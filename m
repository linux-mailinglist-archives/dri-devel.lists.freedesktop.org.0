Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHB4CX08kmn2sAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:37:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B873F13FCC5
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55BF10E231;
	Sun, 15 Feb 2026 21:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NEhINE6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C53E10E010
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:55:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso16494605e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771145738; x=1771750538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=;
 b=NEhINE6EHNViY/nNDCLtt6XljPM39LsaP0MtApyf3JM5qIN0K7kLQlaDIynotcvDlS
 eB0VFbTo4SO1FSx/y0+WCZIdUmg8MqHSh5QWIMHv6kmGYlBr9hlXJkOESutfDga+aMGj
 AORJKP7ghhTFestlM04doVwL+IZb3Q5poAUJ80unqnfj0fWGdfMXHOjdEDHkixiFVmqt
 SIGY16KCtbS+hjEIuZMaS64sLpPY7tixdrbkYVx7pPMfTUhuuqIFWMqrD7BeAmDJGm2q
 /DA0BPgx+1ZAHLu/k51FEmCOQbchG4LHrJEOT7xCnybkhNZq70ybgkQw/Dq7ZV4FE0EB
 pZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771145738; x=1771750538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=;
 b=c881cOnymXFc04jZOHDkMgwgOn8jFUTpK1u2cUSLWDW8l0o2qtjzwgkaTzKNC3Uy5J
 fQEKwbiX8nGohTm/MrfTOWKbq5UZKmyIwm4ho1ZtTg2GBkURROeZnsjkZ46RLUafgm+q
 HZvNDt2rh8kQ4JNUOMu0MNwWuLwXv1V8Tr/gGs7Zu5eVNAOo2QhMmR6eovqG2N1JrzUL
 0aPwtG+ON+5kxvt63sCZIIPLJUv2H9JeY+fFcdRwgFvAUAfiBvRAmtpRuPxLizWz6FS5
 rJo3Pv+1GBsiQVMWiPoLz7HfTrigKCUMQvfo5UtSs53H/IuY1EfQlLg4UBbCOUb1d9Qg
 G3BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJbadwB+fIjYIbkK0rBlonwYxOsEi6qHaE8JOwVZa1j3rBi1VW+hty6rYl8Q7ozmGV4gZdudq51Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe0h1XBpb1khrXshizZJir87rxoBVe3mvcXkgHkjs0Ecg6E82s
 wH6WEoaKnOMrtoN5oGc2Eg9eqZmyN2BIR2q4eSONy+dhNJkDBylA9PWc
X-Gm-Gg: AZuq6aKeZe1Zx71XqoASEJMMZk0d2IsqoRpe5SATif6iytr0aZfkmlppSvQJB573kdQ
 9/zXgA/lujgDW+g1ZGsHHy0O2u1uCyXW25XgCNiJsKpfd+3JjgLdlWRcYNJdQRvWjnZSDrb3c1b
 6+6zI1oSX0XIcvokCAEQQn51fLPEQ/oGqeHzBCNAbl+zEHdVYbv3qMuOHsZUf2BY644oNpurBLD
 btsmrmnpuzQsxRYmslOE3GD1tz4604bq5SY8DxWT7691EBYTJ3rW4+vSGdEaQ32Y609RJWt8CQ8
 NH7iup0HzC4NP+ONHO68U9m8tec3XursXO4VFFiBfuUlM6Xrcvnd4Z2QOZWYaV0GTTchDs3qBnm
 zrGvAFsUpW3nkYBUEM+I6O2deF8KwtXeDBQ0SeUvL4eNkAZ4OXcegO/mk2bhdcL97ol/9a3gvZC
 3sdVMApFe94H7FJSq2dbo=
X-Received: by 2002:a05:600c:314f:b0:483:6d4e:9811 with SMTP id
 5b1f17b1804b1-48373a73ec5mr119238475e9.31.1771145737543; 
 Sun, 15 Feb 2026 00:55:37 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d78cfsm547211675e9.1.2026.02.15.00.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:55:37 -0800 (PST)
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
 Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: [PATCH 0/4] Add support for mt8167 display blocks
Date: Sun, 15 Feb 2026 08:53:52 +0000
Message-ID: <cover.1771144723.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Feb 2026 21:36:42 +0000
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B873F13FCC5
X-Rspamd-Action: no action

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The first patch just does some reordering of dts nodes with no other changes
as this makes later patches cleaner and easier to follow.

Luca Leonardo Scorcia (3):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
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
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 450 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 11 files changed, 446 insertions(+), 35 deletions(-)

-- 
2.43.0

