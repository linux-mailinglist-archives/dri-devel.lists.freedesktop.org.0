Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB1A5EA26
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 04:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C0510E19C;
	Thu, 13 Mar 2025 03:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BPnJ1y7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B0210E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 03:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741836868;
 bh=TNTg47qZROW0WppXAxZZzNCelLLyziUBjKjAdeuuDYM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BPnJ1y7JxkNqwB5O9TwhT/tNs3RtxRBV0KHeFVtwlZe6+1lg0AksfSxutLRLNmv0L
 N3d78EnC88eG/3JL4bizSLiZYlvmrLAzAZ8fOp045oSyr8ztO6Vr8pWtjlm6IYlkrO
 TdjECDS9TGc2648yJCmokdHVF2Mbn3xW20JbtsX3Iag1vzfyjjv/RNoR8m4GVI+ol3
 deFXdwLZEI8nSLI5yvVTMqeQkGBgT8yQATj1K+A/zvkN516n15frFK38NI8lh1SLaF
 /P15qaRCPlW83UDp7p8ODwMKD+EfD2izKQExvFGtCMfy8c2AS0xoffxGehBk1xnpVD
 3DIipChxDcYRw==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E5B817E0B46;
 Thu, 13 Mar 2025 04:34:25 +0100 (CET)
Message-ID: <7c39436c-3f23-41cf-97aa-06d9f9d20e61@collabora.com>
Date: Thu, 13 Mar 2025 09:04:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: mediatek: enable PHY drivers
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250312041943.25676-1-vignesh.raman@collabora.com>
 <5706c76e-7558-4405-a4c6-cab9cb5ddf65@notapiano>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <5706c76e-7558-4405-a4c6-cab9cb5ddf65@notapiano>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nícolas,

On 12/03/25 19:55, Nícolas F. R. A. Prado wrote:
> On Wed, Mar 12, 2025 at 09:49:26AM +0530, Vignesh Raman wrote:
>> The mediatek display driver fails to probe on mt8173-elm-hana and
>> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
>> configurations.
>>
>> Enable the following PHY drivers for MediaTek platforms:
>> - CONFIG_PHY_MTK_HDMI=m for HDMI display
>> - CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
>> - CONFIG_PHY_MTK_XSPHY=m for USB
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Include board details in the commit message.
>>    - Sort newly added PHY configs in defconfig.
>>
>> ---
>>   arch/arm64/configs/defconfig | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 1f25423de383..87e8cbd3fd26 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1572,7 +1572,10 @@ CONFIG_PHY_HI6220_USB=y
>>   CONFIG_PHY_HISTB_COMBPHY=y
>>   CONFIG_PHY_HISI_INNO_USB2=y
>>   CONFIG_PHY_MVEBU_CP110_COMPHY=y
>> +CONFIG_PHY_MTK_HDMI=m
>> +CONFIG_PHY_MTK_MIPI_DSI=m
> 
> This isn't the expected ordering. I imagine you manually added these configs in
> the defconfig.

Yes, I added them manually.

> 
> To get the right ordering, after you've added the configs anywhere in this
> defconfig, do a 'make defconfig', then a 'make savedefconfig', and copy the
> generated 'defconfig' file at the root to this location, then you can add just
> this hunk to the commit, and it'll be in the correct order.

Thanks for the explanation. I will follow this approach.

Regards,
Vignesh

> 
> Thanks,
> Nícolas

