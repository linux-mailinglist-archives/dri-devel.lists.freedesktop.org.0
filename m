Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B17D8FAD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B59D10E946;
	Fri, 27 Oct 2023 07:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EC410E90A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 03:05:07 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cac20789e8so3056275ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 20:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1698375907; x=1698980707; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W03Y8lFBgksp4nZkRCf2tWXHM6a0g6coXGTRRAurfQs=;
 b=3TcstiI9WOORrNaiCSISit3Wxj1a7mKoaUCiEITCfNQ2s6xM+V4GQgfstLurYl3COP
 tg3/PBBG6GdByLMZCSAwAOPoT+4UDUbW/ySePXUOeSpNPr+Yh/F/uT780SydosqlOcvr
 3jvVVUBHp+Bcxdw8gb7AP5hqdqwp4koyTtlekucu213aEmVVjd4n5vZ+1ZpkuERJBJPV
 5NJ6IkaTvRqLITPrFl6HfCmBHyJwh2I4PgQSwKk7uGQFvAO44cFygI7SesxJS8kJCbps
 mYnREUQlLGA+fbcdQz1FYs0iUHliMjQq/5TLEkynm2Hubr927fT4RfzHWebzzuavHzma
 ySYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698375907; x=1698980707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W03Y8lFBgksp4nZkRCf2tWXHM6a0g6coXGTRRAurfQs=;
 b=wNUxIllJUZ8y3BOKlCGVrqz1mM2KzhAiFG25HU/5WI8Z2T1M0xu+Y1RnpcrmZEa5CU
 lXgvLuhUjxtmmfEPlITXLz54jaTgtojL2/cBQ1DrVijb9pi+2CPJrMB5heKmQRnkI61u
 1GaWK+I/v+Zvm4XGJ8r7NFRmVNZAjzh8lat5nTV0TV+/HAZQPhGwchwgswEjPSM1cJ9B
 9NVRV5opQBiy5r9w/XpaSwQYwqYQzoAGO9vna+ujUtEyTjREsv9IqeO9rvqhzH0ZO5Vk
 eBCuQvQqUUQA1IExQGz+S9vUjEkvDBrGOxfFa1LcHwRRhnl6FHCkfpuZn1zVnEsiWnkR
 qM/g==
X-Gm-Message-State: AOJu0YzaRiZXHBcqszzGaFbqU9pJR2jtdWPAH0SknjQvBhtXLnOVrYS7
 TyDVlg0NQwTcU9ppY/UQtK29MA==
X-Google-Smtp-Source: AGHT+IGcvKHk/AFqkD/tlUI6koT0Yo2gHCM03/iP03ms+DONAkcKud1bMM9d3ud2JrcOKbws/jrOoA==
X-Received: by 2002:a05:6a20:4281:b0:163:d382:ba99 with SMTP id
 o1-20020a056a20428100b00163d382ba99mr1931238pzj.5.1698375906700; 
 Thu, 26 Oct 2023 20:05:06 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net.
 [60.250.232.247]) by smtp.gmail.com with ESMTPSA id
 b21-20020a170902ed1500b001c74876f032sm396865pld.162.2023.10.26.20.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 20:05:06 -0700 (PDT)
From: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel-edp: Add panel entry for AUO B116XTN02 and BOE
 NT116WHM-N21, 836X2 and NV116WHM-N49 V8.0
Date: Fri, 27 Oct 2023 11:04:56 +0800
Message-Id: <20231027110435.1.Ia01fe9ec1c0953e0050a232eaa782fef2c037516@changeid>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Oct 2023 07:23:47 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dianders@chromium.org,
 dri-devel@lists.freedesktop.org,
 Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add panel identification entry for
- AUO B116XTN02 family (product ID:0x235c)
- BOE NT116WHM-N21,836X2 (product ID:0x09c3)
- BOE NV116WHM-N49 V8.0 (product ID:0x0979)

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

 drivers/gpu/drm/panel/panel-edp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 95c8472d878a..5bf28c8443ef 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1840,6 +1840,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
@@ -1848,8 +1849,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
-- 
2.34.1

