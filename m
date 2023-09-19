Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ECD7A6042
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B268810E0EC;
	Tue, 19 Sep 2023 10:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E2F10E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:54:10 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 40B8966071A9;
 Tue, 19 Sep 2023 11:54:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695120849;
 bh=YIL8CVeCu2phmjTNYbQbVDRE1/tG7w/T7zljvP0+8Uc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WBGWu/Ab+USWrsW0Z0Uhl+RO5yYIJvHCGPrih+x7pbvCqkRg8r1OfBvmX9xwJAh21
 4HnvcLBXESSY49rYXVpBZAM3+yKFi/+UytYdQAh1lcX56O1gaC8+VghudX9akkIEBl
 ++O1Yv7neVxSA7fS2HLIgL4TbofYMrBtt5eGmBk9FUgucvoUgZIsWgwLnHiQlXraQN
 JPRO1TJQfvU0HSowGaZPUjJ2z/YuFMXkldlIVOm9Dbu8KFf6IHZavvNPt1KT2vssWB
 8fuHSC2uShhJF67yNVYKBpV3y7KFMT0doAKk+qoFuChJtfNTgkrHbKlQt6/ApoQvk4
 Hf/FQTa1KdsAQ==
Message-ID: <766b1ac5-f2c4-0e58-24ff-dafde8e5995b@collabora.com>
Date: Tue, 19 Sep 2023 12:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 10/10] arm64: dts: mt8195-cherry: Add secure mbox settings
 for vdosys
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
 <20230919030345.8629-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919030345.8629-11-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/09/23 05:03, Jason-JH.Lin ha scritto:
> Add a secure mailbox channel to support secure video path on
> vdosys0 and vdosys1.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 37a3e9de90ff..9b838b2cdb3e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -1147,6 +1147,16 @@
>   	status = "okay";
>   };
>   
> +&vdosys0 {
> +	mboxes = <&gce0 0 CMDQ_THR_PRIO_4>,
> +		 <&gce0 8 CMDQ_THR_PRIO_4>; /* secure mbox */
> +};
> +
> +&vdosys1 {
> +	mboxes = <&gce0 1 CMDQ_THR_PRIO_4>,
> +		 <&gce0 9 CMDQ_THR_PRIO_4>; /* secure mbox */
> +};
> +

Is the secure mailbox number firmware dependant?
Otherwise this could go in mt8195.dtsi.

Regards,
Angelo

>   &xhci0 {
>   	status = "okay";
>   


