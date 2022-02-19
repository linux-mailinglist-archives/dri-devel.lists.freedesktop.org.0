Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F54BC99C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 18:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DA510E16F;
	Sat, 19 Feb 2022 17:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31DF10E16F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 17:52:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b11so11132741lfb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7yVrvBYHyY3QdyCCeyIxr1lH8/vkZhQdSt3EyEVyKOQ=;
 b=Z+Y2PwCGESLzwlh6ekus16SE6okHck1S/aJ/1TVFDFmmxlRMudavC5ID4rfQx3gFCz
 W1MZSPN/4+Fx/RCfC6kTNhwpni007xOVyRHw+z+nuasbJKry9LbwPKoZ2gAhc3KeCFAi
 Qt17+bumSz0PxMvDV537wcEhoN84QExYE8Kopw5GoLiXcISR15yJ//wSPJDa1/Pt+7Z6
 mFGFRf31DM/bSCDE9UYVRiAoXFf8vD7kuzRGxKnCrAWvtERB1NodQvBApniBlxN+wj9k
 a7M/mJpr/nIOUZ5lB98CqvzBtpbpT+fABKX62mm4c+IPyP91fbflRUuDtCxqjSaRiNQ/
 Lm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7yVrvBYHyY3QdyCCeyIxr1lH8/vkZhQdSt3EyEVyKOQ=;
 b=gkWRsrrmKXD/wpog7FAsfN7VqNPopARatgyrnw6Syd6n4ePDuxZOb2mypVRy2Bcsqc
 ALg6Eh44nn0K5FS7NFopy4S2ysPdtMvb1TnnfMO5fOApUkJqJecnx1K6B5102EiEMKR8
 CeUrWPr1fNO3SjB7rjcJCP1Rqx3FgetVEbdixLdFH5A7un6lHWQ+RTloe1puiiPu/c3j
 Pz/oY8X+4xLnKp0AWHT3t3QIXbz1okwqdE+iPCsF+J/cZCN/9PikW+fO+xMR/clnWLEu
 95b4HeMhMkzCT80LfCcQZoeiBir4uBujzMLzRf5csWJCD2Jl0jdkQ6WxwYBkMEOZCkVV
 8HAA==
X-Gm-Message-State: AOAM533fYOAp+K8W3moWim8errZTMZM0jCJchNiAcnI0YXuCSTr3GXaz
 TZ/TnGR0l2oSb8dImrI61jg=
X-Google-Smtp-Source: ABdhPJztgefYS2BdI3meZgbmQg2nNYbVEhFCxZeyVrUB8mQqvT+0gHoAIgPTRqIv1H4Rufh/EzXWng==
X-Received: by 2002:ac2:5b4b:0:b0:43c:795a:25a6 with SMTP id
 i11-20020ac25b4b000000b0043c795a25a6mr9172627lfp.268.1645293121966; 
 Sat, 19 Feb 2022 09:52:01 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id q8sm630091lfr.181.2022.02.19.09.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 09:52:01 -0800 (PST)
Message-ID: <2605a614-0a2c-85ac-576a-048f38f9d366@gmail.com>
Date: Sat, 19 Feb 2022 20:52:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/9] gpu: host1x: Add context device management code
Content-Language: en-US
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-4-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220218113952.3077606-4-mperttunen@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

18.02.2022 14:39, Mikko Perttunen пишет:
> +	for (index = 0; index < cdl->len; index++) {
> +		struct iommu_fwspec *fwspec;
> +
> +		ctx = &cdl->devs[index];
> +
> +		ctx->host = host1x;
> +
> +		device_initialize(&ctx->dev);
> +
> +		ctx->dev.dma_mask = &context_device_dma_mask;
> +		ctx->dev.coherent_dma_mask = context_device_dma_mask;
> +		dev_set_name(&ctx->dev, "host1x-ctx.%d", index);
> +		ctx->dev.bus = &host1x_context_device_bus_type;

host1x_context_device_bus_type will be an undefined symbol if
CONFIG_TEGRA_HOST1X_CONTEXT_BUS=n? Please compile and test all combinations.
