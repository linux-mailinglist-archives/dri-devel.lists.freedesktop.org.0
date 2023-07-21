Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D936B75C663
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E76610E663;
	Fri, 21 Jul 2023 12:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF7D10E663
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:03:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-316f589549cso1473682f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689940995; x=1690545795; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0LfYJxT8/PQgOI8EMuv1dYvPO7R8GSgfQTCAsknpK04=;
 b=W9dOJVxhBjvVomAhaW0PulNleqdkzk6xereHKsD3oXaTkxr1hd9dS3JIPkW2G7j3UF
 TKHDxN/ONQVQK7DvY7NJIdQhBicgCADuL8Mhvwbyaz/C1toIw9LG8xvrt1sz4rphnDow
 5Ky2V7Al3B/qtddK/pW7BMBrDKkzj4TYWml9Pbi1j2TPtBFOq6bFmWrDvscvaDffEVZ2
 e5gypLalY1SqzdfDpKRC3jj4pA5aetZcT6gfqYu+hUiRb6zrz8Jf61nFaRvhU1VkR/cl
 WBaelHocsGTIXau2pLRqC9VurkY4kCKiKr0q67zmlL2kRQBde0BPaMseXdSsqdfeSeTb
 Ltcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689940995; x=1690545795;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LfYJxT8/PQgOI8EMuv1dYvPO7R8GSgfQTCAsknpK04=;
 b=JMBkvRMJR0UuLg6jQV8q2niJW5yeiXN1TX6Ds2oiBXyqVZ8oV2eNKVvdfsgnBRr6AI
 HzJ6a/PVUgYIJHD4eDWIf159u1ap2HCaWCwhSdnMv7nOaHvxJFaZ2QRbOkzDjwPr+bA9
 jPIlcYBCK5Dkon36lkYzBppLzaD4scvWmOsYb/8yBYLj1UZKw0K5vPhLghbmwBiDDKVt
 vTXBWyvOlE9U5/XS+N7bbjW/yfzdy/AVp7axQ2f4izaDTv1lk8M7rKzJuLRm4kEaYfyj
 H+0XaCQqH2s7L6sYhGS00gRB0ti52s12eHOfQhjzZuARMO6yJoRHhfI8j2EnPAjecxuQ
 HTeg==
X-Gm-Message-State: ABy/qLbYN9Cz5V+XgYL7bNAkORzLnU97ARJXxGbF3mK6dEeZrB5AbWBc
 01FTycJKRQPDVb12AtdzE4c1BA==
X-Google-Smtp-Source: APBJJlGDdfidTPWDPa/uOrnnpikMk+ASrNSwczpIAbJ9RJi9RZki0USHaGyB+TQB/WJZCrRm4wDfbg==
X-Received: by 2002:a5d:4089:0:b0:315:93a1:c733 with SMTP id
 o9-20020a5d4089000000b0031593a1c733mr1154305wrp.20.1689940995332; 
 Fri, 21 Jul 2023 05:03:15 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a5d58da000000b0030ae499da59sm3998420wrf.111.2023.07.21.05.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 05:03:14 -0700 (PDT)
Message-ID: <ed87a08c-363f-600e-6853-1a6009eb3c99@baylibre.com>
Date: Fri, 21 Jul 2023 14:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/3] MediaTek DRM: Clean up CMDQ support and ifdefs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
 <6c71deca-112e-2ef6-9098-902bc4b92324@baylibre.com>
 <d5c9f1c8-6c05-7679-777a-aa6cec01a3f6@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <d5c9f1c8-6c05-7679-777a-aa6cec01a3f6@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/07/2023 09:41, AngeloGioacchino Del Regno wrote:
> Il 23/06/23 14:49, Alexandre Mergnat ha scritto:
>>
>>
>> On 23/06/2023 11:49, AngeloGioacchino Del Regno wrote:
>>> This series changes MediaTek CMDQ support to use the mtk-cmdq-helper
>>> functions, removing duplicated cmdq setup code in mtk-drm and also
>>> removing all instances of `#if IS_REACHABLE(CONFIG_MTK_CMDQ)` while
>>> keeping compatibility with both CONFIG_MTK_CMDQ=n and =m/=y.
>>>
>>> This applies on top of [1] and [2].
>>>
>>> [1]:https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
>>> [2]:https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
>>
>> Hi Angelo,
>>
>> Can you provide a public branch to test it please ?
>> I tried to apply the dependencies but still have an issue with the 3rd 
>> one:
>>
>> https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com
>> OK
>>
>> https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
>> OK
>>
>> https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
>> KO
>>
>> Thanks
>>
> 
> Sorry for the very late reply; I've somehow lost this email in the 
> haystack...
> 
> There you go:
> https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-kernelci/
> 

Thanks Angelo,

I build/boot your branch for the i350-evk board.

I had to revert this commit from your branch:
"15f12798e218 TODO: soc: mediatek: mtk-pm-domains: Support CPU Power 
Domains"
Because it conflict with the "soc: mediatek: MT8365 power support" serie 
[3].

Also, I change back the defconfig to be aligned with the v6.5-rc1

After that, the board boot and drm/display seems working like a charm.

[3]: 
https://lore.kernel.org/linux-arm-kernel/20230713150414.891893-1-msp@baylibre.com/

-- 
Regards,
Alexandre
