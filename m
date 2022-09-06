Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE025AE0D0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542910E58B;
	Tue,  6 Sep 2022 07:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D353B10E58E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:19:20 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so4791356pjm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=TM+CdNqSvUJq8RjCWX9SS8uu2mM48Yt8MlhJj2Gs6Ak=;
 b=FeXxDKPOjtUzqkwbv70fTVeIm+5VWurSEWn3UmqxM2xxL2yxAeHRE3vY1mBL31YmfA
 TCn1YnaFmP5nKpZRonMs5iU6m+5BDL6Zn42cPM4n7hdYKnYlPSFmNEAyUUYvzksEsbBM
 iG2H1AWtH5C9awoDq9qxL3qHr8lKGDi5U92yf37UmRHbhQRXOGJ9ZLEd2QUvWUGPwiTy
 f6DRQIjat4h6x78EER0Pz/g+z2z6XLYNlpTJLhbMBOwGF12cINHs6jZa8d7Gel1btnjy
 OAlJ4I7NuBhMOIXKwgTK6+JKdLk20L6gONdVSpEFxm4KlQJUC6WIpH1EhPo6DrrJ6+G3
 Yu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=TM+CdNqSvUJq8RjCWX9SS8uu2mM48Yt8MlhJj2Gs6Ak=;
 b=o8fmMlJZwOrKTCqnGbhwG1IMs+F2CH0Q0pNqLbHFTCknmgsmmhMQpDKlt/6kldkybk
 livJvBfoV23j8bNE6Sv2SR5clKGe8+FQPt/gat5pzRzQ2rmMutNB2O4may2bO4k/Ymru
 iujaNa34X9PQr3FQnZeAo0RDAKEkKgVQFcFuyn/kg8YftKmE7TKYo7C6ISlerdHtlaS6
 3hQoI4k8/aBwCyul2uobjFY81A4Z5zRxPkdAf1WHuFM6qedCj6qtiyjc3LiklSWyoGiq
 DJMp4Rh70UGk79XT/KfuNrMwIiNPYaSMievBhrCd6rrQH49vKSOVOQM6zBkOHOV8VwVd
 1hgQ==
X-Gm-Message-State: ACgBeo3/ckSFaP0fU0+oMbgWSUUAGmSzI9H0tZspE58Xklx0Oj7OA00G
 QRsSz8IxZrBfCc9xujecNbu1XqZOTys=
X-Google-Smtp-Source: AA6agR7vqq1QTi7igOOkGXVbjDkp08nRulzSASvLFJk+vjwaKFa0LNvfAfCb2LlljT+4o/btBqahTA==
X-Received: by 2002:a17:902:d2c3:b0:175:406f:5665 with SMTP id
 n3-20020a170902d2c300b00175406f5665mr30858501plc.76.1662448760477; 
 Tue, 06 Sep 2022 00:19:20 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 u195-20020a6279cc000000b00537eb00850asm9293775pfc.130.2022.09.06.00.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:19:20 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: zackr@vmware.com
Subject: [PATCH linux-next] drm/vmwgfx: Remove the unneeded result variable
Date: Tue,  6 Sep 2022 07:19:16 +0000
Message-Id: <20220906071916.337033-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value vmw_cotable_notify() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index f085dbd4736d..080c9c11277b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1263,7 +1263,6 @@ static int vmw_cmd_dx_define_query(struct vmw_private *dev_priv,
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXDefineQuery);
 	struct vmw_ctx_validation_info *ctx_node = VMW_GET_CTX_NODE(sw_context);
 	struct vmw_resource *cotable_res;
-	int ret;
 
 	if (!ctx_node)
 		return -EINVAL;
@@ -1275,9 +1274,8 @@ static int vmw_cmd_dx_define_query(struct vmw_private *dev_priv,
 		return -EINVAL;
 
 	cotable_res = vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_DXQUERY);
-	ret = vmw_cotable_notify(cotable_res, cmd->body.queryId);
 
-	return ret;
+	return vmw_cotable_notify(cotable_res, cmd->body.queryId);
 }
 
 /**
@@ -2576,7 +2574,6 @@ static int vmw_cmd_dx_so_define(struct vmw_private *dev_priv,
 		uint32 defined_id;
 	} *cmd;
 	enum vmw_so_type so_type;
-	int ret;
 
 	if (!ctx_node)
 		return -EINVAL;
@@ -2586,9 +2583,8 @@ static int vmw_cmd_dx_so_define(struct vmw_private *dev_priv,
 	if (IS_ERR(res))
 		return PTR_ERR(res);
 	cmd = container_of(header, typeof(*cmd), header);
-	ret = vmw_cotable_notify(res, cmd->defined_id);
 
-	return ret;
+	return vmw_cotable_notify(res, cmd->defined_id);
 }
 
 /**
-- 
2.25.1
