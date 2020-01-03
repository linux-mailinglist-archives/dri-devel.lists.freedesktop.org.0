Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E31C130221
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401396E44A;
	Sat,  4 Jan 2020 11:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502D86E320
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 14:24:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c14so42583141wrn.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 06:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYev97gpHrXWD4cTObTlC4p8ry7Fm20e+8qBStccKgE=;
 b=GDM9D4o4PbDunO0UiTZRzvlOWD8xXQPVcNj72ji4rteRTGok3nKJKbt3APJknXNL2m
 kItNJhDkEISEfBHdY++LrlV+Q35N48uncWIJojH3E0jHflyPkNZwZBa8UUvoeyb8had3
 CVvJ9VVo0rDFV51OEgw17ggM6MKd82yo3/yppUIc3aV8VHVUujl+KjjKV15sSrLxfI4X
 sWB9RZreKdK5kHVPM85DzyMnZY/8nfykKq5IMwt3S938Me1qYgq5GGqCcKB5cPxPI4ch
 KNmKBpQkFBysoJAs4Gwf/Q/wUFpXJEvOSmnMpJH56DpZoKXfEFipPrVWvrIxscH2/e20
 LPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYev97gpHrXWD4cTObTlC4p8ry7Fm20e+8qBStccKgE=;
 b=HL+jl3hEHZn01md3lzyaJ/IbxkSVdFBBgFwgwWBKkl8fRKrdlXVmfL+1ToxUnWwMen
 Fxf/yEX5WTxplwWlEp34H0AKKWt56D5ToVMBe6nahB64ob+/UEMXafXw+5A0UZPNqefS
 oZSkvcfTcg+u51Zmzc+7iZsCNrBLke2ZII+iFeXJVgc6KQB//Dp2NEtakBoSP8ndDIiA
 FGx+6kaDjFPhUg5R2BNvsTNh+gJv6HFxGNMPQX1ub0s35yNKzHWJZQ9giSL94T+uh6Le
 R4okm0fnGMIHuU7a51QaoPodKOYu6ErLFgVgplRBfINWbSUBrWCbiHLBQBq6O1GdBGik
 9sLQ==
X-Gm-Message-State: APjAAAVWmq3fMAfKj5dBKvyUdGyhXsdtxAKt87D4MkBOZjHg4C0t9Elb
 +Ro0YHz+R/UoSKkzhx7u/sIiIce6iGVgNw==
X-Google-Smtp-Source: APXvYqxL3jhMkdKPNrLu2LvJpgrGgBdIz4w8yC2ATLMVXINdK6pccS5GSmwMvcuQFyuqoCukv5pzAw==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr91343474wrs.213.1578061488663; 
 Fri, 03 Jan 2020 06:24:48 -0800 (PST)
Received: from radium.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x132sm10311612wmg.0.2020.01.03.06.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 06:24:47 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: fix indentation
Date: Fri,  3 Jan 2020 15:24:45 +0100
Message-Id: <20200103142445.55036-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0.rc0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Fabien Parent <fparent@baylibre.com>, airlied@linux.ie,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix indentation in the Makefile by replacing spaces with tabs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 8067a4be8311..b2b523913164 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -21,7 +21,7 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi.o \
 			  mtk_hdmi_ddc.o \
-                          mtk_mt2701_hdmi_phy.o \
+			  mtk_mt2701_hdmi_phy.o \
 			  mtk_mt8173_hdmi_phy.o \
 			  mtk_hdmi_phy.o
 
-- 
2.25.0.rc0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
