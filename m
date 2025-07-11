Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C4B02400
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C7A10E107;
	Fri, 11 Jul 2025 18:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96C4E10E107
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 18:45:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BFCA16F8;
 Fri, 11 Jul 2025 11:45:18 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 037533F694;
 Fri, 11 Jul 2025 11:45:26 -0700 (PDT)
Date: Fri, 11 Jul 2025 19:43:38 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.or>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable Mali GPU for
 all boards
Message-ID: <20250711194338.52532eca@minigeek.lan>
In-Reply-To: <20250711035730.17507-4-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
 <20250711035730.17507-4-iuncuim@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 11 Jul 2025 11:57:29 +0800
iuncuim <iuncuim@gmail.com> wrote:

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.
> 
> Enable the DT nodes for this GPU and specify a regulator that supplies power
> to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
> so are board independent.

Checked the schematics of the three boards where those are available,
and it's indeed DCDC2 there providing the voltage. For the X96QPro+,
regulators.txt in debugs confirms this as well.

> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
>  4 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index 8bc0f2c72..553ad774e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -66,6 +66,11 @@ &gmac0 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index 59db10354..a96927fbd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -54,6 +54,11 @@ &ehci1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_vcc3v3>;
>  	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 142177c1f..b9eeb6753 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -76,6 +76,11 @@ &gmac0 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index 5f97505ec..d07bb9193 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -95,6 +95,11 @@ &ehci1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_cldo3>;
>  	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */

