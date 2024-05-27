Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178DB8CFCC6
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3307810E897;
	Mon, 27 May 2024 09:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SoLhD/G4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5200E10E897
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716801916;
 bh=AjVXj1OoeM119VTDcnK+q4iv8gMO2nea9gJqqFXcka4=;
 h=From:To:Cc:Subject:Date:From;
 b=SoLhD/G4q+46qWolyFE5jDNvHg1xik37vKcdsBjlxf28588SbHgzgtAdmgjqvz/zb
 Ai67IgeuACIJyaxzdIQ9xP5IRDVtZCgjF2V3NzTOj1+1lHQIdZ8hJ6HWp4HD8e2A7w
 bnziQxSRIwx4MyuPXLCpD/YHQeqeFGOiRXRePNrMffMY+H5gcLFUN60HBT2tyaa1bM
 jCf3yr45KS5yC1tO2pUksb1VrWW5RkfjnJ3nBt857ZeNQFd9znRR9PN/90OqXBwMoI
 KgEMboBylqWYtMfz9MMRD9PDGC9AE5X8R6FvRFgNyMp8dr1oCMOT5tk8KdHCMdPp6y
 wK0Rm7jtF4LQA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A021378203F;
 Mon, 27 May 2024 09:25:15 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] drm/panfrost: Add MT8188 support
Date: Mon, 27 May 2024 11:25:11 +0200
Message-ID: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
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

This series adds support for MT8188's Mali-G57 MC3.

AngeloGioacchino Del Regno (2):
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
  drm/panfrost: Add support for Mali on the MT8188 SoC

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c                  | 9 +++++++++
 2 files changed, 10 insertions(+)

-- 
2.45.1

