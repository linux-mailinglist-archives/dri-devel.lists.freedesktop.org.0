Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s1WlOLmZkWnbkAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 11:02:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C715613E6EA
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 11:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF1B890CE;
	Sun, 15 Feb 2026 10:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="B9UjE9Sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net
 [178.154.239.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFB6890CE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 10:02:28 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c17:2010:0:640:2180:0])
 by forward101a.mail.yandex.net (Yandex) with ESMTPS id C762280C19;
 Sun, 15 Feb 2026 13:02:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 02U6OQUG14Y0-rqjbwYxY; 
 Sun, 15 Feb 2026 13:02:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1771149745;
 bh=EK56X4yUyK6p90PJP+pf1u3MX2f+sfz3TRR04+2G4T8=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=B9UjE9SzXK5scnpObCqr7CuifSEFqaFsMpm86WX89Sf1FM6OjeTWgWmEl5Uc/IX/1
 k2hRFfCdjZ6yTOm17+R2SxqNFY3wsYET9Rtzh6lN3nbUrIIBAEkPKKRLRc3/anF3jw
 YpvpfGJW/Y6mrAB3bLVLw0tpe6E+UurPtKGuJEks=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alim Akhtar <alim.akhtar@samsung.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 0/2] arm64: dts + drm/panthor: require explicit GPU
 sram-supply
Date: Sun, 15 Feb 2026 13:01:56 +0300
Message-ID: <20260215100156.135374-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:angelogioacchino.delregno@collabora.com,m:boris.brezillon@collabora.com,m:wens@kernel.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:devicetree@vger.kernel.org,m:geert+renesas@glider.be,m:heiko@sntech.de,m:jernej.skrabec@gmail.com,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:matthias.bgg@gmail.com,m:mripard@kernel.org,m:robh@kernel.org,m:samuel@sholland.org,m:simona@ffwll.ch,m:steven.price@arm.com,m:tzimmermann@suse.de,m:work@onurozkan.dev,m:conor@kernel.org,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[samsung.com,collabora.com,kernel.org,gmail.com,vger.kernel.org,lists.freedesktop.org,glider.be,sntech.de,lists.infradead.org,lists.linux.dev,arm.com,linux.intel.com,sholland.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onurozkan.dev:mid,onurozkan.dev:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C715613E6EA
X-Rspamd-Action: no action

Hi all,

This series follows the discussion around panthor's SRAM regulator handling
and the DT expectations for mali GPU nodes.

Today, if sram-supply is missing in the DT file, panthor falls back to
a dummy regulator with a warning. This implicit behavior hides missing
DT wiring behind regulator core fallback.

As discussed in [1], the agreed direction is:
- Update DTs to explicitly provide sram-supply, when no separate SRAM
  rail exists, use the same regulator as mali-supply.
- Make panthor to treat sram-supply as mandatory for all compatibles
  except mt8196-mali (as that SoC manages SRAM outside panthor).


- First patch applies the DT updates across affected files.
- Second patch makes panthor to treat sram-supply as mandatory
  except mt8196-mali.

[1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/

BR,
Onur

Onur Özkan (2):
  arm64: dts: add missing sram-supply to mali gpu nodes
  drm/panthor: treat sram as mandatory except mt8196

 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts    |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts  |  1 +
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts    |  1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts     |  1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi      |  1 +
 .../arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi  |  1 +
 .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi  |  1 +
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts    |  1 +
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts     |  1 +
 .../dts/allwinner/sun50i-h618-longan-module-3h.dtsi |  1 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts   |  1 +
 .../dts/allwinner/sun50i-h618-orangepi-zero3.dts    |  1 +
 .../dts/allwinner/sun50i-h618-transpeed-8k618-t.dts |  1 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  |  1 +
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts    |  1 +
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts     |  1 +
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts    |  1 +
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts  |  1 +
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi      |  1 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts     |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts         |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi      |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts     |  1 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi    |  1 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi     |  1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi    |  1 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi     |  1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts         |  1 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi      |  1 +
 .../boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi   |  1 +
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      |  1 +
 .../dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts   |  1 +
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts      |  1 +
 arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts |  1 +
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts     |  1 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts     |  1 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi    |  1 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi   |  1 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi        |  1 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts           |  1 +
 .../boot/dts/rockchip/px30-firefly-jd4-core.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi       |  1 +
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts     |  1 +
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi   |  1 +
 .../boot/dts/rockchip/rk3326-gameforce-chi.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts          |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi        |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi        |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts    |  1 +
 .../arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts |  1 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi     |  1 +
 .../arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi   |  1 +
 .../arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts |  1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi     |  1 +
 .../boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi    |  1 +
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi   |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi   |  1 +
 .../boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi   |  1 +
 .../arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi  |  1 +
 .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi      |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi   |  1 +
 .../boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts    |  1 +
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi    |  1 +
 .../arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts  |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts     |  1 +
 .../boot/dts/rockchip/rk3568-wolfvision-pf5.dts     |  1 +
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts    |  1 +
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts   |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi |  1 +
 .../arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi  |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts    |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts  |  1 +
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts  |  1 +
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts     |  1 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts   |  1 +
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts  |  1 +
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts    |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts    |  1 +
 drivers/gpu/drm/panthor/panthor_devfreq.c           | 13 +++++++++----
 138 files changed, 146 insertions(+), 4 deletions(-)

-- 
2.51.2

