Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHh/ONB/nGm6IQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:26:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE4179BDA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DA110E3DC;
	Mon, 23 Feb 2026 16:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mot6d1Wv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0337810E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:26:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso3336359f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771864005; x=1772468805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=;
 b=Mot6d1WvPjc8hu49634Kxd///yLTG0GL7CODMcu3kk8Qe6dRdGE2IaZG/tTJUMwzcO
 U3QL5IyM00sFR5dA3EJFq7m6AayH1LJlV/c+B7w0ltpRCGXIgN2ePjHcTt9BtSpdngx8
 FjyOfZ+jIENvpTHNNYQan+b3iuntHibzOg5uiAhHvDib1wX9HRzeMjAOh0JA2dEl4VBQ
 dzI8SFlcEvpXIGsUyX70//hZg9tEMpImo8CwRl4oR2FeO//9++8tsZi96MGlSuyKtBvo
 9sudOUCs5FjymwyPMnABTVBCe8SQCe+RJo+J7k0Rz31r9xtDNtQ9LWoBlIYZH3fxKyvS
 POuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771864005; x=1772468805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=;
 b=s4xkoLExnm+tCIK/KC40fijjJPgwvkhRMU8hmOgEWgWvy8UWDxC2JGyLSut3Branr9
 gojS5pgmbqmrqQe0yggEiONrRyn4o4KtAe3qpw9A1oh3JWUwLobJu/dNIXLE/VL8BG97
 qgRdWxSn1Jyu83B31QRuxDIDqv1DVg3dfF2bRhonbE4ynEEipjlh+KFdK8p/Gfju8iad
 lmn2vzU5osVr6zxRZayyFdPA50Oax80hbSbr7A0XOZh5esJ7s5QOk39XGIxg4+Ga5OC5
 HsM1m60M74skWyaRlXez1o8C0AohL0EklxBZjqk3gIWVnHrNky4M+ZbfyDSF++cSIJnI
 +SIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB10MhS8bMcnV6a63wX1dX5Hb6rmr70dGEvaTqXIvYs2664Eq1+l3OcY4la8YmWK9TrTkGwZeckaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkkyc946+mtIBisPiUKw5UYQa5PfAurLLuMeBH279/Nq1JUTq+
 xTQVd6I3qMuj5IXOvSNwQ//YTE+WDecvewfMFsL3yp2tkEys+XGIgUux
X-Gm-Gg: ATEYQzyrbTi+uhGVk9yHZHyYulerPRkl4lIygFDF34f7wEk/7z54OMJNKkVtQ2td/p5
 gd57eC8VQFEcraFvwY5jhwL6Z0zK9u8pgP5Ov9s6qtS0vJjm0zYNsdko62kZNUr3L8ZXwQ2HUIp
 B1yA0KF5CuxMCaVlRPK9kDqITD6BZkjMmRaJgmQOR9wmGprP4y4i4I3PfvrbYeYD2AGcVYJgRY5
 KZuFLtyRQ1wgGY1EQdrgzVUU5LrY6rKwa2UVoQo/9wCJD/hSun1xm0TkeVPbLX4pvG4vjcHdls/
 /XNXkxtR0Bx+4HzAqrFV9c5+lknGd8x/d56peXHufxaemPIyiH4Q0s/8AlQQkvS352si4R6m4bG
 Ti+hjMBcWXN6O+zPHNcgfmKveujAFYPtAoXPzNdLLKxjky4gW2aGc0ZSKvd+aHWYUgCwEvfjtZt
 rrwGHA0JLwZ9XGz2MLjhM=
X-Received: by 2002:a5d:5886:0:b0:435:92c6:d556 with SMTP id
 ffacd0b85a97d-4396ffc46bfmr17665504f8f.16.1771864005236; 
 Mon, 23 Feb 2026 08:26:45 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 08:26:44 -0800 (PST)
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
Subject: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Date: Mon, 23 Feb 2026 16:22:49 +0000
Message-ID: <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
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
X-Rspamd-Queue-Id: 99BE4179BDA
X-Rspamd-Action: no action

The mt8167 DSI controller is fully compatible with the one found in
mt2701. Device tree documentation is already present upstream.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index af4871de9e4c..ad10e86b161d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1301,6 +1301,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
-- 
2.43.0

