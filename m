Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB55E7493
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F9F10E413;
	Fri, 23 Sep 2022 07:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF80C10E3B1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 05:51:38 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id w10so9950407pll.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 22:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=jLkty/bBGe2PBxsiiWA4/CqKAsHGTrzTrzwycR1vG3c=;
 b=PRSd5EA2QV4KM5pY+1E0N6c1EXnQ8LeQtK0HM0X4cBDy6NqNwiGsuU89rUsVGQx8P0
 Hx6OB+fyeK2u5Ww7Ky6qKVKq5qs7n3FGAYt0B9wBY+22o/mkRgIVmujDR5o4ZWkFGcAK
 6hv+Hz6X7XS0WnomYpX86aMYst93qvp+pa7NaJJH01Xsen3HWs16912oJHWjByjJvCOy
 vUCf7p3KUP1P5z74zYPKhgXGIVVbyFuPkAoH9FnI9W6lhmWFlQQY4xxQFjy8Ywzcne2H
 z8whlnlZl1k5cL99btSWvMq9CMzUxdOGkf02gkxhuK/f0fO1eTQyQzYt1991wMppFzLB
 3wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=jLkty/bBGe2PBxsiiWA4/CqKAsHGTrzTrzwycR1vG3c=;
 b=vIbUntBoKSeA466Fj6E+6ZoPJZcEeATQM/1Z8LZSbuHS7R5Ggn4OBn7dpRFijMuCid
 4t4awvEkc5xpk3FrqWSiXCRp2z1XaYx7v7ypgiBIQ0X1YReb2wZ6pFrcsbe6CZQUS3eT
 KULKRVcx/1XmARfPF/MBQezIUGTS82AguhrinN7/8MWskIXfL0i32OBUkHCHTAgtb4+l
 7aJdKUdj7h8pGqbe2gukhrcDcMf9UFEVDhseoDl3S0dU4qdS0yOwzLpnVXqqDIZ9z+GY
 kDF04UI5CNuB2T17ukEnuHrP8nkBLb+3zFrcJC0p2tiReGjzoOyDGbcRkFxS4gyfrYB7
 xyww==
X-Gm-Message-State: ACrzQf36wmcpxo3EIKkTOzGJ17mTWvdkSOjz5X6o6Rel1ehhIrxfPww+
 EmisUb2EeNFyTtd+pCsR3nON6g==
X-Google-Smtp-Source: AMsMyM4insN+oo7qq3Dd+6GtbqAWoNwyzn01N95Pcn+8JIxbmexXLXVeVuJQstL9XcvvaC/z/cM/Sg==
X-Received: by 2002:a17:90b:1e45:b0:202:fbc9:3df1 with SMTP id
 pi5-20020a17090b1e4500b00202fbc93df1mr19824389pjb.72.1663912298361; 
 Thu, 22 Sep 2022 22:51:38 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 7-20020a620407000000b0053640880313sm5399908pfe.46.2022.09.22.22.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 22:51:37 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add AUO B116XAK01.6
Date: Fri, 23 Sep 2022 13:51:33 +0800
Message-Id: <20220923055133.302740-1-sean.hong@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Sep 2022 07:09:53 +0000
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
Cc: Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the AUO - B116XAK01.6 (HW: 1A) panel.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 060f4f98bc04..aaa7a24bce6d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1878,6 +1878,7 @@ static const struct panel_delay delay_200_500_e200 = {
 static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.25.1

