Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803465141F6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 07:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5F510FB70;
	Fri, 29 Apr 2022 05:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0659910FB70
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 05:51:20 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id q13so4724015qvk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 22:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aDJuHsnb5EzH/lpZ47Oj8fmkH3usiQ2wqUINLtDi+c8=;
 b=Ye/6eHlQjd1t3TB0u3vmRazBP4a7XLeXMdJ1Rnhm3IbbOnJVrjRTMYYoH7mFIDlD98
 C0A1qidM9UjvmMemSlGxoli2t6CpOcGjR4bfXGEXmsu00Jp6xe53RvfkJ05P396gZ/rQ
 NJw/pMooJ2VKutmKBIYcuyGId2tVz/6m/Ebwltc/is+lAUfoHhhnY173siIkMqVxCHse
 hdrXVD+mxKCeoWqZ4BCMEPurb2KQaHudSQB6jFpFknCl7lyVD+u55HTBu+ZLVRw6lAhJ
 Mwb8WL6EV+5/jRpXwXdduh2t8j2oE3CFyE/el9k2vmvPZfo8huvRw82DQbMgLabJqrQY
 QSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aDJuHsnb5EzH/lpZ47Oj8fmkH3usiQ2wqUINLtDi+c8=;
 b=bwCgkMtA+7fM/gkgeacufupmen5TqDHsvwmIAxqivP7vVP15HPxDFB/fYICO5hYBWP
 y5cQH+fWYDEu/cxy0MAkTuU+HyT1+JWvVIWntQy8maizh1y3/iyh+d7enZdtLYnknRpM
 PuBRdLM8lkdIvrXFfuc/fGJHYphLIB0Wk2oMgTYyvPjAjVB9TiXKChdo54P21ONwQRPP
 /QYnA9YAh0INEv1/F7o8I+N3lMBnM3Z4n1haYdmWPhxvq+WLswwTHYK+NJW5OzjjNRyK
 nXNbBnn0Guk+oyy6kewcIruNXYJQIgMGe7wbVbcNrdSFfxmrotzaa5wPAzI9UNt9P8xe
 UWLg==
X-Gm-Message-State: AOAM531AfcUFiHcorQWqysDwZhdj12EAwgH0bDpTmJMVcYOVHjJ5lg+Y
 bK5TESJztMmabu0hgNPlTKw=
X-Google-Smtp-Source: ABdhPJwixi6jHMC7bGvPnpTqiNSXfVsJOyc9CaKMVWXZvsnUu8ogEfLH6vW++steXpoKW/9kxxCI4g==
X-Received: by 2002:ad4:4345:0:b0:456:915e:9bcc with SMTP id
 q5-20020ad44345000000b00456915e9bccmr5240086qvs.109.1651211479166; 
 Thu, 28 Apr 2022 22:51:19 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05622a104a00b002f35726ccd8sm1194328qte.86.2022.04.28.22.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:51:18 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: deller@gmx.de
Subject: [PATCH] omapfb: simplify the return expression of nec_8048_connect()
Date: Fri, 29 Apr 2022 05:51:12 +0000
Message-Id: <20220429055112.3852209-1-chi.minghao@zte.com.cn>
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
Cc: linux-fbdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 .../fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c     | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c
index be9910ff6e62..b407173e27b1 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c
@@ -117,16 +117,11 @@ static int nec_8048_connect(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
 	struct omap_dss_device *in = ddata->in;
-	int r;
 
 	if (omapdss_device_is_connected(dssdev))
 		return 0;
 
-	r = in->ops.dpi->connect(in, dssdev);
-	if (r)
-		return r;
-
-	return 0;
+	return in->ops.dpi->connect(in, dssdev);
 }
 
 static void nec_8048_disconnect(struct omap_dss_device *dssdev)
-- 
2.25.1


