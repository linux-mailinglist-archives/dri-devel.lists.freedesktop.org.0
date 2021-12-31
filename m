Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2148220B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 05:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A1F10E262;
	Fri, 31 Dec 2021 04:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACA210E28C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 04:51:19 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id gj24so22728337pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 20:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t4K1Jw5wGBkWKkVXYcz32kDo5d4sUj56eGy5SLLt1cU=;
 b=UlgUmRHqZMnAhLW/TH5JlD6JclpjQbfp5oKLMfR4hCzYb/0kWyC6H27vFDveB2+hwV
 rLalRtjrLyd28B7caTA4tTzryIl355YR6y9BTzuYeCXj3IJSQ3WuPxmiQN1M3ImYUGQ2
 XUcjB5H1k9G3NpHtu6HGjWtTppz0Gd/zYVB3E0rRtf8LkAh/xm3t09G32AjwN7lh2nCT
 7SjkMpxw+386vQ1W+8y60v6k3g0o5R+GlM1zcL5HtFCrXi5pYO7qFPiguXdqSiDBVeo8
 hwFW99TpxBocPFlB0HfzzkPqDfljwOGHruQZLsfucqXEplT6Oqrje6zcGk9AsCLy3WOm
 xpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t4K1Jw5wGBkWKkVXYcz32kDo5d4sUj56eGy5SLLt1cU=;
 b=2gwtXi1BHmwWZn7nSf/82IATe8U7PlPWfnYhcQ6cVsILToxnwTD5itxdDKJirJ0/2P
 F7glQ1QCM6niHkcFFsmDufvi1vCafFZqJ7Ab0SGMxA/7Q14fAwspmlEDUnYC94QHfeYc
 njF91fhTGy4yAf85vmc74K/k0srNCNhCWnBVD4CcGzcG+0VB1MjCEKwBEZI6K0MOw7eo
 1tc1yL/8h0J3PDmXkVu3TUXnrCWfyDp0009i9K/HB1KHYhovslvCN+mgGpfIq6e4WqzU
 FmWtK7KYP1pCelP0bQRarrIPTFTuJMW06KDhwB2YzfGoAfmO+WtGykmG2q4TP05Dm6m2
 9UAg==
X-Gm-Message-State: AOAM532yvV4cQHvvWU3THnCaUdZoluXCutejphuKjkIHFWvaf5yGmuOS
 JIe+rMK6iwWKAIBvnBbwVlBjpA==
X-Google-Smtp-Source: ABdhPJxC3ej4ur32ZypJQelHyscgi+bht4m6PoLVSNBC+HTam6DIp3C2QXzucsFUfOmRgbPSc7ZOBA==
X-Received: by 2002:a17:903:2303:b0:149:50d1:19d0 with SMTP id
 d3-20020a170903230300b0014950d119d0mr33940979plh.86.1640926278988; 
 Thu, 30 Dec 2021 20:51:18 -0800 (PST)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id b6sm23819236pjk.29.2021.12.30.20.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 20:51:18 -0800 (PST)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Subject: [PATCH] drm/panel: Update Boe-tv110c9m initial code
Date: Fri, 31 Dec 2021 12:50:56 +0800
Message-Id: <20211231045056.118640-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Optimize two problems

a)Turn off low voltage detection register.During the esd test,
the low-voltage detection ic may be triggered to enter the slpin state,
so a black screen occurs on the panel.
b)Optimize CMD2 page1 gamma.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 5fcbde789ddb..1be150ac758f 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -86,7 +86,7 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0x0F, 0x73),
 	_INIT_DCS_CMD(0x95, 0xE6),
 	_INIT_DCS_CMD(0x96, 0xF0),
-	_INIT_DCS_CMD(0x30, 0x11),
+	_INIT_DCS_CMD(0x30, 0x00),
 	_INIT_DCS_CMD(0x6D, 0x66),
 	_INIT_DCS_CMD(0x75, 0xA2),
 	_INIT_DCS_CMD(0x77, 0x3B),
@@ -112,17 +112,17 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0xB1, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
 	_INIT_DCS_CMD(0xB2, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
 
-	_INIT_DCS_CMD(0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xA7, 0x03, 0xCF, 0x03, 0xDE, 0x03, 0xE0),
+	_INIT_DCS_CMD(0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0),
 	_INIT_DCS_CMD(0xB4, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
 	_INIT_DCS_CMD(0xB5, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
 	_INIT_DCS_CMD(0xB6, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
-	_INIT_DCS_CMD(0xB7, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xA7, 0x03, 0xCF, 0x03, 0xDE, 0x03, 0xE0),
+	_INIT_DCS_CMD(0xB7, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0),
 
 	_INIT_DCS_CMD(0xB8, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
 	_INIT_DCS_CMD(0xB9, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
 	_INIT_DCS_CMD(0xBA, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
 
-	_INIT_DCS_CMD(0xBB, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xA7, 0x03, 0xCF, 0x03, 0xDE, 0x03, 0xE0),
+	_INIT_DCS_CMD(0xBB, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0),
 	_INIT_DCS_CMD(0xFF, 0x24),
 	_INIT_DCS_CMD(0xFB, 0x01),
 
-- 
2.25.1

