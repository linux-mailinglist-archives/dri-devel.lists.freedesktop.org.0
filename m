Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFE389F5C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9363A6F383;
	Thu, 20 May 2021 07:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49296F383
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 07:59:10 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so14148693oto.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ipFaHv6yNLS2dNTaUeBWxHaSlyBgNw5MXhT4rzrbWF0=;
 b=QoLbcxVt1ipsD7jABPLDJcU/hbS2zM6x7VWw9lIZOs5DMbV5XGkflzgQ++U6EoQf38
 E7nV8MOhTyDNhxcZhgh5/9ai5+qUZSFqjNCUjzG83locSRYGoqdeG13REdtU4CmYPDdg
 h+V2LDcs84pmplFsBgmfwcjs2SlNengUh7uAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ipFaHv6yNLS2dNTaUeBWxHaSlyBgNw5MXhT4rzrbWF0=;
 b=LGXpiU3ZR8JbUfWGamT76iCOoLgSth5y3Y5BTFdeqILuzvuB+Oe+hdZFmvhQW0s2oc
 9xqGdFWrAyjEN4TprAQ8bbqKbhILPCzVTyXT4job0Jyu8vA9L2AY7ozHsYicLrQDKZqi
 uMNtMB1VeamzofkbH/9Fd+SNpZ1UvHXEMzZPSijT7lYESltiSDfIvMsSz/L4neZ/JCs8
 D0wgIRNRuNCDxMrXCz27ukT87PA4M4WKYSL+AmXMvCYxfmPCHe1MI384oZPPjWQI5Dij
 v+s/zj3cSPI2n4VInxOwJZMSncGc9USOLoieqsBC/7vELq0gEPysevCfEthANltc/qmA
 Z1TA==
X-Gm-Message-State: AOAM533At/0KA2O7wZqlvWUW/py1vWkl1fGb3Ggb/24wwZz+9uWNCHOc
 U0Oth+jnUH6aVtQybDbdJE8AGql+LYP0OUlUx390rQ==
X-Google-Smtp-Source: ABdhPJwBkS6iF6fYtM5g4TjErCWQMLJ7mVMLddQbEE1GqUf1j6imvSfj+FzO7Q0sHW7WQUJ0dWzdeN8q4Oj7v0GJtXY=
X-Received: by 2002:a9d:4101:: with SMTP id o1mr2923190ote.281.1621497550021; 
 Thu, 20 May 2021 00:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <ee36b7f8-070b-39da-48f5-d546f2c0ceb8@gmail.com>
In-Reply-To: <ee36b7f8-070b-39da-48f5-d546f2c0ceb8@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 May 2021 09:58:59 +0200
Message-ID: <CAKMK7uG4y4xz1HFZAvWNng97HtkpVs0YX2+Yv7i0cU3Sqj2+Ew@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 1:24 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 18.05.21 um 23:17 schrieb Daniel Vetter:
> > [SNIP]
> >> The problem in this case is not starting a new CS, but synchronizing t=
o
> >> the existing ones.
> >>
> >> See a heavy TLB flush is made completely out of sync. E.g. it doesn't
> >> want to wait for any previous operation.
> >>
> >> In other words imagine the following example:
> >> 1. Both process A and B have a BO mapped.
> >> 2. Process A is heavily using the BO and doing all kind of rendering.
> >> 3. Process B is unmapping the BO.
> >>
> >> Now that process B unmaps the BO needs to trigger page table updates a=
nd
> >> a heavy TLB flush, but since this can take really long we want to do i=
t
> >> asynchronously on the hardware.
> >>
> >> With the current approach you basically can't do that because you can'=
t
> >> note that a fence should not participate in synchronization at all.
> >>
> >> E.g. we can't add a fence which doesn't wait for the exclusive one as
> >> shared.
> > Ok I think that's a real problem, and  guess it's also related to all
> > the ttm privatization tricks and all that. So essentially we'd need
> > the opposite of ttm_bo->moving, as in you can't ignore it, but
> > otherwise it completely ignores all the userspace implicit fence
> > stuff.
>
> It goes into that direction, but doesn't sounds like the full solution
> either.
>
> [SNIP]
> > Can we please stop with the "amdgpu is right, everyone else is wrong" a=
pproach?
>
> Well the approach I do here is not "amdgpu is right, everyone else is
> wrong". But rather we had DRM uAPI for i915, nouveau and radeon and
> unfortunately leaked that into DMA-buf without much thinking about it.
>
> I'm also not saying that the approach amdgpu is right. It's just what
> amdgpu needs in it's CS interface.
>
> What I'm saying is that DMA-buf is a device driver independent subsystem
> and we shouldn't make any assumption which come from just a handful of
> DRM driver on it's implicit sync implementation.
>
> > Like I'm pretty much going to type up the patch that does a full drm
> > subsytem audit of everything and whack amdgpu into compliance. Perf
> > hit be damned, you had a few years to fix this with better uapi. Or I
> > find out that there's a giant inconsistent mess, but at least we'd
> > gain some clarity about where exactly we are here and maybe what to do
> > next.
>
> Ok to let us move forward please take a look at the first patches of the
> set. It cleans up quite a bunch of the mess we have in there before even
> coming to adding flags to the shared slots.
>
> I think you will agree on that we should do is cleaning up the use cases
> further and separate implicit sync from resource management.

Just replying on this because I'm a bit busy with reviewing everything
we have in upstream right now.

I agree there's some useful stuff in there, but we have a fundamental
disagreement on how this works. That needs to be resolved first, and
as part of that we need to come up with a plan how to get everyone on
the same page.

Then next thing is a plan how to get the various issues you're raising
around dma_resv rules sorted out.

Once we have that, and only then, does it imo make sense to
review/merge cleanup patches. As long as we have fundamental
disagreements along the lines like we have here there's no point.

I should have a patch set maybe tomorrow or early next week with my
results of the drm subsystem review of how exactly dma_resv is used
currently. Thus far it's a few pages of code analysis, but not yet
complete. Also I found some smaller issues in a few places, so the
discussion is going to involve a few more people until we're settled
here :-/

Cheers, Daniel


> In other words we forbid touching the exclusive and shared fences
> directly and have separate APIs for resource management and implicit sync=
.
>
> This makes sense anyway, no matter what implicit synchronization
> framework we will install underneath.
>
> Regards,
> Christian.
>
> > -Daniel
> >
> >> Regards,
> >> Christian.
> >>
> >>> After that I think we can look at what exact oversync issue remains
> >>> and why and solve it, but until we have this this just feels like
> >>> another rehash of "amgpu insist its own dma_resv interpration is the
> >>> right one and everyone else should move one over".
> >>>
> >>> Or maybe I've just become real garbage at reading random driver code,
> >>> wouldn't be the first time :-)
> >>>
> >>> Cheers, Daniel
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Cheers, Daniel
> >>>>>
> >>>>>> --Jason
> >>>>>>
> >>>>>>
> >>>>>>>> That's also the reason the Valve guys came up with a solution wh=
ere each
> >>>>>>>> BO gets a flag for explicit sync, but that only works for export=
s and
> >>>>>>>> not for imports.
> >>>>>>>>
> >>>>>>>>> I915 and iirc msm has explicit flags for this, panfrost was des=
igned to
> >>>>>>>>> support this correctly from the start (also with flags I think)=
. That's at
> >>>>>>>>> least what I remember from all the discussions at XDC and #dri-=
devel, but
> >>>>>>>>> didn't check the code again to give you the list of uapi flags =
you need
> >>>>>>>>> for each driver.
> >>>>>>>>>
> >>>>>>>>> The other piece is making sure you're only picking up implicit =
fences when
> >>>>>>>>> you should, and not any later ones, for which Jason has a solut=
ion:
> >>>>>>>>>
> >>>>>>>>> https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jaso=
n@jlekstrand.net/
> >>>>>>>> Yes, I helped with that as well. But I think that this is just a=
nother
> >>>>>>>> workaround without really addressing the underlying problem.
> >>>>>>>>
> >>>>>>>>> If amdgpu isn't using those, then you will suffer from
> >>>>>>>>> over-synchronization in vulkan and pay a price. The entire poin=
t of vulkan
> >>>>>>>>> is that you pick up sync points very explicitly, and we also ne=
ed to have
> >>>>>>>>> very explicit uapi for userspace to pick up/set the implicit fe=
nces.
> >>>>>>>>>
> >>>>>>>>> Trying to paper over this with more implicit magic is imo just =
wrong, and
> >>>>>>>>> definitely not the long term explicit sync model we want.
> >>>>>>>> I completely disagree.
> >>>>>>>>
> >>>>>>>> In my opinion the implicit sync model we have for dma_resv curre=
ntly is
> >>>>>>>> just not well designed at all, since it always requires cooperat=
ion from
> >>>>>>>> userspace.
> >>>>>>>>
> >>>>>>>> In other words you need to know when to enable implicit sync in
> >>>>>>>> userspace and that information is simply not present all of the =
time.
> >>>>>>>>
> >>>>>>>> What we have done here is just keeping the old reader/writer fla=
gs i915,
> >>>>>>>> radeon and nouveau once had and pushed that out to everybody els=
e making
> >>>>>>>> the assumption that everybody would follow that without document=
ing the
> >>>>>>>> actual rules of engagement you need to follow here.
> >>>>>>>>
> >>>>>>>> That was a really big mistake and we should try to fix that soon=
er or
> >>>>>>>> later. The only other clean alternative I see is to use a flag o=
n the
> >>>>>>>> exporter to tell the importer if it should sync to shared fences=
 or not.
> >>>>>>>>
> >>>>>>>> Additional to that I'm perfectly fine with implicit sync. Explic=
it sync
> >>>>>>>> certainly has some use cases as well, but I don't see it as an a=
bsolute
> >>>>>>>> advantage over the implicit model.
> >>>>>>> Ok this stops making sense. Somehow you claim userspace doesn't k=
now
> >>>>>>> when to sync, but somehow the kernel does? By guessing, and getti=
ng it
> >>>>>>> wrong mostly, except for the one case that you benchmarked?
> >>>>>>>
> >>>>>>> Aside from silly userspace which exports a buffer to a dma-buf, b=
ut
> >>>>>>> then never imports it anywhere else, there isn't a case I know of
> >>>>>>> where the kernel actually knows more than userspace. But there's =
lots
> >>>>>>> of cases where the kernel definitely knows less, especially if
> >>>>>>> userspace doesn't tell it about what's going on with each renderi=
ng
> >>>>>>> and buffer.
> >>>>>>>
> >>>>>>> So here's the 2 things you need to make this work like every othe=
r driver:
> >>>>>>>
> >>>>>>> 1. A way to set the explicit fence on a buffer. CS ioctl is perfe=
ctly
> >>>>>>> fine, but also can be seperate. Userspace uses this only on a) sh=
ared
> >>>>>>> buffers b) when there's a flush/swap on that shared buffer. Not w=
hen
> >>>>>>> rendering any of the interim stuff, that only leads to oversync.
> >>>>>>> Anything non-shared is handled explicitly in userspace (at least =
for
> >>>>>>> modern-ish drivers). This is the only thing that ever sets an
> >>>>>>> exclusive fence (aside from ttm moving buffers around ofc).
> >>>>>>>
> >>>>>>> 2. A way to sync with the implicit fences, either all of them (fo=
r
> >>>>>>> upcoming write access) or just the write fence (for read access).=
 At
> >>>>>>> first we thought it's good enough to do this in the CS ioctl, but
> >>>>>>> that's a wee bit too late, hence the patches from Jason. My
> >>>>>>> understanding is that vulkan converts this into an vk syncobj/fen=
ce of
> >>>>>>> some sorts, so really can't make this more explicit and intention=
al
> >>>>>>> than that.
> >>>>>>>
> >>>>>>> None of this is something the kernel has the slightest idea about=
 when
> >>>>>>> it happens, so you have to have explicit uapi for it. Trying to f=
ake
> >>>>>>> it in the kernel just doesn't work.
> >>>>>>> -Daniel
> >>>>>>> --
> >>>>>>> Daniel Vetter
> >>>>>>> Software Engineer, Intel Corporation
> >>>>>>> http://blog.ffwll.ch
> >>>>> --
> >>>>> Daniel Vetter
> >>>>> Software Engineer, Intel Corporation
> >>>>> http://blog.ffwll.ch
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
