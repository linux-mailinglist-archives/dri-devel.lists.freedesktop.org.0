Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A26962929
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8351C10E50C;
	Wed, 28 Aug 2024 13:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Du/0qVVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5CE10E478;
 Wed, 28 Aug 2024 13:46:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-533463f6b16so7933778e87.1; 
 Wed, 28 Aug 2024 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724852810; x=1725457610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zK1lhMw3IsSWwXgKEhgbn5qag7aMlRwtX6PSIQDNdLw=;
 b=Du/0qVVaj5AI+NYMNeYNTRe0+tXTBzq5aMcrw9kfhaxbxuptvyyzd9V2p716tWwd1c
 RtFX061pqwDibElqwr98Gztvsp7ui03XiBq1aYt+nI3L/FC61wRD7+OkyvRn4lI4o00V
 ZdufmsUcAbGrwY8H3ht9lEqgVOl00MV73WGLwWqRvmVV7gv99oMjr/SugJoK70lc6B1+
 5A6AuLj4qZOniJT0qK3OGsPTUvDJPvylVaG3MtEJgvLN1AR2bosKR1FEc+x72WuimFs0
 dVFIRHeJJKZX+NOWmNClB0FF6esMHBsyFMi9IcDWkL/lKPGY2kpuMMYQb5lpkoRX2hQz
 ACBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724852810; x=1725457610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zK1lhMw3IsSWwXgKEhgbn5qag7aMlRwtX6PSIQDNdLw=;
 b=xOGyahmtCyhwBuD37vE7umraNb3JeMOu+la8qytsFg/9XTr3nvLmMVlinjnQjjIgND
 xtHGRRaZxfwLu6zQ28XmMc7HkIBlb0woG65H0CliU0zAQbGJ6HknG8kVvsJF0ZwYRoEF
 KFuyQREcSujvRci2Jqunn68NVqHYm9B8ZD8bu0WYq1WrDHUlz7PBXM628KSo1aXTkJEy
 I8xAIrD2bQDIt89v9fQ3V+xJZc7k5PLxAmKCbjMoJGrzPN6+wpKTzjymRA0xV1ncFZqX
 ijRQKIVmCpOqmoJ5ZOpPuw5iXR/g9ssV3SJMaPR6QERKQz1b//cXKWapDMstnU7+pvxS
 3yAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoIJIwvGJRNo1K0fp+CP8lA44J7jnqGCXg+0uCAQoFIa7Io+g7wKWpkk/9fFAekpeKdjZJA4s1fPQ4@lists.freedesktop.org,
 AJvYcCXEih+w+50UEeLODPzMSMqtbld+Oob6wqrdasjZHCOdhMt6d+faj0GngfCCDaNlABOTh+hL/jeZKkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/nX5h+Hd4yimleeHBjVR5xMxZBHSTHiqnVxQRP1LOV50atMI/
 ydJL4k3h5oMQr/o0ooy67ajM20P3XFlbLpeojzBXEffGYRqHRyPFwKN4ccntKYLjNm7U24U1vb3
 hIq2ySo6uuP4hHM3yZ2JSyYUm5Tk=
X-Google-Smtp-Source: AGHT+IFUTMrOZvhdOzhyEhoAcvZyzQa9INgHinlfjZc1gSs77VWpaj/Y9vJhrfrFiAuGjUoshzpAbZ/M20KY6vVjT+Q=
X-Received: by 2002:a05:651c:2121:b0:2ef:dd45:8755 with SMTP id
 38308e7fff4ca-2f4f48ec79fmr120483011fa.9.1724852809216; Wed, 28 Aug 2024
 06:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com>
 <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
 <CACu1E7EueMnte9e+yLEtRE9WmG0J5bVMj59VbPfkDeB7OHbsAw@mail.gmail.com>
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
 <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
 <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
 <57064da3-190c-4554-b085-d56daf979933@gmail.com>
 <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
In-Reply-To: <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Aug 2024 06:46:37 -0700
Message-ID: <CAF6AEGuBMiQft4SCrf=xTQ76q8=+-OS3SEKMmw7TGT5rb=Sygw@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>
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

On Wed, Aug 28, 2024 at 6:42=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Aug 27, 2024 at 3:56=E2=80=AFPM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
> >
> > On 8/27/24 11:07 PM, Rob Clark wrote:
> > > On Tue, Aug 27, 2024 at 1:25=E2=80=AFPM Antonino Maniscalco
> > > <antomani103@gmail.com> wrote:
> > >>
> > >> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> > >>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
> > >>>> On Fri, Aug 23, 2024 at 10:21=E2=80=AFAM Connor Abbott <cwabbott0@=
gmail.com> wrote:
> > >>>>>
> > >>>>> On Thu, Aug 22, 2024 at 9:06=E2=80=AFPM Akhil P Oommen <quic_akhi=
lpo@quicinc.com> wrote:
> > >>>>>>
> > >>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> > >>>>>>> On Mon, Aug 19, 2024 at 9:09=E2=80=AFPM Akhil P Oommen <quic_ak=
hilpo@quicinc.com> wrote:
> > >>>>>>>>
> > >>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco =
wrote:
> > >>>>>>>>> This patch implements preemption feature for A6xx targets, th=
is allows
> > >>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is r=
eady. A6XX
> > >>>>>>>>> hardware as such supports multiple levels of preemption granu=
larities,
> > >>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine =
grained
> > >>>>>>>>> such as draw-call level or a bin boundary level preemption. T=
his patch
> > >>>>>>>>> enables the basic preemption level, with more fine grained pr=
eemption
> > >>>>>>>>> support to follow.
> > >>>>>>>>>
> > >>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > >>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > >>>>>>>>> ---
> > >>>>>>>>
> > >>>>>>>> No postamble packets which resets perfcounters? It is necessar=
y. Also, I
> > >>>>>>>> think we should disable preemption during profiling like we di=
sable slumber.
> > >>>>>>>>
> > >>>>>>>> -Akhil.
> > >>>>>>>
> > >>>>>>> I don't see anything in kgsl which disables preemption during
> > >>>>>>> profiling. It disables resetting perfcounters when doing system=
-wide
> > >>>>>>> profiling, like freedreno, and in that case I assume preempting=
 is
> > >>>>>>> fine because the system profiler has a complete view of everyth=
ing and
> > >>>>>>> should "see" preemptions through the traces. For something like
> > >>>>>>> VK_KHR_performance_query I suppose we'd want to disable preempt=
ion
> > >>>>>>> because we disable saving/restoring perf counters, but that has=
 to
> > >>>>>>> happen in userspace because the kernel doesn't know what usersp=
ace
> > >>>>>>> does.
> > >>>>>>>
> > >>>>>>
> > >>>>>> KGSL does some sort of arbitration of perfcounter configurations=
 and
> > >>>>>> adds the select/enablement reg configuration as part of dynamic
> > >>>>>> power up register list which we are not doing here. Is this some=
thing
> > >>>>>> you are taking care of from userspace via preamble?
> > >>>>>>
> > >>>>>> -Akhil
> > >>>>>
> > >>>>> I don't think we have to take care of that in userspace, because =
Mesa
> > >>>>> will always configure the counter registers before reading them i=
n the
> > >>>>> same submission, and if it gets preempted in the meantime then we=
're
> > >>>>> toast anyways (due to not saving/restoring perf counters). kgsl s=
ets
> > >>>>> them from userspace, which is why it has to do something to set t=
hem
> > >>>>
> > >>>> Sorry, should be "kgsl sets them from the kernel".
> > >>>>
> > >>>>> after IFPC slumber or a context switch when the HW state is gone.
> > >>>>> Also, because the upstream approach doesn't play nicely with syst=
em
> > >>>>> profilers like perfetto, VK_KHR_performance_query is hidden by de=
fault
> > >>>>> behind a debug flag in turnip. So there's already an element of "=
this
> > >>>>> is unsupported, you have to know what you're doing to use it."
> > >>>
> > >>> But when you have composition on GPU enabled, there will be very fr=
equent
> > >>> preemption. And I don't know how usable profiling tools will be in =
that
> > >>> case unless you disable preemption with a Mesa debug flag. But for =
that
> > >>> to work, all existing submitqueues should be destroyed and recreate=
d.
> > >>>
> > >>> So I was thinking that we can use the sysprof propertry to force L0
> > >>> preemption from kernel.
> > >>>
> > >>> -Akhil.
> > >>>
> > >>
> > >> Right but when using a system profiler I imagined the expectation wo=
uld
> > >> be to be able to understand how applications and compositor interact=
. An
> > >> use case could be measuring latency and understanding what contribut=
es
> > >> to it. That is actually the main reason I added traces for preemptio=
n.
> > >> Disabling preemption would make it less useful for this type of
> > >> analysis. Did you have an use case in mind for a system profiler tha=
t
> > >> would benefit from disabling preemption and that is not covered by
> > >> VK_KHR_performance_query (or equivalent GL ext)?
> > >
> > > I would think that we want to generate an event, with GPU timestamp
> > > (ie. RB_DONE) and which ring we are switching to, so that perfetto/et=
c
> > > could display multiple GPU timelines and where the switch from one to
> > > the other happens.
> > >
> > > I'm a bit curious how this is handled on android, with AGI/etc.. I
> > > don't see any support in perfetto for this.
> > >
> > > BR,
> > > -R
> > >
> > >> Best regards,
> > >> --
> > >> Antonino Maniscalco <antomani103@gmail.com>
> > >>
> >
> > Looking at KGSL they seem to use ftrace and I don't see it doing
> > anything to get a timestamp from some GPU timer, really not sure how
> > that would be put in a gpu timeline.
>
> I suspect it would require some work on perfetto trace-processor.  It
> can ingest ftrace events (but those would end up being something
> driver specific).  Maybe with u_trace and some tracepoints in the
> 'ambles something could be done that would be more driver agnostic
> (but idk if that would work for gpu's where preemption happens more
> autonomously in the fw)

btw how to handle tracing preemption probably shouldn't hold up
sending the next iteration of this series.  There isn't that much more
time to get this in v6.12, and I think better visualization of
preemption is going to take some work outside of the kernel.

BR,
-R
