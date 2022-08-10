Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A560F58F418
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 00:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26D914B4B8;
	Wed, 10 Aug 2022 22:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3734112DE6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 22:04:07 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id b12so9037463ils.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=LVHmCu4K9UsnuouvlrhXtn/06oq9/7k5ucyM1f7Rw3o=;
 b=XQQgJm1UBQXQ7vbWpW5FvKeg56vw8j997xb19oPECATfNsXaTQTfoXR8o50ZVfLHlB
 11XQbz7fph6I+75f2RDOdo6KvZwMSsk8mdbmvFAQ24tnCPWIlIocfTz2f8X+/Nr1kQvT
 C94w5BgMq2xltRQN+5uJLNXJyEUsJQ81SigRxq9euRt+kdSVZNsikS8G0JB6xPDBz0nu
 d6GowoELgNsmySJUpL6m0li5rxrQmtqZ0txluj/GRNrF/ypBF3rWJzO0e04xwQoHa3kv
 /rGj1dpU5X0LAJCvW9dGdRrHAgXA6lsED8XCrB1/uGNCrxto2sGFkgg3jJoqFu/k6eTb
 2Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=LVHmCu4K9UsnuouvlrhXtn/06oq9/7k5ucyM1f7Rw3o=;
 b=I3cOi6bt5r4N7G4cunWDxeWr/D2+dscLhwidbHMY5sKLLZYiYNCiz8fSKzY4rIQPIF
 86b0FRBgfwNmY+/3i2/44v5XzGk+tykSUu73p0ENoqxOrqp98z0sxeI5Lqd8cphRTPfv
 Gv1RVccHzX7rZMibVSamfq/RZ/Aj5ohYJoXVEs50PY02fMC87+DHETh8+p7EhGOTc+p0
 PXCJKjdtOCMpK5eFeL14N5Ku4V+C1PUKTnHuOxB9D/GYb1f0N5JF02AzUd7ux+ze82ML
 aTBVyhk48TyDtt8BDYeTg1apzZf5lMyXXW6eyO+wncYOV1v4uXE7DJUh6YwOHUuwZcQ1
 7xrw==
X-Gm-Message-State: ACgBeo1X9xT5szCGpQx03JJ4JJ/GfFOVRW8IFGs0Vo9ecWR0Rn4LyCQH
 DXITWI5az7cHUCF0bxnLvsZBaIHtmKq80I3qfss=
X-Google-Smtp-Source: AA6agR5IBVRyhpKnR2zLMwE90gqNpEfsaXgxYOLxLujMWj6Uon5RNfqf7xcFnsKA6FfgJ4Di+5Cyp7A/pP3pJkReSK4=
X-Received: by 2002:a92:8747:0:b0:2da:cf0d:b615 with SMTP id
 d7-20020a928747000000b002dacf0db615mr13120670ilm.168.1660169047109; Wed, 10
 Aug 2022 15:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
 <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
In-Reply-To: <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Aug 2022 15:03:55 -0700
Message-ID: <CAF6AEGv1cVC9ZNMwpwFOki5CrwD3kSAHM9EUFZGWY-y5zcQsCg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 12:26 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 8/10/22 18:08, Rob Clark wrote:
> > On Wed, Aug 10, 2022 at 4:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote:
> >>> On 7/6/22 00:48, Rob Clark wrote:
> >>>> On Tue, Jul 5, 2022 at 4:51 AM Christian K=C3=B6nig <christian.koeni=
g@amd.com> wrote:
> >>>>>
> >>>>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> >>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don=
't
> >>>>>> handle imported dma-bufs properly, which results in mapping of som=
ething
> >>>>>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lock=
up when
> >>>>>> userspace writes to the memory mapping of a dma-buf that was impor=
ted into
> >>>>>> Tegra's DRM GEM.
> >>>>>>
> >>>>>> Majority of DRM drivers prohibit mapping of the imported GEM objec=
ts.
> >>>>>> Mapping of imported GEMs require special care from userspace since=
 it
> >>>>>> should sync dma-buf because mapping coherency of the exporter devi=
ce may
> >>>>>> not match the DRM device. Let's prohibit the mapping for all DRM d=
rivers
> >>>>>> for consistency.
> >>>>>>
> >>>>>> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.=
com>
> >>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>>>
> >>>>> I'm pretty sure that this is the right approach, but it's certainly=
 more
> >>>>> than possible that somebody abused this already.
> >>>>
> >>>> I suspect that this is abused if you run deqp cts on android.. ie. a=
ll
> >>>> winsys buffers are dma-buf imports from gralloc.  And then when you
> >>>> hit readpix...
> >>>>
> >>>> You might only hit this in scenarios with separate gpu and display (=
or
> >>>> dGPU+iGPU) because self-imports are handled differently in
> >>>> drm_gem_prime_import_dev().. and maybe not in cases where you end up
> >>>> with a blit from tiled/compressed to linear.. maybe that narrows the
> >>>> scope enough to just fix it in userspace?
> >>>
> >>> Given that that only drivers which use DRM-SHMEM potentially could've
> >>> map imported dma-bufs (Panfrost, Lima) and they already don't allow t=
o
> >>> do that, I think we're good.
> >>
> >> So can I have an ack from Rob here or are there still questions that t=
his
> >> might go boom?
> >>
> >> Dmitry, since you have a bunch of patches merged now I think would als=
o be
> >> good to get commit rights so you can drive this more yourself. I've as=
ked
> >> Daniel Stone to help you out with getting that.
> >
> > I *think* we'd be ok with this on msm, mostly just by dumb luck.
> > Because the dma-buf's we import will be self-import.  I'm less sure
> > about panfrost (src/panfrost/lib/pan_bo.c doesn't seem to have a
> > special path for imported dma-bufs either, and in that case they won't
> > be self-imports.. but I guess no one has tried to run android cts on
> > panfrost).
>
> The last time I tried to mmap dma-buf imported to Panfrost didn't work
> because Panfrost didn't implement something needed for that. I'll need
> to take a look again because can't recall what it was.
>
> > What about something less drastic to start, like (apologies for
> > hand-edited patch):
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 86d670c71286..fc9ec42fa0ab 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object
> > *obj, unsigned long obj_size,
> >  {
> >         int ret;
> >
> > +       WARN_ON_ONCE(obj->import_attach);
>
> This will hang NVIDIA Tegra, which is what this patch fixed initially.
> If neither of upstream DRM drivers need to map imported dma-bufs and
> never needed, then why do we need this?

oh, tegra isn't using shmem helpers?  I assumed it was.  Well my point
was to make a more targeted fail on tegra, and a WARN_ON for everyone
else to make it clear that what they are doing is undefined behavior.
Because so far existing userspace (or well, panfrost and freedreno at
least, those are the two I know or checked) don't make special cases
for mmap'ing against the dmabuf fd against the dmabuf fd instead of
the drm device fd.

I *think* it should work out that we don't hit this path with
freedreno but on android I can't really guarantee or prove it.  So
your patch would potentially break existing working userspace.  Maybe
it is userspace that isn't portable (but OTOH it isn't like you are
going to be using freedreno on tegra).  So why don't you go for a more
targeted fix that only returns an error on hw where this is
problematic?

BR,
-R
