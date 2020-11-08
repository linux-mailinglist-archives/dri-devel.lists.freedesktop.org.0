Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8643C2AADF9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551C68973E;
	Sun,  8 Nov 2020 22:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8900089580
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 17:55:52 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id s8so6053603yba.13
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bmWUWppYtFwVGnbqnjHVdjfmtFQq6Ssv8szPUV4ghMI=;
 b=rU7t+xTIfuIcDY5hoRM9w/gETDTs+vfyhqAY2Dd3M/jS2gra/qqOozX8yQfcHFJwdD
 2LxEb7CL4b8rYoPiLxlbS5Klef0HggKBxYOx6wq9Ya+Qpkj94BZ/U3po/RBTRvxeU+XE
 uMyaODFQAEOVU8jYFOUIgz38Fu2QCKHRGHUcoLJyyFLgx1ZHNsHGwV1RYqT5ZfgXOK4h
 iy1FxTyOiotU/nMHvUYKLcC0BZunxINmlrbX36YIF0Lsq+29bGJCPKqV5s2hm/zOxmUA
 mIeRV+nMSEne4/667rkY/F7RKizgBk/9euaYXQz4g2SzjGaY3zj0kmzEEn/UBD8rkdzx
 M0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bmWUWppYtFwVGnbqnjHVdjfmtFQq6Ssv8szPUV4ghMI=;
 b=GDugNRIeZl9ZKW0unRS6g++Xzdm+9YMvk463/Ko0SnwyZqUKRKrL17gncMLgl5OoGB
 ohGa6FsExJvAWpuPxllF5rSpWB+2hGE5bpeJmKI15kDVhjDw+KZW8djSS5gnwfECIrAx
 v8rITl1J51cvslogIXld3Cp933kqHjR16tdCC4bNPWYXmFYSON5fAA59VbASfmQJx7fy
 OthyEOUliULF+8r1hQ260lv5xGp15jAAqTd5DHRGajFq7I3w36Js9XtP6UBRNXT/mugO
 E+eNASL9cueLKssvsN2/Nw0SYIZsmawtGToOIddoAeHYvAHsFZJzuIe4XYeMCE3sOrpj
 8+cA==
X-Gm-Message-State: AOAM530PtVW9b88Ig1lxYhf+yRHZq+Q1iYmpxpefUrE0oTaFgVRYMBiy
 e2fHxSz6Zli21ErdOncOx22ZGVl7WC0rJZL1xG4DyA==
X-Google-Smtp-Source: ABdhPJyDSh//P8YGCca/h595WPbNkP9vxMSpO45fIp2fFwEVMxoWVkZ+T5UcRE0J2J1xCgzdUPtWfd4b52s0RoOYFzM=
X-Received: by 2002:a25:4c1:: with SMTP id 184mr14830144ybe.318.1604858151648; 
 Sun, 08 Nov 2020 09:55:51 -0800 (PST)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-3-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGsYmxwmG2OWdX3Q-5tio+kU-AwhiL_0EyLTVb0=gWgwgw@mail.gmail.com>
In-Reply-To: <CAF6AEGsYmxwmG2OWdX3Q-5tio+kU-AwhiL_0EyLTVb0=gWgwgw@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Sun, 8 Nov 2020 23:25:15 +0530
Message-ID: <CAMi1Hd1+0Gz18Lzm43-gyAEF+gAqd1+9EcYCsJcsgKNbE3WZSA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/dpu: add support for clk and bw scaling for
 display
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Aug 2020 at 21:09, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > This change adds support to scale src clk and bandwidth as
> > per composition requirements.
> >
> > Interconnect registration for bw has been moved to mdp
> > device node from mdss to facilitate the scaling.
> >
> > Changes in v1:
> >  - Address armv7 compilation issues with the patch (Rob)
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Reviewed-by: Rob Clark <robdclark@chromium.org>
>

Hi Kalyan, Rob,

This patch broke the display on the PocoF1 phone
(sdm845-xiaomi-beryllium.dts) running AOSP.
I can boot to UI but the display is frozen soon after that and
dmesg is full of following errors:

[drm:dpu_core_perf_crtc_update:397] [dpu error]crtc-65: failed to
update bus bw vote
[drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
7649746kb > 6800000kb
[drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance check -7
[drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
7649746kb > 6800000kb
[drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance check -7
[drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
7649746kb > 6800000kb
[drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance check -7

Here is the full dmesg https://pastebin.ubuntu.com/p/PcSdNgMnYw/.
Georgi pointed out following patch but it didn't help,
https://lore.kernel.org/dri-devel/20201027102304.945424-1-dmitry.baryshkov@linaro.org/
Am I missing any other followup fix?

Regards,
Amit Pundir
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
