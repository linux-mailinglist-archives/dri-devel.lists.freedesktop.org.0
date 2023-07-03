Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF37465C5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9DB10E243;
	Mon,  3 Jul 2023 22:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C09710E243
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 22:36:27 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-579dfae6855so32260407b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688423786; x=1691015786;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v5YY7eZa6tSEZAqEH7ddXutblBR9DptLHLqPJJAXbjE=;
 b=oc6w2y8/EiiV/kOGEc3tk+2IlksT6VXTryqCwTSPFNt7M10KKNPDkb155MfdIkQSlp
 z/Na5ztWb9Q380/WtUWBjvh9cM3pwAAh9xYoPSXaecaL7ep1KNMYfMFP7GRDzE9s99wl
 QCQ6l34Po6IMCdTUsczn8MVVXv61+c9u6OKEdUZjwqcSbOAmqWlC/VxLTcbZKQyOPCeP
 guGq4816f47tnvaks38UEYwIerbsdhwTn9Qt33OJx2ih+KbAxqXHvbEXB+muzBxtE2BS
 sQjL133Vly6g/R7tQleWSo/SfOi1tuDBQz6TQpxPuVGLJ+sk6yM+ec3nHj+3eBm1RTl2
 NV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688423786; x=1691015786;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v5YY7eZa6tSEZAqEH7ddXutblBR9DptLHLqPJJAXbjE=;
 b=PQk+ufxF5+Px5IPw0lkcDz+8bnkZe5jSzT7pQjYBVAUPLJ2ys3PRfQ7cWip+0/deY6
 /DUohrbuWXzx2pg9EU+q+AeThuDLO8GExwIhdHSvfsy+9yGMS3/CyEkLmODxZBU0VM5R
 Er+qQRQ/YYYVBcVSdXmsz7QradAT/wspG46FSzomdxn8DIfGiwesqq0Pco+Um9WShNDU
 09lBDQYvmlIGLJKLok1dvIHFpl5JvjFM360H90gRN+SoU/oxp1ShulSm8S3tC1LAsMik
 8upDbGTcd7kDF3fxqkpQOKljoLDqj9KQTDeyrd8KuUUofcSMDYggm2JM3qymdiCYXt1n
 WUtA==
X-Gm-Message-State: ABy/qLZtKxCXxO7J/XjiIF9kUMIEKtJf+6uNAxSRqLGtUsiO1yuR8/oi
 6sBjZudGMbyr4TbIKrbEr2n0Xhrw8oero2EsNUFL3g==
X-Google-Smtp-Source: APBJJlGFi/oMweVuBuQGrbV02UEeAGc1r8Xi7vBeXGaplB8KvhFeJQrjDmAmDxehJCeGQ0b/qwddlTTzejOAdQ7sYYg=
X-Received: by 2002:a81:8390:0:b0:579:e2f5:1253 with SMTP id
 t138-20020a818390000000b00579e2f51253mr7350619ywf.39.1688423786046; Mon, 03
 Jul 2023 15:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-3-dmitry.baryshkov@linaro.org>
 <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
 <CAA8EJpo86WaDBPGMJiytqyuNYqUTqBfEmeKSLFYUvK6r82FKqA@mail.gmail.com>
 <83a50eb3-3e0d-6b65-2e15-a675c717912d@quicinc.com>
In-Reply-To: <83a50eb3-3e0d-6b65-2e15-a675c717912d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 01:36:15 +0300
Message-ID: <CAA8EJppekbuLraWGH7M7t0Qqz-hp+6teeB6NkK2DGoTMvJbNqw@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/msm/dpu: drop performance tuning modes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 01:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/3/2023 3:20 PM, Dmitry Baryshkov wrote:
> > On Tue, 4 Jul 2023 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> >>> DPU performance module contains code to change performance state
> >>> calculations. In addition to normal (sum plane and CRTC requirements),
> >>> it can work in 'minimal' or 'fixed' modes. Both modes are impractical,
> >>> since they can easily end up with the display underruns. Userspace also
> >>> should not depend on these modes availability, since they are tuned
> >>> through debugfs, which might not be available.
> >>>
> >>> Drop relevant code to simplify performance state calculations.
> >>>
> >>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> Sorry but NAK on this change for two reasons:
> >>
> >> This mode is not for usermode to depend on but for debugging. I have
> >> personally used both the perf max and perf min modes for debug.
> >>
> >> 1) The purpose is that, if you do see an underrun, you can force the
> >> perf mode as it will select max clk and bw rate
> >>
> >> So something like below:
> >>
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 300000000 >
> >> fix_core_clk_rate
> >>
> >> This will allow us to force the clk to a particular value to see at what
> >> point it starts underruning
> >>
> >> Also you can even do
> >>
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 1 > perf_mode
> >>
> >> This will automatically max out the clk and BW
> >>
> >> With this, you can figure out if underrun is a performance related
> >> underrun or a misconfiguration. We used it even recently to debug the
> >> performance issue with pclk reduction
> >
> > Hmm, 1 is minimum, not maxumum.
> >
>
> The name is kind of confusing.
>
> Yes 1 is min perf mode but it maxes out the clocks and BW.
>
> I guess its named that way because a min perf mode gives you the minimum
> savings in terms of power.
>
> >>
> >> 2) Sometimes, you even want to force an underrun to debug devcoredump OR
> >> the recovery code. Forcing the min clk mode by doing
> >>
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 19200000 >
> >> fix_core_clk_rate
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
> >>
> >> Is the easiest way to trigger the recovery handler.
> >>
> >> Hence I am not at all convinced of dropping this.
> >
> > I see, thanks for sharing the usecases. However I still think that it
> > is overcomplicated for the debugging feature. What about dropping all
> > perf modes and providing just 'override_core_clk_rate' and
> > 'override_avg_bw', 'override_peak_bw'?
> >
>
> No, we need both. Let me explain why:
>
> 1) Having just the min perf mode, directly uses the max clk and bw. This
> is useful when you just want to run at the max and see the behavior
>
> 2) If you want to figure out what is the sweet spot where the issue does
> not happen you need the "fixed" mode to find the range where the issue
> doesnt happen
>
> This is one of the oldest and most effective debugging mechanisms.
>
> I dont want to touch this and I personally use this quite often.

Ack, I'll see if I can keep the interface / idea. I still think that
override + in-kernel limits should do the same trick as the current
'maximum' does.



-- 
With best wishes
Dmitry
