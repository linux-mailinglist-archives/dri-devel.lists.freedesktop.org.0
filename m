Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141CC6A62DD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2146410E0EC;
	Tue, 28 Feb 2023 22:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142F410E0E4;
 Tue, 28 Feb 2023 22:52:27 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id t22so9346526oiw.12;
 Tue, 28 Feb 2023 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677624746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+xn0kkLJKSd4QmG3K7ip5xkkpoJkU+E6BNKewjBKO4=;
 b=hm2BbRf6iwyOalHaun6BduT03qt0ZYxvCu1gelVUyRKiW7rRVseRss0aTG5bQt9GM1
 zAQetjCVvlwssDrNYJGH7x3naVeZN+KE3PB3VnxDvMMnnnQHvuGTP5RZGHvF01yXeaSa
 rXKC7+Z25WPgCkWVYGbZATHtkr9A9yeoMQQb2hbWJadHRTdJInsI1T0diF8s4UEn0WGQ
 j4cTklhIkrHQvbOyxg3S8TO0Man6+wR7+i+ESaDRUV16AstXJpR35+yfQDHU3WSYu14J
 cawWo8geq+lb6gscrDSzvkTotlzuhoTsSTMckxs2qa+vrME/GMuqTEDSOa7wBVvGRvzh
 9xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677624746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+xn0kkLJKSd4QmG3K7ip5xkkpoJkU+E6BNKewjBKO4=;
 b=MxRGi62cWuFI5hR8Iyi8hOfzfS1Ea6R0hse4ItFjsnKmp2512GSw1bxruLoeel+jS6
 cWbahq+q6ER/WIlT1HTzhxFgvNOZNBIVNfdyu0PpZdIfWGLEKY7zjIyP+52O4dKcfOUU
 lMxaP/BxJMlnikSUsxRGLZvq+TnxMMTW2Rw9r/OHXdOaR4A5AFXWPXNW6BfubMkJ9diA
 r17TX0dv0mWqE75jtKCb6Ibc/GQK/rcb8NqnP2JrI3TBrYqfCYTwa+JXduNsGHO08uO3
 6JLYHyzb5wkpV6sy4vTqAQKFchw3/Khpi5jAlheUJWQNZYN85e6JVmwbssUg1nc0Sur+
 zBZw==
X-Gm-Message-State: AO0yUKWxgfVhyZDVrhkdNrT/9KgkTqaGCWbr4nBrwWTZLFXijenkEGjw
 dEidpeZ3sSUKzcRHKb70E63N6BBFpAwElVO/9Ebb5kSj
X-Google-Smtp-Source: AK7set+ta7DIOuLpCnrxaCmgIjP+o9Pcaow818kkCRbnz+bZCOULyHF4/ioxNiYz4AVFG4chPxLTvwSDzE03Wl1nD38=
X-Received: by 2002:a54:440f:0:b0:37d:b58a:6192 with SMTP id
 k15-20020a54440f000000b0037db58a6192mr1560724oiw.3.1677624745945; Tue, 28 Feb
 2023 14:52:25 -0800 (PST)
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
In-Reply-To: <CA+hFU4x0VrQwF4JJcfHNwXrCUF8kP0d=Nhy5bboy=u5pJAgekQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Feb 2023 14:52:14 -0800
Message-ID: <CAF6AEGtBFOvVK-p1Xox-6wp4frrmVqO5C5rq4OxUUMv8V51CVA@mail.gmail.com>
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

On Tue, Feb 28, 2023 at 6:30 AM Sebastian Wick
<sebastian.wick@redhat.com> wrote:
>
> On Tue, Feb 28, 2023 at 12:48=E2=80=AFAM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > On Mon, Feb 27, 2023 at 2:44 PM Sebastian Wick
> > <sebastian.wick@redhat.com> wrote:
> > >
> > > On Mon, Feb 27, 2023 at 11:20 PM Rob Clark <robdclark@gmail.com> wrot=
e:
> > > >
> > > > On Mon, Feb 27, 2023 at 1:36 PM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
> > > > >
> > > > > On Fri, Feb 24, 2023 at 09:59:57AM -0800, Rob Clark wrote:
> > > > > > On Fri, Feb 24, 2023 at 7:27 AM Luben Tuikov <luben.tuikov@amd.=
com> wrote:
> > > > > > >
> > > > > > > On 2023-02-24 06:37, Tvrtko Ursulin wrote:
> > > > > > > >
> > > > > > > > On 24/02/2023 11:00, Pekka Paalanen wrote:
> > > > > > > >> On Fri, 24 Feb 2023 10:50:51 +0000
> > > > > > > >> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > > > >>
> > > > > > > >>> On 24/02/2023 10:24, Pekka Paalanen wrote:
> > > > > > > >>>> On Fri, 24 Feb 2023 09:41:46 +0000
> > > > > > > >>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > > > >>>>
> > > > > > > >>>>> On 24/02/2023 09:26, Pekka Paalanen wrote:
> > > > > > > >>>>>> On Thu, 23 Feb 2023 10:51:48 -0800
> > > > > > > >>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > >>>>>>
> > > > > > > >>>>>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaal=
anen@gmail.com> wrote:
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> On Wed, 22 Feb 2023 07:37:26 -0800
> > > > > > > >>>>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppa=
alanen@gmail.com> wrote:
> > > > > > > >>>>>>
> > > > > > > >>>>>> ...
> > > > > > > >>>>>>
> > > > > > > >>>>>>>>>> On another matter, if the application uses SET_DEA=
DLINE with one
> > > > > > > >>>>>>>>>> timestamp, and the compositor uses SET_DEADLINE on=
 the same thing with
> > > > > > > >>>>>>>>>> another timestamp, what should happen?
> > > > > > > >>>>>>>>>
> > > > > > > >>>>>>>>> The expectation is that many deadline hints can be =
set on a fence.
> > > > > > > >>>>>>>>> The fence signaller should track the soonest deadli=
ne.
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> You need to document that as UAPI, since it is obser=
vable to userspace.
> > > > > > > >>>>>>>> It would be bad if drivers or subsystems would diffe=
r in behaviour.
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> It is in the end a hint.  It is about giving the driv=
er more
> > > > > > > >>>>>>> information so that it can make better choices.  But =
the driver is
> > > > > > > >>>>>>> even free to ignore it.  So maybe "expectation" is to=
o strong of a
> > > > > > > >>>>>>> word.  Rather, any other behavior doesn't really make=
 sense.  But it
> > > > > > > >>>>>>> could end up being dictated by how the hw and/or fw w=
orks.
> > > > > > > >>>>>>
> > > > > > > >>>>>> It will stop being a hint once it has been implemented=
 and used in the
> > > > > > > >>>>>> wild long enough. The kernel userspace regression rule=
s make sure of
> > > > > > > >>>>>> that.
> > > > > > > >>>>>
> > > > > > > >>>>> Yeah, tricky and maybe a gray area in this case. I thin=
k we eluded
> > > > > > > >>>>> elsewhere in the thread that renaming the thing might b=
e an option.
> > > > > > > >>>>>
> > > > > > > >>>>> So maybe instead of deadline, which is a very strong wo=
rd, use something
> > > > > > > >>>>> along the lines of "present time hint", or "signalled t=
ime hint"? Maybe
> > > > > > > >>>>> reads clumsy. Just throwing some ideas for a start.
> > > > > > > >>>>
> > > > > > > >>>> You can try, but I fear that if it ever changes behaviou=
r and
> > > > > > > >>>> someone notices that, it's labelled as a kernel regressi=
on. I don't
> > > > > > > >>>> think documentation has ever been the authoritative defi=
nition of UABI
> > > > > > > >>>> in Linux, it just guides drivers and userspace towards a=
 common
> > > > > > > >>>> understanding and common usage patterns.
> > > > > > > >>>>
> > > > > > > >>>> So even if the UABI contract is not documented (ugh), yo=
u need to be
> > > > > > > >>>> prepared to set the UABI contract through kernel impleme=
ntation.
> > > > > > > >>>
> > > > > > > >>> To be the devil's advocate it probably wouldn't be an ABI=
 regression but
> > > > > > > >>> just an regression. Same way as what nice(2) priorities m=
ean hasn't
> > > > > > > >>> always been the same over the years, I don't think there =
is a strict
> > > > > > > >>> contract.
> > > > > > > >>>
> > > > > > > >>> Having said that, it may be different with latency sensit=
ive stuff such
> > > > > > > >>> as UIs though since it is very observable and can be very=
 painful to users.
> > > > > > > >>>
> > > > > > > >>>> If you do not document the UABI contract, then different=
 drivers are
> > > > > > > >>>> likely to implement it differently, leading to differing=
 behaviour.
> > > > > > > >>>> Also userspace will invent wild ways to abuse the UABI i=
f there is no
> > > > > > > >>>> documentation guiding it on proper use. If userspace or =
end users
> > > > > > > >>>> observe different behaviour, that's bad even if it's not=
 a regression.
> > > > > > > >>>>
> > > > > > > >>>> I don't like the situation either, but it is what it is.=
 UABI stability
> > > > > > > >>>> trumps everything regardless of whether it was documente=
d or not.
> > > > > > > >>>>
> > > > > > > >>>> I bet userspace is going to use this as a "make it faste=
r, make it
> > > > > > > >>>> hotter" button. I would not be surprised if someone wrot=
e a LD_PRELOAD
> > > > > > > >>>> library that stamps any and all fences with an expired d=
eadline to
> > > > > > > >>>> just squeeze out a little more through some weird side-e=
ffect.
> > > > > > > >>>>
> > > > > > > >>>> Well, that's hopefully overboard in scaring, but in the =
end, I would
> > > > > > > >>>> like to see UABI documented so I can have a feeling of w=
hat it is for
> > > > > > > >>>> and how it was intended to be used. That's all.
> > > > > > > >>>
> > > > > > > >>> We share the same concern. If you read elsewhere in these=
 threads you
> > > > > > > >>> will notice I have been calling this an "arms race". If t=
he ability to
> > > > > > > >>> make yourself go faster does not required additional priv=
ilege I also
> > > > > > > >>> worry everyone will do it at which point it becomes point=
less. So yes, I
> > > > > > > >>> do share this concern about exposing any of this as an un=
privileged uapi.
> > > > > > > >>>
> > > > > > > >>> Is it possible to limit access to only compositors in som=
e sane way?
> > > > > > > >>> Sounds tricky when dma-fence should be disconnected from =
DRM..
> > > > > > > >>
> > > > > > > >> Maybe it's not that bad in this particular case, because w=
e are talking
> > > > > > > >> only about boosting GPU clocks which benefits everyone (ex=
cept
> > > > > > > >> battery life) and it does not penalize other programs like=
 e.g.
> > > > > > > >> job priorities do.
> > > > > > > >
> > > > > > > > Apart from efficiency that you mentioned, which does not al=
ways favor
> > > > > > > > higher clocks, sometimes thermal budget is also shared betw=
een CPU and
> > > > > > > > GPU. So more GPU clocks can mean fewer CPU clocks. It's rea=
lly hard to
> > > > > > > > make optimal choices without the full coordination between =
both schedulers.
> > > > > > > >
> > > > > > > > But that is even not the main point, which is that if every=
one sets the
> > > > > > > > immediate deadline then having the deadline API is a bit po=
intless. For
> > > > > > > > instance there is a reason negative nice needs CAP_SYS_ADMI=
N.
> > > > > > > >
> > > > > > > > However Rob has also pointed out the existence of uclamp.mi=
n via
> > > > > > > > sched_setattr which is unprivileged and can influence frequ=
ency
> > > > > > > > selection in the CPU world, so I conceded on that point. If=
 CPU world
> > > > > > > > has accepted it so can we I guess.
> > > > > > > >
> > > > > > > > So IMO we are back to whether we can agree defining it is a=
 hint is good
> > > > > > > > enough, be in via the name of the ioctl/flag itself or via =
documentation.
> > > > > > > >
> > > > > > > >> Drivers are not going to use the deadline for scheduling p=
riorities,
> > > > > > > >> right? I don't recall seeing any mention of that.
> > > > > > > >>
> > > > > > > >> ...right?
> > > > > > > >
> > > > > > > > I wouldn't have thought it would be beneficial to preclude =
that, or
> > > > > > > > assume what drivers would do with the info to begin with.
> > > > > > > >
> > > > > > > > For instance in i915 we almost had a deadline based schedul=
er which was
> > > > > > > > much fairer than the current priority sorted fifo and in an=
 ideal world
> > > > > > > > we would either revive or re-implement that idea. In which =
case
> > > > > > > > considering the fence deadline would naturally slot in and =
give true
> > > > > > > > integration with compositor deadlines (not just boost clock=
s and pray it
> > > > > > > > helps).
> > > > > > > How is user-space to decide whether to use ioctl(SET_DEADLINE=
) or
> > > > > > > poll(POLLPRI)?
> > > > > >
> > > > > > Implementation of blocking gl/vk/cl APIs, like glFinish() would=
 use
> > > > > > poll(POLLPRI).  It could also set an immediate deadline and the=
n call
> > > > > > poll() without POLLPRI.
> > > > > >
> > > > > > Other than compositors which do frame-pacing I expect the main =
usage
> > > > > > of either of these is mesa.
> > > > >
> > > > > Okay, so it looks like we already agreed that having a way to bum=
p frequency
> > > > > from userspace is acceptable. either because there are already ot=
her ways
> > > > > that you can waste power and because this already acceptable in t=
he CPU
> > > > > world.
> > > > >
> > > > > But why we are doing this in hidden ways then?
> > > > >
> > > > > Why can't we have this hint per context that is getting executed?
> > > > > (either with a boost-context flag or with some low/med/max or '-1=
' to '1'
> > > > > value like the latency priority)?
> > > > >
> > > > > I don't like the waitboost because this heurisitic fails in some =
media cases.
> > > > > I don't like the global setting because we might be alternating a=
 top-priority
> > > > > with low-priority cases...
> > > > >
> > > > > So, why not something per context in execution?
> > > > >
> > > >
> > > > It needs to be finer granularity than per-context, because not all
> > > > waits should trigger boosting.  For example, virglrenderer ends up
> > > > with a thread polling unsignaled fences to know when to signal an
> > > > interrupt to the guest virtgpu.  This alone shouldn't trigger
> > > > boosting.  (We also wouldn't want to completely disable boosting fo=
r
> > > > virglrenderer.)  Or the usermode driver could be waiting on a fence=
 to
> > > > know when to do some cleanup.
> > > >
> > > > That is not to say that there isn't room for per-context flags to
> > > > disable/enable boosting for fences created by that context, meaning=
 it
> > > > could be an AND operation for i915 if it needs to be.
> > >
> > > First of all, I believe that the fence deadline hint is a good idea.
> > > With that being said, I also don't think it is sufficient in a lot of
> > > cases.
> > >
> > > The one thing I was alluding to before and that Pekka mentioned as
> > > well is that mutter for example has a problem where we're missing the
> > > deadline consistently because the clocks don't ramp up fast enough an=
d
> > > there is a MR which is just trying to keep the GPU busy to avoid this=
.
> >
> > the dynamic double/triple buffer thing?
>
> Yes
>
> > > It would be much better if the kernel could make sure the clocks are
> > > all ramped up when we start submitting work. In the compositor we
> > > actually have a lot of information that *should* influence clocks. We
> > > know when we're going to start submitting work and when the deadline
> > > for that work is beforehand. We know which windows are visible, and
> > > which one should have the highest priority.
> >
> > This sounds like something orthogonal.. something for cgroups?  Ie.
> > android moves visible/foreground apps to a different cgroup to given
> > them higher priority.  Tvrtko had a patchset to add drm cgroup
> > support..
>
> For the priority stuff, yes, probably. The visibility information on
> the other hand could be used to determine if we want to ramp up the
> GPU in the first place.

Right, but I think that we could have multiple cgroup based knobs, one
that adjusts priority and one that limits/disables deadline based
boost?  This way the compositor could setup different policies for
visible vs hidden apps influencing both how much time they get on the
GPU and boost.

> > > We know when there are
> > > input events which actually matter.
> >
> > This I see input as a different boost source for the driver.  (Ie. one
> > boost signal is missing fence deadlines, another is input events,
> > etc.)
> >
> > We end up using downstream input-handlers on the kernel side for this.
> > Partially for the freq boost (but mostly not, UI interactive workloads
> > like touchscreen scrolling don't generally need high GPU freqs, they
> > are more memory bandwidth limited if they are limited by anything)..
> > really the reason here is to get a head-start on the ~2ms that it
> > takes to power up the GPU if it is suspended.
>
> Right, but one of my main points I want to make here is that we could
> get the head-start not only in response to input events but also for
> the GPU work the compositor submits and in the future also to GPU work
> that clients commit. Except that we don't have a way to tell the
> kernel about it.
>
> > But this is not quite perfect, since for example some keys should be
> > handled on key-down but others on key-up.
> >
> > But again, this is something different from fence deadlines.  I'm
> > interested in proposals because we do need something for this.  But I
> > think it is something is orthogonal to this series.  For input, we
> > want the kernel to know long before userspace is ready to submit
> > rendering.
>
> We can do that in the compositor! Input events are really not
> something you should care about in the kernel. Input itself is also
> not the only indication of incoming animated content. Some network
> packets arriving could equally well result in the same situation.

We do use input boost not just for GPU freq, but also for CPU freq.
It seems like triggering it from the kernel could happen somewhat
sooner than userspace.  (But just speculation.)

I'm not sure network packets count.  Or at least compared to a touch
interface, the user won't perceive the lag nearly as much, compared to
whether or not the UI tracks their fingertips.

> > > We know when the deadline for
> > > client work is.
> > >
> > > In the future we also want to make sure clients know beforehand when
> > > they should start their work and when the deadline is but that's all
> > > very much WIP in both wayland and vulkan.
> > >
> > > There are two issues:
> > >
> > > 1. The compositor has no way to communicate any of that information t=
o
> > > the kernel.
> > > 2. The only connection to client work the compositor has is a fence t=
o
> > > the last bit of work that must be done before the deadline after a
> > > wl_surface.commit.
> >
> > If the client isn't using multiple GPUs, a single fence should be
> > sufficient.  And even if it is, well we still have all the dependency
> > information on the kernel side.  Ie. drm/sched knows what fences it is
> > waiting on if it is waiting to schedule the work associated with the
> > last fence.  It would otherwise require drm/sched to be a bit more
> > tricky than it is so far in this series.
> >
> > But I think the normal dual-gpu case, the app is only dealing with a si=
ngle GPU?
>
> We generally don't know which GPU a client uses though. We know which
> one we're using and tell the client that the buffer should be
> compatible with it but that's the extent of information we have, until
> we get a fence but that fence usually gets to the compositor pretty
> late. Way too late for the compositor to tell the kernel to ramp up
> the GPU and still have an impact.

Are you sure about that?  I'd have expected the app to hand off
fence+buffer to the compositor pretty quickly after rendering is
submitted.  This is what I've seen elsewhere.

> It also seems like we're moving away from tracking execution
> dependencies with fences when we're switching to user mode fences.

I suppose there are two cases..

1) dependent fences all from the same device.. no prob, the right
driver gets the signal that it needs to clk up, and figures out the
rest on it's own

2) dependent fences from different devices.. I suppose if device B is
waiting for a fence from device A before it can make forward progress,
why not express this as a deadline hint on A's fence?  (But by the
time you have this problem, you are probably not really caring about
power consumption, so meh..)

BR,
-R

> > > So in both cases a fence is just not the right primitive for us. We
> > > need to be able to provide per-context/queue information for work tha=
t
> > > will happen in the future and we need a way to refer to a
> > > context/queue generically and over IPC to boost the clocks of the
> > > device that a client is actually using and maybe even give priority.
> > >
> > > But like I said, having a per-fence deadline is probably still a good
> > > idea and doesn't conflict with any of the more coarse information.
> >
> > Yeah, I think the thing is you need multiple things, and this is only
> > one of them ;-)
> >
> > BR,
> > -R
> >
>
