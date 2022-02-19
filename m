Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC6C4BC9BB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 19:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F12110E169;
	Sat, 19 Feb 2022 18:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E042D10E169
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 18:15:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d23so11173429lfv.13
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ZCklAq/Hx2JD+s8iRJLRBAzKBHd1Vzm6GJgE7/9rJMc=;
 b=UYwoW4i1T7TbzJAmNBBE/HsET4YSXMQnecavrbyKf7inSJeH4v/AfLKQ8XpquPHPFX
 iHWiMhWE8hnIwE5wwQ3x0sdr0DvGHneRSwv0U2sPFqcr7o2DoUyEq7lJM/bZLipvNcMC
 FGPUSRotuOyEZfkkLmM8T8ov0xh8zYlkKpiKNlY/bpuf2avLCS8tbvakdIc8fZiIcZAl
 uXtLVd8pJH3TJ8H9fpqUO8MzYZDNfYOJ12TTEqjdLsIjHcXOCObWpLBMGuA3JGPAAkIy
 B9O/fZAgXJHykF3mbMeYmOwvr5MNeDygsQx+NDu5kT8ZAWAalmLWUf9u70TYiNCsahas
 38ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ZCklAq/Hx2JD+s8iRJLRBAzKBHd1Vzm6GJgE7/9rJMc=;
 b=032Gr+RVIFIdl5wXHQlSfVPFUjbH/LI78yvy9+E9B9QuV/41jrl2UF1br0MSrbPzQL
 jwfjZ9df8l51BI2veVIzAijtI3mRUZz8gUg6UmR4E9ZxJnjqOuPNy+Ra2qkk8Y9ZyiLy
 A32ibG6+VcVNEwalaILKSCYLlZUugrcaJFDaVfYUoMcLRFIDRMBaHG7yWeWejC8ACbQz
 O9cgTlgtJ3I+UHwFn+ULIQItUnaIduGu9CwyHlQAvlzOao7tSpMD/YZxQmxkbfj7Fysr
 jj0vOSarhwGZ6+yZv4yFzdzHdeJaNnnpV15l993fhxJzz8HuQuEmkvVPbNxtADojADOu
 p8eg==
X-Gm-Message-State: AOAM530BJOL8xI5tIgfarn3xjZg6+JabB1RegjcxKeFV4bgoBYoVUxxF
 HiT8tOacU4cGEiBkAvZh5h4=
X-Google-Smtp-Source: ABdhPJwJdZ0Gd/bbMF0s0unbw8e1WaovO3J5g4uv+x1CAXGO8sdtzQ4dLL+prgBxwbaaJyAXR9g9RQ==
X-Received: by 2002:a05:6512:548:b0:438:a549:d499 with SMTP id
 h8-20020a056512054800b00438a549d499mr9082717lfl.326.1645294543281; 
 Sat, 19 Feb 2022 10:15:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id v18sm729633ljn.78.2022.02.19.10.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 10:15:42 -0800 (PST)
Message-ID: <50838e8c-8121-d6fb-d693-031739829157@gmail.com>
Date: Sat, 19 Feb 2022 21:15:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/9] gpu: host1x: Add context bus
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-3-mperttunen@nvidia.com>
 <1c97bbb5-ba0b-742c-2a21-8abf195b9e6d@gmail.com>
In-Reply-To: <1c97bbb5-ba0b-742c-2a21-8abf195b9e6d@gmail.com>
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

19.02.2022 20:54, Dmitry Osipenko пишет:
> 18.02.2022 14:39, Mikko Perttunen пишет:
>> +config TEGRA_HOST1X_CONTEXT_BUS
>> +	bool
>> +
>>  config TEGRA_HOST1X
>>  	tristate "NVIDIA Tegra host1x driver"
>>  	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>>  	select DMA_SHARED_BUFFER
>> +	select TEGRA_HOST1X_CONTEXT_BUS
> 
> What is the point of TEGRA_HOST1X_CONTEXT_BUS if it's selected
> unconditionally?

I see now that it's used by arm-smmu.c, should be okay then.
