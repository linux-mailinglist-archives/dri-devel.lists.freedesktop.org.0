Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF956D3A7DB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF12C10E420;
	Mon, 19 Jan 2026 12:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hCTpfTKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF4510E409;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 19D7F443E3;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE43EC2BC86;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824316;
 bh=EvzMyaM5H9x2cdY7aG4hx2yahivm2IErGiiDZ+0Gw88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hCTpfTKxH0DGzVRPmdKdiK5e/RfGOYHTECK5WOOWL7r9JIR7CEADDA+mTwhjfo2p2
 pkMaHVsA9T1mBYb0zjSsgr7OEn3ZLUn++4ro1UfgJxPEgRz1LEV4enYmrU+MmWkb7a
 FN7oVaNa45pBk4dOpJ/v/7SxVX6ujn+7ZjhmXM+/Vhl2AI9eQdNNPZInJODieYedYq
 rmnleEskBEZ6EyG5EGb0Og7vOvSDI1LQQH++QXKMNTL1yEqDzcImoeFPGQP3iuaHu8
 2xGBctAFKc0tRFdCoaQ4KImKPoERLLr2uyPQdyqJOFKPlHur/ot9rXTpizNyGbqyBb
 K7EKm8trcFpug==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001Zjd-41eG; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 8/9] docs: kdoc: improve description of MsgFormatter
Date: Mon, 19 Jan 2026 13:05:03 +0100
Message-ID: <94269990e2d665bec08a1b6f4d28d84939cb9d83.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The description there is quite vague. Make it clearer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kernel-doc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/docs/kernel-doc b/tools/docs/kernel-doc
index 902397804e80..aed09f9a54dd 100755
--- a/tools/docs/kernel-doc
+++ b/tools/docs/kernel-doc
@@ -182,7 +182,10 @@ return 0 if there are issues at kernel-doc markups;
 """
 
 class MsgFormatter(logging.Formatter):
-    """Helper class to format warnings in a similar way to kernel-doc.pl."""
+    """
+    Helper class to capitalize errors and warnings, the same way
+    the venerable (now retired) kernel-doc.pl used to do.
+    """
 
     def format(self, record):
         record.levelname = record.levelname.capitalize()
-- 
2.52.0

