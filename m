Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D32A38BDB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D3610E5AB;
	Mon, 17 Feb 2025 19:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zOZlvMZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B753A10E5AB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:03:44 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so47804231fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819023; x=1740423823; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wqARAPdYJ/xdElMselfYbhjeGyD6v5q+Wc1NzQmTawk=;
 b=zOZlvMZvoR/2zwT6z7vHa66wBZHxPRy0wEYigLxPx0xr0JCVAZDGwPIHXD7v/lSz8L
 h4jZ5CEtubIZQ+cusSuQdgelBhokOcjHhfvqHEvlYNFs8ohT8OkFUM8WchKlROl2tAOs
 qyPrKYjHGE6xduZJb4Vi9lAruKTG9YjYdmGIhHMiqw6PUOt1fx7ML30bYk17c+fc2vb1
 r3+TZ6KHr+lST71sBeKbSx6KKdbbQAqOB/NYW43OS65RpDHp56znsc4UTH0++NW/kxlU
 GKJbH7QwPGptN/dqp9bDEcMVuzKH/mlwHJJG7T56FCSrxMRczkQe6vONaWCp5VPC7CdJ
 U9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819023; x=1740423823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqARAPdYJ/xdElMselfYbhjeGyD6v5q+Wc1NzQmTawk=;
 b=XRRFulFC7oGPgWshKjRpaXtGhozRHLk2Yo9tFNV4LvJfZr9XqgWT88pp8I3iVbrGHK
 5cmejTESJ438ZEmxxBXX+6VObo2GvnUGVyc5jIjfa7ldRxa0BvVQsQG6ikEjDsEpGCTK
 IGOHLHcOCBwyuvOZdEkRXHEBlJ2cQVp6NyWyWV/SN0xg/XxU6KTkN+CXLbj65bBDBkwp
 KflrvVmxUW9/31LQxvpTON4f5ND6y5l/eoJxyMFkCA8loPCshkSeln2ARIMI4SZIPvbO
 wbVmcQBNNUwSGY65dGOHhdRAFu1jdTebh29wlB71PUs67Qtrr7mk53HELipPzhmDn9z4
 3Inw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7TZBh/vcNmELcR03PkdN5zn/AVBH30Ph33GG2X4CYUXiFdn+BB6Twtt+AxS6jsSYk85zworTCnB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztR0XWJdyyJbcqcYMTpFmK+muV3I4R/hKuNCiylO93MuWNIP1L
 K3xNcHVGMpCPg74qY7IZ/Ue+gJvJnqzsGb7xcoqOstrU1zA5pB3b9N0FPVUqDoY=
X-Gm-Gg: ASbGnctnS/25B9SNrAjF9ggHBp8lIy/pAhCbEj1rNt45cO3yfZ+65TQEsjU1SHEiHoI
 MCRXJyVFrp7RuISD1NBk3aJJV8xE6806oHHcHmL0DNcPwcYDcVteAlR8sliIZcEYk1q21wO1NdH
 +Aayf+JBnEKaigSPhkUtciKAD8W9ti9dzrSenk7YLnahBLnaJAJqBIcmYSVdGvwzuV7KI65atne
 TGAfNh7Bz2P7rmIuhe5wjTVJyBsngVCrnftzW87p+Py8V1wXEzDAvy5LxbAawtwKVB8l//sMfTW
 7ogMJ1DL6kKWjOThCYsCGRhluw+L1/daXpLy1cx11ATGc2nb64j477+GLIAUTwvb6prlan8=
X-Google-Smtp-Source: AGHT+IH62f2i1NiC9Y1L4JGihKmed7FGNYzj/K/SBkHNk/de8aDSNi8aRspcctiuRSH4/mHKv2w5Ww==
X-Received: by 2002:a2e:87c7:0:b0:308:f479:5696 with SMTP id
 38308e7fff4ca-30927a48b4emr31189761fa.15.1739819022995; 
 Mon, 17 Feb 2025 11:03:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091d025767sm14492051fa.54.2025.02.17.11.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:03:41 -0800 (PST)
Date: Mon, 17 Feb 2025 21:03:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 11/16] drm/msm/dsi/phy: Add support for SM8750
Message-ID: <sxepkcq5sbksj3xsq4mlvpzg6ljaz23bdhrehahhfjmalrlege@4atufz3uxs6x>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-11-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-11-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:32PM +0100, Krzysztof Kozlowski wrote:
> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with an
> incompatible hardware interface change:
> 
> ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> offsets were just switched.  Currently these registers are not used in
> the driver, so the easiest is to document both but keep them commented
> out to avoid conflict.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1.


:-)


> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 79 ++++++++++++++++++++--
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++
>  4 files changed, 90 insertions(+), 6 deletions(-)
> 
> @@ -191,11 +192,24 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x01b0" name="COMMON_STATUS_ONE"/>
>  	<reg32 offset="0x01b4" name="COMMON_STATUS_TWO"/>
>  	<reg32 offset="0x01b8" name="BAND_SEL_CAL"/>
> +	<!--
> +	Starting from SM8750, offset moved from 0x01bc to 0x01cc, however
> +	we keep only one register map.  That's not a problem, so far,
> +        because this register is not used.  The register map should be split
> +        once it is going to be used.  Comment out the code to prevent
> +	any misuse due to the change in the offset.

Mumbles a lot about the hardware design.

>  	<reg32 offset="0x01bc" name="ICODE_ACCUM_STATUS_LOW"/>
> +	<reg32 offset="0x01cc" name="ICODE_ACCUM_STATUS_LOW"/>
> +	-->
>  	<reg32 offset="0x01c0" name="ICODE_ACCUM_STATUS_HIGH"/>
>  	<reg32 offset="0x01c4" name="FD_OUT_LOW"/>
>  	<reg32 offset="0x01c8" name="FD_OUT_HIGH"/>
> +	<!--
> +	Starting from SM8750, offset moved from 0x01cc to 0x01bc, however
> +	we keep only one register map.  See above comment.
>  	<reg32 offset="0x01cc" name="ALOG_OBSV_BUS_STATUS_1"/>
> +	<reg32 offset="0x01bc" name="ALOG_OBSV_BUS_STATUS_1"/>
> +	-->
>  	<reg32 offset="0x01d0" name="PLL_MISC_CONFIG"/>
>  	<reg32 offset="0x01d4" name="FLL_CONFIG"/>
>  	<reg32 offset="0x01d8" name="FLL_FREQ_ACQ_TIME"/>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
