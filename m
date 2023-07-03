Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792D7465B5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7262D10E23D;
	Mon,  3 Jul 2023 22:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5924410E23D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 22:21:04 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-c4d1b491095so2775453276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 15:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688422862; x=1691014862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kkgySe8Uqu5pVP0Ai+kPcBOTT58PWVlKqx0ZlEZE5+Y=;
 b=BPRSlmcMoK+hP9dytWzXsFTROhVHtygckwckFTx5JDbd4dDnpO/W44ZMXBffRbCuY6
 8DMSHkog3+LE7MD1yOcv4PfvYTZxxIS5cj7dOmc6aWYPwtXSAUq35UROsj/1eCpvtrkW
 AADJxZCy1YRtQ/eJzz6L9bFGKSeHVhUQBTgsXjNGbo314YY7FiAykr9DNWBSBGHHvw6T
 dlExZua5Wbw0UGkNxLEhjKtoxXTnIy6g3vtIP+NdTrpNG8I8DSr+ff4OvYSMFCGegPtm
 hSQy7YokRsQd0AsTSmgGOQQ9f0Wp7xMjmuNYIw7SNeBneCiclrVc2W6Ud2Y21qO5TXM5
 kaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688422862; x=1691014862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkgySe8Uqu5pVP0Ai+kPcBOTT58PWVlKqx0ZlEZE5+Y=;
 b=TF8SZwkfj+eWj7NWZXyUILW8vpSCJbAwHFegUkA4p6phsj85QuyuH5KRAwfhFzZQko
 bJqoz7sUO1eiB+IStyAuW/Hw8/0vPAWKpDBS7bYwNGGtB1jDqj6KKWXQPWA9eysERrvd
 oJ8ILUP2nxhD5/HYkP85rZIv0UAEry6fOdBYNzho/7Z8mI5hQ5UuS0EnMXToeEmJi8wg
 Sph6CJ1X5TEhseDjHg+9J4OHQK9BjduMFmO3MoVtuGnfw3WgEjU8x2pB6m9fIk2e0Riv
 B9FZ6FMmCcL+VyidWk6tPMi8lgF9Ft6RJBQdEa6RMUiO1/V31OHsJv6XnaK1q/3bpSSo
 uQEg==
X-Gm-Message-State: ABy/qLZez5sSoKca1JQLf2hFDFS+G6GYbyIA/PlShAxW7+ouo3UGfDqS
 XIGAGXRSuKU/LNh1s/aMMvKk/1XHGSSXuoKPDSZ6yw==
X-Google-Smtp-Source: APBJJlEEtP62ZoidZ+jhf7XKYlGwyD2YE8XVNqNhvj3CYYjtKsBwT2TqI1Thuy5BNmgT+8qlkuu3JRNyzYYxtBcdvb8=
X-Received: by 2002:a5b:442:0:b0:bca:d619:8ccf with SMTP id
 s2-20020a5b0442000000b00bcad6198ccfmr9825896ybp.55.1688422862240; Mon, 03 Jul
 2023 15:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-3-dmitry.baryshkov@linaro.org>
 <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
In-Reply-To: <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 01:20:51 +0300
Message-ID: <CAA8EJpo86WaDBPGMJiytqyuNYqUTqBfEmeKSLFYUvK6r82FKqA@mail.gmail.com>
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

On Tue, 4 Jul 2023 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> > DPU performance module contains code to change performance state
> > calculations. In addition to normal (sum plane and CRTC requirements),
> > it can work in 'minimal' or 'fixed' modes. Both modes are impractical,
> > since they can easily end up with the display underruns. Userspace also
> > should not depend on these modes availability, since they are tuned
> > through debugfs, which might not be available.
> >
> > Drop relevant code to simplify performance state calculations.
> >
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Sorry but NAK on this change for two reasons:
>
> This mode is not for usermode to depend on but for debugging. I have
> personally used both the perf max and perf min modes for debug.
>
> 1) The purpose is that, if you do see an underrun, you can force the
> perf mode as it will select max clk and bw rate
>
> So something like below:
>
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 300000000 >
> fix_core_clk_rate
>
> This will allow us to force the clk to a particular value to see at what
> point it starts underruning
>
> Also you can even do
>
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 1 > perf_mode
>
> This will automatically max out the clk and BW
>
> With this, you can figure out if underrun is a performance related
> underrun or a misconfiguration. We used it even recently to debug the
> performance issue with pclk reduction

Hmm, 1 is minimum, not maxumum.

>
> 2) Sometimes, you even want to force an underrun to debug devcoredump OR
> the recovery code. Forcing the min clk mode by doing
>
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 19200000 >
> fix_core_clk_rate
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
>
> Is the easiest way to trigger the recovery handler.
>
> Hence I am not at all convinced of dropping this.

I see, thanks for sharing the usecases. However I still think that it
is overcomplicated for the debugging feature. What about dropping all
perf modes and providing just 'override_core_clk_rate' and
'override_avg_bw', 'override_peak_bw'?

-- 
With best wishes
Dmitry
