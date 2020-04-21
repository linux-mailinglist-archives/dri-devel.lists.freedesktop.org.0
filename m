Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095881B3843
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE5F6E9CA;
	Wed, 22 Apr 2020 06:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8E6E34A;
 Tue, 21 Apr 2020 23:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7zVefyS4upAL+bCgFh2rk2xHhMXCXvuF8sDvDJdBc+Q=; b=p6EV4EsYVjbMCvtqpLFwIXFBFo
 P3QaMRiq5e1BckUzI1YYuSD+slL4GbOzR/kp14+Akf1BN7PcuRGMQJKMKibzu7KyrE8qC+2bchne4
 gbyI3rvUfljwWjDfZW1TRgriZ6fOigwjH71PpcxVG+gEen9vhMkEfnlCShN87nHStZsQ89HSf2kKm
 ux5YDi3kUQ4M4r3bpQX63p7qDgTkr5et5NPrTwXaOwfaHiZ7Ri8CDsMvukR/vKU8CAaxzTjJWxzYc
 oCm5M9pe/23E3o2FMXWE5bhZh2GmjtO49E+OLz3A4MkD3MmdZsasZgmDWUvXkqcYXS4wdLgZ2J1fI
 95J+9zXQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR2Ow-0000A9-Cw; Tue, 21 Apr 2020 23:34:02 +0000
To: dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: amd/display: fix Kconfig help text
Message-ID: <31d56a46-e3de-e768-a154-03b6afb3ad72@infradead.org>
Date: Tue, 21 Apr 2020 16:34:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix help text: indent one tab + 2 spaces; end a sentence with a
period; and collapse short lines of text to one line.

Fixes: 23c61b4599c4 ("drm/amd: Fix Kconfig indentation")
Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/amd/display/Kconfig |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

--- linux-next-20200421.orig/drivers/gpu/drm/amd/display/Kconfig
+++ linux-next-20200421/drivers/gpu/drm/amd/display/Kconfig
@@ -21,16 +21,12 @@ config DRM_AMD_DC_HDCP
 	bool "Enable HDCP support in DC"
 	depends on DRM_AMD_DC
 	help
-	 Choose this option
-	 if you want to support
-	 HDCP authentication
+	  Choose this option if you want to support HDCP authentication.
 
 config DEBUG_KERNEL_DC
 	bool "Enable kgdb break in DC"
 	depends on DRM_AMD_DC
 	help
-	  Choose this option
-	  if you want to hit
-	  kdgb_break in assert.
+	  Choose this option if you want to hit kdgb_break in assert.
 
 endmenu

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
