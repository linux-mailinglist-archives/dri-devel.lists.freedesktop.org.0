Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B89568027
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B83311239C;
	Wed,  6 Jul 2022 07:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6468910FE3E;
 Wed,  6 Jul 2022 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=rZuPa
 xkJ0zTc4Mk9Dxc6rPY18b/MAW3ZpJp5vwPFIxI=; b=Ji4gW5Nqy9jZ8MsqfNqNd
 Qpt4DzlFGvuVfI4bYro8jhtHs+SNWhKE1zs6Pidl5rKqSStvwWIcSudHHVSEqYrd
 Yx08ztomlmifzhzObv1yHzYKgw0fX3baogiCjgE4t1O+jLAl74oECfEBkVdtTnvo
 q8T/j0URo0STwZrFb6KY6A=
Received: from bf-rmsz-11.ccdomain.com (unknown [218.17.89.92])
 by smtp9 (Coremail) with SMTP id DcCowAB3xfo+LsViMSQJNg--.19989S2;
 Wed, 06 Jul 2022 14:39:59 +0800 (CST)
From: Zhongjun Tan <hbut_tan@163.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bas@basnieuwenhuizen.nl,
 cai.huoqing@linux.dev
Subject: [PATCH] drm/amd/display: Fix unsigned expression compared with zero
Date: Wed,  6 Jul 2022 14:39:51 +0800
Message-Id: <20220706063951.54122-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAB3xfo+LsViMSQJNg--.19989S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jw4kJFy8Jw4kGry8Ww4xXrb_yoW8JrW7pw
 4fKF1Ygw45XF1Iga4fCF18WFW5Gr93GF4xtrW3Awn8Aw1DAFWUXa4akrWUGa47Wa97uF1S
 y3WDCr47tF1vyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jP739UUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/1tbiWB82xluHzQmvgQAAsB
X-Mailman-Approved-At: Wed, 06 Jul 2022 07:41:40 +0000
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
Cc: Zhongjun Tan <tanzhongjun@coolpad.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhongjun Tan <tanzhongjun@coolpad.com>

Fix unsigned expression compared with zero

Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
index 548cdef8a8ad..21e4af38b8c1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -244,8 +244,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 	bool req128_c = false;
 	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
 	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
-	unsigned int log2_swath_height_l = 0;
-	unsigned int log2_swath_height_c = 0;
+	int log2_swath_height_l = 0;
+	int log2_swath_height_c = 0;
 	unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
 
 	full_swath_bytes_packed_l = rq_param->misc.rq_l.full_swath_bytes;
-- 
2.29.0

