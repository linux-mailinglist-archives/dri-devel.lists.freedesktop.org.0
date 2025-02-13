Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DABA3503D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 22:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D0510E0DF;
	Thu, 13 Feb 2025 21:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QhcDsv1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D45010E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 21:09:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-308ee953553so14551391fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739480938; x=1740085738; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TeNMrpUqpwoLFI0ojzBCoD9uOLScIV/Ka4QcI/0Cif0=;
 b=QhcDsv1G/ADI4KXCXT668iK6VKZh6+woB7Cop0iTj4sFCmXCkoAQBDCgdLf0nBP+ZB
 Jq8U8Yo/tRqENYsuQGhjdX8alAd2dihgHnxaBi9g1fnT9IZ9mpRGeLt7AhOMPbCuV2Xj
 KzjqEKCyJx3i70S6ub9n+YIE83Bm1Z1btkMyITJX0mK98+8imq7Khb3hjZngn0HgdS2/
 09f2+GISx60WPHIGTummLT86vp6H2NtfG/EFeakBcG9HGu6XSgSlEDHY6arWSl8Wsizo
 c7PGnr+tgHb7HFVyOtA0ztDViPBr2RsHga6H5ZOH5NCa3k7jkOL4hxB7hXAhXRWm5qEV
 aXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739480938; x=1740085738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TeNMrpUqpwoLFI0ojzBCoD9uOLScIV/Ka4QcI/0Cif0=;
 b=UVpezrlTx4rpn1MgqI0S/4ZAQLXYhETx/1+J4XXYDI/hNPxVO4y9gCqgyqHS2Fd+eZ
 VoIkpPXN0YYa3hghPJa9XtUb7dB8MnDqGuVWQlQuKO9J/xDz6JyHJiQxvsXSpJDf3W1I
 CjTkYsPj7Rvpf25KxFxSoW4yhj2WdcQSqH4teaysExPQs1e/+7xHmeXj1PV/B5msCalT
 7yQPJCqP8lk4WdFL75J1KrZIbBxc4RAqrHh9tkauhmgRdaGqX5Wx1VnfjJW/ajCNeh65
 CmWvlOt7wLk4Q0O+jIBXUWEJWl20HCmoJ9TtLZBlFMbOawjRJOdUXPRClYhDeoAyj1tw
 D4UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu593VUs8BztGoxx427VIiqJVQAyfYxOMjjjWWzFffAOrLhU/w/INSUR+WGZOsMNbivnZvZ/H9Mj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRHYcv6+4q2/CEqanEFDufPgxRLWDc9IT5Sng3hrNRzsqCTeAJ
 zBt0XPiqENTt1FUYG2YND1zVrR3i9LoAAZK6k7ZmqY5NbGeMLtcIhxTrx1ft52M=
X-Gm-Gg: ASbGnctTtEgT88t0g42HyljYH0kbHYGKf8pdyCvArFJR2LsqMAPM848nVY2PpgXLjIO
 bccQ7OrVU5WfDXZgrJmTbJRptiJVaqj12IHtSIBBVDPhbci1+OTSN8vElFZR23cMEuLgwH0OD6Z
 Ao1C/MR7HzGZL034z6tjm0t2b7tJqphUEAal122TBhp4Xw2/CQOATsL8wUMCjjKlGofe0+BDsK4
 RHkl+9aqT3hq4PO5LVXXOFpIHXgVHV3oNq4Mifxt2VcS88+eRcWWrYh3YhTpSidauY6dPIkNP9x
 XfVlzKPawtbQQCMPXnl88vIJuiIoVINrpMZ84I1CFQXZIaD9H5yAp1iMD2cFBqkRK+4/LSE=
X-Google-Smtp-Source: AGHT+IFoISTHPwl7NmM39tEjJazTxUu4ZlSD1ldej2CAwAd50t/8PacosIj09OljiXHD8nuiFDIq4g==
X-Received: by 2002:a05:651c:211f:b0:2ff:a89b:4210 with SMTP id
 38308e7fff4ca-3090379d3f6mr26646011fa.8.1739480938463; 
 Thu, 13 Feb 2025 13:08:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30914801757sm1997551fa.94.2025.02.13.13.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 13:08:57 -0800 (PST)
Date: Thu, 13 Feb 2025 23:08:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 03/20] drm/panel/asus-tm5p5-n35596: Move to using
 mipi_dsi_*_multi() variants
Message-ID: <axar3e6jb7uzway52adqm27cox43uubkey7fcqqi5yu6wp3kfy@imipkyyg4ag7>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <20250213-mipi_cocci_multi-v1-3-67d94ff319cc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-mipi_cocci_multi-v1-3-67d94ff319cc@redhat.com>
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

On Thu, Feb 13, 2025 at 03:44:20PM -0500, Anusha Srivatsa wrote:
> Stop using deprecated API.
> Used Coccinelle to make the change.
> 
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> index b05a663c134c974df2909e228d6b2e67e39d54c0..aedf644b4a81649fd9a17b6dfdcdb95be1d5762c 100644
> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> @@ -168,14 +168,12 @@ static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs = {
>  static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  	u16 brightness = backlight_get_brightness(bl);
> -	int ret;
>  
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);

Lost return in the error case.

>  
>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>  
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
