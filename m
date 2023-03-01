Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB56A706C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 17:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E90F10E2ED;
	Wed,  1 Mar 2023 16:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17AB10E2ED;
 Wed,  1 Mar 2023 16:02:40 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id bp19so8392546oib.4;
 Wed, 01 Mar 2023 08:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677686560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZTgIVa86LLN7SijAp5DiSOlE+sp3ymBxEWdeeVZigo=;
 b=TBp1nIK1O1zRTKYC0Ov6n0IBc4J/lI2DF7eAURydWaOt2JxDZPCqkE7RXf/1FY0Yh7
 7G5kw7Za4CnagQrBQ29dHVZGcjD40/VCCaBPKBF+UuoYr0HpbrTfMC4A7pNTSVcFt/Jd
 03uP1vNe0Sl2xH8Gs2NdLN5LUxVVljrlkJBhau1Lznm0Lh40dKGTRm1hWkUADbjbkmlU
 rm0afAwXVrf+Ix2/aC+Ype8o/skfGdlCO6rmune0N134Mi5A8bno8qErzv0BBEIAI0kk
 BHf3YkWd6NCPjaL5qm069abExTRjwzHsMY7QxjRlA+qzk/0SjLZeE/UEf8pKgBpTHUuL
 WIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677686560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZTgIVa86LLN7SijAp5DiSOlE+sp3ymBxEWdeeVZigo=;
 b=puJhjo0slolivV1FhV6tLLDIYdxMDuU6iAdOGfWvkQg8tmuRfMfcNuRHDnLEraVrq+
 3g26ow1F4X2yDxbCzO0IGjMMCrIytM3gfnoUUuTHKYMbse2I0K12twlmZlAOVOVs5Jx0
 CI6kk2oumkQgHD+w2LuCNviUzLYPq1GLzsXrRRK3tIqYA20y9ULh3MsOgSlIjishemSL
 BVJNkrRZqZl1xce38t9wuB7fcBZeLlKSF06S+ryphhuwlCGG0zZyzDdLxvTlqIyKh9A+
 bqRfA753J5aWn0irWeqmp/UrLvtT32AX93gdvgR4JS2Unq1/R3buvslPkIMuJiHXLcM3
 /D1Q==
X-Gm-Message-State: AO0yUKVviTkrH9CXreLyTr9VlHwZ0GEHcvYEKUZFrOYVx1vpkAStrIym
 BvEgvayiBgKKZeRfNAKwZ265A/aZ3gtmaLkfK/A=
X-Google-Smtp-Source: AK7set/4/yP+ubTTT4ioZcKqkOZ/hQ3cNL+4WblKtp6/yY8cUthYvIi0H1WIhgpO8R2ZY7Q6TrXiC8Ft4+t+IjJ5yRc=
X-Received: by 2002:a05:6808:2792:b0:37f:b1b8:4a19 with SMTP id
 es18-20020a056808279200b0037fb1b84a19mr2061978oib.3.1677686559704; Wed, 01
 Mar 2023 08:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
 <20230224130053.3f8939e2@eldfell>
 <c5d046d6-ab8e-2bc7-5110-dba78b91348b@linux.intel.com>
 <74e409dc-b642-779e-a755-b793c378e43a@amd.com>
 <CAF6AEGs_yzEj81yNP3KhmVP9Yo3rwTc5vntEVrm9tHw6+w1G_g@mail.gmail.com>
 <Y/0iM+ycUozaVbbC@intel.com>
 <CAF6AEGtXSEyyjELjGtPvnAN7mX+NwzngmB0PbKHsZqjTm-xYsg@mail.gmail.com>
 <CA+hFU4wtW6wNP2Y0e_iE6NhBSSfVRDxTBUk7kOUNHQPRXpSzrQ@mail.gmail.com>
 <CAF6AEGtaxbJ83sfviVWMic6Q8XoyhLvWCdtYwiSd8A4sV4ZXSQ@mail.gmail.com>
 <CA+hFU4x0VrQwF4JJcfHNwXrCUF8kP0d=Nhy5bboy=u5pJAgekQ@mail.gmail.com>
 <CAF6AEGtBFOvVK-p1Xox-6wp4frrmVqO5C5rq4OxUUMv8V51CVA@mail.gmail.com>
 <CA+hFU4yEEo37YBKyhoz6wXWv8B_2JXwo7Ejg9hhufSGaQnBcqA@mail.gmail.com>
In-Reply-To: <CA+hFU4yEEo37YBKyhoz6wXWv8B_2JXwo7Ejg9hhufSGaQnBcqA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 1 Mar 2023 08:02:28 -0800
Message-ID: <CAF6AEGu0S_c-fCEJ0VM_F2EyZk7fa=uNEYULaV4hbzm2yS3DfA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Sebastian Wick <sebastian.wick@redhat.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 1, 2023 at 7:31 AM Sebastian Wick <sebastian.wick@redhat.com> w=
rote:
>
> On Tue, Feb 28, 2023 at 11:52=E2=80=AFPM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > On Tue, Feb 28, 2023 at 6:30 AM Sebastian Wick
> > <sebastian.wick@redhat.com> wrote:
> > >
> > > On Tue, Feb 28, 2023 at 12:48=E2=80=AFAM Rob Clark <robdclark@gmail.c=
om> wrote:
> > > >
> > > > On Mon, Feb 27, 2023 at 2:44 PM Sebastian Wick
> > > > <sebastian.wick@redhat.com> wrote:
> > > > >
> > > > > On Mon, Feb 27, 2023 at 11:20 PM Rob Clark <robdclark@gmail.com> =
wrote:
> > > > > >
> > > > > > On Mon, Feb 27, 2023 at 1:36 PM Rodrigo Vivi <rodrigo.vivi@inte=
l.com> wrote:
> > > > > > >
> > > > > > > On Fri, Feb 24, 2023 at 09:59:57AM -0800, Rob Clark wrote:
> > > > > > > > On Fri, Feb 24, 2023 at 7:27 AM Luben Tuikov <luben.tuikov@=
amd.com> wrote:
> > > > > > > > >
> > > > > > > > > On 2023-02-24 06:37, Tvrtko Ursulin wrote:
> > > > > > > > > >
> > > > > > > > > > On 24/02/2023 11:00, Pekka Paalanen wrote:
> > > > > > > > > >> On Fri, 24 Feb 2023 10:50:51 +0000
> > > > > > > > > >> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > > > > > >>
> > > > > > > > > >>> On 24/02/2023 10:24, Pekka Paalanen wrote:
> > > > > > > > > >>>> On Fri, 24 Feb 2023 09:41:46 +0000
> > > > > > > > > >>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrot=
e:
> > > > > > > > > >>>>
> > > > > > > > > >>>>> On 24/02/2023 09:26, Pekka Paalanen wrote:
> > > > > > > > > >>>>>> On Thu, 23 Feb 2023 10:51:48 -0800
> > > > > > > > > >>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > > > >>>>>>
> > > > > > > > > >>>>>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <p=
paalanen@gmail.com> wrote:
> > > > > > > > > >>>>>>>>
> > > > > > > > > >>>>>>>> On Wed, 22 Feb 2023 07:37:26 -0800
> > > > > > > > > >>>>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > > > >>>>>>>>
> > > > > > > > > >>>>>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen =
<ppaalanen@gmail.com> wrote:
> > > > > > > > > >>>>>>
> > > > > > > > > >>>>>> ...
> > > > > > > > > >>>>>>
> > > > > > > > > >>>>>>>>>> On another matter, if the application uses SET=
_DEADLINE with one
> > > > > > > > > >>>>>>>>>> timestamp, and the compositor uses SET_DEADLIN=
E on the same thing with
> > > > > > > > > >>>>>>>>>> another timestamp, what should happen?
> > > > > > > > > >>>>>>>>>
> > > > > > > > > >>>>>>>>> The expectation is that many deadline hints can=
 be set on a fence.
> > > > > > > > > >>>>>>>>> The fence signaller should track the soonest de=
adline.
> > > > > > > > > >>>>>>>>
> > > > > > > > > >>>>>>>> You need to document that as UAPI, since it is o=
bservable to userspace.
> > > > > > > > > >>>>>>>> It would be bad if drivers or subsystems would d=
iffer in behaviour.
> > > > > > > > > >>>>>>>>
> > > > > > > > > >>>>>>>
> > > > > > > > > >>>>>>> It is in the end a hint.  It is about giving the =
driver more
> > > > > > > > > >>>>>>> information so that it can make better choices.  =
But the driver is
> > > > > > > > > >>>>>>> even free to ignore it.  So maybe "expectation" i=
s too strong of a
> > > > > > > > > >>>>>>> word.  Rather, any other behavior doesn't really =
make sense.  But it
> > > > > > > > > >>>>>>> could end up being dictated by how the hw and/or =
fw works.
> > > > > > > > > >>>>>>
> > > > > > > > > >>>>>> It will stop being a hint once it has been impleme=
nted and used in the
> > > > > > > > > >>>>>> wild long enough. The kernel userspace regression =
rules make sure of
> > > > > > > > > >>>>>> that.
> > > > > > > > > >>>>>
> > > > > > > > > >>>>> Yeah, tricky and maybe a gray area in this case. I =
think we eluded
> > > > > > > > > >>>>> elsewhere in the thread that renaming the thing mig=
ht be an option.
> > > > > > > > > >>>>>
> > > > > > > > > >>>>> So maybe instead of deadline, which is a very stron=
g word, use something
> > > > > > > > > >>>>> along the lines of "present time hint", or "signall=
ed time hint"? Maybe
> > > > > > > > > >>>>> reads clumsy. Just throwing some ideas for a start.
> > > > > > > > > >>>>
> > > > > > > > > >>>> You can try, but I fear that if it ever changes beha=
viour and
> > > > > > > > > >>>> someone notices that, it's labelled as a kernel regr=
ession. I don't
> > > > > > > > > >>>> think documentation has ever been the authoritative =
definition of UABI
> > > > > > > > > >>>> in Linux, it just guides drivers and userspace towar=
ds a common
> > > > > > > > > >>>> understanding and common usage patterns.
> > > > > > > > > >>>>
> > > > > > > > > >>>> So even if the UABI contract is not documented (ugh)=
, you need to be
> > > > > > > > > >>>> prepared to set the UABI contract through kernel imp=
lementation.
> > > > > > > > > >>>
> > > > > > > > > >>> To be the devil's advocate it probably wouldn't be an=
 ABI regression but
> > > > > > > > > >>> just an regression. Same way as what nice(2) prioriti=
es mean hasn't
> > > > > > > > > >>> always been the same over the years, I don't think th=
ere is a strict
> > > > > > > > > >>> contract.
> > > > > > > > > >>>
> > > > > > > > > >>> Having said that, it may be different with latency se=
nsitive stuff such
> > > > > > > > > >>> as UIs though since it is very observable and can be =
very painful to users.
> > > > > > > > > >>>
> > > > > > > > > >>>> If you do not document the UABI contract, then diffe=
rent drivers are
> > > > > > > > > >>>> likely to implement it differently, leading to diffe=
ring behaviour.
> > > > > > > > > >>>> Also userspace will invent wild ways to abuse the UA=
BI if there is no
> > > > > > > > > >>>> documentation guiding it on proper use. If userspace=
 or end users
> > > > > > > > > >>>> observe different behaviour, that's bad even if it's=
 not a regression.
> > > > > > > > > >>>>
> > > > > > > > > >>>> I don't like the situation either, but it is what it=
 is. UABI stability
> > > > > > > > > >>>> trumps everything regardless of whether it was docum=
ented or not.
> > > > > > > > > >>>>
> > > > > > > > > >>>> I bet userspace is going to use this as a "make it f=
aster, make it
> > > > > > > > > >>>> hotter" button. I would not be surprised if someone =
wrote a LD_PRELOAD
> > > > > > > > > >>>> library that stamps any and all fences with an expir=
ed deadline to
> > > > > > > > > >>>> just squeeze out a little more through some weird si=
de-effect.
> > > > > > > > > >>>>
> > > > > > > > > >>>> Well, that's hopefully overboard in scaring, but in =
the end, I would
> > > > > > > > > >>>> like to see UABI documented so I can have a feeling =
of what it is for
> > > > > > > > > >>>> and how it was intended to be used. That's all.
> > > > > > > > > >>>
> > > > > > > > > >>> We share the same concern. If you read elsewhere in t=
hese threads you
> > > > > > > > > >>> will notice I have been calling this an "arms race". =
If the ability to
> > > > > > > > > >>> make yourself go faster does not required additional =
privilege I also
> > > > > > > > > >>> worry everyone will do it at which point it becomes p=
ointless. So yes, I
> > > > > > > > > >>> do share this concern about exposing any of this as a=
n unprivileged uapi.
> > > > > > > > > >>>
> > > > > > > > > >>> Is it possible to limit access to only compositors in=
 some sane way?
> > > > > > > > > >>> Sounds tricky when dma-fence should be disconnected f=
rom DRM..
> > > > > > > > > >>
> > > > > > > > > >> Maybe it's not that bad in this particular case, becau=
se we are talking
> > > > > > > > > >> only about boosting GPU clocks which benefits everyone=
 (except
> > > > > > > > > >> battery life) and it does not penalize other programs =
like e.g.
> > > > > > > > > >> job priorities do.
> > > > > > > > > >
> > > > > > > > > > Apart from efficiency that you mentioned, which does no=
t always favor
> > > > > > > > > > higher clocks, sometimes thermal budget is also shared =
between CPU and
> > > > > > > > > > GPU. So more GPU clocks can mean fewer CPU clocks. It's=
 really hard to
> > > > > > > > > > make optimal choices without the full coordination betw=
een both schedulers.
> > > > > > > > > >
> > > > > > > > > > But that is even not the main point, which is that if e=
veryone sets the
> > > > > > > > > > immediate deadline then having the deadline API is a bi=
t pointless. For
> > > > > > > > > > instance there is a reason negative nice needs CAP_SYS_=
ADMIN.
> > > > > > > > > >
> > > > > > > > > > However Rob has also pointed out the existence of uclam=
p.min via
> > > > > > > > > > sched_setattr which is unprivileged and can influence f=
requency
> > > > > > > > > > selection in the CPU world, so I conceded on that point=
. If CPU world
> > > > > > > > > > has accepted it so can we I guess.
> > > > > > > > > >
> > > > > > > > > > So IMO we are back to whether we can agree defining it =
is a hint is good
> > > > > > > > > > enough, be in via the name of the ioctl/flag itself or =
via documentation.
> > > > > > > > > >
> > > > > > > > > >> Drivers are not going to use the deadline for scheduli=
ng priorities,
> > > > > > > > > >> right? I don't recall seeing any mention of that.
> > > > > > > > > >>
> > > > > > > > > >> ...right?
> > > > > > > > > >
> > > > > > > > > > I wouldn't have thought it would be beneficial to precl=
ude that, or
> > > > > > > > > > assume what drivers would do with the info to begin wit=
h.
> > > > > > > > > >
> > > > > > > > > > For instance in i915 we almost had a deadline based sch=
eduler which was
> > > > > > > > > > much fairer than the current priority sorted fifo and i=
n an ideal world
> > > > > > > > > > we would either revive or re-implement that idea. In wh=
ich case
> > > > > > > > > > considering the fence deadline would naturally slot in =
and give true
> > > > > > > > > > integration with compositor deadlines (not just boost c=
locks and pray it
> > > > > > > > > > helps).
> > > > > > > > > How is user-space to decide whether to use ioctl(SET_DEAD=
LINE) or
> > > > > > > > > poll(POLLPRI)?
> > > > > > > >
> > > > > > > > Implementation of blocking gl/vk/cl APIs, like glFinish() w=
ould use
> > > > > > > > poll(POLLPRI).  It could also set an immediate deadline and=
 then call
> > > > > > > > poll() without POLLPRI.
> > > > > > > >
> > > > > > > > Other than compositors which do frame-pacing I expect the m=
ain usage
> > > > > > > > of either of these is mesa.
> > > > > > >
> > > > > > > Okay, so it looks like we already agreed that having a way to=
 bump frequency
> > > > > > > from userspace is acceptable. either because there are alread=
y other ways
> > > > > > > that you can waste power and because this already acceptable =
in the CPU
> > > > > > > world.
> > > > > > >
> > > > > > > But why we are doing this in hidden ways then?
> > > > > > >
> > > > > > > Why can't we have this hint per context that is getting execu=
ted?
> > > > > > > (either with a boost-context flag or with some low/med/max or=
 '-1' to '1'
> > > > > > > value like the latency priority)?
> > > > > > >
> > > > > > > I don't like the waitboost because this heurisitic fails in s=
ome media cases.
> > > > > > > I don't like the global setting because we might be alternati=
ng a top-priority
> > > > > > > with low-priority cases...
> > > > > > >
> > > > > > > So, why not something per context in execution?
> > > > > > >
> > > > > >
> > > > > > It needs to be finer granularity than per-context, because not =
all
> > > > > > waits should trigger boosting.  For example, virglrenderer ends=
 up
> > > > > > with a thread polling unsignaled fences to know when to signal =
an
> > > > > > interrupt to the guest virtgpu.  This alone shouldn't trigger
> > > > > > boosting.  (We also wouldn't want to completely disable boostin=
g for
> > > > > > virglrenderer.)  Or the usermode driver could be waiting on a f=
ence to
> > > > > > know when to do some cleanup.
> > > > > >
> > > > > > That is not to say that there isn't room for per-context flags =
to
> > > > > > disable/enable boosting for fences created by that context, mea=
ning it
> > > > > > could be an AND operation for i915 if it needs to be.
> > > > >
> > > > > First of all, I believe that the fence deadline hint is a good id=
ea.
> > > > > With that being said, I also don't think it is sufficient in a lo=
t of
> > > > > cases.
> > > > >
> > > > > The one thing I was alluding to before and that Pekka mentioned a=
s
> > > > > well is that mutter for example has a problem where we're missing=
 the
> > > > > deadline consistently because the clocks don't ramp up fast enoug=
h and
> > > > > there is a MR which is just trying to keep the GPU busy to avoid =
this.
> > > >
> > > > the dynamic double/triple buffer thing?
> > >
> > > Yes
> > >
> > > > > It would be much better if the kernel could make sure the clocks =
are
> > > > > all ramped up when we start submitting work. In the compositor we
> > > > > actually have a lot of information that *should* influence clocks=
. We
> > > > > know when we're going to start submitting work and when the deadl=
ine
> > > > > for that work is beforehand. We know which windows are visible, a=
nd
> > > > > which one should have the highest priority.
> > > >
> > > > This sounds like something orthogonal.. something for cgroups?  Ie.
> > > > android moves visible/foreground apps to a different cgroup to give=
n
> > > > them higher priority.  Tvrtko had a patchset to add drm cgroup
> > > > support..
> > >
> > > For the priority stuff, yes, probably. The visibility information on
> > > the other hand could be used to determine if we want to ramp up the
> > > GPU in the first place.
> >
> > Right, but I think that we could have multiple cgroup based knobs, one
> > that adjusts priority and one that limits/disables deadline based
> > boost?  This way the compositor could setup different policies for
> > visible vs hidden apps influencing both how much time they get on the
> > GPU and boost.
>
> I'm not sure if a negative control really makes sense. There are
> probably timing sensitive use cases where the result doesn't show up
> on the local screen and penalizing them when they are not focused or
> hidden might also not be the best idea.

Policy decisions are up to the OS/distro.. we can only provide
controls that can be tuned, it is up to someone else to choose how to
use those controls, such as whether it wants to differentiate between
visible and non-visible apps.  That is why cgroups and a negative
control are a good solution for controlling what the driver does with
the deadline boost hint.

> > > > > We know when there are
> > > > > input events which actually matter.
> > > >
> > > > This I see input as a different boost source for the driver.  (Ie. =
one
> > > > boost signal is missing fence deadlines, another is input events,
> > > > etc.)
> > > >
> > > > We end up using downstream input-handlers on the kernel side for th=
is.
> > > > Partially for the freq boost (but mostly not, UI interactive worklo=
ads
> > > > like touchscreen scrolling don't generally need high GPU freqs, the=
y
> > > > are more memory bandwidth limited if they are limited by anything).=
.
> > > > really the reason here is to get a head-start on the ~2ms that it
> > > > takes to power up the GPU if it is suspended.
> > >
> > > Right, but one of my main points I want to make here is that we could
> > > get the head-start not only in response to input events but also for
> > > the GPU work the compositor submits and in the future also to GPU wor=
k
> > > that clients commit. Except that we don't have a way to tell the
> > > kernel about it.
> > >
> > > > But this is not quite perfect, since for example some keys should b=
e
> > > > handled on key-down but others on key-up.
> > > >
> > > > But again, this is something different from fence deadlines.  I'm
> > > > interested in proposals because we do need something for this.  But=
 I
> > > > think it is something is orthogonal to this series.  For input, we
> > > > want the kernel to know long before userspace is ready to submit
> > > > rendering.
> > >
> > > We can do that in the compositor! Input events are really not
> > > something you should care about in the kernel. Input itself is also
> > > not the only indication of incoming animated content. Some network
> > > packets arriving could equally well result in the same situation.
> >
> > We do use input boost not just for GPU freq, but also for CPU freq.
> > It seems like triggering it from the kernel could happen somewhat
> > sooner than userspace.  (But just speculation.)
>
> Technically it has to be sooner but I doubt it makes any difference.
> Getting a lot of false-positives on the other hand does make a
> difference.

Regardless of whether it is done in kernel or userspace, you do want a
cooldown period so you are not constantly boosting.

Generally false-positives aren't much of a problem.. ie. touch or
mouse events are not ambiguous.  The exception is key events, because
ideally you don't want to hard-code in the kernel which keys are
modifier keys that should be handled on key-up instead of key-down.
But I think if we allowed userspace to configure this somehow, it
would be perfectly reasonable (and optimal) to handle input boost in
the kernel.

> > I'm not sure network packets count.  Or at least compared to a touch
> > interface, the user won't perceive the lag nearly as much, compared to
> > whether or not the UI tracks their fingertips.
>
> Sure, stutter in interactive cases is especially awful but stutter is
> awful in general. If we can solve it in all cases we should do so.

Sure, but the cases where I've seen a need for input boost are all
about the transition from idle->active.  Ie. the display panel has
gone to self-refresh, gpu is suspended, cpu and memory is downclocked.
And suddenly the user decides they want to start scrolling.  We need
some help to adapt to the new state where we are all of a sudden busy
doing something.  This is where input-boost comes in.  If there is no
direct connection to user input, then there is no lag for the user to
percieve.

> > > > > We know when the deadline for
> > > > > client work is.
> > > > >
> > > > > In the future we also want to make sure clients know beforehand w=
hen
> > > > > they should start their work and when the deadline is but that's =
all
> > > > > very much WIP in both wayland and vulkan.
> > > > >
> > > > > There are two issues:
> > > > >
> > > > > 1. The compositor has no way to communicate any of that informati=
on to
> > > > > the kernel.
> > > > > 2. The only connection to client work the compositor has is a fen=
ce to
> > > > > the last bit of work that must be done before the deadline after =
a
> > > > > wl_surface.commit.
> > > >
> > > > If the client isn't using multiple GPUs, a single fence should be
> > > > sufficient.  And even if it is, well we still have all the dependen=
cy
> > > > information on the kernel side.  Ie. drm/sched knows what fences it=
 is
> > > > waiting on if it is waiting to schedule the work associated with th=
e
> > > > last fence.  It would otherwise require drm/sched to be a bit more
> > > > tricky than it is so far in this series.
> > > >
> > > > But I think the normal dual-gpu case, the app is only dealing with =
a single GPU?
> > >
> > > We generally don't know which GPU a client uses though. We know which
> > > one we're using and tell the client that the buffer should be
> > > compatible with it but that's the extent of information we have, unti=
l
> > > we get a fence but that fence usually gets to the compositor pretty
> > > late. Way too late for the compositor to tell the kernel to ramp up
> > > the GPU and still have an impact.
> >
> > Are you sure about that?  I'd have expected the app to hand off
> > fence+buffer to the compositor pretty quickly after rendering is
> > submitted.  This is what I've seen elsewhere.
>
> After rendering is submitted it is already too late if the GPU takes
> 2ms to wake up. And if there is no rendering submitted there is no
> fence and if there is no fence it has no deadline. If we want to solve
> that we also need some kind of 'work will be submitted to the queue
> starting from this time' hint.

Right, which is why I view this as a different problem with a
different solution.

> > > It also seems like we're moving away from tracking execution
> > > dependencies with fences when we're switching to user mode fences.
> >
> > I suppose there are two cases..
> >
> > 1) dependent fences all from the same device.. no prob, the right
> > driver gets the signal that it needs to clk up, and figures out the
> > rest on it's own
>
> AFAIU with user mode fences it's impossible for the kernel to figure
> out what work depends on it and it might never signal. The whole
> deadline on fences thing breaks down with user mode fences.

Given that user-mode fences are not a solved problem (and I don't
think they'll ever completely replace kernel fences), I don't think
this is relevant.

BR,
-R

> > 2) dependent fences from different devices.. I suppose if device B is
> > waiting for a fence from device A before it can make forward progress,
> > why not express this as a deadline hint on A's fence?  (But by the
> > time you have this problem, you are probably not really caring about
> > power consumption, so meh..)
> >
> > BR,
> > -R
> >
> > > > > So in both cases a fence is just not the right primitive for us. =
We
> > > > > need to be able to provide per-context/queue information for work=
 that
> > > > > will happen in the future and we need a way to refer to a
> > > > > context/queue generically and over IPC to boost the clocks of the
> > > > > device that a client is actually using and maybe even give priori=
ty.
> > > > >
> > > > > But like I said, having a per-fence deadline is probably still a =
good
> > > > > idea and doesn't conflict with any of the more coarse information=
.
> > > >
> > > > Yeah, I think the thing is you need multiple things, and this is on=
ly
> > > > one of them ;-)
> > > >
> > > > BR,
> > > > -R
> > > >
> > >
> >
>
