Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92E8C6A76
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 18:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DF210E524;
	Wed, 15 May 2024 16:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HMuQsBPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2713F10E35D;
 Wed, 15 May 2024 16:22:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 396FE614E5;
 Wed, 15 May 2024 16:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D031C4AF07;
 Wed, 15 May 2024 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715790153;
 bh=/DDr0YT9qTvIH8iY/nkjsMi+kyIIH9WChrEk5EOyyhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HMuQsBPVFE9G3d5i5R0ExhGgGiXVCJ/s2Y1he2/H+0JkCz80s/dSst6Sq+7MLFzlN
 T54HdhZdqTPIOL3ELWxuo/FYCYv7pue4M/xZ+Y9UsWNcqaV9e+x0JAvON47oOE2HnK
 ZyM08aasJNuuQgsWi8vt7l/vpSd0W4Nb9o+b1bgnW+Wi2QhAVHg6v4Ol23oG0CNXVD
 22BnXdUzw7Yyu08u5Hs7pwde0h846B6tyFfXzQ1VPoku34uKxDyB4x2PJ4MK0PgEI9
 LqJ0GixpowXUDbVM4HK2Vpg7LNlzTGS5XnSPVd0RQ9aG4pdCKBbvAikH0unHIZGWAF
 k/ZX6wf9wb6XA==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Ofir Bitton <obitton@habana.ai>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] MAINTAINERS: Change habanalabs maintainer and git repo
 path
Date: Wed, 15 May 2024 19:22:21 +0300
Message-Id: <20240515162222.12958-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515162222.12958-1-ogabbay@kernel.org>
References: <20240515162222.12958-1-ogabbay@kernel.org>
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

Because I left habana, Ofir Bitton is now the habanalabs driver
maintainer.

The git repo also changed location to the Habana GitHub website.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index abd4dbe2c653..5bd45a919aff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9431,11 +9431,11 @@ S:	Maintained
 F:	block/partitions/efi.*
 
 HABANALABS PCI DRIVER
-M:	Oded Gabbay <ogabbay@kernel.org>
+M:	Ofir Bitton <obitton@habana.ai>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 C:	irc://irc.oftc.net/dri-devel
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
+T:	git https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git
 F:	Documentation/ABI/testing/debugfs-driver-habanalabs
 F:	Documentation/ABI/testing/sysfs-driver-habanalabs
 F:	drivers/accel/habanalabs/
-- 
2.34.1

