Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92533ED6A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 10:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884C46E516;
	Wed, 17 Mar 2021 09:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460BE6E516
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NQRZn
 WXsBa44aCkWDCH+ENfuI2B82mvYTVNLXxgVA7U=; b=ngc47QqNRkVX61NPKJBig
 22MPVNuj6P4vY+skcjKrvR9obvTY3Rg8y5ds6HCdcDG2dANabGHBxl/OnQbW8QD6
 yY2fkaFLSfQgT9AwSsEYCsrwSALDEx6OLk3Nc6GLVFrmzwrOCDLSUJHmotLmc3c0
 5kR7L9qyf9uPO1DX8bNqGA=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowADHzJyM0FFgU67lqQ--.19405S2;
 Wed, 17 Mar 2021 17:49:08 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 sebastian.reichel@collabora.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH] omapdrm/dss/dsi.c:modify 'u32'->'int'
Date: Wed, 17 Mar 2021 17:48:52 +0800
Message-Id: <20210317094852.424-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowADHzJyM0FFgU67lqQ--.19405S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43Kw4rZry7uFWfGF13twb_yoWxtFg_uF
 1IqrsxXr4avF98Zr1ayay2vryFyF17ZF40yr18tFWfAw4avrn8X34DZry7Zw1vkr42qF95
 C3WDXryFvF4xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8CD73UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiHhRYUVSItTcNmQAAsJ
X-Mailman-Approved-At: Wed, 17 Mar 2021 09:51:29 +0000
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
Cc: tangchunyou@yulong.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: tangchunyou <tangchunyou@yulong.com>

1.the type of mipi_dsi_create_packet id int
2.u32 can not < 0

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 8e11612..11c502d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2149,7 +2149,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 			     const struct mipi_dsi_msg *msg)
 {
 	struct mipi_dsi_packet pkt;
-	u32 r;
+	int r;
 
 	r = mipi_dsi_create_packet(&pkt, msg);
 	if (r < 0)
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
