Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E792AD706C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814E210E82E;
	Thu, 12 Jun 2025 12:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Pdr3jsG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7307610E832
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749731436;
 bh=xMj0PeXUpejsICB72qzZq/FU9wUca+EJE4sWUqWhTeA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pdr3jsG8LEBbrTq48ZzhTF8vjLwU0K+gNO+X2iv7Gdtf7LmKBdaFEIz5QMWdeccwD
 GLCxrTWkvx74UkGx64K3aPq/B4r5m2wWanFUdRsvxE/zkUcEWjvmC0tdmaSl7DthRD
 5BeuUwEdjAOZP363EEtatAdEPq2wvbL19UMWfJpDqLJEWqCebJY82sVUPdY5Cah+Bp
 d6wLrrwIXhisc4G9pCT8qm9/8yoDg9PO+QNBA6isGJKMkProKjiDrtP+vHW8of9oIv
 T0bBlbb2VBZy8YlsWjQe1n9JNo/CshEopiXzxi9osJgM+NETN7+2eF9RvK13lDKGw6
 5cndkuogjgGWQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 48C9D17E06BF;
 Thu, 12 Jun 2025 14:30:35 +0200 (CEST)
Message-ID: <85cb44fd-f597-443e-81b4-e259513aec9f@collabora.com>
Date: Thu, 12 Jun 2025 15:30:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Fix HDMI output on RK3576
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <3011644.e9J7NaK4W3@workhorse>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3011644.e9J7NaK4W3@workhorse>
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

Hi Nicolas,

On 6/12/25 3:13 PM, Nicolas Frattaroli wrote:
> On Wednesday, 11 June 2025 23:47:46 Central European Summer Time Cristian Ciocaltea wrote:
>> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
>> char rate via phy_configure_opts_hdmi"), the workaround of passing the
>> PHY rate from DW HDMI QP bridge driver via phy_set_bus_width() became
>> partially broken, unless the rate adjustment is done as with RK3588,
>> i.e. by CCF from VOP2.
>>
>> Attempting to fix this up at PHY level would not only introduce
>> additional hacks, but it would also fail to adequately resolve the
>> display issues that are a consequence of the system CRU limitations.
>>
>> Therefore, let's proceed with the solution already implemented for
>> RK3588, that is to make use of the HDMI PHY PLL as a more accurate DCLK
>> source in VOP2.
>>
>> It's worth noting a follow-up patch is going to drop the hack from the
>> bridge driver altogether, while switching to HDMI PHY configuration API
>> for setting up the TMDS character rate.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Cristian Ciocaltea (3):
>>       dt-bindings: display: vop2: Add optional PLL clock property for rk3576
>>       arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
>>       arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576
>>
>>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
>>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  7 ++-
>>  2 files changed, 49 insertions(+), 14 deletions(-)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250611-rk3576-hdmitx-fix-e030fbdb0d17
>>
> 
> For the whole series:
> 
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> This fixes HDMI output for 4K resolutions on my RK3576 ArmSoM Sige5.
> The DTB checks and bindings checks pass as well.
Many thanks for the additional testing!

Regards,
Cristian
