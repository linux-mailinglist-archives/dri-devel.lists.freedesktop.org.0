Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81C903739
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 10:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF2410E573;
	Tue, 11 Jun 2024 08:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EXoraPiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1456C10E576
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718096166;
 bh=jyXZ6Jmf602HyTlI6R8H2s9bUCikY0FkUQKhwDBS4eE=;
 h=From:To:Cc:Subject:Date:From;
 b=EXoraPiEN270DmvqR7ysOyaTy9JXeBNGVwFlanfv/WHqUC2RULZGc6Mgz77ahE6Vj
 p2E4Eml5aApaJ+fFwaBuBIAlySQc8Iuj0y8c9wDWps/O0hlse2GlUQ+rn4OLDhb3iM
 mRshvN0fNDbVom4oWFIod6+u1peB+B2asyb3hGmu4g1CgYHQc3KjIMZ7EHpeqKFHCD
 ncnU9QRe20Oj1Gbvm/Mhz7schrzmNyDo3F+pJL2207yfnqf/hiuuSO/6IvmOJLPES9
 h4B8Lw3R9VLuTJO15Xw85/qupnYsBaJv2BrFL3ME/AeBtSqH/F5+NN1BKWtncPhORe
 nK7yE+iJhevoQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 832AD378020A;
 Tue, 11 Jun 2024 08:56:05 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] drm/panfrost: Add MT8188 support
Date: Tue, 11 Jun 2024 10:56:00 +0200
Message-ID: <20240611085602.491324-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
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

Changes in v3:
 - Added comment stating that MT8188 uses same supplies as MT8183
   as requested by Steven

Changes in v2:
 - Fixed bindings to restrict number of power domains for MT8188's
   GPU to three like MT8183(b).

This series adds support for MT8188's Mali-G57 MC3.

AngeloGioacchino Del Regno (2):
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
  drm/panfrost: Add support for Mali on the MT8188 SoC

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml      |  5 ++++-
 drivers/gpu/drm/panfrost/panfrost_drv.c                | 10 ++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.45.2

