Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C94BC9E6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 19:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F46F10E13F;
	Sat, 19 Feb 2022 18:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8794B10E13F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 18:35:22 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u7so1342213ljk.13
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ihAhYAdeg+5mNGGybXtL07Go2hn89yUQuHza/hGj/wQ=;
 b=CKbEo/EfSh655da36ya0jrhiGmnzQqTJlKVP0gefuCExsV+Ab7Ta4cauO8X8eA3OWK
 TEZrfeFlxRC+gQEgaRmPQeXwLBjjzfgOYxrodtJQGs+efxIkqMPTUKC4v9B7eVm7qKYl
 YGUfTC6sdtKsKCnDAFUKWJTjZ9s2Zr79iREHv35eU1e/w4U8VDM29SYxf88A+zdYNJs0
 9hAbRMheWeo4Hmth/m1GzpzOmPFDZ5rP+lCPG8lUufpRM2Alh00ttY9Ml9cgAXiicfP6
 HYkiHJhRMbJTXV+hdEPibOskEipA8014nW1jPmS00i/Qqz9eCUw8Pc36FwSTGZ0Y0L6F
 xTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ihAhYAdeg+5mNGGybXtL07Go2hn89yUQuHza/hGj/wQ=;
 b=lpf+ZB8gJfWSPf56opcMm7WiJNb/PBe6P7lYPJsU7RhK+nJwKvQTGxLljPI1UDBKpo
 zVlclwJwRxhLiPhNd18p49ds/7eilwANpYzroARh3RuHr9RQpbc633g90+oYYGTV3siC
 LiPzFXpgCUVBFihzRq/7yVgY2lZBGKhE7JZJk0C9q+uJ5gLPvzbBNBoCJkh8HNIw89wF
 MBLsEEDkqfM9a5gaj+DQGRxctFC2XT7cFvrEWNNqN+8kvxL5CFqPJb8URMqkdDnrzE6y
 HHkkkQXTixDLst/oVv5HQZyPEEEfAibkBTuf0uQD99thHY85zj5eH8CMXYuRk9yi0cOH
 3F0g==
X-Gm-Message-State: AOAM533K2cC7tZ/a6fZYPXtQjSCVTDr5UuQ5P7r22VK11BemjEQbJeZJ
 5cjY870kbyFsok6lyc5acPsNEgDJypY=
X-Google-Smtp-Source: ABdhPJyUuey/Cp/BTWCj1MjuWX+PNTm6NcAPr+wmv4r6uS40/QsJrxTXnPwEO8K6bkDeKyB/mQeKDw==
X-Received: by 2002:a05:651c:201b:b0:246:34b5:155e with SMTP id
 s27-20020a05651c201b00b0024634b5155emr1600949ljo.273.1645295720866; 
 Sat, 19 Feb 2022 10:35:20 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id j11sm642315lfm.40.2022.02.19.10.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 10:35:20 -0800 (PST)
Message-ID: <2b4dd244-f918-4d26-2322-00a0bb226ccf@gmail.com>
Date: Sat, 19 Feb 2022 21:35:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 9/9] drm/tegra: Support context isolation
Content-Language: en-US
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-10-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220218113952.3077606-10-mperttunen@nvidia.com>
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
> +	if (context->memory_context && context->client->ops->get_streamid_offset) {
            ^^^
> +		int offset = context->client->ops->get_streamid_offset(context->client);
> +
> +		if (offset >= 0) {
> +			job->context = context->memory_context;
> +			job->engine_streamid_offset = offset;
> +			host1x_context_get(job->context);
> +		}

You should bump refcount unconditionally or you'll get refcnt underflow
on put, when offset < 0.

> +	}
> +
>  	/*
>  	 * job_data is now part of job reference counting, so don't release
>  	 * it from here.
> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
> index 9ab9179d2026..be33da54d12c 100644
> --- a/drivers/gpu/drm/tegra/uapi.c
> +++ b/drivers/gpu/drm/tegra/uapi.c
> @@ -33,6 +33,9 @@ static void tegra_drm_channel_context_close(struct tegra_drm_context *context)
>  	struct tegra_drm_mapping *mapping;
>  	unsigned long id;
>  
> +	if (context->memory_context)
> +		host1x_context_put(context->memory_context);

The "if (context->memory_context &&
context->client->ops->get_streamid_offset)" above doesn't match the "if
(context->memory_context)". You'll get refcount underflow.
