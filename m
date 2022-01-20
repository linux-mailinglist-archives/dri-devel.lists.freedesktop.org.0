Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF24949EA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BC410E8F6;
	Thu, 20 Jan 2022 08:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7987910E243
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 06:45:31 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id e28so57100pfj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 22:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ecs-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=M7J5tzZZVmeA1P0cwSulRKeIAGlLrTXUVBwKsO/DNQw=;
 b=eBnTE6KboIcUgSDDHcRQhY2E71dW8BbaqtL3pUmTx2vZPBStcEcsZkn6A9deXugJr2
 9n/Vzusq3cNbE1mzKZgorVOsPiQvyTafYqvPVffslRVClVIOvBjOuEuSMcv2eSkg47+G
 +JCmxKeABWTOzOg+THVBInMstvKXX/VaLyupe+C0EuZ5tzAskH9iUFr4g+fOMppc6J7L
 LtK8rwkLS0+yd1fu5SWPuBD2NlsQjNK5Os/je79glzOJ3ctqxFPVoWtVF15UYf0xkFBh
 b4IXeTWwExPYk+VbyCn9H9uiYWwLOGUrYy7n+duiG5ZAvnXPrRJCI5qUQsJ0r2vyTJm8
 7buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=M7J5tzZZVmeA1P0cwSulRKeIAGlLrTXUVBwKsO/DNQw=;
 b=yvewZjM6XL/63mJbrKC0kkTUrsSE/aNfEM4Ec/ZDUhCpuuH9zJnkmPUsT4ld7Pozz6
 F9mI2FOhxwHTqOQG7QkJ7++F75v6RGzwf67MYrxPRTxc1BNHd8d7OCwz4FmBKy5EOpxk
 5+jqYCPAe3UhrbnKF3iLcL5yTV9XACIpQW3b//oyBCVT3BlRiPqP+j1MS197+ASLjTCs
 hqdv9aZSV2nY5Do1da14ck9xDC/8a1KhDyrEvh2AAXKvH1eYKxc8uC66zLd1GL2EI4a8
 ebgskbCg+CmcElQQWTauEtj7IaZD/HDvJ7ozNc63hk2PVhCN5ftDmCX7WIjmndVVpRXT
 M8FA==
X-Gm-Message-State: AOAM532B4jAI6gwFcLUeEkBVIo+g8cQ05/WWrx/1eSR1QU/9b05MGCfT
 oN4+eaipFA0Kzhq2fAv08dgyCQ==
X-Google-Smtp-Source: ABdhPJyZh6hf8sXFC79qwpGEmAAO9vEOJdZKhLkHRFW/LA3lP4oPb6YD8zz1q31NcvrKvBr9zJTtEA==
X-Received: by 2002:a05:6a00:808:b0:4c1:3960:bb1c with SMTP id
 m8-20020a056a00080800b004c13960bb1cmr34830892pfk.84.1642661131061; 
 Wed, 19 Jan 2022 22:45:31 -0800 (PST)
Received: from localhost.localdomain ([103.104.171.42])
 by smtp.gmail.com with ESMTPSA id q21sm1760129pfj.94.2022.01.19.22.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 22:45:30 -0800 (PST)
From: Grace Mi <grace.mi@ecs.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] gpu: drm: panel-edp: Add panels planned for
 sc7180-trogdor-pazquel
Date: Thu, 20 Jan 2022 06:45:10 +0000
Message-Id: <20220120064457.1.I337b8db7efaba8eb9c0ffd4da0d8c8133faf6f19@changeid>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: Bob Moragues <moragues@chromium.org>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Yunlong Jia <yunlong.jia@ecs.com.tw>,
 Henry Sun <henrysun@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>

We have added corresponding information:
    [BOE]NV116WHM-N45 use delay_200_500_e50
    [KDB]116N29-30NK-C007 use delay_200_500_e80_d50
    [STA]2081116HHD028001-51D use delay_100_500_e200
Add 3 panels & 2 delay.

Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Signed-off-by: Grace Mi <grace.mi@ecs.corp-partner.google.com>
---

 drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 176ef0c3cc1da..1baed4b9e5d1a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1745,6 +1745,19 @@ static const struct panel_delay delay_200_500_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_200_500_e80_d50 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 80,
+	.disable = 50,
+};
+
+static const struct panel_delay delay_100_500_e200 = {
+	.hpd_absent = 100,
+	.unprepare = 500,
+	.enable = 200,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.name = _name, \
@@ -1768,13 +1781,17 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
+	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
+
 	{ /* sentinal */ }
 };
 
-- 
2.17.1

