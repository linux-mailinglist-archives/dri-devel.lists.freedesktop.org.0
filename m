Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B33768F2
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 18:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9BF6E0DD;
	Fri,  7 May 2021 16:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F446E0C8;
 Fri,  7 May 2021 16:40:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x5so9893796wrv.13;
 Fri, 07 May 2021 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4CPL9h5x73Ann+qEMsFApvYh7VXBIJ0G23zuIDn8I8U=;
 b=t1PyZwNJLMv1CVdAjugYlsAJBVrx49OS6K0/fhwHP+SgVoCj6/CtKIWcs0leAN6bbC
 2tWxTB6cCQQfV0QfmkzTHI6G5AuKBm18CgLNCLd+Yy8ur6+yl1RNSo7sABmcz1k4yjvL
 oFy5G5QK/YIm/Bz0EZvX89gSPE8M05mgMRjaWomy0pBWUxyf7Jjv2lm6TbWTFD5+THrf
 bta6ged9xZpO2CCHYUbhG+g6vrfY1PNmecBSldEFehVe0lTqWreD/z8+deYvc5DJkahz
 BYcC82VQmSvOzwm47t1p6r+17dJUs7Y2nw6c5xCaslmByqk8ggMFjZ2tehIY70T5kLrR
 /SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4CPL9h5x73Ann+qEMsFApvYh7VXBIJ0G23zuIDn8I8U=;
 b=VA8y8VoJ5p4qopXeZUiuqctBT3JSy2mbOJx58f8+JlGfqPXS0LYul4Iteb415whW0I
 EKJRZ75aq/Hk52bS6vvjGivDwxtGS47uOGn5RkzZct0L5vs301SrAcOmTrH1X6b0GgUs
 fKB1RTG3UrwYgodWuaUNFzZECpXzcIoAuVt0eZHNoZp8equQHYxhdhDD9RVx0TZ+nANg
 mYeOUY3UqUAkQMmBHhYMsXRj/pQ9n0aIQzqaHVEVdA3BrRpp1spURAVDzoENTxsqo/QQ
 fJrrdOXHq7liI/0hmCXr35+bhTKGgAnYyA65q9U5fyOHZ3uyeqMwbTVm89ickLP9tVRV
 R0OQ==
X-Gm-Message-State: AOAM531UeZSO/w4EIhZFbYDwsRtJFtVfND3JFUG44KbEhZ5hcgt3pJLb
 qHgTfX3YObEB++KjOsM1XctdoIHwXjuWJwmNLu12KuvQ
X-Google-Smtp-Source: ABdhPJy/CbdmIsf9tcYDuxSphsOaELuRqHDDX3ibDwIcYNNk/6Zcf87iyHOMtlu2NSlD5XV+ynLnOr/toQ8iwy97/rA=
X-Received: by 2002:adf:e510:: with SMTP id j16mr13847766wrm.28.1620405608069; 
 Fri, 07 May 2021 09:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210507141651.2887-1-sean@poorly.run>
In-Reply-To: <20210507141651.2887-1-sean@poorly.run>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 May 2021 09:43:48 -0700
Message-ID: <CAF6AEGutiv+0QMNo6QQ8jSDYwxhJ5+62_TZ5zsiT_WxgDm+JiA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix uninitialized var usage in
 dsi_phy_28nm_8960.c
To: Sean Paul <sean@poorly.run>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 7, 2021 at 7:16 AM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch fixes the following error:
>
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: error: variable 'parent_name' is uninitialized when used here
> [-Werror,-Wuninitialized]
>         snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
>                  ^~~~~~~~~~~
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30:
> note: initialize the variable 'parent_name' to silence this warning
>         char *clk_name, *parent_name, *vco_name;
>                                     ^
>                                      = NULL
> 1 error generated.
> make[5]: ***
> [scripts/Makefile.build:279: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o] Error 1
>
> It looks like the allocation was inadvertently deleted.
>
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Thanks, I'll pick this up for next -fixes pr

BR,
-R

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 582b1428f971..86e40a0d41a3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         if (!vco_name)
>                 return -ENOMEM;
>
> +       parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> +       if (!parent_name)
> +               return -ENOMEM;
> +
>         clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
>         if (!clk_name)
>                 return -ENOMEM;
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
