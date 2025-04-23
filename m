Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C525A9890C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 14:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0880A10E0B0;
	Wed, 23 Apr 2025 12:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BicpC+SW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FA210E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:02:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0831DA4CEA3;
 Wed, 23 Apr 2025 11:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1161C4CEE2;
 Wed, 23 Apr 2025 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745409728;
 bh=0nzwQLtEHyNu/7/CKM0ZVwpRTIEm+zb35CC9woF3LVg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BicpC+SW6jsQVvZDY4P3/K1ZYD9yv3Nb4aVjxvOzhdalNeiPLXe1GYUMz2cUW4V/z
 nEMLfVF1MhN8J28ogaxUKxwp1hJobsFpeXE8PptO5g/8OdWTYmJnf5HTeeRfLb0klY
 C/rJBtHzMZLdpuW3XBFM7c7rfA5ZQpG30CpBZAjBcRayerhFPHdCN3imsND1POPALU
 iQLy75pwgeThzmanfZ4fApIjkefjJa3zaNh92R84awnvCkPpIcw2sJ4apntKN+BzMc
 MuB2kONuwsMuHgJfnV58GfXyh6g1Fv7enE1Uw5Ia8e2NAD9qrdUIqs7wwhg6O73VZM
 c66Xk24JswzBg==
Message-ID: <7988146f-cbc0-465b-af3b-b16562e163ce@kernel.org>
Date: Wed, 23 Apr 2025 14:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] arm64: dts: mediatek: Add MT8186 Ponyta
 Chromebooks
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250423093647.4074135-3-cengjianeng@huaqin.corp-partner.google.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@kernel.org>
In-Reply-To: <20250423093647.4074135-3-cengjianeng@huaqin.corp-partner.google.com>
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

On 23/04/2025 11:36, Jianeng Ceng wrote:
> MT8186 ponyta, known as huaqin custom label, is a
> MT8186 based laptop. It is based on the "corsola" design.
> It includes LTE, touchpad combinations.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Changes in v10:
> - No change.
> 
> Changes in v9:
> - PATCH 2/2: Add sound model to fix the warning.
> - Link to v8:https://lore.kernel.org/all/20240914063122.1622196-3-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v8:
> - PATCH 2/2: Change the commit about ponyta.
> - Link to v7:https://lore.kernel.org/all/20240913031505.372868-3-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v7:
> - PATCH 2/2: Remove prototype sku.
> - PATCH 2/2: Disable the other trackpad to enable one of them.
> - Link to v5:https://lore.kernel.org/all/20240909023148.1677936-3-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v6:
> - No change.
> 
> Changes in v5:
> - PATCH 2/2: Remove sku2147483647.
> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-3-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage since v3:
> - No change.
> 
> Changes in v2:
> - PATCH 2/2: Modify the dtb name without rev2.
> - Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>   .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
>   .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
>   .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
>   4 files changed, 91 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 58484e830063..3aa06476c6c0 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -64,6 +64,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku16.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
> new file mode 100644
> index 000000000000..986498af4c70
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-ponyta.dtsi"
> +
> +/ {
> +	model = "Google Ponyta sku0 board";
> +	compatible = "google,ponyta-sku0", "google,ponyta", "mediatek,mt8186";
> +};
> +
> +&i2c2 {
> +	trackpad@15 {
> +		status = "disabled";
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
> new file mode 100644
> index 000000000000..ff5eea0ddeb4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-ponyta.dtsi"
> +
> +/ {
> +	model = "Google Ponyta sku1 board";
> +	compatible = "google,ponyta-sku1", "google,ponyta", "mediatek,mt8186";
> +};
> +
> +&i2c2 {
> +	trackpad@2c {
> +		status = "disabled";
> +	};
> +};
> +
> +&usb_c1 {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> new file mode 100644
> index 000000000000..0abf69077089
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-steelix.dtsi"
> +
> +&keyboard_controller {
> +	function-row-physmap = <
> +		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
> +		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
> +		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
> +		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
> +		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
> +		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
> +		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
> +		MATRIX_KEY(0x00, 0x04, 0)	/* T8 */
> +		MATRIX_KEY(0x00, 0x01, 0)	/* T9 */
> +		MATRIX_KEY(0x02, 0x09, 0)	/* T10 */
> +		MATRIX_KEY(0x01, 0x09, 0)	/* T11 */
> +		MATRIX_KEY(0x01, 0x05, 0)	/* T12 */
> +	>;
> +
> +	linux,keymap = <
> +		CROS_STD_MAIN_KEYMAP
> +		MATRIX_KEY(0x00, 0x02, KEY_BACK)
> +		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
> +		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
> +		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
> +		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
> +		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> +		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> +		MATRIX_KEY(0x00, 0x04, KEY_PLAYPAUSE)
> +		MATRIX_KEY(0x00, 0x01, KEY_MICMUTE)
> +		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> +		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> +		MATRIX_KEY(0x01, 0x05, KEY_VOLUMEUP)
> +	>;
> +};
> +
> +&mt6366codec {
> +	mediatek,dmic-mode = <1>; /* one-wire */
> +};
> +
> +&sound {
> +	model = "mt8186_rt1019_rt5682s";
> +};
> +

