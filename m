Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C345E7497
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070DA10E449;
	Fri, 23 Sep 2022 07:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05910E3B1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 05:37:35 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d24so10819031pls.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 22:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=FDXVHN6kTmXxUTt2S0ck8BktO3/KI3qikuzjAIbxt+w=;
 b=UElJ5TsMWjrGPps0Q16ahhlFPdH+s9IZ2bfkibo7EfOotDX8gzl8zGcGiR0nGIYIzw
 p7A7fTWJgBv7mm+bVax+nEbzVisIklWa8+iH7XnGyeIZrAADFkUtG3GuF8AmlOyaCDYs
 WDNdGj8fg62dx330FNRm/BaqXQ2xg1yzNCjvM0B5l9SUQeHG4hoagszMk+tP7aKmi5WJ
 A0j5RwMC7clO2bSY2xVr+T9in/JfCDYKsbeG7GJSR4drSiv0VB8ElZhLc0ZlziXikK7M
 TrsLynAB+mrGyaipi9vm4/iQ9NVhpv5eBCG9PlcQR8L2gQ0JPU6v/h9x09ETEOWtH5So
 nCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=FDXVHN6kTmXxUTt2S0ck8BktO3/KI3qikuzjAIbxt+w=;
 b=HCjVKR8ADM4byP4WWdDqB//2SyJSU72WXqdyqqqRz4mKB0TAq+gkKa5eocGPMR3Dzm
 55PTCEY1xyEXX/Y6iiFGuQULb0mRn745puWNbPR2RBVUAWcMqIi8WXUwck8KmAzbd+aQ
 6/ose2dzu5orpZ7VOlelr4X3168FMgYYqM+MO96X9qi81QVJsX8anCYis2Q4aFvTpNfl
 lnrihv85ZtmaBI1g5jSiz8xqfLYitvBsKrhWMN53lOyc/Tsi4uYsGiuD+NMYiTZc9mux
 8CtOni4qFAFoQmNJO/n6B115tvC/1hMSN0EBiRW6sosMmEXxNZJjSjykwF3hKVpKvGCx
 DTMQ==
X-Gm-Message-State: ACrzQf2vaPuzDHlsgK5V2gxPMHVglacdDIdTb558noZ6iEswv+vEVVVe
 RjBtbO5ariM/uXA5BN2boYYAAj6gJBu0LA==
X-Google-Smtp-Source: AMsMyM4EcpDyZXdrGwZ4+tDXeKknxr/WNz0cYXP/OQvK9ZI120PJu8NXAasuJByKZhR03PhQaAvp1Q==
X-Received: by 2002:a17:90b:3b81:b0:202:597a:c71d with SMTP id
 pc1-20020a17090b3b8100b00202597ac71dmr18970470pjb.105.1663911455069; 
 Thu, 22 Sep 2022 22:37:35 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 y129-20020a62ce87000000b005480167b921sm5619760pfg.172.2022.09.22.22.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 22:37:34 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add INX N116BCN-EA1
Date: Fri, 23 Sep 2022 13:37:29 +0800
Message-Id: <20220923053729.301626-1-sean.hong@quanta.corp-partner.google.com>
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

Add support for the INX - N116BCN-EA1 (HW: C4) panel.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 060f4f98bc04..8db91fb3d39b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1889,6 +1889,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_p2e80, "N116BCN-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
-- 
2.25.1

