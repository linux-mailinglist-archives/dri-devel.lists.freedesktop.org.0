Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B96A6772BD
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 22:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE81D10E2E1;
	Sun, 22 Jan 2023 21:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA20710E2E1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 21:36:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A62EB80B59;
 Sun, 22 Jan 2023 21:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7E3C433D2;
 Sun, 22 Jan 2023 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674423415;
 bh=+kFCj2QmQqaqkQtiLOFfyT0VJOQjHQOx/aIvyvGdoLs=;
 h=From:To:Cc:Subject:Date:From;
 b=qdLvj6w6684w6d/X9zYg2BFZL54G4t/TuI0Ru07Dj8kOCPAVoymyXtBQGBX0RPJgO
 vFWVq0fHA9L+aPQE+N5MOg+6YTtOcP4dTjZmtyPALYNYrzyNnIhD9D4Cg+s1dLoWRn
 MTJ0fd1Mc4eMZu8t+o6Ry0xiUg+4vXPCoYAc9LUiLo09CPpbxmYMwjiHz020m3S/KF
 r0/s0x+hi+U9rpO1ef709JJU1EFLq9kdQwc68nhiBS1+PYEhvp8sB6o3uWPwvR8rBs
 YtF0hwHJxaiHHqqishvWLDP0UhZxVIOo4CWWoXdjGwNsbqYkC59+fkVed2OcOVwT1C
 rPI2g6AG2BcFw==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/8] Docs: Add missing SPDX license identifiers of
Date: Sun, 22 Jan 2023 21:36:42 +0000
Message-Id: <20230122213650.187710-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-mm@kvack.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 SeongJae Park <sj@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some subsystem documents are missing SPDX license identifiers on index
files.  This patchset adds those.

Changes from v1
(https://lore.kernel.org/lkml/20230114194741.115855-2-sj@kernel.org/)
- Separate from index file content changes
- Separate patch for each subsystem doc (Alex Deucher)
- Use MIT license for gpu (Alex Deucher)

SeongJae Park (8):
  Docs/crypto/index: Add missing SPDX License Identifier
  Docs/driver-api/index: Add missing SPDX License Identifier
  Docs/gpu/index: Add missing SPDX License Identifier
  Docs/hwmon/index: Add missing SPDX License Identifier
  Docs/input/index: Add missing SPDX License Identifier
  Docs/mm/index: Add missing SPDX License Identifier
  Docs/scheduler/index: Add missing SPDX License Identifier
  Docs/sound/index: Add missing SPDX License Identifier

 Documentation/crypto/index.rst     | 2 ++
 Documentation/driver-api/index.rst | 2 ++
 Documentation/gpu/index.rst        | 2 ++
 Documentation/hwmon/index.rst      | 2 ++
 Documentation/input/index.rst      | 2 ++
 Documentation/mm/index.rst         | 2 ++
 Documentation/scheduler/index.rst  | 2 ++
 Documentation/sound/index.rst      | 2 ++
 8 files changed, 16 insertions(+)

-- 
2.25.1

