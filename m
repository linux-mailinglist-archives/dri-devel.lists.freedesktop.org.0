Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66AA736ADA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4FC10E2CB;
	Tue, 20 Jun 2023 11:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC4210E2CB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:22:13 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1aa25c5cf0eso522274fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687260132; x=1689852132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wVecaaQM4xrAZr82w6m0IGLG2JLPDqBBxmjVroCLSM0=;
 b=qANQ2mwg03Cm76n/W6rPfbgZaYwPb+XnZgf3NfPYhznjufCTh7LPs55NLn1ipp7L/Q
 Lg76ZYtRdDdyiNzO/85hLaP0yQ8Z3fPAWu3u7XIMsTW89seo4ZMZ832jT4JFB/Fph5zs
 HKWCjftItkO6EZ6tVi26+Ady3IKMGd02qe6oh+iqwAmJ1MADCL4OKfsUSdW99EOCR3O6
 1mG2uwJ/HEkmSINrPdRR+9LQYiRs1o4e5be/5oSC3SuCvnCw38VWUsDaIXkYTkryks8k
 QeS/E8fvP6GNw+Rr+jVluJ1auFky4oXKGXXGs1lD5FpxnKOhhZRIKoHmrtDIkQD8Ix64
 hoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687260132; x=1689852132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wVecaaQM4xrAZr82w6m0IGLG2JLPDqBBxmjVroCLSM0=;
 b=QoKG6kVmbdqe+VsInnrdkkzYubnIE++GKJ0hG+iLcN4TwhM4sc+ZKV40dRZAX/SfId
 RGlPo9ERE6tveJy9CUpeEL9SzNU7ARPAIOYQfobK3LJlDScI+IDmCfdF9f7iEtAJKLQH
 g7qtijiwSknJv12VE1Rkd/M9+OL5ZFxW2N2oEMuUIceZu7+aGDdvACAu/zOrRPtVzs80
 O/u55t2WmcyUjowuwVXSFePYtAPhm4z6kG7XhOI6yCdSy6PYHNzDf7W6dD14C9XZO8jn
 3HlSFBIbs+uboc875wNAbeW2jdEzk0FsVGbqmHp5t73m+/xrGZ1jPwcrSzW4c2cXObX4
 4OMw==
X-Gm-Message-State: AC+VfDzhPpEGAyKWXCckmhjStq+RalNeoVKUB72FC5zOtF/LOyzmEXU+
 BXG//sZVaH3FeA+8lStTV2jqPE1Ca1E=
X-Google-Smtp-Source: ACHHUZ4vtWVOtLJMXYc8dLGtmcQ4EqeWV2pPOHQYDjZje+2Oq7XjVbCuGfLZIunk7lklTVmDHOigvQ==
X-Received: by 2002:aca:dec6:0:b0:39c:8498:8159 with SMTP id
 v189-20020acadec6000000b0039c84988159mr8566748oig.1.1687260132269; 
 Tue, 20 Jun 2023 04:22:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:352b:7d18:ddaa:cf28])
 by smtp.gmail.com with ESMTPSA id
 y186-20020acae1c3000000b0039eb51a5dffsm990454oig.43.2023.06.20.04.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:22:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2] drm/panel: simple: Add connector_type for innolux_at043tn24
Date: Tue, 20 Jun 2023 08:22:02 -0300
Message-Id: <20230620112202.654981-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The innolux at043tn24 display is a parallel LCD. Pass the 'connector_type'
information to avoid the following warning:

panel-simple panel: Specify missing connector_type

Signed-off-by: Fabio Estevam <festevam@denx.de>
Fixes: 41bcceb4de9c ("drm/panel: simple: Add support for Innolux AT043TN24")
---
Changes since v1:
- Pass Fixes tag (Neil).

 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a247a0e7c799..7c80528d571e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2178,6 +2178,7 @@ static const struct panel_desc innolux_at043tn24 = {
 		.height = 54,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
-- 
2.34.1

