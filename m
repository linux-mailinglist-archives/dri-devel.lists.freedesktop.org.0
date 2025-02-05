Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FDA28570
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 09:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E67510E753;
	Wed,  5 Feb 2025 08:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b690HBL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3837F10E747
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738743441;
 bh=IuOxI/ygHiJ4+esRB4KPb824pwCYUZ+ubtGSSeOB49g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b690HBL0Y58AYX8OZ+w0KvHB0iE9/an3YndS61YkZzLOv/X4sEo2LrpscRhGTNDfV
 9he71z23AT3JRlSGt1M/aWOBjpD/zMq0sMn+Le1+MqrldNXxLT4iEFaTYGvNlsXZt5
 iwQw/dF6BrrlPyfia6xF19nVROkMP+hQCpcuB3FxhEkB9teOw1GljVdURD+aEVKW6f
 KOkx97qug9ZYvZ/NcWD60zIDxu2FqNNEJRWFbEq4WRV9GYqyzP2JKn/xvyJwDjFlWk
 LteKtmZmrEjpRI6JHnnm9aY1gqdxkvplahnTjn5ETPRO441ug4VAKae/JPDuXVqoqL
 ZSL3N0F6ydZMg==
Received: from localhost.localdomain (unknown [171.76.83.215])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0750C17E0DD8;
 Wed,  5 Feb 2025 09:17:18 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/ci: update expectation files
Date: Wed,  5 Feb 2025 13:46:48 +0530
Message-ID: <20250205081652.1928927-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205081652.1928927-1-vignesh.raman@collabora.com>
References: <20250205081652.1928927-1-vignesh.raman@collabora.com>
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

Update expectation files for the mesa uprev.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - New commit in v2.

---
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 85647eca4e55..6ebcc7d89fbd 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -13,6 +13,8 @@ kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
-- 
2.43.0

