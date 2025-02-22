Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262FA405AB
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 06:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9F10EB5E;
	Sat, 22 Feb 2025 05:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TOlhDKR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538F810EB5E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 05:42:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so4400062e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740202924; x=1740807724; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vO61PwMr9fG3YaV/tA/ZETRTgpImj80gIG6et6cmRFA=;
 b=TOlhDKR0l7uwLVP+fUkGfDVlEZ+xShoq+JUi4xfrrL92iO8QHIf3c7GCeRrBKnHzPD
 BbDTGmL17oxJkzJ1y1JNAYAdwFFFq6gO2uFbHBnIbxNXRnzdTdZGmJJP+8Qa1P4p56Pb
 QcEdOFGShMQm+OiKdcuYRh36wWYL+skuKTJeKAOGuyBW4OHYkLkNNMD8auVIaDzWAOrJ
 nem3wdwhpLzRu959/oxJY6C1aWDfprGpjpiEDVCWGmF/0dGhj4FTvmQSfd2HhKoIdQCr
 LgfQlfxdvYqJ+VdQfYwga2Z84VBOPBXmmh6baSNm97NHti4vJk8MX3mUPCmGo/y7n/IC
 g9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740202924; x=1740807724;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vO61PwMr9fG3YaV/tA/ZETRTgpImj80gIG6et6cmRFA=;
 b=b/Y1VyDi6CT0SIF0m18uOyeg5acNEt3qZOrXslBeN1tqi+fXhUatOR++WpY9Ak1555
 18WOIMJ0SPYPBlNkPQq7yN9DrSay613WvOrKYe+dP3yWf5ak6fNgEaFO1mM92DtmddsC
 7YaNTefn3CmzNMfQOvWDsEcFWKzt5mUSwXBsg5k33ELZaltFpIWV7J97sXaP+3z1Ng7x
 pBO6ANk4/JFG0oUcYbmDTj3Mo/H1H4B42G2oJ6yjoQfWB+ctOTjXpH80EZBs1IjLGZsY
 MS1oA57cO7Y7pUiTmmfiJsWldO9Bni8puv60RcYP1akT6WpDVSAEVDWB675kpwMXBKii
 +rDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDHo9tkBZaSM2s0oeQY8RcmWBKvFEMet1O3l3t4TSwXASaULr96uwTW/pr4JNCYmKyi/eaTuRernQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOmkNoP6HOyMHyWGIxoGjid4QyX5ME/Ks/7CVLtXe4wLFzxmPh
 Q8W6xeQyFpOlAKJ7lGGi78UYiqQtK/w5dwHqCpelbDGM9bzbh0+pAHR1Ig8D5OI=
X-Gm-Gg: ASbGncvoTcgMqjyzdMuIIiWK3RB8PjxFOPiYtjQab4oMIeMmpGVv0tiEwLdF3p3vFz0
 qNpVLrLl0NP+9qUCamZ3P9YAhHHn3ZOW+S1+5maqbevsX7m0YF1unCjPcXG+W02RKzwN2wUTDyJ
 mRVsFpxgCMW7L9cnDAT1HdrAtz2mjHASEFXao7G5Qh5LDMZqB89maxX959mC2pmn/Ma+izJ5X0B
 XDsOOiwZpGaeeJJedN1LyQ21mDccU3wUt5Lrjapih6da1Sr/Bw4POS08jX5SdxGGdeqNMFqNxaa
 VmwybHeMKm3CATGSJOnTtAAs/p5znCbNmbTvzlfvKq5lF75xYZ/9pYBFykfkfCiyI24b0s6hRnT
 unD6cAw==
X-Google-Smtp-Source: AGHT+IGiIeRReqCJe8XcAs+P8MFQu4S5iiJzOGajXPXAgfgMiOHfmVTqn9FGs7qnDVSijblMJUCdaA==
X-Received: by 2002:a05:6512:2387:b0:545:9e4:e823 with SMTP id
 2adb3069b0e04-546e58bacd7mr3221825e87.16.1740202923578; 
 Fri, 21 Feb 2025 21:42:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54527244fd7sm2580680e87.12.2025.02.21.21.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 21:42:02 -0800 (PST)
Date: Sat, 22 Feb 2025 07:41:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 5/8] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
Message-ID: <4dsv4ks7nfy2ywcv6rukm243rywt7ynaso6sckpfg4vyzluwez@nvxzkjpjckiy>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222025102.1519798-6-shiyongbang@huawei.com>
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

On Sat, Feb 22, 2025 at 10:50:58AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add registering drm_aux and use it to get connector edid with drm
> functions. Add ddc channel in connector initialization to put drm_aux
> in drm_connector. And also add detect callback to detect connector
> befored call connector_get_modes.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - deleting type conversion, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  3 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 33 ++++++++++++++++---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 +++
>  3 files changed, 35 insertions(+), 6 deletions(-)
> 
>  
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>  	.get_modes = hibmc_dp_connector_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc,

I think a proper .detect callback should be reading sink_count. Most
likely it will work though.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  };
>  

-- 
With best wishes
Dmitry
