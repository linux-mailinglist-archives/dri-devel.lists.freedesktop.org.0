Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C52A5A3F6F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 21:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8545710EFAF;
	Sun, 28 Aug 2022 19:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBEB10EFAF
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=zAHYVCWMSa2GkiBj19jjzwY2RqRsZ7LJnQxJnAPq1zg=; b=P8V23faQAMfvwOClKJ6XIrXpzc
 KjvzHK7UOfyVy5euPzpRpwmPhLitNhoO1U1LzN8AITpRZSZbQbMW7NV05FfFcuPV0YVfaEnH8mjCS
 gzTsXoBKPMZ6s2VWNGXcID7GDzzv7T/aEIRQcu5I7YrNv0QbqwehoYqNevXumHr2RlVN8YWn+FrPf
 DPyFU/tqyX8J9yYsmm40FlH9uyGArTnvcwKOo+EXSkluSDpx3S6g7ncmDSd7Y0fzAD7WHJQNQLli0
 AO6xPgDTmdR4cq3W7cThLVs1WfS89quANJpwPMk0IzC1LuAPO+reGc8QqcZr07E8rA/Nh0XCFSVg1
 s4NeraQQ==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oSNu7-002SHO-D7; Sun, 28 Aug 2022 19:25:07 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: fb: udlfb: clean up text and formatting
Date: Sun, 28 Aug 2022 12:25:01 -0700
Message-Id: <20220828192501.14232-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.2
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
Cc: linux-fbdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, Bernie Thompson <bernie@plugable.com>,
 dri-devel@lists.freedesktop.org, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up punctuation, spelling, and formatting for command line usage
and modprobe config file usage in udlfb.rst.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bernie Thompson <bernie@plugable.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Helge Deller <deller@gmx.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
---
v2: use some text suggestions from Bagas Sanjaya (Thanks);
    add a '.' at the end of a sentence.

 Documentation/fb/udlfb.rst |   23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

--- a/Documentation/fb/udlfb.rst
+++ b/Documentation/fb/udlfb.rst
@@ -86,17 +86,24 @@ Module Options
 Special configuration for udlfb is usually unnecessary. There are a few
 options, however.
 
-From the command line, pass options to modprobe
-modprobe udlfb fb_defio=0 console=1 shadow=1
+From the command line, pass options to modprobe::
 
-Or modify options on the fly at /sys/module/udlfb/parameters directory via
-sudo nano fb_defio
-change the parameter in place, and save the file.
+  modprobe udlfb fb_defio=0 console=1 shadow=1
 
-Unplug/replug USB device to apply with new settings
+Or change options on the fly by editing
+/sys/module/udlfb/parameters/PARAMETER_NAME ::
 
-Or for permanent option, create file like /etc/modprobe.d/udlfb.conf with text
-options udlfb fb_defio=0 console=1 shadow=1
+  cd /sys/module/udlfb/parameters
+  ls # to see a list of parameter names
+  sudo nano PARAMETER_NAME
+  # change the parameter in place, and save the file.
+
+Unplug/replug USB device to apply with new settings.
+
+Or to apply options permanently, create a modprobe configuration file
+like /etc/modprobe.d/udlfb.conf with text::
+
+  options udlfb fb_defio=0 console=1 shadow=1
 
 Accepted boolean options:
 
