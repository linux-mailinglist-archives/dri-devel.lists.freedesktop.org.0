Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBF6BD9A55
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 15:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50C10E606;
	Tue, 14 Oct 2025 13:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="epsDhhe/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232D710E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760447913;
 bh=N9CPJhNcpyyh4sczYatDI6/r/7qpIp3TR5G111HRq78=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=epsDhhe/mwkwONk0kXV9Zj2RKIc2TCEiXIkdiwvQx+ULEB69paBU3kQDB2yujqJpk
 1zGXChqrS+4IpngqHl2POYI9O6e6qOtzyVanhODNoEUaOIoYPYrtiDO/vWTHEPdOkg
 4wfqYLjlbDo4+Yud8dQn/pxbkQjw/fBWZ01ekg2e2eWgWovoXCtqh3kigNuy+wtiBR
 pFkoiTfF3iNFz6tmEsLI0L6z14oejco+dCYPRIQYcFBWjNAmwWZ2f2YZvJqFoYbrwI
 66b1hy7ZlsC2Ubn9TrfsjA5ZVUNbI1UjUZkiCtiL+4Eu3sswJZ5lzeXrUru3iLITge
 2k0jF7MfNstfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3496117E12DF;
 Tue, 14 Oct 2025 15:18:33 +0200 (CEST)
Message-ID: <c29a4ea7-34fd-44bf-bb32-a7a96bf0e04e@collabora.com>
Date: Tue, 14 Oct 2025 15:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8365: Add GPU support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
 <20250813-mt8365-enable-gpu-v1-2-46c44c6c1566@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250813-mt8365-enable-gpu-v1-2-46c44c6c1566@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/08/25 11:25, Louis-Alexis Eyraud ha scritto:
> The Mediatek MT8365 SoC has an integrated Arm Mali G52 MC1 GPU
> (Bifrost).
> Add gpu, OPP table, and MFG clock driver nodes in mt8365.dtsi to support
> it using the Panfrost driver.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 41 +++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index e6d2b3221a3b7a855129258b379ae4bc2fd05449..6a7b4f58918b22f51b792f3a99bd777acf72df9d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -267,6 +267,24 @@ clk26m: oscillator {
>   		clock-output-names = "clk26m";
>   	};
>   
> +	gpu_opp_table: opp-table-gpu {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-450000000 {
> +			opp-hz = /bits/ 64 <450000000>;
> +			opp-microvolt = <650000>;
> +		};

Blank line between OPP nodes, please.

};

opp-560000000 {
	...
};

opp-800000000

otherwise,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +		opp-560000000 {
> +			opp-hz = /bits/ 64 <560000000>;
> +			opp-microvolt = <700000>;
> +		};
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <800000>;
> +		};
> +	};
> +
