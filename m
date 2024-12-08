Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDAC9E84B6
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D621210E30D;
	Sun,  8 Dec 2024 11:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RV57GYhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E363F10E261
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:42:50 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso42326291fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658169; x=1734262969; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rqdm0M9gFPaLS3SS+kPxyU+HG5ijsXwtikH0q0stVKg=;
 b=RV57GYhJuQskuXWPlloLs1ooVKTHy0Z8GHlky3CGW190zIKLTuU+EDrsHudnHk8vG7
 bR1DepK044uRGj4PdzxvjGYnmeJ2PFSpqZ3PatPcjZzQXgCZVbQiWWRivxtkBXtBgKqF
 n5/QtsdhUtJgiYf73VzCQD/XL8zOJVlXyXlOem05wG6l4tSz5/WRrphFuNqokMoSY9nc
 To7UYR+1DsvDGVVFhYU941EN5jSCx1m69Txeg8XgJ9/9ksKlRJrUWv6sqZ/fc/PB1/XH
 8We91GcycdKfcVkYQR2iNVwZMQS++fGiU0HnumjTUMfH2TVqRZRMR5RuZmdDNfCS+nTz
 hDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658169; x=1734262969;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqdm0M9gFPaLS3SS+kPxyU+HG5ijsXwtikH0q0stVKg=;
 b=kHsqL3ahNO71+/202KCX39pyhtvhOEaON04/9wl5umhBe7K+y0aSwAxh7Xt/EX+Hd/
 OmyMPkgEUbDKWWO5MgesEx52i87ORfGGRbWvW+pa9I7SkHPvTamaaa8+m4GBc+KKDx2C
 Ahibk22BynCjnZcgEXw18CRzHqV/1ULUpXJ0Ycj2hgP12vGPppNVX6TxjGfdGw+DFntk
 Qlx5HW9AhwpF1xNyNzcVpKEau7VNkz3PHEC4y6IfyRhPi1GGJitSMigEqGIkuGfH6bU+
 zpxZMHAr++Shf1tZyaXuyjguOSIqVpT+rPz+VbrnN0azakVdRGtSioi8yl0Dswkf8w21
 +GVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo5Hcqh8a9pefafN15TS5bqCKxG3lgMxDOb0EtJikbAo2HFEoaZvJW87H0/rP85asX8eCqI74ZXrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7HVpjfbE5jGvi0c5Vtua4AdMGfvoYIXddYfsMN9mGVER8VU1T
 ZrTq2Wf0EbD3HZ3V11PjyhhRoyXxXGtv+ASUox9JAB08HfaaMMoVSw6v/gT0s40=
X-Gm-Gg: ASbGncub4V+3E58katqz0IbyAX1jItho+KmFmPQ7MJ35xZtGweDXARNDsm9p7GAG41k
 kkKFuppZ3aUlIf5qrY4wvXcfbZvijB+6Racwm6nMFiwFOE6evC7dJY7B7+jB8B7cW0eVp6O6WQR
 wnNVWvJlwlUjV0wd/2bWaKX4JfB824GfffNp4f4z1FTCAVJPYWw3kYpuKNVpMlrnbUjd15SamGm
 0Mo1bfUrLvqvpPO4W6BjO1fYy8SdJx8KlvNy/l7zqqctqrUk9bBogpsonuWI687DS/nj2YlrUrX
 eFxKKVxrQZqw5+wkAnD2yefLsXiMhQ==
X-Google-Smtp-Source: AGHT+IH8v5VqGhc3V23ZRaSeetM6jF9bsN4HcuZe4bb0441mma81kPswSik1ZjOvPZIUevWiRzkUZA==
X-Received: by 2002:a05:6512:3b98:b0:53e:16ed:eac2 with SMTP id
 2adb3069b0e04-53e2c2efc44mr4026683e87.54.1733658168789; 
 Sun, 08 Dec 2024 03:42:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53eaa3bd421sm427671e87.97.2024.12.08.03.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:42:47 -0800 (PST)
Date: Sun, 8 Dec 2024 13:42:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 19/45] drm/msm/dp: add support to program mst support in
 mainlink
Message-ID: <kdkbyhljc7dkvbmcrk6jhbtdybx3g5aca3uysw4l2qf4bf34uo@ty6jrhcruo5m>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-19-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-19-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:50PM -0800, Abhinav Kumar wrote:
> Add support to program the MST enabled bit in the mainlink
> control when a mst session is active and disabled.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 88d6262a972ef2d30c467ef5ff5c58ef3299ae7d..bdc66e5cab640c351708ba1a1bc3bca21784df6e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -417,6 +417,23 @@ void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catal
>  	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
>  }
>  
> +void msm_dp_catalog_mst_config(struct msm_dp_catalog *msm_dp_catalog, bool enable)

Can this be merged into msm_dp_catalog_ctrl_mainlink_ctrl() ? Or is that
function called too early, when we do not know yet if we need MST or
not?

> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +							      struct msm_dp_catalog_private,
> +							      msm_dp_catalog);
> +
> +	u32 mainlink_ctrl;
> +
> +	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +	if (enable)
> +		mainlink_ctrl |= (0x04000100);
> +	else
> +		mainlink_ctrl &= ~(0x04000100);

#define

> +
> +	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>  void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
>  						bool enable)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index c91c52d40209b8bcb63db9c0256f6ef721dace8a..07284f484e2861aeae12b115cd05a94afed1c9cb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -138,5 +138,6 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_
>  /* DP MST APIs */
>  void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
>  bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
> +void msm_dp_catalog_mst_config(struct msm_dp_catalog *dp_catalog, bool enable);
>  
>  #endif /* _DP_CATALOG_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 2bfe2aac3c02b02b12713dbd98e79ed4a75b85d0..3839f1e8e1aeb2a14a7f59c546693141a0df6323 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -186,6 +186,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>  	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
>  
> +	if (ctrl->mst_active)
> +		msm_dp_catalog_mst_config(ctrl->catalog, true);
> +
>  	msm_dp_ctrl_config_ctrl(ctrl, msm_dp_panel);
>  
>  	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
> @@ -2132,6 +2135,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  	phy = ctrl->phy;
>  
>  	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +	msm_dp_catalog_mst_config(ctrl->catalog, false);
>  
>  	ctrl->mst_active = false;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
