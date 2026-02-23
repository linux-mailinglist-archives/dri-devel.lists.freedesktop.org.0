Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kTjnBb5/nGmLIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:26:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3F179B83
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42610E3CF;
	Mon, 23 Feb 2026 16:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dbFQBzO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231DC10E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:26:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so3403926f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771863992; x=1772468792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GPabK+sR6tt9Q+NXwIlbFeumv2ta8pwtwfHRnJheAtg=;
 b=dbFQBzO/gZ6anMyQTk4ZVui5XmJkED7+/iaB9rOZufU9jhIpn3kaHAxxGAfSreK8Hh
 zUP8dHbEY0ANVdDzN7KQE8bRKRgJMjwACFGsHhuCL4/JklpFI3RdVY/TnX2D0RMUeMKJ
 /vurYR+9+wTL6Evu3cGh9yUAtwjZ4XM+UDablFUMB2K2jkIvXuRoNCtA3H8N+RNjG6ty
 j+F0ybFthdjBgnMGOkHeh48F19OoJ6hy6FQSXO0QJ4g44P8LLupNtp7EAB4s7OGIZI11
 fKWtSvUuGFyMffXYFfgIuVliidI+j8eWX0jin5H3nDVEHHmq2/XJIX2Z/O2aeyRTCvKo
 6QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771863992; x=1772468792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPabK+sR6tt9Q+NXwIlbFeumv2ta8pwtwfHRnJheAtg=;
 b=Ee58+5eq0uFYvweSy+16BiSoLwVVjb8nlMd7KCV/aLy7pGHkvw2ZF3mpbv6oq27LDk
 PO5C03rZrTGSe4snlCAAqQh06AAQIjdxKbC7WYV1ab245oECQToBSczmpWznbNHz1uu0
 BYx57We1kPKNOWXHDhbpIScLJCk0mvQw/OcgujU5T9/UGedHz16jdp1f2N++xv9ecGdd
 GgiVyKritGMjJgxok8W5jSk86BvhK3GStgg1mb3ULBwJBdUAg4szc0aLOMWNP1QxfrE9
 /RSw3mY4BaAVhLFEKS/xJ69Hzf7YcGmRjw/i5WNb+z7rFEh1PfRAXYq67eNDJlyqXoIH
 klzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWj87wui+Ucoknqri8pqGPvOv0k4ZH1cmJLmqTg+yGBt9+vyWvF6Qb6bHzByS7p/Klae1s8l2zcgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8t4C9DSjaOk4IMWqXFgV1/eQfiFmOnM2fGE8jZMHmevNKGtu6
 hg6nbEad33nwaetiCU/FdqfKRbbZpeLqqbnovB9G5co9SR//eM98Ay9B
X-Gm-Gg: ATEYQzx0qYTk2QF3nDn/ygwkLxgU/KC7j9M64/pv2baHNGOs8N4eiSqig5jNqgyw/mU
 DzST1J2uYh50uj9C0gXP6cgLggBefrMc3bfRx4BCbedumYcDY6w5m9JS4QmUjheRzeulyEtUCtf
 keCsp87HMRQTvDlUaCJV6f7XFkJEASv7/BqQyft1vJXUidX+rGggH5RFLXk6MHB5rCkrWRNzLSk
 cqu5RvY8R7ZJ3f7atYzlE6zvqgsBqmz/eCitozpjF6Vy7Que3T8lkK3sFsOqb3SKuzhyhac5fQh
 LUAG5/1V4CWBUe6nBPN0HPxmQ2+obZgvTukBWU3cb5ShHvKV100ZZOlAnYwssNwCFoA7cBz32VK
 ClD8lhNUvq7qabOeUghMwR8y3cpN4zFeZhe+OpBnLAC0yrJ1deNv6n4qQ/W4UHKe6S2CY2H7g+A
 Qcnyw4mZxaDSh2Y3PRdZ8=
X-Received: by 2002:a05:6000:40cd:b0:437:719d:a753 with SMTP id
 ffacd0b85a97d-4396f156a40mr16159891f8f.11.1771863992210; 
 Mon, 23 Feb 2026 08:26:32 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 08:26:31 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v3 0/6] Add support for mt8167 display blocks
Date: Mon, 23 Feb 2026 16:22:44 +0000
Message-ID: <cover.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,linux.intel.com,suse.de,ffwll.ch,mediatek.com,linaro.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6BD3F179B83
X-Rspamd-Action: no action

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The first patch just does some reordering of dts nodes with no other
changes as this makes later patches cleaner and easier to follow.

v3:
 - Added mt8167-dsi compatible to driver instead of changing the binding;
 - Resolved patch formatting issues.

v2:
 - Separate patch for mediatek,dsi-phy binding;
 - Separate patch for mt8167-dsi binding;
 - Simplified OF graph endpoints in mt8167.dtsi.

Luca Leonardo Scorcia (5):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
  dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes
  drm/mediatek: dsi: Add compatible for mt8167-dsi

Val Packett (1):
  gpu: drm: mediatek: ovl: add specific entry for mt8167

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   4 +-
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   1 +
 .../display/mediatek/mediatek,wdma.yaml       |   4 +-
 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 381 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   1 +
 11 files changed, 374 insertions(+), 34 deletions(-)

-- 
2.43.0

