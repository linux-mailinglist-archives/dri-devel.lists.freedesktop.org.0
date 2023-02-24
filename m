Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C86A1CBB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 14:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBBF10E1F0;
	Fri, 24 Feb 2023 13:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A4810E5B8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 13:08:32 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FBF16602FB6;
 Fri, 24 Feb 2023 13:08:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677244110;
 bh=xo1yhPMyDaRz4SOUHsbsxgo14//hh0ZQOfocbNC6veY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HG7SbVCmRnaklGIxLLZ099L6hajqr5lOYvMIJevUkx5q9DdLxc1+srkL5FwkIkOc9
 gIh6txekjwYdcHBCd8PlmthiS0jFcHJjOxEWPUSQQuB5fC4x8UScMzRMNH8yyEcPxN
 TSq8kMBt7bc84NaGim7cVvVsZ1U0MEAxTQBOVUMTAJ06ByhGPObyz120YrlGpjtMl9
 1q00viChtTV3R82CqSrwejD18qI/QDH0/dcXGJgWYPOg8mfVzBX1Zm4j9lhgpxEurg
 2dulDaLggfhytozyqrxYUEVB8o4GSf+qRGNSIKWK1s9MXXMXIOrwkK4B4//s4KufTM
 2uUVpfXa7lmxg==
Message-ID: <61ebdd1a-2737-0516-08fd-3b9aa0ddd4fe@collabora.com>
Date: Fri, 24 Feb 2023 14:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/11] drm/panfrost: Add the MT8192 GPU ID
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/02/23 11:06, Chen-Yu Tsai ha scritto:
> On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>
>> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
>> but treat it as otherwise identical to a standard Mali-G57.
>>
>> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
>> special GPU ID, in case we find functional differences between
>> MediaTek's implementation and the standard Mali-G57 down the line.
>>
>> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> As previously mentioned, MT8195 Mali G57 has minor revision number 1.
> Do we need to handle that?
> 

Maybe something went wrong while sending the reply to the same question on v2?

Anyway, from what I can see on my MT8195 machine, it works fine without adding
any particular handling...

Alyssa, Steven,
are you aware of anything that we should consider?

Regards,
Angelo

>> ---
>>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> index 6452e4e900dd..d28b99732dde 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> @@ -204,6 +204,14 @@ static const struct panfrost_model gpu_models[] = {
>>
>>          GPU_MODEL(g57, 0x9001,
>>                  GPU_REV(g57, 0, 0)),
>> +
>> +       /* MediaTek MT8192 has a Mali-G57 with a different GPU ID from the
>> +        * standard. Arm's driver does not appear to handle this model.
>> +        * ChromeOS has a hack downstream for it. Treat it as equivalent to
>> +        * standard Mali-G57 for now.
>> +        */
>> +       GPU_MODEL(g57, 0x9003,
>> +               GPU_REV(g57, 0, 0)),
>>   };
>>
>>   static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
>> --
>> 2.39.2
>>


