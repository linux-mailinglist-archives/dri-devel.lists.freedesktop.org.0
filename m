Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF21A0B69B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2491710E662;
	Mon, 13 Jan 2025 12:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HexdmL0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7710E662
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:19:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B17E85C3EFF;
 Mon, 13 Jan 2025 12:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C396EC4CEDD;
 Mon, 13 Jan 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736770756;
 bh=YqdktbBo+5ZgVspVWNNkMAMs40aG+J2NhoLDvxlVHQY=;
 h=From:To:Cc:Subject:Date:From;
 b=HexdmL0AAD+9dt9UBdbGYelsBKMT/RJZEsk8gE+HwCup7olVaUPV4Jz28/PS0uldP
 UBIbWdRKw/0/AAaYeO9Mqh5ANQyhL1EC7cH1AX1vkGnBlHAmJlyoNy94lTJIcF6JqV
 WxgDZ3jgCHJHb2iB/uFrw3bJf5eycpkaxdJVzEs11PDg2wz2Fj1J+8zmM9GAK0MS3R
 aL9K/jVVSh0u5OkFu3YxSH2MW0rmOuLhQdcRdeveAN/XtFSia12IWxR4luHm3TCBSI
 SxH5P16qXl6fBQGKEbrZ/S1xYWMF0ZMt1yqmm4fsTm/+lcND7eIpuI99JrNr6oHTAy
 4rQU1Um7GN0WA==
From: Philipp Stanner <phasta@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] MAINTAINERS: Update DRM GPU Scheduler section
Date: Mon, 13 Jan 2025 13:18:50 +0100
Message-ID: <20250113121851.31382-1-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
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

Luben has not been active and has not responded to mails since summer
2024. Remove him from MAINTAINERS and add an entry in CREDITS.

Philipp has a new email address and an ACK to commit work time to the
scheduler. Thus, set the state to 'Supported'.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 5 ++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index cda68f04d5f1..1593ada4209c 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3948,6 +3948,10 @@ S: 1 Amherst Street
 S: Cambridge, Massachusetts 02139
 S: USA
 
+N: Luben Tuikov
+E: Luben Tuikov <ltuikov89@gmail.com>
+D: Maintainer of the DRM GPU Scheduler
+
 N: Simmule Turner
 E: sturner@tele-tv.com
 D: Added swapping to filesystem
diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26..fa288ef20c59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7888,12 +7888,11 @@ F:	Documentation/gpu/zynqmp.rst
 F:	drivers/gpu/drm/xlnx/
 
 DRM GPU SCHEDULER
-M:	Luben Tuikov <ltuikov89@gmail.com>
 M:	Matthew Brost <matthew.brost@intel.com>
 M:	Danilo Krummrich <dakr@kernel.org>
-M:	Philipp Stanner <pstanner@redhat.com>
+M:	Philipp Stanner <phasta@kernel.org>
 L:	dri-devel@lists.freedesktop.org
-S:	Maintained
+S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/scheduler/
 F:	include/drm/gpu_scheduler.h
-- 
2.47.1

