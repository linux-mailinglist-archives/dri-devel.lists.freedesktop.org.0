Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683267487F0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2D510E38E;
	Wed,  5 Jul 2023 15:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253BC10E38E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:26:26 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by laurent.telenet-ops.be with bizsmtp
 id HTSR2A00945Xpxs01TSRp7; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Ob-000ck3-Ma;
 Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Of-00AwXT-8R;
 Wed, 05 Jul 2023 17:26:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 0/3] Add support for DRM_FORMAT_NV{24,42}
Date: Wed,  5 Jul 2023 17:26:14 +0200
Message-Id: <cover.1688570702.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series adds support for semi-planar YUV formats with
non-subsampled chroma planes.

It has been tested with the shmob_drm driver on the R-Mobile A1-based
Atmark Techno Armadillo-800-EVA development board.

Thanks for your comments!

Geert Uytterhoeven (3):
  util: Add NV24 and NV42 frame buffer formats
  util: Add pattern support for DRM_FORMAT_NV{24,42}
  modetest: Add support for DRM_FORMAT_NV{24,42}

 tests/modetest/buffers.c | 20 ++++++++++++++++++++
 tests/util/format.c      |  2 ++
 tests/util/pattern.c     |  4 ++++
 3 files changed, 26 insertions(+)

-- 
2.34.1

