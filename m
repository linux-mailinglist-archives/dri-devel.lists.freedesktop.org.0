Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MGxLFdjhGkM2wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:31:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B59F0C84
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2C10E856;
	Thu,  5 Feb 2026 09:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JgrWYSbM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x/Xr4eTI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JgrWYSbM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x/Xr4eTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3684710E856
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:30:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B14743E766;
 Thu,  5 Feb 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770283856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
 b=JgrWYSbMyCnsSiRoegio6OgghlGookwTHCTt6MGIwkcH+3Ce8EkBUKYRH9w+QVI8NJXtVy
 s0ckwlMuu2uSlfSlfc1jDcogJUsjywoyCce/q/FlzDEoQe+lH+aYGwEAPkRQdHQR3xBEs0
 lLyrwIptIO8MmoYoUi7LqQ6xzxEtq9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770283856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
 b=x/Xr4eTIhaFcjxgVIGvLEDun1keoGuUzASn1QtGAiz5tSTyfMaMLo8blh9Cq4KK1t89gle
 QQH8TRcS1CGj/HAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770283856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
 b=JgrWYSbMyCnsSiRoegio6OgghlGookwTHCTt6MGIwkcH+3Ce8EkBUKYRH9w+QVI8NJXtVy
 s0ckwlMuu2uSlfSlfc1jDcogJUsjywoyCce/q/FlzDEoQe+lH+aYGwEAPkRQdHQR3xBEs0
 lLyrwIptIO8MmoYoUi7LqQ6xzxEtq9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770283856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XY+5F7eiJUNFHYoaIWWokkpSAzmiSLPZoyLUPmhmHa0=;
 b=x/Xr4eTIhaFcjxgVIGvLEDun1keoGuUzASn1QtGAiz5tSTyfMaMLo8blh9Cq4KK1t89gle
 QQH8TRcS1CGj/HAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 016AF3EA63;
 Thu,  5 Feb 2026 09:30:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9tp3Ok9jhGnGJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Feb 2026 09:30:55 +0000
Message-ID: <ccb973b8-4b13-4a70-be48-06b2cbe0adf8@suse.de>
Date: Thu, 5 Feb 2026 10:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Verisilicon DC8200 driver (and adaption to TH1520)
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <gaohan@iscas.ac.cn>,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:gaohan@iscas.ac.cn,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[iscas.ac.cn,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 15B59F0C84
X-Rspamd-Action: no action

Hi,

patches 1 to 5 have been merged into drm-misc-next. In patch 3, I 
replaced COMPILER_TEST with COMPILE_TEST in the Kconfig file.

Best regards
Thomas

Am 29.01.26 um 03:39 schrieb Icenowy Zheng:
> This patchset tries to add a driver for Verisilicon DC8200 driver, and
> demonstrates the driver on T-Head TH1520 with its HDMI output.
>
> This display controller IP is used on StarFive JH7110 too, but as the
> HDMI controller used there isn't as common as the DesignWare one, I
> choose to use TH1520 in this patchset.
>
> The DC driver is written with other DC-series (mainly DC8000, which is
> known to be used on Eswin EIC7700 SoC) display controllers in mind, and
> uses the identification registers available on all Vivante branded IPs.
> A known exception is DCNano display controller, which is unlikely to be
> supported by this driver because of totally different register map and
> no known identification registers. (P.S. the in-tree loongson DRM driver
> seems to be for some DCNano instances based on the register map.)
>
> The HDMI controller seems to come with some common PHY by Synopsys, the
> DesignWare HDMI TX 2.0 PHY. By searching a few register names from the
> BSP driver of that PHY, that PHY seems to be used by a in-tree dw-hdmi
> glue, rcar_dw_hdmi -- an updated downstream version of rcar_dw_hdmi
> contains all 6 registers set here in the th1520-dw-hdmi driver. Some
> more suprising thing is that RK3288 uses the same PHY too, but the
> in-tree dw_hdmi-rockchip driver writes the configuration data array in a
> weird way to reuse the HDMI 3D TX PHY configuring function. It might be
> valuable to add common configuring function and configuration data
> definition for this HDMI 2.0 PHY too, but the current driver in this
> patchset simply duplicated most configuration logic from rcar_dw_hdmi
> driver (but with 3 extra configuration registers configured, which is
> done by their downstream kernel).
>
> This revision contains only little code change -- only a Kconfig select
> is added. The other purpose is to collect Thomas Zimmermann's tags and
> squash MAINTAINERS change to real driver per his suggestion.
>
> Icenowy Zheng (8):
>    dt-bindings: vendor-prefixes: add verisilicon
>    dt-bindings: display: add verisilicon,dc
>    drm: verisilicon: add a driver for Verisilicon display controllers
>    dt-bindings: display/bridge: add binding for TH1520 HDMI controller
>    drm/bridge: add a driver for T-Head TH1520 HDMI controller
>    riscv: dts: thead: add DPU and HDMI device tree nodes
>    riscv: dts: thead: lichee-pi-4a: enable HDMI
>    mailmap: map all Icenowy Zheng's mail addresses
>
>   .mailmap                                      |   4 +
>   .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++
>   .../bindings/display/verisilicon,dc.yaml      | 122 ++++++
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   MAINTAINERS                                   |   8 +
>   .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  25 ++
>   arch/riscv/boot/dts/thead/th1520.dtsi         |  66 ++++
>   drivers/gpu/drm/Kconfig                       |   2 +
>   drivers/gpu/drm/Makefile                      |   1 +
>   drivers/gpu/drm/bridge/Kconfig                |  10 +
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   drivers/gpu/drm/bridge/th1520-dw-hdmi.c       | 173 ++++++++
>   drivers/gpu/drm/verisilicon/Kconfig           |  16 +
>   drivers/gpu/drm/verisilicon/Makefile          |   5 +
>   drivers/gpu/drm/verisilicon/vs_bridge.c       | 371 ++++++++++++++++++
>   drivers/gpu/drm/verisilicon/vs_bridge.h       |  39 ++
>   drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
>   drivers/gpu/drm/verisilicon/vs_crtc.c         | 191 +++++++++
>   drivers/gpu/drm/verisilicon/vs_crtc.h         |  31 ++
>   drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 +++
>   drivers/gpu/drm/verisilicon/vs_dc.c           | 207 ++++++++++
>   drivers/gpu/drm/verisilicon/vs_dc.h           |  38 ++
>   drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
>   drivers/gpu/drm/verisilicon/vs_drm.c          | 182 +++++++++
>   drivers/gpu/drm/verisilicon/vs_drm.h          |  28 ++
>   drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 +++++++
>   drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
>   drivers/gpu/drm/verisilicon/vs_plane.c        | 124 ++++++
>   drivers/gpu/drm/verisilicon/vs_plane.h        |  72 ++++
>   .../gpu/drm/verisilicon/vs_primary_plane.c    | 173 ++++++++
>   .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
>   31 files changed, 2384 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>   create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
>   create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>   create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


