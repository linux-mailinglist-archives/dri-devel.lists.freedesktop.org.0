Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0A2E07EC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C14B6E839;
	Tue, 22 Dec 2020 09:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BF589AB2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 13:05:19 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D006m55Mlzhw7F;
 Mon, 21 Dec 2020 21:04:32 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 21 Dec 2020 21:05:06 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] gpu: drm: Replace simple_strtol by simple_strtoul
Date: Mon, 21 Dec 2020 21:05:41 +0800
Message-ID: <20201221130541.1975-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:47 +0000
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The simple_strtol() function is deprecated, use simple_strtoul() instead.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpu/drm/drm_modes.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 501b4fe55a3d..048d6a2c1623 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1395,7 +1395,7 @@ static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
 		return -EINVAL;
 
 	str++;
-	bpp = simple_strtol(str, end_ptr, 10);
+	bpp = simple_strtoul(str, end_ptr, 10);
 	if (*end_ptr == str)
 		return -EINVAL;
 
@@ -1414,7 +1414,7 @@ static int drm_mode_parse_cmdline_refresh(const char *str, char **end_ptr,
 		return -EINVAL;
 
 	str++;
-	refresh = simple_strtol(str, end_ptr, 10);
+	refresh = simple_strtoul(str, end_ptr, 10);
 	if (*end_ptr == str)
 		return -EINVAL;
 
@@ -1486,7 +1486,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
 	int remaining, i;
 	char *end_ptr;
 
-	xres = simple_strtol(str, &end_ptr, 10);
+	xres = simple_strtoul(str, &end_ptr, 10);
 	if (end_ptr == str)
 		return -EINVAL;
 
@@ -1495,7 +1495,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
 	end_ptr++;
 
 	str = end_ptr;
-	yres = simple_strtol(str, &end_ptr, 10);
+	yres = simple_strtoul(str, &end_ptr, 10);
 	if (end_ptr == str)
 		return -EINVAL;
 
@@ -1553,7 +1553,7 @@ static int drm_mode_parse_cmdline_int(const char *delim, unsigned int *int_ret)
 		return -EINVAL;
 
 	value = delim + 1;
-	*int_ret = simple_strtol(value, &endp, 10);
+	*int_ret = simple_strtoul(value, &endp, 10);
 
 	/* Make sure we have parsed something */
 	if (endp == value)
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
