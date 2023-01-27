Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FD67DD8F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 07:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAC610E15F;
	Fri, 27 Jan 2023 06:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97C910E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=psI5wI9gulg2hiH2+9DDGUZ4DRwxGGa5fsXKxdqh1Cg=; b=GDSHyuSnwmRwrzcgo52Fxr4lGG
 qW8sH5zwfWGtGUCulyKTh/GX4iwb7tPDP0O1mbJHGWuCLnbLunf5DE8bD52L0uSSCaFOuYWaSNA2M
 xr1sE7w4E8fn9VTms7kPgWDrLMIqGbacYcDYAVWaLdvrzqCrUt/e0WsBOdHfM4x8wG6g12Bc9HxPU
 VWf4OtBtsNWGsLTUIPCmtXWeigeLSB+zPx5O7fCBLIbK3P8XNWkYkWSZVR1RdaaqH5hZVsCzneZOD
 jVowP26GzY6Voj783BeEA9ykRKlkSjjoVh/9ENT1Q7LMpjlQWjhIdJ7lC2q2xmDMgJsz0gUiwNtqc
 oINmJDiw==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pLIPE-00DM0u-KO; Fri, 27 Jan 2023 06:40:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/35] Documentation: fb: correct spelling
Date: Thu, 26 Jan 2023 22:39:37 -0800
Message-Id: <20230127064005.1558-8-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
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
