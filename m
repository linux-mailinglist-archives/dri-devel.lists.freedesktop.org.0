Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57CAD6790
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 08:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF9410E188;
	Thu, 12 Jun 2025 05:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TJiONlJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40F110E188
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749707477;
 bh=slvcAQUT+HFsllFYLGyw5Fofz5HxNlsL+2o5mQBM/0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TJiONlJ9E7Ze3sRhwKZBV9R9Z6MEzthUCgwvyz+PCAR+b70XacpHK1Ok/w3otAUFo
 xcTXGKlAwRPHZ1F6LQYAfijJx8cPS2ocEIIYr5CIe0ASepzhEjtn3vMGn46lxkk2eW
 8psRt03UkK1YeCc6FFFhyESjq4YJXMdOEo/0/I0ziEoIMbfNowwJy5KPqv/k5cZNgZ
 MxuwYQMKU4LDB3uCpiJrUHZmeU79iOy4kKyhervclnE+dBW10wK/xsvQM6s/UVMUUa
 UcN/1JEs4AAex34cYtPmWbGHMbMtJnA49vF7KX6dJwpN6QDEC+iw572cMrnmH9AY6/
 TKCFRDlv01aYQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 19B3E17E0863;
 Thu, 12 Jun 2025 07:51:17 +0200 (CEST)
Message-ID: <33376472-679b-406f-aadb-41dd540c47cf@collabora.com>
Date: Thu, 12 Jun 2025 08:51:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source
 to VOP2 on rk3576
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
 <6011857.DvuYhMxLoT@trenzalore>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <6011857.DvuYhMxLoT@trenzalore>
Content-Type: text/plain; charset=UTF-8
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

Hi Detlev,

On 6/12/25 3:00 AM, Detlev Casanova wrote:
> Hi Cristian,
> 
> On Wednesday, 11 June 2025 17:47:49 EDT Cristian Ciocaltea wrote:
>> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
>> char rate via phy_configure_opts_hdmi"), the workaround of passing the
>> rate from DW HDMI QP bridge driver via phy_set_bus_width() became
>> partially broken, as it cannot reliably handle mode switches anymore.
>>
>> Attempting to fix this up at PHY level would not only introduce
>> additional hacks, but it would also fail to adequately resolve the
>> display issues that are a consequence of the system CRU limitations.
>>
>> Instead, proceed with the solution already implemented for RK3588: make
>> use of the HDMI PHY PLL as a better suited DCLK source for VOP2. This
>> will not only address the aforementioned problem, but it should also
>> facilitate the proper operation of display modes up to 4K@60Hz.
>>
>> It's worth noting that anything above 4K@30Hz still requires high TMDS
>> clock ratio and scrambling support, which hasn't been mainlined yet.
>>
>> Fixes: d74b842cab08 ("arm64: dts: rockchip: Add vop for rk3576")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi index
>> 6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef16
>> 7d94904 100644 --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> @@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
>>  				 <&cru HCLK_VOP>,
>>  				 <&cru DCLK_VP0>,
>>  				 <&cru DCLK_VP1>,
>> -				 <&cru DCLK_VP2>;
>> +				 <&cru DCLK_VP2>,
>> +				 <&hdptxphy>;
>>  			clock-names = "aclk",
>>  				      "hclk",
>>  				      "dclk_vp0",
>>  				      "dclk_vp1",
>> -				      "dclk_vp2";
>> +				      "dclk_vp2",
>> +				      "pll_hdmiphy0";
>>  			iommus = <&vop_mmu>;
>>  			power-domains = <&power RK3576_PD_VOP>;
>>  			rockchip,grf = <&sys_grf>;
> 
> I tested this on the ROCK 4D and can confirm that:
>  - New modes like 2K are now working
>  - Mode changes is now correctly supported
> 
> So,
> Tested-By: Detlev Casanova <detlev.casanova@collabora.com>

Thanks for taking the time to perform all these tests!

Cristian
