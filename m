Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B0111A6A8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D986EAA1;
	Wed, 11 Dec 2019 09:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2286 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 11:03:01 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E516E8BA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 11:03:01 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAAN3MP000772; Tue, 10 Dec 2019 11:24:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GsvFmn2Io9RQH4WVAel4LbY/KD1vPThkRF3bXi0kBSc=;
 b=NW3/2OhvT2AXjZlfB8+JBsflTE/O4C8IrGSrLrBzhsX0A2l8sFpCqrnyQPn0i6OT1PFU
 d809XInzz1DMBbHvSyFi3ssE+aOyQFOZv+5Yyn6EPbQ2uXZsImaPNL3q3WRXpAITPeO3
 WAXpNq4KsZYOR30C1xvugW5HXHQ4Q0n/eziU6frhFqFYrsmJCNB1T5zm0CQuCE4coGJS
 l4Pxc+EW9yXmRIkvg0q5eZGMKCC3kcwHCXl22W8G2bavnzf7ns8Op1SC8tQupE1OMYrT
 0FYXo76NxndqtytR8L4fAlGYuBvwdaaopOaXu/QNVadKZ4QwQgerCdrSTxSlN+Qx7czV 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wrapxm031-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 11:24:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55085100034;
 Tue, 10 Dec 2019 11:24:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D256F2A5A4D;
 Tue, 10 Dec 2019 11:24:39 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Dec 2019 11:24:39
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <jani.nikula@linux.intel.com>, <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <yakui.zhao@intel.com>, <benjamin.gaignard@st.com>
Subject: [PATCH] drm/modes: tag unused variables to avoid warnings
Date: Tue, 10 Dec 2019 11:24:37 +0100
Message-ID: <20191210102437.19377-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some variables are set but never used. To avoid warning when compiling
with W=1 and keep the algorithm like it is tag theses variables
with _maybe_unused macro.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in this version:
- do not modify the code to remove the unused variables
  just prefix them with __maybe_unused macro.
  
 drivers/gpu/drm/drm_modes.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 88232698d7a0..70aed4e2990d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -233,7 +233,7 @@ struct drm_display_mode *drm_cvt_mode(struct drm_device *dev, int hdisplay,
 		/* 3) Nominal HSync width (% of line period) - default 8 */
 #define CVT_HSYNC_PERCENTAGE	8
 		unsigned int hblank_percentage;
-		int vsyncandback_porch, vback_porch, hblank;
+		int vsyncandback_porch, __maybe_unused vback_porch, hblank;
 
 		/* estimated the horizontal period */
 		tmp1 = HV_FACTOR * 1000000  -
@@ -386,9 +386,10 @@ drm_gtf_mode_complex(struct drm_device *dev, int hdisplay, int vdisplay,
 	int top_margin, bottom_margin;
 	int interlace;
 	unsigned int hfreq_est;
-	int vsync_plus_bp, vback_porch;
-	unsigned int vtotal_lines, vfieldrate_est, hperiod;
-	unsigned int vfield_rate, vframe_rate;
+	int vsync_plus_bp, __maybe_unused vback_porch;
+	unsigned int vtotal_lines, __maybe_unused vfieldrate_est;
+	unsigned int __maybe_unused hperiod;
+	unsigned int vfield_rate, __maybe_unused vframe_rate;
 	int left_margin, right_margin;
 	unsigned int total_active_pixels, ideal_duty_cycle;
 	unsigned int hblank, total_pixels, pixel_freq;
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
