Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B25A39C5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5245110ED11;
	Sat, 27 Aug 2022 19:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0B710ED11
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=t63ek6wzn1sWs76eOsCuIOgWn2uP5FVAKK7B50IIh4U=; b=K7t3NDw3OclQKkVe6WtTNwQyKi
 svTVu5fXZrvNG3JQT/z0IU8aUNhm88NQaBz0oMVZblr8jLDbCcdRlt+y8czWf3YtGaJ9pdmsq2/X7
 MYlxCsStEwCzdroDqzVPVKzBPFUbw/Cm8FdJ9Wry4FRuofNpPceo4LCcMxfcqN/nfCU9Xnpvczl/1
 u0NtcyW59F8sQpWchIwmRXqkrVd3mxnWeQYK5SfqR/sGpa6maUW6BiVQ2c2rP73GwMr3lWx/rgbqO
 ICtBIQAGuL8sF29MQKtKXe0Ba7NkJJgUB0R7Q5CG9Nv8pu6GfBVXdTZiHJPoPVnPD6P3cF9iX1S6l
 JuKg+G0A==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oS1eV-001eoZ-3M; Sat, 27 Aug 2022 19:39:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: fb: udlfb: clean up text and formatting
Date: Sat, 27 Aug 2022 12:39:25 -0700
Message-Id: <20220827193925.19612-1-rdunlap@infradead.org>
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
 dri-devel@lists.freedesktop.org
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
---
 Documentation/fb/udlfb.rst |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

--- a/Documentation/fb/udlfb.rst
+++ b/Documentation/fb/udlfb.rst
@@ -86,17 +86,21 @@ Module Options
 Special configuration for udlfb is usually unnecessary. There are a few
 options, however.
 
-From the command line, pass options to modprobe
-modprobe udlfb fb_defio=0 console=1 shadow=1
+From the command line, pass options to modprobe::
 
-Or modify options on the fly at /sys/module/udlfb/parameters directory via
-sudo nano fb_defio
-change the parameter in place, and save the file.
+  modprobe udlfb fb_defio=0 console=1 shadow=1
+
+Or modify options on the fly at /sys/module/udlfb/parameters directory via::
+
+  sudo nano fb_defio
+  change the parameter in place, and save the file.
 
 Unplug/replug USB device to apply with new settings
 
-Or for permanent option, create file like /etc/modprobe.d/udlfb.conf with text
-options udlfb fb_defio=0 console=1 shadow=1
+Or for permanent options, create a file like /etc/modprobe.d/udlfb.conf
+with text::
+
+  options udlfb fb_defio=0 console=1 shadow=1
 
 Accepted boolean options:
 
