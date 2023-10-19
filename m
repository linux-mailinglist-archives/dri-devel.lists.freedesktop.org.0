Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01D7CF444
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 11:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB39A10E4AB;
	Thu, 19 Oct 2023 09:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A0C10E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 09:46:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8D17CE2A7B;
 Thu, 19 Oct 2023 09:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B31C433C8;
 Thu, 19 Oct 2023 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697708777;
 bh=imPQaZSo4/5PveWRSHBSOIL71eT83rBtNCC3QLRGEvc=;
 h=From:To:Cc:Subject:Date:From;
 b=KrsugNSgqYlPKG+VRyPClkrhR+Zk4RysJw58hAxbhUSJwPzYu0Tey1Okm6cHs/tQZ
 JM1FWhYjEVjNwNReCTcr9jNzPVrkiW+hdUqnPNnYnXYo99tcxMu3bZvRYiXUUuC0/A
 2H2YQrhNGzegXc0yAvrbwZ8WV5JXMZC3SMIbFn9DH1+bXRGVbBDdNYPk5u3BoZbLJc
 s+uL2XI/MmLahQHGI7iEGX1bWtZsu0jrG6ceNSdeBkIw6jw4OFij5x8ZB6TrLPpMMR
 zroTcgBEcYxA1zO/FyVh4X8OH1tnMYuDTqC4bNaue3PpWLbGF0L8uyDAvi0FfIZk5e
 G6wLZf6Zu13Gg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/doc: ci: Require more context for flaky tests
Date: Thu, 19 Oct 2023 11:46:09 +0200
Message-ID: <20231019094609.251787-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flaky tests can be very difficult to reproduce after the facts, which
will make it even harder to ever fix.

Let's document the metadata we agreed on to provide more context to
anyone trying to address these fixes.

Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/automated_testing.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 469b6fb65c30..2dd0e221c2c3 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -67,6 +67,19 @@ Lists the tests that for a given driver on a specific hardware revision are
 known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
+Each new flake entry must be associated with a link to a bug report to
+the author of the affected driver, the board name or Device Tree name of
+the board, the first kernel version affected, and an approximation of
+the failure rate.
+
+They should be provided under the following format::
+
+  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Board Name: broken-board.dtb
+  # Version: 6.6-rc1
+  # Failure Rate: 100
+  flaky-test
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.41.0

