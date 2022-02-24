Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2DF4C3165
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 17:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A2F10E9A0;
	Thu, 24 Feb 2022 16:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E459110E9A0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 16:33:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFE0061986;
 Thu, 24 Feb 2022 16:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB975C340EC;
 Thu, 24 Feb 2022 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645720432;
 bh=Jx798Ph8I20XDqm7nN7xiXbSKh34Ido96y5BYrAeLHI=;
 h=From:To:Cc:Subject:Date:From;
 b=NSMN9NNieFOK4ayCzXWROSzX5iLWj1SLOrkaoxNkcEaChvcHP3sybgHfl4yzSa7oR
 CsvGfO7Zgs/3UwY2VCEOOYCRW2dn1GOkrnkwz2zrsNBRbia+zmih+qVDZSI/j5GJUx
 pEmOdeSECTORe3n1sHoEmN1pjG9lSI+mQma+yrUwF7ZeEse84h0l0dUlyX1163iixS
 kFFZ2nEGLnZTpRmddl4U4rEA0F4JCV2mJ1kXiWxOVfDlih/Ao4H6OjKD/BTs1oHVIU
 5v8KTJKW7GbHorm6XHMjQ4RQy1siXduEr/AsfKhD15IFSl4mqXPF4ezp2wTVYzo/T4
 vsO/jPhJjZY0w==
From: broonie@kernel.org
To: Dave Airlie <airlied@linux.ie>,
	DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Thu, 24 Feb 2022 16:33:48 +0000
Message-Id: <20220224163348.3751461-1-broonie@kernel.org>
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
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/core/dc_resource.c

between commit:

  3743e7f6fcb93 ("drm/amd/display: Fix stream->link_enc unassigned during stream removal")

from the drm-fixes tree and commits:

  6d33f0e820bfb ("drm/amd/display: Fix stream->link_enc unassigned during stream removal")
  d9eb8fea6862e ("drm/amd/display: Drop DCN for DP2.x logic")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 18757c1585232,19b56f9acf84e..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c

[Used drm version]
