Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424A5871C7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 21:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D54A8EC29;
	Mon,  1 Aug 2022 19:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62C8B213
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 19:51:45 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 206so7073852pgb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dR+H5DgsvjR0QyoFiNRqr/JAWUNMcgGPEXzXe3YKbRY=;
 b=frSpdh45TuWu76mH63xtZhu7CKbri0Km2IeQIRrVyVdYGmmS/ux+7aZbiKWjZ47O34
 PxW8ihbAKVey3f0r4za/SoQUooQWS+nlNhMISmQ4jgGb0J8cBki8IMHXX5gMosVXLTos
 6aRJht3EYpupBGHYLNa/Aw15GxcIKbSI+zcy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dR+H5DgsvjR0QyoFiNRqr/JAWUNMcgGPEXzXe3YKbRY=;
 b=FFEL5ainhVOivUF7kx88uH9qiLaIb3Ijz/OTwu4xedCTdd7F79ltXGvLDEYhpg4rNv
 +hAsGEncECa1nTrg/lkH6pyaySd0U2+qnEy+PleaMwX5IHzvVsE055vtMF2+AeD+XzyQ
 qBsFkqxCN/1yYYdcJeD2yjmlbDf2Xdh2SIdc7dJHd8/OJDEf2DFh2Ip5pBtGBgQEMS5k
 Sn0q4gXVTc2qx+vVPa6vCNyj1YwD9ACRvHJ2+W/rLiOS/4hUDEC76Y6RErLHO9/VM0tC
 NrKFFfVjfpFwA5DEhGRYPvOfmsbj4nJunOcNjY9Ge9y+KDrYs/db3XdnPj7mthArcJa9
 Q1sw==
X-Gm-Message-State: ACgBeo2LbwqkMXZY7tVeC9PqF7f+6EpnTDX+qQtGmBMEjiErx1MKsVkD
 bnpsfGvI+23uztqd9LL0Ns2cpr7TiPUcCNicnHfLzQ==
X-Google-Smtp-Source: AA6agR7eEiNpUei/D65W3dNWbRG0jraq9q/sZnjn4XfAwaG4cKYsywGUC3qy52/E5Sr9ysCurayirlNiUC5RNtqh5MA=
X-Received: by 2002:a05:6a00:2341:b0:52c:e2eb:cc70 with SMTP id
 j1-20020a056a00234100b0052ce2ebcc70mr14917077pfj.32.1659383504589; Mon, 01
 Aug 2022 12:51:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Aug 2022 12:51:43 -0700
MIME-Version: 1.0
In-Reply-To: <1659382970-17477-1-git-send-email-quic_khsieh@quicinc.com>
References: <1659382970-17477-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 1 Aug 2022 12:51:43 -0700
Message-ID: <CAE-0n52=zJ0ScrknAhsvJQc5hXP7+TGaoa4gnaVzsT26bQL_Uw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-01 12:42:50)
> Data Symbols scrambled is required for tps4 at link training 2.
> Therefore SCRAMBLING_DISABLE bit should not be set for tps4 to
> work.
> RECOVERED_CLOCK_OUT_EN is for enable simple EYE test for jitter
> measurement with minimal equipment for embedded applications purpose
> and is not required to be set during normal operation.
> Current implementation always have RECOVERED_CLOCK_OUT_EN bit set
> which cause SCRAMBLING_DISABLE bit wrongly set at tps4 which prevent
> tps4 from working.
> This patch delete setting RECOVERED_CLOCK_OUT_EN to fix SCRAMBLING_DISABLE
> be wrongly set at tps4.
>
> Fixes: 956653250b21 ("drm/msm/dp: add support of tps4 (training pattern 4) for HBR3")
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ab6aa13..013ca02 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1214,7 +1214,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>         if (ret)
>                 return ret;
>
> -       dp_ctrl_train_pattern_set(ctrl, pattern | DP_RECOVERED_CLOCK_OUT_EN);
> +       dp_ctrl_train_pattern_set(ctrl, pattern);

This line is from the first patch introducing this driver. Even if this
is fixing tps4 support, it sounds like the bit should never have been
enabled in the first place. Why isn't the fixes tag targeted at the
first commit? Does it hurt to apply it without commit 956653250b21?
