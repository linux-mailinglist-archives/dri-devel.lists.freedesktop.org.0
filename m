Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0A40DEC4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 17:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45BA6EE22;
	Thu, 16 Sep 2021 15:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136F56EE22
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 15:56:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p29so20360565lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pXiUgJm3/YT0R1UavljamsegHbZUJZaoEIiTrfWYSoA=;
 b=GHY66jKKKN6d6NjmPVoR2XlGuFlev8iy/c5ihOVU98TR100xqvX1w3Un0BieaiPINE
 9/Am1ujDSZvSZSPtSracjI48I12RDzeOgNhIIx8uyM23Lr9AcZLr7cC4KbVJifaTYZb6
 bT4anUzmcM9tNVXWPJipXbk0SWwQsQAk55u+CKcHvUWg/6Ds+67ZvlBSvStGksQ4ZPS7
 T1T9MS2NK1X8Qi+cSSk5HCDKOnxodDU+iuvuciIhaSJuZ7muspgFlu1J6BqMBiY0E6Lz
 SQCcp3zzyA3V9igLPRbWbovfgbuCcYsgVWfWE7HQZ3JxZH8YQ7zakKSoDgpa8FKVJ07i
 YtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pXiUgJm3/YT0R1UavljamsegHbZUJZaoEIiTrfWYSoA=;
 b=dpKdEeMiEm+NDBmwk12UYa0NpZxBhseLJNeQL3vGHQON+WyRtkFm22utERqgeUrrIJ
 SjTqB4C7t42iDQgdpu+3HjHnvwGDBpZiHDYcq2FX3K97qgr7CtghJPeB5nLUR8N3FR9G
 Xxv7YJQG4oCCCEA+666vQsB7YQVzA6z6u6EXVdzx2oK0M4niKM2pHXNd0GfksidvDOYw
 z59m+Cp0yFQMHyeNuxvcu/raEgq4KNJQSiWbnj73dx9tma1cg1gv9xEkrsUo2tAHa6uR
 sVJrlBgHnPEbagdMQFUpYKlR1tArHuWNOc4ncFuBQk1i4CYxe2qBNCcrYfSYlIOxGDdI
 Szew==
X-Gm-Message-State: AOAM530lmkKqHSi54ht6WyJmWnkpBf/X9NCxl/L1d3kFrG6yRMV+tO7j
 SKhFX2Ubpph8qd4Fi4+nMIA=
X-Google-Smtp-Source: ABdhPJyvXF8R0TDGw96Rj9ymltmjLPtCdAGmk3RkPsV/K0jPLnautylfP8phTSCr/NYN5Yyi+51ZLg==
X-Received: by 2002:a2e:8881:: with SMTP id k1mr5430414lji.443.1631807780987; 
 Thu, 16 Sep 2021 08:56:20 -0700 (PDT)
Received: from [192.168.2.145] (94-29-62-67.dynamic.spd-mgts.ru. [94.29.62.67])
 by smtp.googlemail.com with ESMTPSA id r11sm392491ljk.71.2021.09.16.08.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 08:56:20 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Use correct property for BO size
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210916141307.2010255-1-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <458e09d5-dba0-8c80-a58e-f2ce27973b18@gmail.com>
Date: Thu, 16 Sep 2021 18:56:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916141307.2010255-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

16.09.2021 17:13, Mikko Perttunen пишет:
> The size property is not always populated, while the gem.size
> property is.
> 
> Fixes: d7c591bc1a3f ("drm/tegra: Implement new UAPI")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/uapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
> index dc16a24f4dbe..690a339c52ec 100644
> --- a/drivers/gpu/drm/tegra/uapi.c
> +++ b/drivers/gpu/drm/tegra/uapi.c
> @@ -222,7 +222,7 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
>  		mapping->iova = sg_dma_address(mapping->sgt->sgl);
>  	}
>  
> -	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
> +	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->gem.size;
>  
>  	err = xa_alloc(&context->mappings, &args->mapping, mapping, XA_LIMIT(1, U32_MAX),
>  		       GFP_KERNEL);
> 

Did something bad happened to [1]? Thierry fetched patches, but didn't
make the fixes-PR yet, AFAICS.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20210817020153.25378-3-digetx@gmail.com/

