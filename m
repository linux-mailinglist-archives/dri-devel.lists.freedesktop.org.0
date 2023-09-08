Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE07798393
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 09:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB310E87C;
	Fri,  8 Sep 2023 07:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361FA10E87C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 07:53:25 +0000 (UTC)
Received: from [192.168.1.23] (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DEF3566072A2;
 Fri,  8 Sep 2023 08:53:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694159603;
 bh=1Be9Ga17gksJsOil0d5EZoQWNEzJGykPqruhkf331P8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AZ8K5q+HuIaaU6/G04eKJSX0xrkxKxQB3FT9sj7Ftu3/eZFbcjcUuN0wZDB1Uru/+
 SRRAaZZY9CpqexRRTVJwqqy2gLir7pE2gZVNT1DV4X/m0nKY7UEX8kzAk1oZgSXQdL
 Lmq3zfkiEKO5O28VvgFGJu7mu2A9LXIHs4XR/1wUMTNnQo25S7RIs7xdl152ZM7Lwk
 lZi/4cDySYL16Pemg1Mc/OnqIxALgeq5SLlrMVZt/Gj/AY3Xl27NJXEHwaFZnjvpyL
 DFbNN+wBQgmXV+uLAfoCeQfeyyzzPlysSiOmAuLvMu3+DuB7yAYXGyUnQUfJlUSQrX
 Oj81GmCXY/TKg==
Message-ID: <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>
Date: Fri, 8 Sep 2023 13:23:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
 <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com,
 corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On 07/09/23 16:16, AngeloGioacchino Del Regno wrote:
> Il 25/08/23 14:24, Vignesh Raman ha scritto:
>> Enable regulator
>> Enable MT6397 RTC driver
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/arm64.config | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ci/arm64.config 
>> b/drivers/gpu/drm/ci/arm64.config
>> index 817e18ddfd4f..ea7a6cceff40 100644
>> --- a/drivers/gpu/drm/ci/arm64.config
>> +++ b/drivers/gpu/drm/ci/arm64.config
>> @@ -184,6 +184,8 @@ CONFIG_HW_RANDOM_MTK=y
>>   CONFIG_MTK_DEVAPC=y
>>   CONFIG_PWM_MTK_DISP=y
>>   CONFIG_MTK_CMDQ=y
>> +CONFIG_REGULATOR_DA9211=y
>> +CONFIG_RTC_DRV_MT6397=y
> 
> I wonder if it'd be a better idea to simply add those to the defconfig 
> instead as
> 
> CONFIG_REGULATOR_DA9211=m
> CONFIG_RTC_DRV_MT6397=m
> 
> Any opinion on this? Matthias? Anyone else?

CONFIG_RTC_DRV_MT6397=m is already present in defconfig.
We can also add CONFIG_REGULATOR_DA9211=m to defconfig.

Regards,
Vignesh
