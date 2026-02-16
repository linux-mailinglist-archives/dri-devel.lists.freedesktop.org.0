Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA5IMtdEk2kP3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:24:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B346146174
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEEE10E0AB;
	Mon, 16 Feb 2026 16:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NhA4Y5m+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C1210E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:24:51 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43638a33157so3283544f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771259090; x=1771863890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=;
 b=NhA4Y5m+vKsQCKy72Ne3umzV+w7Y7l2UionwHmuOil9Dvyt9OKt4Vujv2Sfm46Fn4u
 JznKS3Gx+0FeliJTnAhT5SdyqyLH0svY1jW9sxA5SuiWSJ3u8Ncd5YoJh8pirqTYbsUa
 Dzeu1S77ti46RphxWbK9uYw+767JaaYyh2cxKisJXSkLZ6e5Hw/XfvQFJwhtkmjhjCNH
 IrjFIE2w895fuHzKgiDac8Mk2+EDIRtsj7yWRTf0aAk6LNTRNA8WAeBOANvMbAH0lBqS
 KvGZSJqmBlvydutqtgOzd7IH/XeT3mI8q/kDPpM3uFU4NJ6m2hF0kd1pxTqjuXVdVmdL
 He7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771259090; x=1771863890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=;
 b=WWuWgz9+atzuIlvWqo8u29HkLOURYt/rq0XN6Fvi1E6GFnzasNUBzIqeUhJCuw1NOl
 m1hpMzDWTIxUKhY0cwXMEsSwCpMZtO5gaeGZ9rQQ2Vc1VIXMHZf5b4vcYPYap6BwZ69A
 IKc12ecYaT4a+eFU7wjOyPwgGt7zN1MTcy6mJX4KUOvwM58k0hSnn+09Gm5nRRMpv6N4
 UnVjvaS2P179wwCwNice50oX9rAjEMQt4a/Huk83+uKQbpz+uSHfj/5daTgQdRm+geAq
 LS17WBEdBb9t0wuee2hp0WAWVsuAdEDYP1VT2ApFTJSDGxK8/O1aDXhFrIOZnDrQrhEA
 jdEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmyuF1YaSt6J7bT+pLYh1lkgNgzChkeP2xzVtW/ndUfvFx3jJzWccrRDSDwN7aS8+APNDg2k6ACQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg1O7AJrzSHB/ph8Nnt9qC4z9FUpWkspMxs5kdxgpT/3SSQJmW
 cB+T/JC6c0G8WpFicWmcPwarjNhMr6kJ4jloKem++ttpXFxOgNtr9OQL
X-Gm-Gg: AZuq6aLMdstGZloRnmpVOH7wBGm9VeRfmmO1fw4F71zOxQHzZY7Zufrp3RjXsD+uZc8
 ZFqJGWSu40zoY/9AaDsMSDAFBZOUtxwhK5JcFXLZPVj+WeVUFvRyrlgZGkTRUgNNYLM2R1YYjAZ
 vvFiEYZLHz+CEPyqpcH2itW0Fu5d0hDjSWQkaiZiqH4hwHTRt0sZcb/9+/Y0rlkj52Hx0eyPET2
 D8u41tg7gBntCy/NGZJnkDynVOLVUfFn6EXvF/qKP+msh1hQHJt8fO/Lpd5+7U6UQ0E7BwiLR2a
 amV+m3O6UYEui1q0/cnvvCzEsx9zs/2GyKLsgN8SGA8cZKeRWQSYlMY9Nr/BtuqSo47kZlwd7YD
 2teaWz1D8CqFpqqTVz8EOAEK26Gs05lvEuiaPydOfNids/yQjnMuXkDJRxFVRhg8Ny+Tnzr100U
 B9vK3oSk0YAPXXJ4GyEa8=
X-Received: by 2002:a05:6000:2501:b0:435:e460:235b with SMTP id
 ffacd0b85a97d-4379795572emr15102960f8f.59.1771259089859; 
 Mon, 16 Feb 2026 08:24:49 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:24:49 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v2 0/6] Add support for mt8167 display blocks
Date: Mon, 16 Feb 2026 16:22:11 +0000
Message-ID: <cover.1771258407.git.l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,collabora.com,baylibre.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3B346146174
X-Rspamd-Action: no action

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The first patch just does some reordering of dts nodes with no other changes
as this makes later patches cleaner and easier to follow.

v2:
 - Separate patch for mediatek,dsi-phy binding;
 - Separate patch for mt8167-dsi binding;
 - Simplified OF graph endpoints in mt8167.dtsi.

Luca Leonardo Scorcia (5):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
  dt-bindings: display: mediatek: Correct compatibility for mt8167-dsi
  dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes

Val Packett (1):
  gpu: drm: mediatek: ovl: add specific entry for mt8167

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   4 +-
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,dsi.yaml        |   5 +-
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   1 +
 .../display/mediatek/mediatek,wdma.yaml       |   4 +-
 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 381 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 11 files changed, 377 insertions(+), 35 deletions(-)

-- 
2.43.0

