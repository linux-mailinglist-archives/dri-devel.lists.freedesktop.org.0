Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5B9628FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DF810E52C;
	Wed, 28 Aug 2024 13:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y8bv4gnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A54F10E524;
 Wed, 28 Aug 2024 13:43:14 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a45bso3746762a12.0; 
 Wed, 28 Aug 2024 06:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724852593; x=1725457393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pEqZjPIkfOrpkl6p6w9n8vu/E0lE1rdjJmvNSljER0=;
 b=Y8bv4gnBg1d5RYzR0CffgIMEeHuJrSteESzMjFPlP9nf3/hsyuS4v1l7zCxBElfuOa
 zjSVluuj+xNn86NxDDjguwy9iufDiNL0ADxcqKclu2Ned+pdQr0j3Ap/y2ijS3z46Ulz
 1+OiYj7HwP+nqBWDo4Q6+h90yKcza/ZzKJIp1iHncrCGYKnfcTUS3F97otCV4Bg4V5RQ
 LCJeswgElutWgx+BnseXY7Y5opUcK3Ml09eTfT5P64OppQw6F8JEiT58M6Md4IfkHGMp
 4O7zCghFMxXNXvcsizm+Bpw4wy4Wn3h7MRN5QI24a4r+IIsPbSE46B8PMGLvTAuA7mmX
 n8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724852593; x=1725457393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pEqZjPIkfOrpkl6p6w9n8vu/E0lE1rdjJmvNSljER0=;
 b=wEGdnyq8PXWXT5u0ycOqqL+txpdLtmXorRGI8WMFX6x+eVMIMMeLWaGfi8FaS+EDj4
 U+O8gRoqPI+CVnoza/OcPg1EGF7cqfUspOzZsUEC/6JTnYG138E5AVAxxdYYChevDAKD
 FLItIDeT1acOlgHAt1ZhX1KU4BSmAY2qvhBCFFHjtF/xOdhY8o/+o0muHqymu2LMN98M
 lbE+iETkVcY7aSP67LSmP3mlBq+ollULJ0x9hx4J3Qo5QxJdEkM6iNqtGgEbUBf/MjLu
 qFgo/0mhjEWqIcM+WU5c3SnIiPcQ8Bk3HAlM6PIEsDng2iZW6na0oE/nV6NlxKmmulio
 DGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+EDGnTHA0akB/n1qQE+w0UcYYnUI5rR/s2HgwrPODIY4KZbQ2xJY7mdtTXWfbcisCFji/A2FB0QM=@lists.freedesktop.org,
 AJvYcCW/8eTQaQki377TC2MBg8ddGj1syGm3P4CsSy15zpMWuysFqMZefcbMNKV+N8eU2p0Vm+sIdN9oEZC4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaDL9X528LyCAF+P2n0MYaUiArE9KAy6HECljw14K6NOyvKZdy
 VKasu3ab00YK/3gKCVmbAIZ26eOstUKnjAK6PZ6fJMUG+WOEuXSTRElELPfYkZGt177zUqFg+uY
 oHRPoP39wAG9swKoFmnu/rg1oU30=
X-Google-Smtp-Source: AGHT+IF2LPaReCgiSF2wFWIOBSNIVsBhtFt72m4yvlauwvxjZPteZ9QiL/jsA4kYTxq7xW1WENObJdlA9yG8gXzfDdY=
X-Received: by 2002:a05:6402:3509:b0:5c0:c65f:819e with SMTP id
 4fb4d7f45d1cf-5c0c65f8230mr4586507a12.9.1724852592106; Wed, 28 Aug 2024
 06:43:12 -0700 (PDT)
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
In-Reply-To: <57064da3-190c-4554-b085-d56daf979933@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Aug 2024 06:42:59 -0700
Message-ID: <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
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

On Tue, Aug 27, 2024 at 3:56=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 8/27/24 11:07 PM, Rob Clark wrote:
> > On Tue, Aug 27, 2024 at 1:25=E2=80=AFPM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> >>
> >> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> >>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
> >>>> On Fri, Aug 23, 2024 at 10:21=E2=80=AFAM Connor Abbott <cwabbott0@gm=
ail.com> wrote:
> >>>>>
> >>>>> On Thu, Aug 22, 2024 at 9:06=E2=80=AFPM Akhil P Oommen <quic_akhilp=
o@quicinc.com> wrote:
> >>>>>>
> >>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> >>>>>>> On Mon, Aug 19, 2024 at 9:09=E2=80=AFPM Akhil P Oommen <quic_akhi=
lpo@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wr=
ote:
> >>>>>>>>> This patch implements preemption feature for A6xx targets, this=
 allows
> >>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is rea=
dy. A6XX
> >>>>>>>>> hardware as such supports multiple levels of preemption granula=
rities,
> >>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine gr=
ained
> >>>>>>>>> such as draw-call level or a bin boundary level preemption. Thi=
s patch
> >>>>>>>>> enables the basic preemption level, with more fine grained pree=
mption
> >>>>>>>>> support to follow.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >>>>>>>>> ---
> >>>>>>>>
> >>>>>>>> No postamble packets which resets perfcounters? It is necessary.=
 Also, I
> >>>>>>>> think we should disable preemption during profiling like we disa=
ble slumber.
> >>>>>>>>
> >>>>>>>> -Akhil.
> >>>>>>>
> >>>>>>> I don't see anything in kgsl which disables preemption during
> >>>>>>> profiling. It disables resetting perfcounters when doing system-w=
ide
> >>>>>>> profiling, like freedreno, and in that case I assume preempting i=
s
> >>>>>>> fine because the system profiler has a complete view of everythin=
g and
> >>>>>>> should "see" preemptions through the traces. For something like
> >>>>>>> VK_KHR_performance_query I suppose we'd want to disable preemptio=
n
> >>>>>>> because we disable saving/restoring perf counters, but that has t=
o
> >>>>>>> happen in userspace because the kernel doesn't know what userspac=
e
> >>>>>>> does.
> >>>>>>>
> >>>>>>
> >>>>>> KGSL does some sort of arbitration of perfcounter configurations a=
nd
> >>>>>> adds the select/enablement reg configuration as part of dynamic
> >>>>>> power up register list which we are not doing here. Is this someth=
ing
> >>>>>> you are taking care of from userspace via preamble?
> >>>>>>
> >>>>>> -Akhil
> >>>>>
> >>>>> I don't think we have to take care of that in userspace, because Me=
sa
> >>>>> will always configure the counter registers before reading them in =
the
> >>>>> same submission, and if it gets preempted in the meantime then we'r=
e
> >>>>> toast anyways (due to not saving/restoring perf counters). kgsl set=
s
> >>>>> them from userspace, which is why it has to do something to set the=
m
> >>>>
> >>>> Sorry, should be "kgsl sets them from the kernel".
> >>>>
> >>>>> after IFPC slumber or a context switch when the HW state is gone.
> >>>>> Also, because the upstream approach doesn't play nicely with system
> >>>>> profilers like perfetto, VK_KHR_performance_query is hidden by defa=
ult
> >>>>> behind a debug flag in turnip. So there's already an element of "th=
is
> >>>>> is unsupported, you have to know what you're doing to use it."
> >>>
> >>> But when you have composition on GPU enabled, there will be very freq=
uent
> >>> preemption. And I don't know how usable profiling tools will be in th=
at
> >>> case unless you disable preemption with a Mesa debug flag. But for th=
at
> >>> to work, all existing submitqueues should be destroyed and recreated.
> >>>
> >>> So I was thinking that we can use the sysprof propertry to force L0
> >>> preemption from kernel.
> >>>
> >>> -Akhil.
> >>>
> >>
> >> Right but when using a system profiler I imagined the expectation woul=
d
> >> be to be able to understand how applications and compositor interact. =
An
> >> use case could be measuring latency and understanding what contributes
> >> to it. That is actually the main reason I added traces for preemption.
> >> Disabling preemption would make it less useful for this type of
> >> analysis. Did you have an use case in mind for a system profiler that
> >> would benefit from disabling preemption and that is not covered by
> >> VK_KHR_performance_query (or equivalent GL ext)?
> >
> > I would think that we want to generate an event, with GPU timestamp
> > (ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
> > could display multiple GPU timelines and where the switch from one to
> > the other happens.
> >
> > I'm a bit curious how this is handled on android, with AGI/etc.. I
> > don't see any support in perfetto for this.
> >
> > BR,
> > -R
> >
> >> Best regards,
> >> --
> >> Antonino Maniscalco <antomani103@gmail.com>
> >>
>
> Looking at KGSL they seem to use ftrace and I don't see it doing
> anything to get a timestamp from some GPU timer, really not sure how
> that would be put in a gpu timeline.

I suspect it would require some work on perfetto trace-processor.  It
can ingest ftrace events (but those would end up being something
driver specific).  Maybe with u_trace and some tracepoints in the
'ambles something could be done that would be more driver agnostic
(but idk if that would work for gpu's where preemption happens more
autonomously in the fw)

BR,
-R

> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>
