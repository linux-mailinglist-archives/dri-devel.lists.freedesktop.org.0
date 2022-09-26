Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CAF5EAE92
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 19:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683ED10E10E;
	Mon, 26 Sep 2022 17:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C658510E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 17:50:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 421726106D;
 Mon, 26 Sep 2022 17:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D45C433D6;
 Mon, 26 Sep 2022 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664214601;
 bh=dfRtJrOyfuNQSb5O1EcqfWI5vVuj+fieEC5eUAhWmc8=;
 h=From:To:Cc:Subject:Date:From;
 b=bkPQBDeTCsHdEajVYrLXBe77kld1oJRz2kSXY3Q2mLgbZT8WphZhiuMVAskm+TQRh
 FJfgFYkPaQ9jZkjBVWbK2MOWWU5wKpjePreXNnu/vMa9xN52QnX2pP7fuMbB5S6FB9
 Frus2BsngarZ1Pm1nZ750LE2W6P2+UexwFzS7FMTxQGha0BFbb1saSN2Y2iLOgSX4W
 koWpNkVglVKiUpWqiQch/yw+FTt59djgSqmHt+c2nA2MiIDpe0T0apXWwY8cdtYY9O
 8IzdtOjlCR8dqcXjR3kElVzmyouasovHluzPjtyIowLMSAVIcwrTuSefB5mLydhRUI
 G1lNKNkq0Vpuw==
From: broonie@kernel.org
To: Dave Airlie <airlied@redhat.com>,
	DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Mon, 26 Sep 2022 18:49:50 +0100
Message-Id: <20220926174950.231288-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Alvin Lee <Alvin.Lee2@amd.com>, Lee@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c

between commit:

  58d97c99c99f4 ("drm/amd/display: Update MBLK calculation for SubVP")

from the drm-fixes tree and commits:

  41c81dcf59991 ("drm/amd/display: Update MBLK calculation for SubVP")
  5c1a431aaf52b ("drm/amd/display: Added debug option for forcing subvp num ways")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 1f195c5b3377d,417dfdcf95962..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c


