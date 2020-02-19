Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C60F1649E5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F94D6EC4A;
	Wed, 19 Feb 2020 16:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708C6E7F1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:13:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r11so685902wrq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=k+5x80NuD9V+Qnk21e0mDSFOMaIC5Iytof66uYIbXss=;
 b=vSIEsdExWZ2FbdPu0MU7VTcU7IF3oIQ32l2NuuFLX8Pl5KvjA2twy0JNbXU9P3gDHq
 pOIyRNd5icecIFJ6CN41j4lbT0HN7PdIOQQfHknbRaNqaij9+c0i4d0iJg+IQGvonXEU
 /9FRusWgtIxolCOpZiznjI7l95lFAo6SYHdMTkHOSWXGeE5QQ4xXAyjQIBJ7H28zG08w
 aF36mTgygaz9dlKMUJ1bBVY4y30cpm+aMCHoCls0t+A8d56qFO9jks3oTHVBldvNsVj2
 Eafka6pMIzGAL5iq4nWphoxSq1ILpTyXY8Snp3fTPCd08FppMLnwh55Ef5rUYg9R1hKi
 SLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k+5x80NuD9V+Qnk21e0mDSFOMaIC5Iytof66uYIbXss=;
 b=MYnZXGwpNF65Jpqq6z0lkUgWAIXnB8cXSjH+eBqs04kP9dnNorkErx4UX4m1VDwwpT
 jqdVvhw+p/lGUU8XD8gl5m0Rroescbt4qA8LNIXDs3Lip9jI36C6rmOPcm5dVGH8lpVb
 GJnB/vOxB9T9D6sUsrYO3Tqy4jdeyRYIILVgrQo6VtBPwGbmcNWGTWULNubXMIgBL/aY
 7FYpWlzh6+4CcKIfQUpevR8wU2cUIZFRlBQpkIznxUJa1QmFYRYjduIa9kDXOqJhxLMD
 +RpU3EJOHQ8zZaVkbyUFAGk804PQEbJ3NF3BQtjF4klIlbKzn/3FVoi6x6OQK5InqIn8
 21YA==
X-Gm-Message-State: APjAAAVM7LVxESl532ciRPGPapFu+Kh3h7nP7JCClQIVoijAuk+EQhLp
 FAOOYbisFepMGbNaZN0vySFu2w==
X-Google-Smtp-Source: APXvYqzMstRSs0CuhMEXF+cVCctS5nCVYxs4zXGgDEYIyjt2Wlt/zX0aqBTexiTEeZ2jMvRmxr7YRg==
X-Received: by 2002:adf:f406:: with SMTP id g6mr36762230wro.189.1582121618880; 
 Wed, 19 Feb 2020 06:13:38 -0800 (PST)
Received: from robin.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g25sm7999695wmh.3.2020.02.19.06.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 06:13:38 -0800 (PST)
From: Phong LE <ple@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: component type MTK_DISP_OVL_2L is not correctly
 handled
Date: Wed, 19 Feb 2020 15:13:24 +0100
Message-Id: <20200219141324.29299-1-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 19 Feb 2020 16:18:11 +0000
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
Cc: Phong LE <ple@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The larb device remains NULL if the type is MTK_DISP_OVL_2L.
A kernel panic is raised when a crtc uses mtk_smi_larb_get or
mtk_smi_larb_put.

Signed-off-by: Phong LE <ple@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1f5a112bb034..57c88de9a329 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -471,6 +471,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	/* Only DMA capable components need the LARB property */
 	comp->larb_dev = NULL;
 	if (type != MTK_DISP_OVL &&
+	    type != MTK_DISP_OVL_2L &&
 	    type != MTK_DISP_RDMA &&
 	    type != MTK_DISP_WDMA)
 		return 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
