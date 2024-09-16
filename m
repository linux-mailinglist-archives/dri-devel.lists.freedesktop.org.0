Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43244979AA2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 07:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B1910E09D;
	Mon, 16 Sep 2024 05:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sCx0+0Yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0D010E09D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 05:11:30 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6d74ff7216eso19796607b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 22:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726463489; x=1727068289; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xClosrKSKvRQXSe4g+NTsfgEyk3rcyU/wxole1yQDT0=;
 b=sCx0+0YjwUyeqj8NFZP8J7yu8TR6oIY76/PI8aKsC0DnK2SwSkVk5XQMuQOknVN48R
 Vtoc5SZRzre3TCP1nSuJrxUPAN+0VTJ48ONxpqcJh4S4L2DtSCh5qSDebso6NNmnqnqK
 J8R1v3j4ARrbywUXFZMurJMclf/DadtQpVfzhCPVCV3JMfKcOMLlebsqiMiKx9AxbV2Z
 VexKEg9ITChkBEKPf7LAIWjUKQPVUq4pyinjrFiHsHljvuqlFe/2XwlV5XlOqRgThHBP
 /OL6ZsHiqOvTFNPQOtw31SXhf6wWZ1hQmSBUP0GMCFdHoNqe6PuSPxNrfeFMCMl82Ylv
 /cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726463489; x=1727068289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xClosrKSKvRQXSe4g+NTsfgEyk3rcyU/wxole1yQDT0=;
 b=qH5manUm9eto1bdyiBycBoOg2SrzqRgT401lodw4ysh1CPwBkm94D7hP0rA9BVkBVC
 TV2hQXh8t3cZ7NziBaDZsBLTEbwSpiBjmA/4sLUi42f67aRRrbjP6mlDIXdQSgdlYCT2
 bNVrWDtHudTk+QHaqOojEQai4CcCL+5263+klEqzDWegm5eciuQwV4vMfAAyDLTXXNLG
 UzygYLQIH3MSvPUUt3L2D3nwySzAYTIqPZf33BL0K+1fEwx0bGYcC9Fv1aPXDdKT0Ud0
 ZU3dk31Obu3EzTWldBCJHYJ7QA288bX73Jo8Lqg20NC9CW2CtqrIjbDEdjmy1m1BMtuK
 pDRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5DCCFDDDcBd9G/cjYSzxYrA/ZFnmWJCteIFe0nLqRxFfZYCu2QHr7LEyVaQwF8042Dn0bnyk0VRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5KiG4brEL3IAv3NX2c512vpQWegTfbVJR+HXi1RYVeOtvpQ2B
 N5vNbzxajX0Nbc8im7zJ2GNpuJAWZ22wU65QGltvJS2fgkXtWyNlvRjaKhgPFPuKTwsHNHKTYE9
 9fJy6GBtnHxFF+MoQbvQikvMmRaKmhsioFB9+DA==
X-Google-Smtp-Source: AGHT+IHw0+9JwP/NwY/8uibNHIFwJiOUTZZF4F6o99jcFoo8qq9n9ykue29sInrAe1E0S1koV97Qqsuk5tzD/GYpnQE=
X-Received: by 2002:a05:690c:4a10:b0:6d3:be51:6d03 with SMTP id
 00721157ae682-6dbcc3b3a4cmr89104197b3.23.1726463489085; Sun, 15 Sep 2024
 22:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Sep 2024 07:11:17 +0200
Message-ID: <CAA8EJpp1ZHFFY9M3i47d658Q-m3ggJzhxSRUapX=tckgdAwcNg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 15 Sept 2024 at 10:10, Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> In order to meet the timing, remove the delay between "backlight off"
> and "display off"
>
> Removing variables: display_off_to_enter_sleep_delay_ms

This is not enough. If this is a fix, then describe why the original
commit is incorrect, provide necessary explanation, details, etc.
Otherwise it looks as if you are removing the delay that was necessary
for other panels

Also if this is a fix, it should be properly notated with the Fixes
tag, maybe cc:stable, etc.

In its current state: NAK.

>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 44897e5218a6..2f8af86bc2a0 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -31,7 +31,6 @@ struct jadard_panel_desc {
>         bool reset_before_power_off_vcioo;
>         unsigned int vcioo_to_lp11_delay_ms;
>         unsigned int lp11_to_reset_delay_ms;
> -       unsigned int backlight_off_to_display_off_delay_ms;
>         unsigned int display_off_to_enter_sleep_delay_ms;
>         unsigned int enter_sleep_to_reset_down_delay_ms;
>  };
> @@ -69,9 +68,6 @@ static int jadard_disable(struct drm_panel *panel)
>         struct jadard *jadard = panel_to_jadard(panel);
>         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
>
> -       if (jadard->desc->backlight_off_to_display_off_delay_ms)
> -               mipi_dsi_msleep(&dsi_ctx, jadard->desc->backlight_off_to_display_off_delay_ms);
> -
>         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>
>         if (jadard->desc->display_off_to_enter_sleep_delay_ms)
> @@ -858,7 +854,6 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
>         .reset_before_power_off_vcioo = true,
>         .vcioo_to_lp11_delay_ms = 5,
>         .lp11_to_reset_delay_ms = 10,
> -       .backlight_off_to_display_off_delay_ms = 100,
>         .display_off_to_enter_sleep_delay_ms = 50,
>         .enter_sleep_to_reset_down_delay_ms = 100,
>  };
> @@ -1109,7 +1104,6 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
>         .reset_before_power_off_vcioo = true,
>         .vcioo_to_lp11_delay_ms = 5,
>         .lp11_to_reset_delay_ms = 10,
> -       .backlight_off_to_display_off_delay_ms = 100,
>         .display_off_to_enter_sleep_delay_ms = 50,
>         .enter_sleep_to_reset_down_delay_ms = 100,
>  };
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
