Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77059128D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A54AB5CF3;
	Fri, 12 Aug 2022 14:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51297B5CF3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:57:24 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id l24so979177ion.13
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=zKjSj2wTsw/rznrfDfUfY+1E6AA9/o4ZtfsJOOVevII=;
 b=I0hYDAQhR6fZiGQJpTRTzwuIV7C2zNpXtIo1w4Znh1k2YeTNw1apiK2zkUfv0NrswJ
 ImnfizLL+jBzIUA5S0nSjhWI4mIrInUl1pNo+cjA5XFipGL4B6nuWTz7H1eOrAOmDflJ
 IU93NK5XEK9vuM2SNjqmgQkXjbLECjKFk2d5dUv8YcT53dCZwbxnNG+AOuDJFmfEtOTO
 cXC7PknC37U43S2F1oYjlHyXfVdcTCiZy3guMRpK+lg2maL2K6yeLwmZMgEP1gQiNWDB
 dwS+EnmM0RNc5h4b8vAvGb4l7OXFr3WgZo8Arje190utWbbH4kKqo9XmybzOABmSPH0M
 euwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=zKjSj2wTsw/rznrfDfUfY+1E6AA9/o4ZtfsJOOVevII=;
 b=RMcCPyYgwrlpvNHUz5vsSvj0igiOtBFCmXhrooTZlfbn/CJJ5Kq4jd/nx03lYcfKzd
 zbqgHfDl0qEZMJvXHre+Vtiu6ayLTBV+hBzDGmXM2m3lhig+SIo9QPgVMf2aSRlnypSD
 bVPdZ8Vr40qp3TfcUSIir5Fp00TSgcEtH2N6rNXwZL59wUrDFGFjd8gaIsqVwHZo7aGl
 6M42bL5Tqt2JMIxG4GxauiYYcKAvd3FWJzKVes9cxIYTlhOCE5QILzd/14DFqDqd4sbK
 EEvPLjZgySe1TDx310bz2kMZTqDoRAEv4R952j6+iVhccZgl+wg/UzM7WC9xEp/p7Okh
 mZpg==
X-Gm-Message-State: ACgBeo3s7St/sVoqbQ5bg7WCcmui9lxNQz7YgSL0IiFtxPjqMYU4m8Ob
 003HrAEQQylcfj34VD9H2jr3JJUagfymFm5ZEIc=
X-Google-Smtp-Source: AA6agR53abgJhbrjrkXXm8aoDOdt5N7ApLUDf8l8gdXWC5K0h+8H6Vmqk/EXucLiIPfbZRv7mEND0MbYtsaU/4RpswI=
X-Received: by 2002:a05:6602:26c7:b0:67b:72ef:b87b with SMTP id
 g7-20020a05660226c700b0067b72efb87bmr1846439ioo.175.1660316243533; Fri, 12
 Aug 2022 07:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
 <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
 <CAF6AEGv1cVC9ZNMwpwFOki5CrwD3kSAHM9EUFZGWY-y5zcQsCg@mail.gmail.com>
 <fc019528-7ec7-9e5b-1b6d-c44da14346cf@collabora.com>
 <CAF6AEGv8zSd0fEYB9hd2QOyTt53gFSQoL8JdZtCvtCdYfMfB2Q@mail.gmail.com>
 <73b51dde-689f-64ce-a1c8-0d7c84a2ed66@collabora.com>
In-Reply-To: <73b51dde-689f-64ce-a1c8-0d7c84a2ed66@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 12 Aug 2022 07:57:11 -0700
Message-ID: <CAF6AEGuR1cRQYaQBYGnMBzy=XJUcN2o2gzabZaGO2Dj62Uq1DA@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 4:26 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 8/11/22 02:19, Rob Clark wrote:
> > On Wed, Aug 10, 2022 at 3:23 PM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 8/11/22 01:03, Rob Clark wrote:
> >>> On Wed, Aug 10, 2022 at 12:26 PM Dmitry Osipenko
> >>> <dmitry.osipenko@collabora.com> wrote:
> >>>>
> >>>> On 8/10/22 18:08, Rob Clark wrote:
> >>>>> On Wed, Aug 10, 2022 at 4:47 AM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> >>>>>>
> >>>>>> On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote:
> >>>>>>> On 7/6/22 00:48, Rob Clark wrote:
> >>>>>>>> On Tue, Jul 5, 2022 at 4:51 AM Christian K=C3=B6nig <christian.k=
oenig@amd.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> >>>>>>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers=
 don't
> >>>>>>>>>> handle imported dma-bufs properly, which results in mapping of=
 something
> >>>>>>>>>> else than the imported dma-buf. On NVIDIA Tegra we get a hard =
lockup when
> >>>>>>>>>> userspace writes to the memory mapping of a dma-buf that was i=
mported into
> >>>>>>>>>> Tegra's DRM GEM.
> >>>>>>>>>>
> >>>>>>>>>> Majority of DRM drivers prohibit mapping of the imported GEM o=
bjects.
> >>>>>>>>>> Mapping of imported GEMs require special care from userspace s=
ince it
> >>>>>>>>>> should sync dma-buf because mapping coherency of the exporter =
device may
> >>>>>>>>>> not match the DRM device. Let's prohibit the mapping for all D=
RM drivers
> >>>>>>>>>> for consistency.
> >>>>>>>>>>
> >>>>>>>>>> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.in=
tel.com>
> >>>>>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>>>>>>>
> >>>>>>>>> I'm pretty sure that this is the right approach, but it's certa=
inly more
> >>>>>>>>> than possible that somebody abused this already.
> >>>>>>>>
> >>>>>>>> I suspect that this is abused if you run deqp cts on android.. i=
e. all
> >>>>>>>> winsys buffers are dma-buf imports from gralloc.  And then when =
you
> >>>>>>>> hit readpix...
> >>>>>>>>
> >>>>>>>> You might only hit this in scenarios with separate gpu and displ=
ay (or
> >>>>>>>> dGPU+iGPU) because self-imports are handled differently in
> >>>>>>>> drm_gem_prime_import_dev().. and maybe not in cases where you en=
d up
> >>>>>>>> with a blit from tiled/compressed to linear.. maybe that narrows=
 the
> >>>>>>>> scope enough to just fix it in userspace?
> >>>>>>>
> >>>>>>> Given that that only drivers which use DRM-SHMEM potentially coul=
d've
> >>>>>>> map imported dma-bufs (Panfrost, Lima) and they already don't all=
ow to
> >>>>>>> do that, I think we're good.
> >>>>>>
> >>>>>> So can I have an ack from Rob here or are there still questions th=
at this
> >>>>>> might go boom?
> >>>>>>
> >>>>>> Dmitry, since you have a bunch of patches merged now I think would=
 also be
> >>>>>> good to get commit rights so you can drive this more yourself. I'v=
e asked
> >>>>>> Daniel Stone to help you out with getting that.
> >>>>>
> >>>>> I *think* we'd be ok with this on msm, mostly just by dumb luck.
> >>>>> Because the dma-buf's we import will be self-import.  I'm less sure
> >>>>> about panfrost (src/panfrost/lib/pan_bo.c doesn't seem to have a
> >>>>> special path for imported dma-bufs either, and in that case they wo=
n't
> >>>>> be self-imports.. but I guess no one has tried to run android cts o=
n
> >>>>> panfrost).
> >>>>
> >>>> The last time I tried to mmap dma-buf imported to Panfrost didn't wo=
rk
> >>>> because Panfrost didn't implement something needed for that. I'll ne=
ed
> >>>> to take a look again because can't recall what it was.
> Upd: I re-checked Panfrost using today's linux-next and mapping of
> imported dma-buf works, I mapped imported buf from video decoder.
> Apparently previously I had some local kernel change that broke the mappi=
ng.
>
> >>>>> What about something less drastic to start, like (apologies for
> >>>>> hand-edited patch):
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >>>>> index 86d670c71286..fc9ec42fa0ab 100644
> >>>>> --- a/drivers/gpu/drm/drm_gem.c
> >>>>> +++ b/drivers/gpu/drm/drm_gem.c
> >>>>> @@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object
> >>>>> *obj, unsigned long obj_size,
> >>>>>  {
> >>>>>         int ret;
> >>>>>
> >>>>> +       WARN_ON_ONCE(obj->import_attach);
> >>>>
> >>>> This will hang NVIDIA Tegra, which is what this patch fixed initiall=
y.
> >>>> If neither of upstream DRM drivers need to map imported dma-bufs and
> >>>> never needed, then why do we need this?
> >>>
> >>> oh, tegra isn't using shmem helpers?  I assumed it was.  Well my poin=
t
> >>> was to make a more targeted fail on tegra, and a WARN_ON for everyone
> >>> else to make it clear that what they are doing is undefined behavior.
> >>> Because so far existing userspace (or well, panfrost and freedreno at
> >>> least, those are the two I know or checked) don't make special cases
> >>> for mmap'ing against the dmabuf fd against the dmabuf fd instead of
> >>> the drm device fd.
> >>
> >> It's not clear to me what bad Android does form yours comments. Does i=
t
> >> export dma-buf from GPU and then import it to GPU? If yes, then DRM co=
re
> >> has a check for the self-importing [1].
> >>
> >> [1]
> >> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_pri=
me.c#L918
> >>
> >> If you're meaning something else, then please explain in a more detail=
s.
> >
> > So, android/gralloc allocates buffers externally to the driver and
> > imports them into driver.  (And that seems to not just be window
> > surfaces, but in cases random textures, etc)
> >
> > In the normal case these should be allocated from drm/msm so it should
> > hit [1].. this is the "dumb luck" I mentioned earlier.  But I'm not
> > confident enough to say that there is no other case.
> >
> >>
> >>> I *think* it should work out that we don't hit this path with
> >>> freedreno but on android I can't really guarantee or prove it.  So
> >>> your patch would potentially break existing working userspace.  Maybe
> >>> it is userspace that isn't portable (but OTOH it isn't like you are
> >>> going to be using freedreno on tegra).  So why don't you go for a mor=
e
> >>> targeted fix that only returns an error on hw where this is
> >>> problematic?
> >>
> >> That's what the first versions of the patch did and Christian suggeste=
d
> >> that it's not a good approach. In fact it should be not only Tegra tha=
t
> >> has a broken dma-buf mapping, but apparently OMAP driver too.
> >
> > Hmm, I guess I'm a bit more conservative when it comes to potentially
> > breaking userspace.
>
> If such userspace exists, then of course the mapping should continue to
> work. Still will be great to know what that userpsace is.

Definitely existing mesa does not have a special mmap path for
imported dma-bufs (both in the case of panfrost and freedreno, I
didn't check any others).  The only question is whether there is a
case where some app/test/etc imports a foreign dma-buf fd and then
does something that would trigger mmap'ing, like readpix.

BR,
-R

> Alright, let's keep the dma-buf mapping as-is for now. I'll fix just the
> Tegra driver then.
>
> --
> Best regards,
> Dmitry
