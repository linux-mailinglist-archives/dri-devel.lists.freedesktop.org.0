Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648AB6900B8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 08:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229C710E0BA;
	Thu,  9 Feb 2023 07:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DFB10E0BA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 07:11:34 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PC7MQ6Cyfz6FK2T;
 Thu,  9 Feb 2023 15:11:30 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 3197BK4w016072;
 Thu, 9 Feb 2023 15:11:20 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 9 Feb 2023 15:11:22 +0800 (CST)
Date: Thu, 9 Feb 2023 15:11:22 +0800 (CST)
X-Zmail-TransId: 2af963e49c9afffffffffe960917
X-Mailer: Zmail v1.0
Message-ID: <202302091511222329971@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <alexander.deucher@amd.com>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYW1kZ3B1L2Rpc3BsYXk6IHJlbW92ZSBkdXBsaWNhdGUgaW5jbHVkZSBoZWFkZXIgaW7CoGxpbmtfZHBtcy5j?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 3197BK4w016072
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 63E49CA2.000 by FangMail milter!
X-FangMail-Envelope: 1675926690/4PC7MQ6Cyfz6FK2T/63E49CA2.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63E49CA2.000/4PC7MQ6Cyfz6FK2T
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
Cc: sunpeng.li@amd.com, qingqing.zhuo@amd.com, xinhui.pan@amd.com,
 rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com,
 dri-devel@lists.freedesktop.org, george.shen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

link_hwss.h is included more than once.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index 9cdfa7f7dc77..0c26b3589608 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -51,7 +51,6 @@
 #include "link_enc_cfg.h"
 #include "resource.h"
 #include "dsc.h"
-#include "link_hwss.h"
 #include "dccg.h"
 #include "clk_mgr.h"
 #include "atomfirmware.h"
-- 
2.25.1
