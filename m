Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915BF83CEE7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30E810E25B;
	Thu, 25 Jan 2024 21:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502910E25B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:51:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5101cd91017so1261270e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706219453; x=1706824253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T54fsLBTRmT4jgVEtxyLn6mAS33agnyvi4UEMgBVoWQ=;
 b=gFqPyPpzZhg5MFSmzkSNKZd/Y4Z2LFMhQHU+AKr/s6/p+B1omQZhj4jQSz99KcUBx1
 084pzvyXhUJQ56mESYDefgyvKFsK+Gjriryun0+9v9EWHp8bmV9qjqlOiOb2wm6zcE7S
 5d+tH0CyoFsVuYQ5y1AAxmIzCl/UdLslZfNCtTSToqOGi2rBeqW3XJJ+8piIkiMGlXJm
 osaklqp+pcjTiCFZemc3hbK9i4blJl3ri/MdoZPzYNJfBS+7U/HbxtY62lU8h1RzprxU
 /1a5aUtfwxdXmasy1HSd/mptHMKtgsoz+hSxc6I2EsnBPiQR0Y/kq6SUMDhhdKmXboi4
 6nLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706219453; x=1706824253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T54fsLBTRmT4jgVEtxyLn6mAS33agnyvi4UEMgBVoWQ=;
 b=OLvJ6mIbtf3RwgseBBjI/raGjtMDXrI3cCRKHT2jg6OYjJAM4+wgi4Z9lHOa1BzK1B
 Otl59bKpK+lQZGx6hTeVAiiVlFh7nN77RSSPXXR7wkUC1vRqr04EhO1SP7i6JPISgzfQ
 IpwqDcpP9ORMKTzgTEqts8afc8CkzfrnZe6A81uoxJztsl6vWIw3cHIXZbaxg17M4eaL
 etq6ghyEEmcilz+RzsRcVV0YnpR4ChuzsdMqwnA91FOckhFivsAoYUuY49wHmH34iwaE
 BTysEu23nr7X1Ut0yRkX8M5acqqKQ1hwRgZPHDtx+rXDdWiMm9hILG7sXCTD9DVQ7gjK
 /a2g==
X-Gm-Message-State: AOJu0Yyr6UYGqbA20J8xbDXbQh4FEzVLp8EoEzEAVqJPTvI/15vOMbYB
 zW0tbz5JkXWap1YzqaX2I+owQZ5FeJ1qZzF+Q766EX4oSebXlC+63AWDth8rnRc=
X-Google-Smtp-Source: AGHT+IFCdBHp2PBFHOeepK/hfxpQeySTG1iUcHe72e+6UbKprHQdajEkeHG41o05AtpkYezNWRUIMQ==
X-Received: by 2002:ac2:48ba:0:b0:50f:13f8:3879 with SMTP id
 u26-20020ac248ba000000b0050f13f83879mr144675lfg.75.1706219453369; 
 Thu, 25 Jan 2024 13:50:53 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05651232cc00b0050f0dce126bsm2942118lfg.214.2024.01.25.13.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:50:52 -0800 (PST)
Message-ID: <64c9c8ee-6ae3-4db5-8952-b8b1fff71d8b@linaro.org>
Date: Thu, 25 Jan 2024 23:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] drm/msm/dp: enable SDP and SDE periph flush update
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-14-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-14-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
> 
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
> 
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>   4 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7e4c68be23e56..b43083b9c2df6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -446,6 +446,24 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>   	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>   }
>   
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
> +{
> +	u32 mainlink_ctrl;
> +	u16 major = 0, minor = 0;
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +
> +	dp_catalog_hw_revision(dp_catalog, &major, &minor);
> +	if (major >= 1 && minor >= 2)

if (major > 1 || (major == 1 && minor >= 2))

As a check, which of the values should be written for maj.min = 2.1?

> +		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
> +	else
> +		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
> +
> +	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   					u32 rate, u32 stream_rate_khz,
>   					bool fixed_nvid, bool is_ycbcr_420)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6b757249c0698..1d57988aa6689 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -169,6 +169,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>   void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>   				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ddd92a63d5a67..c375b36f53ce1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>   
>   	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
> +	dp_catalog_setup_peripheral_flush(ctrl->catalog);
>   
>   	dp_ctrl_config_ctrl(ctrl);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 756ddf85b1e81..05a1009d2f678 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -102,6 +102,8 @@
>   #define DP_MAINLINK_CTRL_ENABLE			(0x00000001)
>   #define DP_MAINLINK_CTRL_RESET			(0x00000002)
>   #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER	(0x00000010)
> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	(0x00800000)
> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	(0x01800000)
>   #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
>   
>   #define REG_DP_STATE_CTRL			(0x00000004)

-- 
With best wishes
Dmitry

