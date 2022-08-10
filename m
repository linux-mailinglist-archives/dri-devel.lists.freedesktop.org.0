Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876458EEFA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 17:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8A92AD25;
	Wed, 10 Aug 2022 15:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4FB14A449
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 15:08:28 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id g15so5868914iob.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=P8TXeNV+7zskV8fKSSy2utDBKNnP7PwHXswFotxFdK0=;
 b=WSpLVtuzfN5igBK8LD8eFpSXdWpwPBUjySGUljTob+BUjSVxKylVO7RDdomFHBrH8B
 jFvSm6eJkbuw5XlkXEaQGHqaatqFW7VEHvQAgl1jx/b4vTlpmCgEO1Qm8HA4U7lvAWQz
 hl9+/qx0cuemGM39X4lyM6r8ab9sNmDaCXYI4YSZ3LCprskOPyFHh/RssVwnfQZPDzqO
 Dt7JO4n6bBN3S9C7384h/zV3UT7z6ZhdOy5pwVMYj9KZH0aqWiaP+i0IXHscoTLQs7Yc
 nYna+23vqtrzY1+2tePKwaKhoZQfRuUZCvsnjEqlMgQYHg6C3dhyFZV/kHWkcmGsGcHS
 oI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=P8TXeNV+7zskV8fKSSy2utDBKNnP7PwHXswFotxFdK0=;
 b=AvNfnz0uDnRELQRIA/CI2cXWppouX8GtSs2oui2HJvEtWTGUqDF4R7nUthV83QcD3S
 P33XGnUnaPK6OBwKU8CSTQnDOrzinOQ5KcgedFj+M4QAoJDXxAKPiCwRnuJMgovKT2h2
 UUjibqkJHt8cvsGUNihE4cKTGKLSDMsIYj1d4W1QgkK+WayOgL816x1pg9jKI0sDPEcB
 slHpsWDv5IR720YzQTyCtbfBLuKkdvXkGp7GNSBKUhTGUZcZmFeFJlhUlOers+CfeYRq
 R68x52JHwNz/DMXNC8R06gWd65Sui5KMEECLa5e0Pl72b6tRIEAVry9x8wNC+TiJAyKp
 p0jQ==
X-Gm-Message-State: ACgBeo3nGzda5GGC/tLJCfeLaLiNRCBwQkVV3gQlJQFumM6yCMdrPpfp
 U9UuRTzW9FKgekVIR5bzYTGxgedhEVGuAtxoD8A=
X-Google-Smtp-Source: AA6agR74RZvvSswze2RlPU2jPG2C0znVnnazQXl+qZfN9DPU4Mu2uILtC9LaOZUSLAH9emrDZl1TfXxVIUeu5/kSLNk=
X-Received: by 2002:a05:6602:26c7:b0:67b:72ef:b87b with SMTP id
 g7-20020a05660226c700b0067b72efb87bmr11903368ioo.175.1660144107634; Wed, 10
 Aug 2022 08:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
In-Reply-To: <YvOav/vF2awVWIu0@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Aug 2022 08:08:15 -0700
Message-ID: <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 linux-tegra@vger.kernel.org, 
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 4:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote:
> > On 7/6/22 00:48, Rob Clark wrote:
> > > On Tue, Jul 5, 2022 at 4:51 AM Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> > >>
> > >> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> > >>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don'=
t
> > >>> handle imported dma-bufs properly, which results in mapping of some=
thing
> > >>> else than the imported dma-buf. On NVIDIA Tegra we get a hard locku=
p when
> > >>> userspace writes to the memory mapping of a dma-buf that was import=
ed into
> > >>> Tegra's DRM GEM.
> > >>>
> > >>> Majority of DRM drivers prohibit mapping of the imported GEM object=
s.
> > >>> Mapping of imported GEMs require special care from userspace since =
it
> > >>> should sync dma-buf because mapping coherency of the exporter devic=
e may
> > >>> not match the DRM device. Let's prohibit the mapping for all DRM dr=
ivers
> > >>> for consistency.
> > >>>
> > >>> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.c=
om>
> > >>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > >>
> > >> I'm pretty sure that this is the right approach, but it's certainly =
more
> > >> than possible that somebody abused this already.
> > >
> > > I suspect that this is abused if you run deqp cts on android.. ie. al=
l
> > > winsys buffers are dma-buf imports from gralloc.  And then when you
> > > hit readpix...
> > >
> > > You might only hit this in scenarios with separate gpu and display (o=
r
> > > dGPU+iGPU) because self-imports are handled differently in
> > > drm_gem_prime_import_dev().. and maybe not in cases where you end up
> > > with a blit from tiled/compressed to linear.. maybe that narrows the
> > > scope enough to just fix it in userspace?
> >
> > Given that that only drivers which use DRM-SHMEM potentially could've
> > map imported dma-bufs (Panfrost, Lima) and they already don't allow to
> > do that, I think we're good.
>
> So can I have an ack from Rob here or are there still questions that this
> might go boom?
>
> Dmitry, since you have a bunch of patches merged now I think would also b=
e
> good to get commit rights so you can drive this more yourself. I've asked
> Daniel Stone to help you out with getting that.

I *think* we'd be ok with this on msm, mostly just by dumb luck.
Because the dma-buf's we import will be self-import.  I'm less sure
about panfrost (src/panfrost/lib/pan_bo.c doesn't seem to have a
special path for imported dma-bufs either, and in that case they won't
be self-imports.. but I guess no one has tried to run android cts on
panfrost).

What about something less drastic to start, like (apologies for
hand-edited patch):

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 86d670c71286..fc9ec42fa0ab 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object
*obj, unsigned long obj_size,
 {
        int ret;

+       WARN_ON_ONCE(obj->import_attach);
+
        /* Check for valid size. */
        if (obj_size < vma->vm_end - vma->vm_start)
                return -EINVAL;
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e02991ca..6190f5018986 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -609,17 +609,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
  */
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct
vm_area_struct *vma)
 {
-       struct drm_gem_object *obj =3D &shmem->base;
        int ret;

        if (obj->import_attach) {
-               /* Drop the reference drm_gem_mmap_obj() acquired.*/
-               drm_gem_object_put(obj);
-               vma->vm_private_data =3D NULL;
-
-               return dma_buf_mmap(obj->dma_buf, vma, 0);
+               return -EINVAL;
        }

        ret =3D drm_gem_shmem_get_pages(shmem);
        if (ret) {
                drm_gem_vm_close(vma);
--
2.36.1
