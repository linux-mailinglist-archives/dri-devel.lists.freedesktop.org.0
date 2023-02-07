Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5767468DE1F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 17:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B9910E56B;
	Tue,  7 Feb 2023 16:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 589 seconds by postgrey-1.36 at gabe;
 Tue, 07 Feb 2023 09:48:10 UTC
Received: from mr85p00im-ztdg06011901.me.com (mr85p00im-ztdg06011901.me.com
 [17.58.23.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5741210E4B7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1675762700;
 bh=uy/u/jBsLuDEhP7DZbXSmCIaVmd50OFJVFk6lVxCMTQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=IdNaGH+xWpP+bEltJRBGwq59N1vzX3jRcn7IhWiCvXkemsmknYb+6kk0LZu5kmHoj
 tlq5PJLm8RNV99aLNv9gGEDlVFmfJM7Et5WeRxe9gnQpl++lhJFay1zpfTUhgNrET0
 bQ+Z8ZDYaqVHIN3vYw8n8yIk5qEC3Ub3ORFS15RgKIXNOB4haO0SvnEDlzlneLeAoe
 iVKYZ++43efkadZ8DQ/Wup4kDpw0xgTPIjDSkPGV9GJ9tlSNg0HKMy5jJyW9X3z7pc
 1d/CzEEeK2m1yI6xwAGHoh2yVboWm8/MUf/EYUgOyiFasaysIiRJWLDyEnF6MSTqyP
 ycyjMkjY6cDxw==
Received: from apollo.fritz.box (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id 9F4F790056A;
 Tue,  7 Feb 2023 09:38:18 +0000 (UTC)
From: Lucy Mielke <mielkesteven@icloud.com>
To: deller@gmx.de, linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: omapfb: cleanup inconsistent indentation
Date: Tue,  7 Feb 2023 10:36:11 +0100
Message-Id: <20230207093611.9361-1-mielkesteven@icloud.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s1KjAHgi32XVWN0sMXv-uTz5FlrRyFXw
X-Proofpoint-ORIG-GUID: s1KjAHgi32XVWN0sMXv-uTz5FlrRyFXw
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 clxscore=1011
 mlxlogscore=791 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302070086
X-Mailman-Approved-At: Tue, 07 Feb 2023 16:42:33 +0000
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
Cc: Lucy Mielke <mielkesteven@icloud.com>, linux-kernel@vger.kernel.org,
 arnd@arndb.de, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This cleans up the indentation according to the Linux kernel coding
style, and should fix the warning created by the kernel test robot.

Fixes: 8b08cf2b64f5a60594b07795b2ad518c6d044566 ("OMAP: add TI OMAP
	framebuffer driver")

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lucy Mielke <mielkesteven@icloud.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 32 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 1f3df2055ff0..4b673daa32cb 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -78,7 +78,7 @@ static struct platform_device omapdss_device = {
 	.name		= "omapdss_dss",
 	.id		= -1,
 	.dev            = {
-		.release = omapdss_release,
+	.release	= omapdss_release,
 	},
 };
 
@@ -544,19 +544,25 @@ static int set_fb_var(struct fb_info *fbi,
 		var->yoffset = var->yres_virtual - var->yres;
 
 	if (plane->color_mode == OMAPFB_COLOR_RGB444) {
-		var->red.offset	  = 8; var->red.length	 = 4;
-						var->red.msb_right   = 0;
-		var->green.offset = 4; var->green.length = 4;
-						var->green.msb_right = 0;
-		var->blue.offset  = 0; var->blue.length  = 4;
-						var->blue.msb_right  = 0;
+		var->red.offset		= 8; 
+		var->red.length		= 4;
+		var->red.msb_right	= 0;
+		var->green.offset	= 4; 
+		var->green.length	= 4;
+		var->green.msb_right	= 0;
+		var->blue.offset	= 0; 
+		var->blue.length	= 4;
+		var->blue.msb_right	= 0;
 	} else {
-		var->red.offset	 = 11; var->red.length	 = 5;
-						var->red.msb_right   = 0;
-		var->green.offset = 5;  var->green.length = 6;
-						var->green.msb_right = 0;
-		var->blue.offset = 0;  var->blue.length  = 5;
-						var->blue.msb_right  = 0;
+		var->red.offset		= 11; 
+		var->red.length		= 5;
+		var->red.msb_right	= 0;
+		var->green.offset	= 5;  
+		var->green.length	= 6;
+		var->green.msb_right	= 0;
+		var->blue.offset	= 0;
+		var->blue.length	= 5;
+		var->blue.msb_right	= 0;
 	}
 
 	var->height		= -1;
-- 
2.39.1

