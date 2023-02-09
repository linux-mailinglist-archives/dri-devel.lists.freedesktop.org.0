Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798F6900C3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 08:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B500110E91E;
	Thu,  9 Feb 2023 07:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069D10E91E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 07:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=psI5wI9gulg2hiH2+9DDGUZ4DRwxGGa5fsXKxdqh1Cg=; b=3g9U85Y+r0o2gcjA02swU4ypiz
 iVUnPVL+xafRfDyqlHYIWtMGbpDO73/ENly4Dc97gdVPgmQ4tJV7p7+0tBdc5hGuVT6o1Bj9pgq7r
 Yf1qD6lWYUriWzONRRZ0PlcLc0N5eTeKYVe4n5FZ0ykc1GxnOPZo4ICLRjAiMIGucQj3RigrIZTWx
 t09YmW8T3Ait/CCp7066nS/wLLO/POduLE7k9hBw/CKp0VAfiMJngpVLa9pXzkjMgFkVWaoKluNw/
 kJTOd/YySTDitIMIIQDbRtZMM86o7BMmZA8MzezCg1TjTfV29W9coEafQT5+Uq1QSV/HLLRUIBPqP
 lRqoO+Zw==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pQ18B-000LPt-08; Thu, 09 Feb 2023 07:14:07 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/24] Documentation: fb: correct spelling
Date: Wed,  8 Feb 2023 23:13:41 -0800
Message-Id: <20230209071400.31476-6-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209071400.31476-1-rdunlap@infradead.org>
References: <20230209071400.31476-1-rdunlap@infradead.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct spelling problems for Documentation/fb/ as reported
by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/fb/sm712fb.rst |    2 +-
 Documentation/fb/sstfb.rst   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -- a/Documentation/fb/sm712fb.rst b/Documentation/fb/sm712fb.rst
--- a/Documentation/fb/sm712fb.rst
+++ b/Documentation/fb/sm712fb.rst
@@ -31,5 +31,5 @@ Missing Features
 ================
 (alias TODO list)
 
-	* 2D acceleratrion
+	* 2D acceleration
 	* dual-head support
diff -- a/Documentation/fb/sstfb.rst b/Documentation/fb/sstfb.rst
--- a/Documentation/fb/sstfb.rst
+++ b/Documentation/fb/sstfb.rst
@@ -73,7 +73,7 @@ Module insertion
 	  the device will be /dev/fb0. You can check this by doing a
 	  cat /proc/fb. You can find a copy of con2fb in tools/ directory.
 	  if you don't have another fb device, this step is superfluous,
-	  as the console subsystem automagicaly binds ttys to the fb.
+	  as the console subsystem automagically binds ttys to the fb.
        #. switch to the virtual console you just mapped. "tadaaa" ...
 
 Module removal
