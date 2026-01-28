Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN6NApPCeWl0zAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:02:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F329DFC6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607AC10E623;
	Wed, 28 Jan 2026 08:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AzfytbL1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9mseFebz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AzfytbL1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9mseFebz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A47610E623
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 08:02:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 39DC133A89;
 Wed, 28 Jan 2026 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769587341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HdX0f2dML8sWbRIWYSdyI0DECX0mAgXwtUGagydlIRI=;
 b=AzfytbL1lVWXPoxtrRuFz1PEKLfUfEZm31NnZqciYlo29uMnXNz4s+ZJ6DNCP3ZoHp0I9v
 ugWKtUgcxg6Su5Ymt3v2+TAVFF8YEs+1TWfywccwBnSLccRhSvrcFDLyl/jRUx/HHJJhLe
 J7N22aQcwqLxRFiNWxTgDrV11VIrbto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769587341;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HdX0f2dML8sWbRIWYSdyI0DECX0mAgXwtUGagydlIRI=;
 b=9mseFebzzCyJbVAkX7gPTvcYQ1hVNzAA6tt6B2EAvC6K+ktzMtGwza4RrDYVriAj6spV63
 ooFUhzr6tVN9RaAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AzfytbL1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9mseFebz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769587341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HdX0f2dML8sWbRIWYSdyI0DECX0mAgXwtUGagydlIRI=;
 b=AzfytbL1lVWXPoxtrRuFz1PEKLfUfEZm31NnZqciYlo29uMnXNz4s+ZJ6DNCP3ZoHp0I9v
 ugWKtUgcxg6Su5Ymt3v2+TAVFF8YEs+1TWfywccwBnSLccRhSvrcFDLyl/jRUx/HHJJhLe
 J7N22aQcwqLxRFiNWxTgDrV11VIrbto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769587341;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HdX0f2dML8sWbRIWYSdyI0DECX0mAgXwtUGagydlIRI=;
 b=9mseFebzzCyJbVAkX7gPTvcYQ1hVNzAA6tt6B2EAvC6K+ktzMtGwza4RrDYVriAj6spV63
 ooFUhzr6tVN9RaAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CD8B3EA61;
 Wed, 28 Jan 2026 08:02:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2Jo0FYzCeWmwBwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Jan 2026 08:02:20 +0000
Message-ID: <d83b2c28-c666-4dff-9a1d-59d4c5b2e284@suse.de>
Date: Wed, 28 Jan 2026 09:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,
 Han Gao <gaohan@iscas.ac.cn>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-6-zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260123092830.4046009-6-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:gaohan@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me,iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.com:url,iscas.ac.cn:email,suse.de:email,suse.de:dkim,suse.de:mid,icenowy.me:email,pengutronix.de:email,samsung.com:email]
X-Rspamd-Queue-Id: 43F329DFC6
X-Rspamd-Action: no action

Hi

Am 23.01.26 um 10:28 schrieb Icenowy Zheng:
> From: Icenowy Zheng <uwu@icenowy.me>
>
> T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller (paired
> with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from the
> display controller.
>
> Add a driver for this controller utilizing the common DesignWare HDMI
> code in the kernel.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> No changes since v3.
>
> Changes in v2:
> - Created a new function to set PHY parameters and refactored the
>    control flow of the configure_phy callback.
>
>   MAINTAINERS                             |   1 +
>   drivers/gpu/drm/bridge/Kconfig          |  10 ++
>   drivers/gpu/drm/bridge/Makefile         |   1 +
>   drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173 ++++++++++++++++++++++++
>   4 files changed, 185 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9de..fc04fc007a054 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22556,6 +22556,7 @@ F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>   F:	arch/riscv/boot/dts/thead/
>   F:	drivers/clk/thead/clk-th1520-ap.c
>   F:	drivers/firmware/thead,th1520-aon.c
> +F:	drivers/gpu/drm/bridge/th1520-dw-hdmi.c
>   F:	drivers/mailbox/mailbox-th1520.c
>   F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>   F:	drivers/pinctrl/pinctrl-th1520.c
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index a250afd8d6622..8e19f5fb9ad7c 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -335,6 +335,16 @@ config DRM_THINE_THC63LVD1024
>   	help
>   	  Thine THC63LVD1024 LVDS/parallel converter driver.
>   
> +config DRM_THEAD_TH1520_DW_HDMI
> +	tristate "T-Head TH1520 DesignWare HDMI bridge"
> +	depends on OF
> +	depends on COMMON_CLK
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this to enable support for the internal HDMI bridge found
> +	  on the T-Head TH1520 SoC.
> +
>   config DRM_TOSHIBA_TC358762
>   	tristate "TC358762 DSI/DPI bridge"
>   	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index c7dc03182e592..085b5db45d6fd 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_SII902X) += sii902x.o
>   obj-$(CONFIG_DRM_SII9234) += sii9234.o
>   obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
>   obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
> +obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
>   obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
>   obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
>   obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> new file mode 100644
> index 0000000000000..389eead5f1c45
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + *
> + * Based on rcar_dw_hdmi.c, which is:
> + *   Copyright (C) 2016 Renesas Electronics Corporation
> + * Based on imx8mp-hdmi-tx.c, which is:
> + *   Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_modes.h>
> +
> +#define TH1520_HDMI_PHY_OPMODE_PLLCFG	0x06	/* Mode of operation and PLL dividers */
> +#define TH1520_HDMI_PHY_CKSYMTXCTRL	0x09	/* Clock Symbol and Transmitter Control Register */
> +#define TH1520_HDMI_PHY_VLEVCTRL	0x0e	/* Voltage Level Control Register */
> +#define TH1520_HDMI_PHY_PLLCURRGMPCTRL	0x10	/* PLL current and Gmp (conductance) */
> +#define TH1520_HDMI_PHY_PLLDIVCTRL	0x11	/* PLL dividers */
> +#define TH1520_HDMI_PHY_TXTERM		0x19	/* Transmission Termination Register */
> +
> +struct th1520_hdmi_phy_params {
> +	unsigned long mpixelclock;
> +	u16 opmode_pllcfg;
> +	u16 pllcurrgmpctrl;
> +	u16 plldivctrl;
> +	u16 cksymtxctrl;
> +	u16 vlevctrl;
> +	u16 txterm;
> +};
> +
> +static const struct th1520_hdmi_phy_params th1520_hdmi_phy_params[] = {
> +	{ 35500000,  0x0003, 0x0283, 0x0628, 0x8088, 0x01a0, 0x0007 },
> +	{ 44900000,  0x0003, 0x0285, 0x0228, 0x8088, 0x01a0, 0x0007 },
> +	{ 71000000,  0x0002, 0x1183, 0x0614, 0x8088, 0x01a0, 0x0007 },
> +	{ 90000000,  0x0002, 0x1142, 0x0214, 0x8088, 0x01a0, 0x0007 },
> +	{ 121750000, 0x0001, 0x20c0, 0x060a, 0x8088, 0x01a0, 0x0007 },
> +	{ 165000000, 0x0001, 0x2080, 0x020a, 0x8088, 0x01a0, 0x0007 },
> +	{ 198000000, 0x0000, 0x3040, 0x0605, 0x83c8, 0x0120, 0x0004 },
> +	{ 297000000, 0x0000, 0x3041, 0x0205, 0x81dc, 0x0200, 0x0005 },
> +	{ 371250000, 0x0640, 0x3041, 0x0205, 0x80f6, 0x0140, 0x0000 },
> +	{ 495000000, 0x0640, 0x3080, 0x0005, 0x80f6, 0x0140, 0x0000 },
> +	{ 594000000, 0x0640, 0x3080, 0x0005, 0x80fa, 0x01e0, 0x0004 },
> +};
> +
> +struct th1520_hdmi {
> +	struct dw_hdmi_plat_data plat_data;
> +	struct dw_hdmi *dw_hdmi;
> +	struct clk *pixclk;
> +	struct reset_control *mainrst, *prst;
> +};
> +
> +static enum drm_mode_status
> +th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +		       const struct drm_display_info *info,
> +		       const struct drm_display_mode *mode)
> +{
> +	/*
> +	 * The maximum supported clock frequency is 594 MHz, as shown in the PHY
> +	 * parameters table.
> +	 */
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static void th1520_hdmi_phy_set_params(struct dw_hdmi *hdmi,
> +				const struct th1520_hdmi_phy_params *params)
> +{
> +	dw_hdmi_phy_i2c_write(hdmi, params->opmode_pllcfg,
> +			      TH1520_HDMI_PHY_OPMODE_PLLCFG);
> +	dw_hdmi_phy_i2c_write(hdmi, params->pllcurrgmpctrl,
> +			      TH1520_HDMI_PHY_PLLCURRGMPCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->plldivctrl,
> +			      TH1520_HDMI_PHY_PLLDIVCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->vlevctrl,
> +			      TH1520_HDMI_PHY_VLEVCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->cksymtxctrl,
> +			      TH1520_HDMI_PHY_CKSYMTXCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->txterm,
> +			      TH1520_HDMI_PHY_TXTERM);
> +}
> +
> +static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
> +				     unsigned long mpixelclock)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(th1520_hdmi_phy_params); i++) {
> +		if (mpixelclock <= th1520_hdmi_phy_params[i].mpixelclock) {
> +			th1520_hdmi_phy_set_params(hdmi,
> +						   &th1520_hdmi_phy_params[i]);
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int th1520_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct th1520_hdmi *hdmi;
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct device *dev = &pdev->dev;
> +
> +	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> +	if (!hdmi)
> +		return -ENOMEM;
> +
> +	plat_data = &hdmi->plat_data;
> +
> +	hdmi->pixclk = devm_clk_get_enabled(dev, "pix");
> +	if (IS_ERR(hdmi->pixclk))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
> +				     "Unable to get pixel clock\n");
> +
> +	hdmi->mainrst = devm_reset_control_get_exclusive_deasserted(dev, "main");
> +	if (IS_ERR(hdmi->mainrst))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->mainrst),
> +				     "Unable to get main reset\n");
> +
> +	hdmi->prst = devm_reset_control_get_exclusive_deasserted(dev, "apb");
> +	if (IS_ERR(hdmi->prst))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->prst),
> +				     "Unable to get apb reset\n");
> +
> +	plat_data->output_port = 1;
> +	plat_data->mode_valid = th1520_hdmi_mode_valid;
> +	plat_data->configure_phy = th1520_hdmi_phy_configure;
> +	plat_data->priv_data = hdmi;
> +
> +	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	return 0;
> +}
> +
> +static void th1520_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	dw_hdmi_remove(hdmi);
> +}
> +
> +static const struct of_device_id th1520_dw_hdmi_of_table[] = {
> +	{ .compatible = "thead,th1520-dw-hdmi" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, th1520_dw_hdmi_of_table);
> +
> +static struct platform_driver th1520_dw_hdmi_platform_driver = {
> +	.probe		= th1520_dw_hdmi_probe,
> +	.remove		= th1520_dw_hdmi_remove,
> +	.driver		= {
> +		.name	= "th1520-dw-hdmi",
> +		.of_match_table = th1520_dw_hdmi_of_table,
> +	},
> +};
> +
> +module_platform_driver(th1520_dw_hdmi_platform_driver);
> +
> +MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
> +MODULE_DESCRIPTION("T-Head TH1520 HDMI Encoder Driver");
> +MODULE_LICENSE("GPL");

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


