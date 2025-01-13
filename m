Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F668A0B69C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA38D10E666;
	Mon, 13 Jan 2025 12:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eizZpvEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398BF10E666
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:19:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D629F5C564F;
 Mon, 13 Jan 2025 12:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9A1C4CED6;
 Mon, 13 Jan 2025 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736770759;
 bh=F9fL/h+H387nru6m+oeMnAd4l+e1bTwumZ90iIseEC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eizZpvElYFgzKJJ9GM/FCYK8iQBEoYj81xHyxOdUEGZmC60HQ9fJKvALeUh/h5LkW
 Ckz2TqlJNovcaYq1tBa7hyW9k7zdl6pHbd0uvYzIcsyzUMDtUWgfiIV8BKQWH8MXS+
 AnQGB4ngYNdvgb2xTxy1QvTp4OUzB4KRw8cuh0al6vPaTZxVyJhlJHkW+Yv38o0g76
 52ssg/osTmkPH3kuPflCXcsYw81BlLulnAC9vQBRjj/UzWjdGn2bL2cLKnk93VstbZ
 ZL0wLTSjZVswE5Go463601VHCk+aquDnYZsT1NpKVJ6xr+HYCo05tDBXx0B3w0U6MG
 NyOAEy8lIRkwQ==
From: Philipp Stanner <phasta@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/2] MAINTAINERS: Add DRM GPU Scheduler reviewer
Date: Mon, 13 Jan 2025 13:18:51 +0100
Message-ID: <20250113121851.31382-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113121851.31382-1-phasta@kernel.org>
References: <20250113121851.31382-1-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Christian König is the original author of much of the scheduler's code
and, thus, well suited to do reviews.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa288ef20c59..f70e69bfc0c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7891,6 +7891,7 @@ DRM GPU SCHEDULER
 M:	Matthew Brost <matthew.brost@intel.com>
 M:	Danilo Krummrich <dakr@kernel.org>
 M:	Philipp Stanner <phasta@kernel.org>
+R:	Christian König <ckoenig.leichtzumerken@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.47.1

