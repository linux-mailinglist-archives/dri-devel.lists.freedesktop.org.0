Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE88FB265
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 14:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E6810E463;
	Tue,  4 Jun 2024 12:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="n6zvlhQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36E10E27D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717504766;
 bh=neyavww+fmoXtsq8dOJETlMstKR82zPDydDGrfHscoE=;
 h=From:To:Cc:Subject:Date:From;
 b=n6zvlhQJC6+IwBALtX7My3wR3eEKc19cyRlxukQVC0fDN8oCxD2DTC4y1HK08oO8b
 ZISIgVpR1FxiqqPT3sjOhLtJDyOwjSLNJjLkctM+j9duvxD9Vl2V+x39qI2KFfpiaj
 79oL6Hqy50WnIqKLg0oddv0Nxm8aS0ye6dpIp+86S3OaU6FCI09lsoCSFJq8w9Vb9K
 OkNCnbClVMXKR89hT1wxN/4kUNorECTC57Ds/GqQTIuoyWLxMxNT0AFyS2D95VNYwJ
 cOqTSKG7xS8aNzx0EBVlaQIBNN3n/M38k6WO7ikHZnUnAdKzWTxLto3BV9pUksop2n
 FAhph6kGZjonw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DBEAC37821A8;
 Tue,  4 Jun 2024 12:39:24 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] drm/panfrost: Add MT8188 support
Date: Tue,  4 Jun 2024 14:39:20 +0200
Message-ID: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
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

Changes in v2:
 - Fixed bindings to restrict number of power domains for MT8188's
   GPU to three like MT8183(b).

This series adds support for MT8188's Mali-G57 MC3.

AngeloGioacchino Del Regno (2):
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
  drm/panfrost: Add support for Mali on the MT8188 SoC

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 5 ++++-
 drivers/gpu/drm/panfrost/panfrost_drv.c                  | 9 +++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.45.1

