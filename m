Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07D4946F40
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 16:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865210E0B8;
	Sun,  4 Aug 2024 14:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="MAAaukYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de
 [129.70.45.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC40C10E0B8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1722779896;
 bh=zH6zcpfQzEPY42kyNiFsf91oqYp3C8QfOhOqkV9IZaQ=;
 h=From:To:Cc:Subject:Date:From;
 b=MAAaukYpINGq93j7et+GA+DZ0I+lLcKwSxb6j8XbwvpWLajTt1SStkn2NQGMXkTSV
 V42gC57n+/J8HXR7LhT54MhcpRMV/3NrFjjB0ZxU9bhc9MFRfUP/9r6ASN6hoFB+oS
 1Ccr6W+sTam+c7TlZQeUWdS+uyZK58FLQ/U14BcgKv0YA6sAFB/Y7gJSQc/GtV1n32
 zXHgkr8AQ+OP9aixMvod7zpglO7c8rVnHfjdlzkETOON3KMECfZVqLbmNRjrkzwD+X
 HEmszSwgkveKSBSYxV+4UHnIqMsPim9AsrAx673fTkP+cyS8SDqdVuQQ6a53yWhjzw
 ZxReSFxHnP8UQ==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id 88D4820793;
 Sun,  4 Aug 2024 15:58:16 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/3] drm/amd: some trivial fixes
Date: Sun,  4 Aug 2024 15:56:26 +0200
Message-ID: <cover.1722778722.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.2
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

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Nothing serious here, just some bits I noticed when reading code.

Tobias Jakobi (3):
  drm/amd: Make amd_ip_funcs static for SDMA v5.0
  drm/amd: Make amd_ip_funcs static for SDMA v5.2
  drm/amdgpu/swsmu: fix SMU11 typos (memlk -> memclk)

 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c                  | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h                  | 1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c                  | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h                  | 1 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 ++--
 6 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.44.2

