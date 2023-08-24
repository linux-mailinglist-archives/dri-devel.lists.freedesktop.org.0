Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5EF787595
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 18:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122410E025;
	Thu, 24 Aug 2023 16:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CF810E025
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 16:40:06 +0000 (UTC)
Received: from ginger.. (unknown [189.115.8.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F9916607276;
 Thu, 24 Aug 2023 17:40:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692895205;
 bh=J8b2QT9rrJ018sKXflFL3FjdhNbqyS9w7fXnjXrLUcM=;
 h=From:To:Cc:Subject:Date:From;
 b=ROoNObRj3jfoWAYldXHpGfSLSdoQL0iecq4jjC3aAMkDzvlfJf2j0KKhKC8dTCUXx
 JVmPBX4RUoJxu7m9UWOJwaMH6iyvO1lvxAEjYRyTpodLJovyHP7L8UjICJFSQzn5OL
 ko1+HLg9AfvzY3TfqoSsPeu9Dsuezfo5I5J0VgIQMRqY7oLkslDARqwOft+KNdMwzI
 WD+93mbT9JraJwmKrtxoROYdj3bb7jb6QPvcvqplnYg4TVozPi9nr8zYyfo0H/4YqG
 VVWUqSkwCHJNJEXPjDaFCc2oIAaw9AmDFz4py4LTA8WJE9bs9zgBaxm0j0M3eTyRON
 U8mgzqBI6QLww==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: ci: docs: fix build warning - add missing scape
Date: Thu, 24 Aug 2023 13:39:54 -0300
Message-Id: <20230824163954.47881-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
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
Cc: daniel.vetter@ffwll.ch, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warning:

Documentation/gpu/automated_testing.rst:55: WARNING: Inline emphasis start-string without end-string.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Patch for topic/drm-ci
---
 Documentation/gpu/automated_testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 1b87b802ac7f..469b6fb65c30 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -52,7 +52,7 @@ IGT_VERSION
 drivers/gpu/drm/ci/testlist.txt
 -------------------------------
 
-IGT tests to be run on all drivers (unless mentioned in a driver's *-skips.txt
+IGT tests to be run on all drivers (unless mentioned in a driver's \*-skips.txt
 file, see below).
 
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-fails.txt
-- 
2.34.1

