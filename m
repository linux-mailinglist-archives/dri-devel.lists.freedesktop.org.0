Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BE9DEF62
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DD610E156;
	Sat, 30 Nov 2024 08:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x+K9v15F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0584110E230
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:39:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de84e4005so3014560e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732955990; x=1733560790; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=60sx0mWw0yfKGfuq1JkGjNW0KfJvKS/QRfp4rQuI3pc=;
 b=x+K9v15FBVIkRdDOc5zx8YchXcHgz02VFK5GG6+o9bpOZHWqbX09iEFYu0/px97cDs
 5VIT5zYaxV/EAAqdSd0u8QoLvFU+YnpelFgQwKqmmz6r9hsTtJcXoN3syrkRH85cJzHM
 aWsz7aNjFczOjSjhWnaQMOIZikGB2pu+VL4YKS6NDr2QvPReuyaUh8z5ibXj7rYOj5ax
 IYtonN0lO/HuM45UZNK23m8rSNlPcxM4YsxhAEXDdA/JkdT7ChnrJ7OpzeCLKCtofVk8
 i9qOuam/z6QQ1CPHG+QRAJxxijd9oKrH85TXBs37WyXXgdwxLXqt4k/2WnvL+vzB001r
 GRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732955990; x=1733560790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60sx0mWw0yfKGfuq1JkGjNW0KfJvKS/QRfp4rQuI3pc=;
 b=Wb2oEawfLsAL4tqR7tEEWMS1yEfz3W3ikuie4nKgCNOhM8oJLYs/BzykFMPFkXRxRp
 Izu+N2bENpojJG35v3yaJqI2A3yJSdqt3KpdgBkCLlpkwOlQsLpp7IMxvk5U0W0jb5TX
 sCzqDzICD/Sz4rVUIQhys98PKgMIS4//oJMKnFxfS4eAoV3JDgInR3nJ9a+fnRL3tM2L
 ipYcbvFEDknqxTp624bS5xED36j2QvUBLwB5QuGsx/N6J5bTpw+E8X5pQSzAZltRzy/P
 O6F38w1VhBm6Ar14y/OusnToMfSoiEwwzdx8EfuD7dGom7IXP2CfhqQJiwypFq0nXifH
 dhfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUMVVxfU1XANlhUOB5TL3USlQV1vevef3x72mFJxxPOBa0LQ4BoFtZLRscXpP4szMQyImbnMD2RBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2q2WIvEP9D13LM9ahctcvWCt30TvEWd1dIs34xpA0XlLMLKGH
 xiw58MTuRpJTEBHjo99flgVwR+/lVrl70ukgGrOSd7ZsseC/nCSKytu+L0waqgQ=
X-Gm-Gg: ASbGncvkK5DNK0PQsCz6arI2aRtL2yl5B7UkDQGICbAZ2IMX9axdXptjIrCkzDPe1HJ
 fg19RuuPtUn2Xu2OZ4ICwVNSYB0OE/0m6fTLHM+ArJNIdb0gWwMiULlZSX8PvE8ScDqdnEm7uI9
 3qXT47Z72QxJVgcz/z/7Hiq3jvuwmesVXih+VWd9IVMw+2K67wku0tjJmzQLkBUPRn1IzEkKqQX
 ut3ACUq/K8A7GmpHKCWSHKcw1I0OZIRRQBakC8d0JjhlwzsSUOal79Ghr+GsRJJkho0e1Ncf6yJ
 HrWibsOc8YOZT4OJMp5/S1lA7gFTMg==
X-Google-Smtp-Source: AGHT+IEZ0VPvlTILkrhYt48fs8ZlxgdXNHcVOZdYnoICSZyUeiM50kM2bpLGagJTYYGxnqPFfP1oYw==
X-Received: by 2002:a05:6512:3e1d:b0:53d:de4f:a15 with SMTP id
 2adb3069b0e04-53df00c74aemr8303777e87.6.1732955990159; 
 Sat, 30 Nov 2024 00:39:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64a0666sm706052e87.276.2024.11.30.00.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:39:48 -0800 (PST)
Date: Sat, 30 Nov 2024 10:39:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/connector: hdmi: Use YUV420 output format as an
 RGB fallback
Message-ID: <w66zx533ugdapxvs6mtks7wj3tyqdu334t33mbb6i665m2fiqk@r4qtm7linuvv>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
 <20241130-hdmi-conn-yuv-v1-3-254279a08671@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-hdmi-conn-yuv-v1-3-254279a08671@collabora.com>
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

On Sat, Nov 30, 2024 at 01:56:34AM +0200, Cristian Ciocaltea wrote:
> Introduce the switch to YUV420 when computing the best output format and
> RGB cannot be supported for a given color depth.
> 
> While at it, add a minor improvement to the debug message indicating the
> supported format.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 3a55881a544a519bb1254968db891c814f831a0f..b4e865e0680f35fd2d849536789f6c1f98a48258 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -304,7 +304,7 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
>  		return false;
>  	}
>  
> -	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
> +	drm_dbg_kms(dev, "%s output format supported with %u bpc (TMDS char rate: %llu Hz)\n",

Correct, but irrelevant. Please split to a separate commit.

>  		    drm_hdmi_connector_get_output_format_name(fmt),
>  		    bpc, conn_state->hdmi.tmds_char_rate);
>  
> @@ -319,15 +319,16 @@ hdmi_compute_format(const struct drm_connector *connector,
>  {
>  	struct drm_device *dev = connector->dev;
>  
> -	/*
> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
> -	 * devices, for modes that only support YCbCr420.
> -	 */
>  	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_RGB)) {
>  		conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
>  		return 0;
>  	}
>  
> +	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_YUV420)) {
> +		conn_state->hdmi.output_format = HDMI_COLORSPACE_YUV420;
> +		return 0;
> +	}

Should we prefer YCbCr 4:2:0 over RGB?

> +
>  	drm_dbg_kms(dev, "Failed. No Format Supported for that bpc count.\n");
>  
>  	return -EINVAL;
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
