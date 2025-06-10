Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE31AD2CF2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 06:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AC510E258;
	Tue, 10 Jun 2025 04:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="R9EUnTAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD6810E258
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 04:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dlck4n7ZL89xi43vZeatFJhr6XAnqZ+D1K3Jv5D9+FU=; b=R9EUnTAxCx9H7ng7I0b/OXniOl
 L0Zy/k3Js1X0kyoP8gItled4L6izykivME1BBpabcQquidAEnYS8zJ9pVPJvBGIcL0ZJdD+LPo0Jy
 As+LFrVnk/SdzolrmWhvPyBQvkFNBjZbp6At5VvHTzB0JfsUKP977pNQ4xo2uVywizI3hjtY+C4SY
 X/pzFUFCm9wetY/mk6IOrUamRcclow4fognVL6vHXfcbe1dee9FseZOxayPta0WIm7DV5GmXCgGDy
 gy1TB0SMaB88mQDP0OlTGo+b9Mv2t5JdOeJxRXEptFi8Y8VxPG6pOH6uJyG62vHvUAZxGaDw0Bv4y
 /r47xVvg==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uOr4m-007RYE-0x;
 Tue, 10 Jun 2025 07:59:08 +0300
Message-ID: <140a1f16-3baa-46a1-9cb3-a02381cbb3e4@kapsi.fi>
Date: Tue, 10 Jun 2025 13:57:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: tegra: Add NVJPG power-domain node
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-2-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20250606-diogo-nvjpg-v1-2-5f2c36feeb39@tecnico.ulisboa.pt>
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
> Add the NVJPG power-domain node in order to support the NVJPG
> accelerator.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 402b0ede1472af625d9d9e811f5af306d436cc98..6f8cdf012f0f12a16716e9d479c46b330bbb7dda 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -947,6 +947,12 @@ pd_xusbhost: xusbc {
>   				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
>   				#power-domain-cells = <0>;
>   			};
> +
> +			pd_nvjpg: nvjpg {
> +				clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
> +				resets = <&tegra_car 195>;
> +				#power-domain-cells = <0>;
> +			};
>   		};
>   	};
>   
> 

Please mention Tegra210 in the commit subject. Otherwise,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

