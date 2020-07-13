Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB821D80F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28836E505;
	Mon, 13 Jul 2020 14:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114906E505;
 Mon, 13 Jul 2020 14:14:11 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id rk21so17392201ejb.2;
 Mon, 13 Jul 2020 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIZxje+MAG8HbWvvUc6uH3FVOHItPs+CHk8GbtDOk8s=;
 b=h+yIc+JccePabEpzp8I+pesSbr0m/WLujDxYsdjf+9DXMasZsalm91neD19Ivz6u5G
 cdJOx/+AN0f1eZmadGkvokecJppcr3fIl9jirgr4LS66G/c1gM5eahuei+G2+foVs49c
 wLFvLLiEofL9DNPUS9ezarBzYtL9yX8/WwbvmyKseNxcURxm8eVAMo5jfqqWf+dcWELZ
 tC2sbb1nLzOGKadrmUFv2291VTpzkcLwJYQdm5gGbhsqH2rrpikjrZXgCWmI7OgR11gL
 HlAabodB/rBX0KVZKOtpMzIhvXVq/MHCUZcb52SRnXVacSLDA1SSLG7FV8pGh7hYpe9U
 cEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIZxje+MAG8HbWvvUc6uH3FVOHItPs+CHk8GbtDOk8s=;
 b=cLRJ2tzBZ3DxITKLSBXS/qnDJFBZM+Np3leBOOyV59L4ZrRrlZflySW38ilS9wPruU
 xG9hHi+gygeLnO6PzVlTOv/D9P/0/KpZbG8QsH5TFFLI+DeFIeChg60lT9+gO2GzI19w
 3yGC3ryOQLk1UoBpprHejG/s80zZRVF0jQEA2/tvEweVT7jX+EIQbMBsEjHPjTcFlgbj
 joe28+mZsPz/e1H7phGGIfGMThC/fPP2U2aO2coe4GHZDdUtuUYYtiVQ4evZ8IugKafd
 bfUK5020B4OGOKcmWJ3/CYAAc706LGRSkeFPksMwyUeN6x7Ltnm9dijei89UfquKOkn0
 RWmQ==
X-Gm-Message-State: AOAM533aKpTvi/HbvEMA7eRFULhRJYr98dOeKYXCe8Fxz53lCsomBgZG
 +UYBEojrmbK747AYIn2s0qcRZPm2FRx1IPzg7+4=
X-Google-Smtp-Source: ABdhPJzRe9teOUkzh2Dfta6zb49ZDUsatOfn8+cgv5TYh6kQrSWbSloCSg2Xc8sRSHFDK4FawOk5qifcPpSE3vTVWrA=
X-Received: by 2002:a17:906:1187:: with SMTP id
 n7mr67254807eja.161.1594649650550; 
 Mon, 13 Jul 2020 07:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com>
 <c10c0f70988d42037ccaccc6b5474942@codeaurora.org>
In-Reply-To: <c10c0f70988d42037ccaccc6b5474942@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 13 Jul 2020 07:14:42 -0700
Message-ID: <CAF6AEGvhVLY=2d7Qbp2qXmLX-ywtN1jkydhHkVesREF3ffRjYA@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: enumerate second cursor pipe for
 external interface
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
 Raviteja Tamatam <travitej@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 3:18 AM <kalyan_t@codeaurora.org> wrote:
>
> On 2020-07-10 22:19, Rob Clark wrote:
> > On Thu, Jun 25, 2020 at 5:46 AM Kalyan Thota <kalyan_t@codeaurora.org>
> > wrote:
> >>
> >> Setup an RGB HW pipe as cursor which can be used on
> >> secondary interface.
> >>
> >> For SC7180 2 HW pipes are enumerated as cursors
> >> 1 - primary interface
> >> 2 - secondary interface
> >>
> >> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 8f2357d..23061fd 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -117,10 +117,10 @@
> >>                 .reg_off = 0x2AC, .bit_off = 0},
> >>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> >>                 .reg_off = 0x2AC, .bit_off = 8},
> >> -       .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> >> -               .reg_off = 0x2B4, .bit_off = 8},
> >>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> >> -               .reg_off = 0x2BC, .bit_off = 8},
> >> +               .reg_off = 0x2B4, .bit_off = 8},
> >> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> >> +               .reg_off = 0x2C4, .bit_off = 8},
> >
> > It looks like you shifted the register offset here from 0x2bc to
> > 0x2c4, was that intentional?
> >
> > BR,
> > -R
> Yes Rob, the offset was wrong which i corrected in this patch.


Thanks for confirming.  In the future, it would have been useful to
mention that in the commit msg.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
