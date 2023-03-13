Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B56B72B8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 10:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87B010E30A;
	Mon, 13 Mar 2023 09:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7510E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 09:36:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o5-20020a05600c510500b003ec0e4ec6deso4344019wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 02:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678700193;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/voBu6XJv3Cuj4S1ZjmI/oeTZAcic/pgfze+nCN+AT0=;
 b=ZqJSmKTV8NfA58WB+WzePvSMWdfCwDddQE/PtoPdRV8N4+TIhZES7HK8mHwH5Zk4Rj
 Z0UByrMNGXFIkeUhPflzyVJ0sPJuMhQw6rDkZbFPAqhXp6VnU51OZwe8+O4Xko4B+dJV
 3hinDiIYhXEZFPz3riHzj+V5XPLbzktxlE/+pDGFP6rtxrZ+LJIwnRp7a9MkonLkqJi/
 jrh7zFobZUaJ3nmDLQeUWrGIigNZ3RYq1E0rLiJStf/M3a6ZVwc+N7gAYuxm6yls4bSC
 kzA4bS3a9tRfH05HYHE3aVNYpYu5PqkP5raXMwUayuwtyPDT1S7Jxi+3ysmRWEVdoJVx
 DZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678700193;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/voBu6XJv3Cuj4S1ZjmI/oeTZAcic/pgfze+nCN+AT0=;
 b=ZMGX+Sg7CISE+q8wXaNIzcImdHwUp4b4zOEgIzfhRYoSF3MjXYIPUKgGgDku3yzBPR
 w0xV0W/jJhPuCzbvEmtUobbVWTm9+W7eZ2qeUR1QPa3CpOCgAMtKAGqWZRbkEcX8mD9R
 YZUoQbXcwMx3iMbcWaoWwdz1sFFuVi6dJXnvACDRm5eH2b/Vr8f01Tn9M+ehuVRLVUpO
 OHoCB2C+GT5aq1BlkQqhb6wqU3qrobPriFV0Ollj90ngWZfAKsnKGJudgo4VX7sbWLW1
 H5W4F0jjRTYEYaojiZXEaX6eskdQGlxoECGfu7bjnf6moImPev6MvBhjCF0wTWFqrk2J
 PYCQ==
X-Gm-Message-State: AO0yUKWoiZLotr8+EC4ma8axh/f6ebe5TwMiNYKA9Ab++F9q2BWqj650
 dYSxRo8kVXO8TFZX4yjkZxc97S0ChEa4T4uc9JgHrg==
X-Google-Smtp-Source: AK7set+f9cpJyxCSLO6I2npjkfIwt56hnr9ULKBRmRjuy9MEkUdHAMeS9NJlzhQt8QuW3LddJn4H0w==
X-Received: by 2002:a05:600c:c8e:b0:3db:2e06:4091 with SMTP id
 fj14-20020a05600c0c8e00b003db2e064091mr11333479wmb.37.1678700192785; 
 Mon, 13 Mar 2023 02:36:32 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c470700b003e8dc7a03basm8792434wmo.41.2023.03.13.02.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 02:36:32 -0700 (PDT)
Message-ID: <292f25d7-2b2b-ba2a-36c3-c207960141f9@linaro.org>
Date: Mon, 13 Mar 2023 10:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] MAINTAINERS: Add include/drm/drm_bridge.h to DRM DRIVERS
 FOR BRIDGE CHIPS
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230313055951.2997299-1-victor.liu@nxp.com>
Organization: Linaro Developer Services
In-Reply-To: <20230313055951.2997299-1-victor.liu@nxp.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: jernej.skrabec@gmail.com, rfoss@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/03/2023 06:59, Liu Ying wrote:
> Appropriate maintainers should be suggested for changes to the
> include/drm/drm_bridge.h header file, so add the header file to the
> 'DRM DRIVERS FOR BRIDGE CHIPS' section.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d409875740d..b6e7ac70b8a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6824,6 +6824,7 @@ S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/bridge/
>   F:	drivers/gpu/drm/bridge/
> +F:	include/drm/drm_bridge.h
>   
>   DRM DRIVERS FOR EXYNOS
>   M:	Inki Dae <inki.dae@samsung.com>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
