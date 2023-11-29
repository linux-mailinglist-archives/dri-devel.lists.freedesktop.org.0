Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AD7FD692
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1143710E536;
	Wed, 29 Nov 2023 12:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C31210E536
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:19:31 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BE0426607326;
 Wed, 29 Nov 2023 12:19:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701260370;
 bh=XPqb5JshYNquGPkJGWY0HezlshvZancOV1Y08nA8CYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CvOBtgyaHioy9cuADbv5R52hqXzjAP6cvOJry63R7jsCOKHTBGchyto83ojeFKwwc
 CSN/82xQ6AtamhXf5OZFA1EAQHnxOP8FcDeWA4kZBH9khBgZ159iLfJ/XfQJ4hxDJN
 vtNHkmeKWkukAUFB9tJyIHES7LevAq0IIjfjABewYpCGeCvAWRqY2Cs6L2f7BCyjRV
 zBHtJkuY8t78GXfQMKVQZgUC1Fi2l0skQZlm2HgxPjhtBFJ5FBJp/f8MO5N2ZEg1Qa
 oXV/vJtFK1Y5V5XSFzPVR3RHCpQ2EeLiTa18AXJiiAIwvNics+lU6X+jb9EPXYDfYZ
 3aGfOJeGQNMyw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v6 09/10] drm/doc: ci: Add IGT version details for flaky tests
Date: Wed, 29 Nov 2023 17:48:40 +0530
Message-Id: <20231129121841.253223-10-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the IGT version in the flaky tests reporting template.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - Added a new patch in the series to update drm ci documentation

---
 Documentation/gpu/automated_testing.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 240e29d5ba68..2d5a28866afe 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -69,14 +69,15 @@ the result. They will still be run.
 
 Each new flake entry must be associated with a link to the email reporting the
 bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, and an approximation of the
-failure rate.
+the board, the first kernel version affected, the IGT version used for tests,
+and an approximation of the failure rate.
 
 They should be provided under the following format::
 
   # Bug Report: $LORE_OR_PATCHWORK_URL
   # Board Name: broken-board.dtb
-  # Version: 6.6-rc1
+  # Linux Version: 6.6-rc1
+  # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
-- 
2.40.1

