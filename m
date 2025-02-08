Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F77A2D5DB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 12:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D5B10E04D;
	Sat,  8 Feb 2025 11:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IsnbsrIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216C210E04D
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 11:51:41 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5450475df18so532797e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 03:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739015499; x=1739620299; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/KWkTtSxyAD0TycOxsbaDEty+yUoozFaWimwQpzkH/0=;
 b=IsnbsrIvefGtkNtmTGMRzeKqwz0VVI/0VukhV2vOStddB7EVfPkersd3B1ScuYS/+t
 364Mgx+XUGpyvIcDbIO0MOFrMwMtGcLc56oqqzADQRW08VhPloTgaKxDKlW1qqiRiCoT
 huVIY7bgObKOZxUnkIl7DgnbCT6BvN42d8oFyGBtI4YKEL7mfYgupgbLPl/1QDsuTQAW
 2foO6GoYU7r7/oL5uhntdXR2PliCYFK0pnPDO5n1b09wv2suugFblvzY+tRBiBd1hkhC
 o5RsatM4BOhQGWNvUsV+IsAkbpGfPtI8xEvaNPUUkdqgP7Tf2heCL/rMHoCfinP6D8cg
 Xmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739015499; x=1739620299;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KWkTtSxyAD0TycOxsbaDEty+yUoozFaWimwQpzkH/0=;
 b=UwxjHic8vCVtYMKRhl7NNP8VCPbT0X5qsvyo5eVnlt2/sOZvrTptfh+m//dmWMxmJM
 no+ypzHhoQIhH0KYNpDa34sHiZip8ud2urBcUvMfilwhebu821RikK8AO70rWjx601np
 8UmWS7kMSMds2Fj/Ju3LnGH9nf+yA47xXOGY7lH5fQ1+u20DjC2S8Oclyfj5gETaTtAB
 vt0lOY7WUlukCPqE1Heb0W3YvlsM0LL24vsThZd3KKdIAFujrgqjvedwCKcsXPNx4PGT
 R3Ci6g0G5dYPQZPpz24tLHYhPAR78dkDaMWSKbiKV9sV2PCNIHnsTIseaQ18axYkH+EE
 sL7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPs7PDWCPeDBrTFrmSXaLuTLfk4Mx80snqU0Z0TbszNVZFX3leJ9qKP3SpfnhfEwnSRC4yz4UZo38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRnydrFkVssTo5ZVEodT9jhOjH1UQoWW7xiY+FaowltsgiK5RF
 0Q9JsCA7Y4mdKFrTF6E/ftkbjggAs7fj769AIUJrUDwJs6QmS97mfBdbiooiKQ5FY24RNLDDFFD
 X8tg=
X-Gm-Gg: ASbGncsdIPJkwwfXWuwFva9gSSF9ENXH427AtmY3dYHNSAY+qv/CLl1+n1E5LvkEohc
 sdxo9+jRhGW/95lnsfFIgAezyXiQYpCU2BQHUTjaXc/UZWyvWXPYKfTGpisrCXweBbYtZvAwzaN
 s3qwqOBLsBk2KybE0SSFPsrz3ujy+w1OJY//t6uhzf8dRDjyEDfSgdxSYCSNEC8stFuNA6yNtKz
 lSTOefafod9n8wISsVfUcPJO68DTAh1/BVvoCQKvOiJ6wkaB0t56XAkQt3MNXff7dndRZSMq896
 T/S9tnTthD6OycLtQoa4cz37rrjL+f3y+5mmN74Pfd9thPWLtOid/y81iai7gPWvIeEIul4=
X-Google-Smtp-Source: AGHT+IFVANwHEGEIiKS7ESzLOzalgWZ88CbKZgKjivaqeSCA8Ol31KRlZDcLcS/X0/BdWQjJ+9RDDA==
X-Received: by 2002:ac2:5eca:0:b0:545:40f:575c with SMTP id
 2adb3069b0e04-545040f58bcmr699914e87.0.1739015499109; 
 Sat, 08 Feb 2025 03:51:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54412885e19sm628967e87.152.2025.02.08.03.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 03:51:38 -0800 (PST)
Date: Sat, 8 Feb 2025 13:51:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
Message-ID: <2yesnamgb6haoy3xxxvlb4d26a44incl2k6cpyl3x4nnf7qhok@b66pfkcxqh7p>
References: <20250208051541.176667-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208051541.176667-1-tejasvipin76@gmail.com>
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

On Sat, Feb 08, 2025 at 10:45:41AM +0530, Tejas Vipin wrote:
> Change the visionox-r66451 panel to use multi style functions for 
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 179 ++++++++----------
>  1 file changed, 76 insertions(+), 103 deletions(-)
> 
> @@ -187,25 +181,13 @@ static int visionox_r66451_enable(struct drm_panel *panel)
>  	}
>  
>  	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> -	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> -	if (ret) {
> -		dev_err(&dsi->dev, "Failed to set PPS\n");
> -		return ret;
> -	}
> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
>  
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(120);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>  
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(&dsi->dev, "Failed on set display on: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(20);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>  
>  	return 0;

return dsi_ctx.accum_err;

>  }

-- 
With best wishes
Dmitry
