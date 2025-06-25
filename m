Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A672AE879D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A0410E758;
	Wed, 25 Jun 2025 15:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aSvlWe/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0AD10E758
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6ABC55C4A51;
 Wed, 25 Jun 2025 15:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A67C4CEEA;
 Wed, 25 Jun 2025 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750864480;
 bh=tSWCU5y49XiL1c3oWIxdBzIvWyn6Jye02tKZZJ8ztdE=;
 h=From:Subject:Date:To:Cc:From;
 b=aSvlWe/dTnG25YAeE5DLuWI8VfxXVzW3rcVZYqVIzWutKLXOE17Sap4Khh1nm2ku9
 VUmcI+0WZvFoJe0q7xGyVci3HnHFO8BYdPllQdlJR68RTWZy8UEGB3pB9Bk6wJmqSL
 UwCSBErucsJJtDKpv1RNieHcWYMBEUNNsT93oohJnFqmQCcA6EW5zQ4TiHnLJ4uIpV
 f7Xb9XFVkVVKD5Mh7xR/K9n6CCe0KDOIwIh7BGzIfWdQIeHfiuLgO7RZB5ZwYxFE9b
 SKt6d2ESZnMxEhZL7cABJpxAjuk83Kkoba3NrBdvo9WBBxPxfTpc+9+rtxQe3ImpT+
 m5UCOjLU7oZpQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/3] drm/tests: edid: Improve our kunit EDIDs
Date: Wed, 25 Jun 2025 17:14:34 +0200
Message-Id: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFoSXGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3ZSiXN3SgpTEklTd1JTMFF1TS4NkYwuLpFTz5CQloK6CotS0zAq
 widGxtbUA8Oe4AmEAAAA=
X-Change-ID: 20250625-drm-update-edid-590c388be7cb
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=690; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tSWCU5y49XiL1c3oWIxdBzIvWyn6Jye02tKZZJ8ztdE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkxQjGffpV+2sPWWjNTPC9oMf/llxeZg+O91JgmPOPe5
 bvleVxxx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIZAdjfem1JxsVGSLUT95f
 32LXKdJq6cvZfD0+t4Evcp3zrpNF16dOCz4jmqm99MqzhOsSSyynM9aXzCw9Kb011LLh0ayHeVO
 m5nJzrGTisPu0q9LVup/9yo0LdyYcsfp3fYWUucT5V+slzukCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi, 

Here's a series fixing a few issues I found looking into our kunit EDIDs
some more.

Let me know what you think,
Maxime 

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (3):
      drm/tests: edid: Fix monitor range limits
      drm/tests: edid: Update CTA-861 HDMI Vendor Specific Data Block
      drm/tests: edid: Add edid-decode --check output

 drivers/gpu/drm/tests/drm_kunit_edid.h | 142 ++++++++++++++++++++++-----------
 1 file changed, 94 insertions(+), 48 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250625-drm-update-edid-590c388be7cb

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

