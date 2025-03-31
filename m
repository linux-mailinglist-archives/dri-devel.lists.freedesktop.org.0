Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78683A76321
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292310E3A9;
	Mon, 31 Mar 2025 09:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (unknown [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402EE10E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:26:03 +0000 (UTC)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZR5N12sxhz8RV6T
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 17:25:53 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZR5Ms4BDzz51SXw;
 Mon, 31 Mar 2025 17:25:45 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 52V9PVjp073794;
 Mon, 31 Mar 2025 17:25:31 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Mon, 31 Mar 2025 17:25:34 +0800 (CST)
Date: Mon, 31 Mar 2025 17:25:34 +0800 (CST)
X-Zmail-TransId: 2af967ea5f8effffffffc4e-3c31b
X-Mailer: Zmail v1.0
Message-ID: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <j@jannau.net>, <liviu.dudau@arm.com>, <chunkuang.hu@kernel.org>
Cc: <fnkl.kernel@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
 <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvNF0gUmVwbGFjZSBjdXN0b20gY29tcGFyZV9kZXYgd2l0aCBjb21wb25lbnRfY29tcGFyZV9vZiBpbiBkcm0=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52V9PVjp073794
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA5FA1.001/4ZR5N12sxhz8RV6T
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of, as suggested in
the review feedback. This simplifies the code by eliminating redundant
logic and aligns with the pattern used in other DRM drivers like
hdlcd_drv.c and malidp_drv.c.

Tang Dongxing (4):
  drm: adp: Replace custom compare_dev with component_compare_of
  drm: arm: hdlcd: Replace custom compare_dev with component_compare_of
  drm: malidp: Replace custom compare_dev with component_compare_of
  drm: mediatek: Replace custom compare_dev with component_compare_of

 drivers/gpu/drm/adp/adp_drv.c          | 7 +------
 drivers/gpu/drm/arm/hdlcd_drv.c        | 7 +------
 drivers/gpu/drm/arm/malidp_drv.c       | 9 +--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +------
 4 files changed, 4 insertions(+), 26 deletions(-)

-- 
2.25.1
