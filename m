Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED138706D12
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B72F10E449;
	Wed, 17 May 2023 15:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8F10E449
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:41:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A079A846BF;
 Wed, 17 May 2023 17:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684338115;
 bh=yu+HBQ+xsF7Vdw92aEE9A/go0SCqzU/xKdNUXvOwEPA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Jod5jwz3UbECy2pApjdZKKmx9LfmUwR0C3LKq+MPolY/ieAuWh/CUTuNU4BwSrC4A
 PAm9tS+DtaOTkWicX9m0rC+utJPR/3TFzWH7M04hccR8vxYfenU3enqR5H08XpcjMD
 I/zDYk0cdSkV4YXHaCHqCTWU2VqXBQXsl/SlLRkLPnt1+1CKj1dVYOKyiEYvbPQExh
 F3eD0RgqAn5oOEWMuiPqpHgR/83/cQ8vG+IA8p1uP9SFxnhb28kL1deQG6TI2yO85P
 fP5jyAfh0oOZ2/cnFf1Yn2ikYTM5hWciIv7MPZg4+kJhVKm8xq+1n+JBoUTA6PgegX
 LvshId/EEoehw==
Message-ID: <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
Date: Wed, 17 May 2023 17:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/3] ARM: dts: stm32: fix several DT warnings on
 stm32mp15
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
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/17/23 16:35, Raphael Gallais-Pou wrote:

Hi,

> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 0f1110e42c93..a6e2e20f12fa 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -457,8 +457,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&sii9022_in>;
>   		};
>   	};

This LTDC port/endpoint stuff always scares me, because I always feel I 
get it wrong.

I believe the LTDC does have one "port" , correct.

But I think (?) that the LTDC has two endpoints, endpoint@0 for DPI 
(parallel output out of the SoC) and endpoint@1 for DSI (internal 
connection into the DSI serializer) ?

Only one of the endpoints can be connected at a time, but there are 
actually two endpoints in the LTDC port {} node, aren't there ?

So the original description should be OK I think , maybe 
#address/#size-cells are missing instead ?
