Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3E7D070F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 05:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D4110E57F;
	Fri, 20 Oct 2023 03:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FE510E580
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 03:42:50 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:8302:9b9b:d59b:1681])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 438BD660734F;
 Fri, 20 Oct 2023 04:42:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697773368;
 bh=J/05EHEanGm0FKJy5r1e6byK6E7i3PXK9ybEm42W1rM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gfq/Bt6RPsw03QJinuDfXdH9ViYHkQ/YUY8Ofx6C8jRaYJoLFcQDqZUd47CDqJmB1
 Nl0kMt+bJyMAOdfAhk6kq5JNTZGdcOyihBEEDUQfOJbZefz7I3bY2myqnt3Yx5Y/os
 YtqBt/wHqCelxlQg1ATkNxX5lfDR9jgrb/Q5W7JAvXGm4evwwGo1oJy0dTBZ4hXpVV
 z0sEZjNQamLCjj5Fe4/39VolCi1RXLHESJYFCgRoNxBjjyu+stX896U+rHiPB9pHLo
 l7c+zxz4gtLXVSxDpm+AohP5u4AFNHVxg5jt5pIwFftRgSyRKFuqnHgElYhwmPDmVE
 r0XpZh8D+RNSg==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 9/9] drm/ci: docs: add step about how to request privileges
Date: Fri, 20 Oct 2023 00:41:24 -0300
Message-Id: <20231020034124.136295-10-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020034124.136295-1-helen.koike@collabora.com>
References: <20231020034124.136295-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, linux-doc@vger.kernel.org,
 vignesh.raman@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clarify the procedure developer must follow to request privileges to
run tests on Freedesktop gitlab CI.

This measure was added to avoid untrusted people to misuse the
infrastructure.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>
---

v2:
- fix typo in commit message
---
 Documentation/gpu/automated_testing.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 469b6fb65c30..8ec1878b44ab 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -86,10 +86,13 @@ https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the
 CI/CD configuration file from .gitlab-ci.yml to
 drivers/gpu/drm/ci/gitlab-ci.yml.
 
-3. Next time you push to this repository, you will see a CI pipeline being
+3. Request to be added to the drm/ci-ok group so that your user has the
+necessary privileges to run the CI on https://gitlab.freedesktop.org/drm/ci-ok
+
+4. Next time you push to this repository, you will see a CI pipeline being
 created (eg. https://gitlab.freedesktop.org/janedoe/linux/-/pipelines)
 
-4. The various jobs will be run and when the pipeline is finished, all jobs
+5. The various jobs will be run and when the pipeline is finished, all jobs
 should be green unless a regression has been found.
 
 
-- 
2.39.2

