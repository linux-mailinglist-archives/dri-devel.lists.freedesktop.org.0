Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A06AB95A9
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD68810E9A1;
	Fri, 16 May 2025 05:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4B10E85B;
 Thu, 15 May 2025 12:11:42 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZypwM75cDz57f2;
 Thu, 15 May 2025 20:11:31 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZypwF56zxzBRHKN;
 Thu, 15 May 2025 20:11:25 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Zypvz3HpXz5B1Gr;
 Thu, 15 May 2025 20:11:11 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 54FCB49i003322;
 Thu, 15 May 2025 20:11:04 +0800 (+08)
 (envelope-from zhang.enpei@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid32;
 Thu, 15 May 2025 20:11:08 +0800 (CST)
Date: Thu, 15 May 2025 20:11:08 +0800 (CST)
X-Zmail-TransId: 2afc6825d9dc093-d077f
X-Mailer: Zmail v1.0
Message-ID: <20250515201108576jof-gkjSxRfMaGDgKo-pc@zte.com.cn>
Mime-Version: 1.0
From: <zhang.enpei@zte.com.cn>
To: <lyude@redhat.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <airlied@redhat.com>, <zhang.enpei@zte.com.cn>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbm91dmVhdS9kcDogY29udmVydCB0byB1c2UgRVJSX0NBU1QoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54FCB49i003322
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825D9F2.000/4ZypwM75cDz57f2
X-Mailman-Approved-At: Fri, 16 May 2025 05:50:09 +0000
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>
As opposed to open-code, use ERR_CAST to clearly indicate that this is a
pointer to an error value and a type conversion is performed.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
index 99110ab2f44d..43ad467d09db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -646,7 +646,7 @@ r535_conn_new(struct nvkm_disp *disp, u32 id)
        ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
                                    NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA, sizeof(*ctrl));
        if (IS_ERR(ctrl))
-               return (void *)ctrl;
+               return ERR_CAST(ctrl);

        ctrl->subDeviceInstance = 0;
        ctrl->displayId = BIT(id);
-- 
2.25.1
