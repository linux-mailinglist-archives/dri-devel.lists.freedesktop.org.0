Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226ED9618FB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 23:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC6710E420;
	Tue, 27 Aug 2024 21:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GEboNRnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3B310E41F;
 Tue, 27 Aug 2024 21:07:36 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a45bso3389080a12.0; 
 Tue, 27 Aug 2024 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724792854; x=1725397654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOAnTmOnHe8ISWccwwZaFrwu31RfPaMAWI8/7kt2V+U=;
 b=GEboNRnqKngorEHZk5uuGYAwTajRMiCXQ38D6km3/4mWA94jdupalHx8m3VAbE528q
 0EaQcPlr3WwM+yrYPVgKr7WjsDZAyvJ8x4vI+calQMlsofZzugnuH21H7l92lwVdcQgu
 OHmztbQVMECbWF8B7eIbvs+fZWR6/m3rT0si7/AqpCiqRXPct76yFXxzyRg4d95JjVGe
 KQUW1JmyZTk0YfT+CnOw3g6IY9sLpa0lB7L9geQ7hRdulucB/KbXm4Y93g0GqiHty/Be
 aSXdUuUL5VVnYItE4Ibi1G7TMDDQmPAbZ+p1YLI92lpY9SHLyMn1CXvn0WzTnmbE5m0w
 4dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724792854; x=1725397654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOAnTmOnHe8ISWccwwZaFrwu31RfPaMAWI8/7kt2V+U=;
 b=WU8MDK8Tpa23z9KuqkDHdI4mghu2x7pXnpPcSG9NzbrmEW/HporCTMN9fLxnh9K44/
 iE3y+dCXInbdPWftZhS7QfnrE6Vmzek02bnAKYr1wKxYy5SwaQWLQyXhGISX5Y6gFKmO
 Wn8KLT978ees9jNlWQMTkNBu6lukaPIlkztePlW8xhQ17+fHt7kDCQhcp+5LgMRAZAB7
 GXP2aRYUEI2wJ1surqD7oZleoktHcj+9kjYZ2rC5cJ/YxIfGzrZQNGZELswjSrevPoO5
 /Tl4cI+MJCL27qBRad+FxYQ0+2AMochIYtui0kZGAnpv0VJ/TYvggFhhxBlMJ7iuS5dU
 j45w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1+b2GFnJYsQR69Itx9D9Fq5XLx+t406KYBpAjcwi4ADOsINQR7mLQP/8LFMYk2GIcTsLZWzmGeqs=@lists.freedesktop.org,
 AJvYcCVAf7eScJx053ZPvG3NQym8H1vWfDArR77eu1WxMtyOIWg1zZ/elNSfp5fcqNsNjp/h8MnRe58JGLq7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgnELuaWlADdjwzRmU1JYFOSdYfvDZeURkPuEuX7GwuGI8U4gH
 8LbHGBC4v+wavnDcpsadw5d9rf6ZisqT5j+Pngf9PhMCdluTT+bwZWLmOjLeQdxDaGKWX8hwcGN
 Fm34KMF73FjRpkXGHfJI3pHUyEwQ=
X-Google-Smtp-Source: AGHT+IH4yUpOnbf3fiViQzG0Q9MrI/HhazmQh5j6snorZhGmpjGr45lt2u3lI5d4clmzogam6vZBbvXWL5kVYKZYj9E=
X-Received: by 2002:a05:6402:40c5:b0:5be:f363:633b with SMTP id
 4fb4d7f45d1cf-5c08915b2admr15388230a12.1.1724792853603; Tue, 27 Aug 2024
 14:07:33 -0700 (PDT)
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
In-Reply-To: <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Aug 2024 14:07:20 -0700
Message-ID: <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
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

On Tue, Aug 27, 2024 at 1:25=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> > On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
> >> On Fri, Aug 23, 2024 at 10:21=E2=80=AFAM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> >>>
> >>> On Thu, Aug 22, 2024 at 9:06=E2=80=AFPM Akhil P Oommen <quic_akhilpo@=
quicinc.com> wrote:
> >>>>
> >>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> >>>>> On Mon, Aug 19, 2024 at 9:09=E2=80=AFPM Akhil P Oommen <quic_akhilp=
o@quicinc.com> wrote:
> >>>>>>
> >>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrot=
e:
> >>>>>>> This patch implements preemption feature for A6xx targets, this a=
llows
> >>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready=
. A6XX
> >>>>>>> hardware as such supports multiple levels of preemption granulari=
ties,
> >>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grai=
ned
> >>>>>>> such as draw-call level or a bin boundary level preemption. This =
patch
> >>>>>>> enables the basic preemption level, with more fine grained preemp=
tion
> >>>>>>> support to follow.
> >>>>>>>
> >>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> No postamble packets which resets perfcounters? It is necessary. A=
lso, I
> >>>>>> think we should disable preemption during profiling like we disabl=
e slumber.
> >>>>>>
> >>>>>> -Akhil.
> >>>>>
> >>>>> I don't see anything in kgsl which disables preemption during
> >>>>> profiling. It disables resetting perfcounters when doing system-wid=
e
> >>>>> profiling, like freedreno, and in that case I assume preempting is
> >>>>> fine because the system profiler has a complete view of everything =
and
> >>>>> should "see" preemptions through the traces. For something like
> >>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
> >>>>> because we disable saving/restoring perf counters, but that has to
> >>>>> happen in userspace because the kernel doesn't know what userspace
> >>>>> does.
> >>>>>
> >>>>
> >>>> KGSL does some sort of arbitration of perfcounter configurations and
> >>>> adds the select/enablement reg configuration as part of dynamic
> >>>> power up register list which we are not doing here. Is this somethin=
g
> >>>> you are taking care of from userspace via preamble?
> >>>>
> >>>> -Akhil
> >>>
> >>> I don't think we have to take care of that in userspace, because Mesa
> >>> will always configure the counter registers before reading them in th=
e
> >>> same submission, and if it gets preempted in the meantime then we're
> >>> toast anyways (due to not saving/restoring perf counters). kgsl sets
> >>> them from userspace, which is why it has to do something to set them
> >>
> >> Sorry, should be "kgsl sets them from the kernel".
> >>
> >>> after IFPC slumber or a context switch when the HW state is gone.
> >>> Also, because the upstream approach doesn't play nicely with system
> >>> profilers like perfetto, VK_KHR_performance_query is hidden by defaul=
t
> >>> behind a debug flag in turnip. So there's already an element of "this
> >>> is unsupported, you have to know what you're doing to use it."
> >
> > But when you have composition on GPU enabled, there will be very freque=
nt
> > preemption. And I don't know how usable profiling tools will be in that
> > case unless you disable preemption with a Mesa debug flag. But for that
> > to work, all existing submitqueues should be destroyed and recreated.
> >
> > So I was thinking that we can use the sysprof propertry to force L0
> > preemption from kernel.
> >
> > -Akhil.
> >
>
> Right but when using a system profiler I imagined the expectation would
> be to be able to understand how applications and compositor interact. An
> use case could be measuring latency and understanding what contributes
> to it. That is actually the main reason I added traces for preemption.
> Disabling preemption would make it less useful for this type of
> analysis. Did you have an use case in mind for a system profiler that
> would benefit from disabling preemption and that is not covered by
> VK_KHR_performance_query (or equivalent GL ext)?

I would think that we want to generate an event, with GPU timestamp
(ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
could display multiple GPU timelines and where the switch from one to
the other happens.

I'm a bit curious how this is handled on android, with AGI/etc.. I
don't see any support in perfetto for this.

BR,
-R

> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>
