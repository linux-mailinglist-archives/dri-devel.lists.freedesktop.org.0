Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA551596558
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 00:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1514B10E0E8;
	Tue, 16 Aug 2022 22:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C48B10E037
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 22:18:00 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id p184so6020873iod.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=YxrdumqftQLuRvBgXAJJEgX9wQwha5D/4zqqNT0e1YQ=;
 b=QjZzfuK0Zlo4t04FKNLTefuSQnZ9+HZ3DwKYubYesaUySBjgCRIAgpB2/k6doilgNW
 oimpktTtdI+MjpvnMmpb7SIKa+YtonjR64laPdMvNWrAMbFR4ytDX9RkmYr/HLSYCCsk
 a2W1iU1LUEIgBmycSKNu06se+qCb/ul7uYqJlhCjN74guTSwusnuWG5qd7yQKLam4pP9
 afIkc+HqaDzr2VGl8RaoTpPc8JyCt61BSk16Jtv/OsZ+q4ogwrc0ky1pY3PXk9p0usv0
 dNiNclJUS5QpdITT1zO279vbdx8nVMyRxP9TPda0l71ZeaqfQdSkVuZqvk4DZC++kVwl
 Ht4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=YxrdumqftQLuRvBgXAJJEgX9wQwha5D/4zqqNT0e1YQ=;
 b=wLs88aRO1nTuVzT+VGybF8D0UZlEJyHdag5dciWyfKLPDagGk4WBEhyHFmFzie19L4
 2tvhz0PJofGpyF0a2YS0xDia+k7ITkIFcVDZYDosoLfCYUA2eWU/GejJfIfi4hWw8scy
 g7JlCV2oVAsYtfJKQc23iVcRkhfIORXa6/8IgGABQ1cBoBxyNmpj4wmFxxfWsWH4E+nB
 e2pKF191c4YlxFUTpxt9BmZS2u26rlRdJyuH1N0bXSCDO4IHPD15QEbVJqROGmYFumpg
 Sfb/FpvSz04OqZ3AolbLXedZqQSa2LKDrkOeXKlckxCdNPfDc9wGVAZKMm7LQc/SC+Fj
 Q0sw==
X-Gm-Message-State: ACgBeo2p0NbMfE0g2f+VctKHlD/ML515CwisxuI0HGB1XWcu9zpV/VqQ
 F79hbhsEWQCXRaik661Go4fNBd1+fXhefpyhlAk=
X-Google-Smtp-Source: AA6agR4pb56KxC9qGZLF8Hd47U5KQrzKaP5h2spSlahS8WFzewStJOWVSsWoWPfpCXdSLGYIvet+nPfW4JcViJyo+eI=
X-Received: by 2002:a05:6602:26c7:b0:67b:72ef:b87b with SMTP id
 g7-20020a05660226c700b0067b72efb87bmr9900643ioo.175.1660688279329; Tue, 16
 Aug 2022 15:17:59 -0700 (PDT)
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
 <CAF6AEGuR1cRQYaQBYGnMBzy=XJUcN2o2gzabZaGO2Dj62Uq1DA@mail.gmail.com>
 <CAF6AEGvvR1NUd_GKP=Bxp3VTDMBYT+OwTkkgOWxgYFijZaVVEQ@mail.gmail.com>
 <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
In-Reply-To: <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Aug 2022 15:18:31 -0700
Message-ID: <CAF6AEGs4oQ-E30Uha0-So0t7qoZ6mQg-0suLBfSqoGm+VnHiWw@mail.gmail.com>
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

On Tue, Aug 16, 2022 at 4:45 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 8/12/22 18:01, Rob Clark wrote:
> > On Fri, Aug 12, 2022 at 7:57 AM Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> On Fri, Aug 12, 2022 at 4:26 AM Dmitry Osipenko
> >> <dmitry.osipenko@collabora.com> wrote:
> >>>
> >>> On 8/11/22 02:19, Rob Clark wrote:
> >>>> On Wed, Aug 10, 2022 at 3:23 PM Dmitry Osipenko
> >>>> <dmitry.osipenko@collabora.com> wrote:
> >>>>>
> >>>>> On 8/11/22 01:03, Rob Clark wrote:
> >>>>>> On Wed, Aug 10, 2022 at 12:26 PM Dmitry Osipenko
> >>>>>> <dmitry.osipenko@collabora.com> wrote:
> >>>>>>>
> >>>>>>> On 8/10/22 18:08, Rob Clark wrote:
> >>>>>>>> On Wed, Aug 10, 2022 at 4:47 AM Daniel Vetter <daniel@ffwll.ch> =
wrote:
> >>>>>>>>>
> >>>>>>>>> On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote=
:
> >>>>>>>>>> On 7/6/22 00:48, Rob Clark wrote:
> >>>>>>>>>>> On Tue, Jul 5, 2022 at 4:51 AM Christian K=C3=B6nig <christia=
n.koenig@amd.com> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> >>>>>>>>>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() help=
ers don't
> >>>>>>>>>>>>> handle imported dma-bufs properly, which results in mapping=
 of something
> >>>>>>>>>>>>> else than the imported dma-buf. On NVIDIA Tegra we get a ha=
rd lockup when
> >>>>>>>>>>>>> userspace writes to the memory mapping of a dma-buf that wa=
s imported into
> >>>>>>>>>>>>> Tegra's DRM GEM.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Majority of DRM drivers prohibit mapping of the imported GE=
M objects.
> >>>>>>>>>>>>> Mapping of imported GEMs require special care from userspac=
e since it
> >>>>>>>>>>>>> should sync dma-buf because mapping coherency of the export=
er device may
> >>>>>>>>>>>>> not match the DRM device. Let's prohibit the mapping for al=
l DRM drivers
> >>>>>>>>>>>>> for consistency.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux=
.intel.com>
> >>>>>>>>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.c=
om>
> >>>>>>>>>>>>
> >>>>>>>>>>>> I'm pretty sure that this is the right approach, but it's ce=
rtainly more
> >>>>>>>>>>>> than possible that somebody abused this already.
> >>>>>>>>>>>
> >>>>>>>>>>> I suspect that this is abused if you run deqp cts on android.=
. ie. all
> >>>>>>>>>>> winsys buffers are dma-buf imports from gralloc.  And then wh=
en you
> >>>>>>>>>>> hit readpix...
> >>>>>>>>>>>
> >>>>>>>>>>> You might only hit this in scenarios with separate gpu and di=
splay (or
> >>>>>>>>>>> dGPU+iGPU) because self-imports are handled differently in
> >>>>>>>>>>> drm_gem_prime_import_dev().. and maybe not in cases where you=
 end up
> >>>>>>>>>>> with a blit from tiled/compressed to linear.. maybe that narr=
ows the
> >>>>>>>>>>> scope enough to just fix it in userspace?
> >>>>>>>>>>
> >>>>>>>>>> Given that that only drivers which use DRM-SHMEM potentially c=
ould've
> >>>>>>>>>> map imported dma-bufs (Panfrost, Lima) and they already don't =
allow to
> >>>>>>>>>> do that, I think we're good.
> >>>>>>>>>
> >>>>>>>>> So can I have an ack from Rob here or are there still questions=
 that this
> >>>>>>>>> might go boom?
> >>>>>>>>>
> >>>>>>>>> Dmitry, since you have a bunch of patches merged now I think wo=
uld also be
> >>>>>>>>> good to get commit rights so you can drive this more yourself. =
I've asked
> >>>>>>>>> Daniel Stone to help you out with getting that.
> >>>>>>>>
> >>>>>>>> I *think* we'd be ok with this on msm, mostly just by dumb luck.
> >>>>>>>> Because the dma-buf's we import will be self-import.  I'm less s=
ure
> >>>>>>>> about panfrost (src/panfrost/lib/pan_bo.c doesn't seem to have a
> >>>>>>>> special path for imported dma-bufs either, and in that case they=
 won't
> >>>>>>>> be self-imports.. but I guess no one has tried to run android ct=
s on
> >>>>>>>> panfrost).
> >>>>>>>
> >>>>>>> The last time I tried to mmap dma-buf imported to Panfrost didn't=
 work
> >>>>>>> because Panfrost didn't implement something needed for that. I'll=
 need
> >>>>>>> to take a look again because can't recall what it was.
> >>> Upd: I re-checked Panfrost using today's linux-next and mapping of
> >>> imported dma-buf works, I mapped imported buf from video decoder.
> >>> Apparently previously I had some local kernel change that broke the m=
apping.
> >>>
> >>>>>>>> What about something less drastic to start, like (apologies for
> >>>>>>>> hand-edited patch):
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem=
.c
> >>>>>>>> index 86d670c71286..fc9ec42fa0ab 100644
> >>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
> >>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
> >>>>>>>> @@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_objec=
t
> >>>>>>>> *obj, unsigned long obj_size,
> >>>>>>>>  {
> >>>>>>>>         int ret;
> >>>>>>>>
> >>>>>>>> +       WARN_ON_ONCE(obj->import_attach);
> >>>>>>>
> >>>>>>> This will hang NVIDIA Tegra, which is what this patch fixed initi=
ally.
> >>>>>>> If neither of upstream DRM drivers need to map imported dma-bufs =
and
> >>>>>>> never needed, then why do we need this?
> >>>>>>
> >>>>>> oh, tegra isn't using shmem helpers?  I assumed it was.  Well my p=
oint
> >>>>>> was to make a more targeted fail on tegra, and a WARN_ON for every=
one
> >>>>>> else to make it clear that what they are doing is undefined behavi=
or.
> >>>>>> Because so far existing userspace (or well, panfrost and freedreno=
 at
> >>>>>> least, those are the two I know or checked) don't make special cas=
es
> >>>>>> for mmap'ing against the dmabuf fd against the dmabuf fd instead o=
f
> >>>>>> the drm device fd.
> >>>>>
> >>>>> It's not clear to me what bad Android does form yours comments. Doe=
s it
> >>>>> export dma-buf from GPU and then import it to GPU? If yes, then DRM=
 core
> >>>>> has a check for the self-importing [1].
> >>>>>
> >>>>> [1]
> >>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_=
prime.c#L918
> >>>>>
> >>>>> If you're meaning something else, then please explain in a more det=
ails.
> >>>>
> >>>> So, android/gralloc allocates buffers externally to the driver and
> >>>> imports them into driver.  (And that seems to not just be window
> >>>> surfaces, but in cases random textures, etc)
> >>>>
> >>>> In the normal case these should be allocated from drm/msm so it shou=
ld
> >>>> hit [1].. this is the "dumb luck" I mentioned earlier.  But I'm not
> >>>> confident enough to say that there is no other case.
> >>>>
> >>>>>
> >>>>>> I *think* it should work out that we don't hit this path with
> >>>>>> freedreno but on android I can't really guarantee or prove it.  So
> >>>>>> your patch would potentially break existing working userspace.  Ma=
ybe
> >>>>>> it is userspace that isn't portable (but OTOH it isn't like you ar=
e
> >>>>>> going to be using freedreno on tegra).  So why don't you go for a =
more
> >>>>>> targeted fix that only returns an error on hw where this is
> >>>>>> problematic?
> >>>>>
> >>>>> That's what the first versions of the patch did and Christian sugge=
sted
> >>>>> that it's not a good approach. In fact it should be not only Tegra =
that
> >>>>> has a broken dma-buf mapping, but apparently OMAP driver too.
> >>>>
> >>>> Hmm, I guess I'm a bit more conservative when it comes to potentiall=
y
> >>>> breaking userspace.
> >>>
> >>> If such userspace exists, then of course the mapping should continue =
to
> >>> work. Still will be great to know what that userpsace is.
> >>
> >> Definitely existing mesa does not have a special mmap path for
> >> imported dma-bufs (both in the case of panfrost and freedreno, I
> >> didn't check any others).  The only question is whether there is a
> >> case where some app/test/etc imports a foreign dma-buf fd and then
> >> does something that would trigger mmap'ing, like readpix.
> >
> > The other complication I noticed is that we don't seem to keep around
> > the fd after importing to a GEM handle.  And I could imagine that
> > doing so could cause issues with too many fd's.  So I guess the best
> > thing is to keep the status quo and let drivers that cannot mmap
> > imported buffers just fail mmap?
>
> That actually should be all the drivers excluding those that use
> DRM-SHMEM because only DRM-SHMEM uses dma_buf_mmap(), that's why it
> works for Panfrost. I'm pretty sure mmaping of imported GEMs doesn't
> work for the MSM driver, isn't it?

Hmm, I would have expected it to work, at least prior to the mangling
debug thing danvet added.

Actually, I suspect with the mangling enabled, all sorts of things
would fall apart, I'm not seeing how things like sg_phys() continue to
work.  But not sure if we have that enabled in anything that is
getting android CTS run on it.

BR,
-R

> Intel and AMD drivers don't allow to map the imported dma-bufs. Both
> refuse to do the mapping.
>
> Although, AMDGPU "succeeds" to do the mapping using
> AMDGPU_GEM_DOMAIN_GTT, but then touching the mapping causes bus fault,
> hence mapping actually fails. I think it might be the AMDGPU
> driver/libdrm bug, haven't checked yet.
>
> So we're back to the point that neither of DRM drivers need to map
> imported dma-bufs and this was never tested. In this case this patch is
> valid, IMO.
>
> --
> Best regards,
> Dmitry
