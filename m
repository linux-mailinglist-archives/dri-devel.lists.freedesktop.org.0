Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D24A2DDDA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 13:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7E310E3F8;
	Sun,  9 Feb 2025 12:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JZ6lHdyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7B910E31F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 12:43:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so4019094e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739104988; x=1739709788; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9gsXK1c1HmBF0r91iHeQ51YNAu0JZcecPSTcAdGkjgo=;
 b=JZ6lHdyUAv5h8a+UtwZldMDZrjvjfGt5RAm2BdlvPYjmoJT6kTnBQXBHEjiFVb+zZv
 wRJ22YBYzoevutgrXaRs7eS+6BfPSGhgXz7SCU+Yj5sHAcbfVXm5BSOUI+LsINzGA1gS
 7Bp/p8mBnrv5wlO6QMRpkgYp9Z5MVDf1LCzvpXHwUDlZ5i+LOaTQWnpz8ED3aUJb/mNj
 YdYIZ8UhpwrLj2o+R+HDTWhzi1VGhYYmBEfsenmQs0PAkGcyRid5opAhaDQ8+Tp0jalD
 IQJsMnWzkHHbCHHBFzVXFDSQKqdBLa4trkUzgEsL4jZhn3EiuV9Jvo3RxWpcoC/RBlYV
 zPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739104988; x=1739709788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gsXK1c1HmBF0r91iHeQ51YNAu0JZcecPSTcAdGkjgo=;
 b=pNsL/WQk86lwT1Za49oKMaXXVwu0ptg3gBz5hVxcIW1QW5y1O3EO3XKs5mBj8+kDRI
 1PK8yPzRmPZleK6IVWOkLY0+JyY7JlqvA44NQkVdl3fUUDlGQJo9iQsxc/JpGx5pWp0V
 ROqkNcwGfGZjsv6WTHjtOQ8wVAePUDwNZGpDAwvgAIcui2iQ42zIAWTKxr/hUbxaX+TG
 d6GKAHRH9AowmMydx8wXRtkSLLw4822YUAjL2HOEPkel65XxSuUGAKKhKbHGI/ktjZYL
 iW/dpBOya2tUNa0+9ELQ6gY/Da3MdGuXL2Fni0brBvTUkaZVRunvDpPaHozCVAW/bdkn
 EciA==
X-Gm-Message-State: AOJu0Yyx3e2qb9FlrMeeSbftyfmEVVwbexQDFF0XMF5bxDJf5MfqV7/z
 la9dbHBT1XZ4rpDUWcA/1C6Am2B7HjJD78VkQ7h+m3ddXAk14HAYKVHPqR6XUjg=
X-Gm-Gg: ASbGnctsnDyblwg/Y/7Iy2b8sK63kC1X9nCfgSEbsgzEOY+ztDqYhz6+eKNylX2tYfa
 SbrqUK6iWZm2cUPGuxpmdB4kXp7ldjqnCFo7AiW8RKLsfWcdjyT14XuR5pkwSramvUffzJfJ8A9
 ItNWBw2UIkla+K9IHEZS69nYWOapg/Fh4lNJORdqb3rbbXaw57im/vVDBbO7BGZWXAfLPf1tg9x
 RED9164ycoCDuQI5a182/+2SM4W0zeOJqnhgseziWN9PSPqAktL0Prn/v6KAeCA+WdOWAqEMlJs
 v4hVaJbyzL6xXL6XCPK6/7xHWfHVoZNM5nHXj/y8Yix6BYbmOW1BfJJykvNIKD3tBVG+gZE=
X-Google-Smtp-Source: AGHT+IGo53O+US6XScRqpOTQ1EFQWQ3fdSrf5MEgBBs2ShlxBiJl7TtgukYGj4l7WJRi3NjYq3C2SQ==
X-Received: by 2002:a05:6512:a8b:b0:545:ba7:26f5 with SMTP id
 2adb3069b0e04-5450ba727f9mr302724e87.46.1739104987991; 
 Sun, 09 Feb 2025 04:43:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450a1fbfc6sm146222e87.92.2025.02.09.04.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 04:43:06 -0800 (PST)
Date: Sun, 9 Feb 2025 14:43:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge-connector: handle subconnector types
Message-ID: <k5ziaxb3jgqfxd3wadi4irk6kbtawudzkkatcmr635gidw6tf5@i62xyzbv2gyx>
References: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>
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

On Fri, Jan 17, 2025 at 11:50:50AM +0200, Dmitry Baryshkov wrote:
> If the created connector type supports subconnector type property,
> create and attach corresponding it. The default subtype value is 0,
> which maps to the DRM_MODE_SUBCONNECTOR_Unknown type. Also remove
> subconnector creation from the msm_dp driver to prevent having duplicate
> properties on the DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> This is a leftover of my previous attempt to implement USB-C DisplayPort
> uABI. The idea was dropped, but I consider this part still to be useful,
> as it allows one to register corresponding subconnector properties and
> also to export the subconnector type.
> ---
> Changes in v3:
> - Rebased on top of linux-next
> - Drop subconnector property from msm_dp driver
> - Link to v2: https://lore.kernel.org/r/20230903214934.2877259-1-dmitry.baryshkov@linaro.org
> 
> Changes in v2:
> - Dropped all DP and USB-related patches
> - Dropped the patch adding default subtype to
>   drm_connector_attach_dp_subconnector_property()
> - Replaced creation of TV subconnector property with the check that it
>   was created beforehand (Neil, Laurent)
> - Link to v1: https://lore.kernel.org/r/20230729004913.215872-1-dmitry.baryshkov@linaro.org/
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 28 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.c                |  3 ---
>  include/drm/drm_bridge.h                       |  4 ++++
>  3 files changed, 31 insertions(+), 4 deletions(-)

It seems this isn't getting any response. Also we don't have (and don't
expect) DVI-I and TV bridges. Let me merge DP part to [1] and drop other
parts.

https://lore.kernel.org/linux-arm-msm/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

-- 
With best wishes
Dmitry
