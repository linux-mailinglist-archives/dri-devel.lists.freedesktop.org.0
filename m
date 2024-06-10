Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0890283A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 20:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0979610E3E9;
	Mon, 10 Jun 2024 18:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v6zim+CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EA610E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 18:05:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52bc1261e8fso3375406e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718042745; x=1718647545; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jq311+jHBWw/wg5Yu0ubpcmMeph+69ZyPahta+jvUUE=;
 b=v6zim+CLoqmqVo9cU53+vGkknpCQq/eHAgS33EfllQiS1p671mmc5XEiqnMgPtk20T
 FNN6sK6QJTT7z1bFRf2MjWPUjuXP5BzzxA3ue7mk2v9Z3Ed6LzfddjeEaj9rZSW6VpNk
 JvbDgR3z2sGW2cNq7HFBF5knUmFsGCiQRO91WHcfp9LfjV94BHSL5TrPU8Q9YZC9dWff
 0f+NLxaM4ajnliG0NMB/gWbwi5VWNZrHMKQm0iPVAgLhnCwulVIpGnWe4/M99IT3se3j
 Zxq63i8ThdobTo62Z0jjuhAju4Um5miS5ZeugW+e/uY4Gh25FKWokC2DSusUQbxsHYIs
 D4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718042745; x=1718647545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jq311+jHBWw/wg5Yu0ubpcmMeph+69ZyPahta+jvUUE=;
 b=pQ916G7rP4KcCoMtiz3AYfua8YS1+ESVPgpEfCU80jqHE8hNzONUcCR6upekZGC6ov
 aY+HPTg964yd/18Cz43ilU2ebNw+fAcKLNtS3cj0TAH4dgmhzCK3RIbiZMVupYwgaYIB
 pTqmcdZLkyQIfqZbYGhXXR67SnkwvWwOcvvHFomKRhUdKF36XuGA5w554VxGDAilMOuW
 tl8AGGSHjJmom1/pZL1ZTORyv3NNeIrAf7IRMzOZnK6ycxHYtdsnOubGiv7jtO6LRxxf
 GLlGx9+wM1eOa5w84SWFaSUq/U7M3k5irBqxLrYGv8AGcASt+CbCIshRmFJ5tpvKj7WS
 4jlQ==
X-Gm-Message-State: AOJu0Yz2hzcISSkR7RJD75x4mQrfvsX0NkCJ840ZwV2Pr4m79FPE0ubn
 BafhoamyTx2ImySC8snkChX19NwTPHH697qrTKA01Jq8UgPk6yCvfp9gWe4FNQw=
X-Google-Smtp-Source: AGHT+IFsQXlO93m/zw0ul/eOnAjjWLLgult+ZYCoqRL7CuGjYR79H0v1GI39s3HvJlFTjC9yqtzyOg==
X-Received: by 2002:a05:6512:39c7:b0:52c:90ba:9705 with SMTP id
 2adb3069b0e04-52c90ba97afmr558993e87.49.1718042745295; 
 Mon, 10 Jun 2024 11:05:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c8857d7a9sm858413e87.44.2024.06.10.11.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 11:05:44 -0700 (PDT)
Date: Mon, 10 Jun 2024 21:05:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
Message-ID: <cho3yre3diduix2eovvth3rfeernfh62vpg5pp2z6yi7egcwnj@k7sw5wkv72fr>
References: <20240610111200.428224-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610111200.428224-1-mripard@kernel.org>
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

On Mon, Jun 10, 2024 at 01:12:00PM +0200, Maxime Ripard wrote:
> It looks like the documentation for the HDMI-related fields recently
> added to both the drm_connector and drm_connector_state structures
> trigger some warnings because of their use of anonymous structures:
> 
>   $ scripts/kernel-doc -none include/drm/drm_connector.h
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'broadcast_rgb' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'infoframes' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_drm' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'vendor' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'is_limited_range' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'output_bpc' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'output_format' description in 'drm_connector_state'
>   include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_char_rate' description in 'drm_connector_state'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'vendor' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'product' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'supported_formats' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'infoframes' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'lock' description in 'drm_connector'
>   include/drm/drm_connector.h:2112: warning: Excess struct member 'audio' description in 'drm_connector'
> 
> Create some intermediate structures instead of anonymous ones to silence
> the warnings.
> 
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
> Fixes: 948f01d5e559 ("drm/connector: hdmi: Add support for output format")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 207 +++++++++++++++++++-----------------
>  1 file changed, 109 insertions(+), 98 deletions(-)
> 

With the semicolon fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
