Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A89AD2CFC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 07:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B2D10E46A;
	Tue, 10 Jun 2025 05:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="W1t/L6lG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D2610E46A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5svVUtchtz7CoHBdcy+lHR9EZn7myAFDhWihgVXNkmI=; b=W1t/L6lGDPF0R10ik8dKmaitbo
 OUzeLg5OH5khxiIyjwI8s22Y2VCSIQxNpyXxAyIriv8mbtlJXSem52+ApcWsByo06eFQZMSI1lEOu
 QAvWgsBsJYflMs9DZTSpHrZIc8vjxSBXVnGqLyYYlvLwM1VGVMuAw5dN8ldDee1W8MAgCO7YrDh6+
 eujydMqiTzJAVs7vgwtH9QxYhw4l1L7leci8JPkygSFhHpqT6wn+l0cNl5YPFPMizTqzZ1HQ6nY2B
 IWm7C4T+2/kNrRwMw+K+XmeC9ooGN4fuenm8oj7twmUXD5El+J3dwmgNv77dv2HR6tc2TNPx0Ckh4
 H+JFgzjQ==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uOr7q-007STv-2n;
 Tue, 10 Jun 2025 08:02:19 +0300
Message-ID: <4a02f671-2be0-45c9-b471-071596b22338@kapsi.fi>
Date: Tue, 10 Jun 2025 14:01:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: tegra: Add NVJPG node
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-3-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20250606-diogo-nvjpg-v1-3-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 6/6/25 7:45 PM, Diogo Ivo wrote:
> The Tegra X1 chip contains a NVJPG accelerator capable of
> encoding/decoding JPEG files in hardware, so add its DT node.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 6f8cdf012f0f12a16716e9d479c46b330bbb7dda..087f38256fd40f57c4685e907f9682eb49ee31db 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -253,7 +253,13 @@ vic@54340000 {
>   		nvjpg@54380000 {
>   			compatible = "nvidia,tegra210-nvjpg";
>   			reg = <0x0 0x54380000 0x0 0x00040000>;
> -			status = "disabled";
> +			clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
> +			clock-names = "nvjpg";
> +			resets = <&tegra_car 195>;
> +			reset-names = "nvjpg";
> +
> +			iommus = <&mc TEGRA_SWGROUP_NVJPG>;
> +			power-domains = <&pd_nvjpg>;
>   		};
>   
>   		dsib: dsi@54400000 {
> 

Please mention Tegra210 in the commit subject, and perhaps adjust the 
commit message to say that you're updating and enabling the device tree 
node (rather than adding, since it's already there).

With that,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

