Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C397F706CFF
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F58010E179;
	Wed, 17 May 2023 15:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A1610E179
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:38:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B3D8846BF;
 Wed, 17 May 2023 17:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684337893;
 bh=M2eZPFSQ41Q2D5uOI+yQoYDb47PQYn5beh6o3SR5YPU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yj+yFxg/67nXD6F8KdjGNlHeJUvviQO5I5ySKPLO/v3UuNNeAQbbAQon1X4iYoFH+
 4ng+9TJsrfKE3Ri/aRLHPEd28tFXh0dw8+94gAYvLhuN2k3MsRBjDYN9/zy9BwEJTM
 j0BwNM9pp2jMIaGjsGL3n+LqWMcKZ0R0OSN3e7jf014CyrDIAXaMQqkYCCarukQE8n
 gAow4a/1AB+IYMC93ztJlaa6MI5oUPyvpbtsqOmVFZf4qMxcldl463dSI9mgLvtDhc
 74pLarpGSdMH/IpdCsBMWblZJ+J3RIo5DcqfaRZWGbPoCdP7/Rq0gbuyVQ9GgZGE2h
 GpuGffaI6X3tw==
Message-ID: <dc5fae3e-28e8-92eb-612e-ee447d6eebfa@denx.de>
Date: Wed, 17 May 2023 17:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/3] STM32 warning cleanup
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517132214.254757-1-raphael.gallais-pou@foss.st.com>
 <56bcad63-a32e-63fc-1c20-15909f2788b5@denx.de>
 <c617bb64-e7fd-c3de-6e29-6dd7c5896d16@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c617bb64-e7fd-c3de-6e29-6dd7c5896d16@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/23 16:38, Raphael Gallais-Pou wrote:
> 
> On 5/17/23 16:06, Marek Vasut wrote:
>> On 5/17/23 15:22, Raphael Gallais-Pou wrote:
>>> This serie aims to reduce the number of device-tree warnings of
>>> following boards :
>>>
>>>     - STM32F429-DISCO
>>>     - STM32MP15*
>>>
>>> Those warnings were appearing either during build or when checking
>>> dt-bindings and concern mostly LTDC and DSI IPs and were due to the
>>> following cases:
>>>
>>>     - panel-dsi@0 nodes that needed
>>>     - unnecessary #address-cells and #size-cells properties
>>>     - residual 'reg' field on single endpoints
>>>
>>> Raphael Gallais-Pou (3):
>>>     ARM: dts: stm32: fix warnings on stm32f469-disco board
>>>     dt-bindings: display: st,stm32-dsi: Remove unnecessary fields
>>>     ARM: dts: stm32: fix several DT warnings on stm32mp15
>>>
>>>    .../devicetree/bindings/display/st,stm32-dsi.yaml      |  2 --
>>>    arch/arm/boot/dts/stm32f469-disco.dts                  |  4 ++--
>>>    arch/arm/boot/dts/stm32mp151.dtsi                      |  5 -----
>>>    arch/arm/boot/dts/stm32mp157.dtsi                      |  7 -------
>>>    .../dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    |  6 ++++--
>>>    .../boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  6 ++++--
>>>    .../stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts  |  3 +--
>>>    arch/arm/boot/dts/stm32mp157c-dk2.dts                  |  8 ++++++++
>>>    arch/arm/boot/dts/stm32mp157c-ev1.dts                  | 10 +++++++---
>>>    arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts              |  3 +--
>>>    arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi     |  6 +-----
>>>    arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                 |  3 +--
>>>    12 files changed, 29 insertions(+), 34 deletions(-)
>>>
>>
>> Is this a V2 series ?
> 
> Hi Marek
> 
> 
> yes it was,
> 
> Thanks for highlighting it to me.

You're welcome, I see a V3 now, thanks !
