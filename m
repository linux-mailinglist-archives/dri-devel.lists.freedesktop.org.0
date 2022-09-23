Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64535E762A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A9D10E4B4;
	Fri, 23 Sep 2022 08:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA3210E4B4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 08:50:33 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id fs14so12273289pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=m0GiZu8zLID0eFEYzNtc/d/rbc2E3znwv6VNJxzsvXA=;
 b=L1P50DVoPxcpKqaRrMElsHyMYUo6ZaCJl7prsqcYutvTJA7fdBiEBxp1bG2bu1SVpu
 FDQKD1dFsz6h760y7ANrdH013zGD1YCkLjBi5vewQeL/h3yyoBjHNoOHM11XNGW2+N1o
 tvkjrU2s1NFsJTkPNrnF+lJn1q8CRjuHIong0uyoF4n160gkkvES7QFotkTGsYR+rB4P
 CrCtDdeCppNurnU2VQjWpeaokkIoukOavSBoanKSgp3/OYWEM8WU8pLg/+n7bwPUmaod
 zJHqB3Yc9wy5KZT9+RDWSQiyZZszMDoRGPwZ+G8jWSRfWPjCweKYgHcOWdG1T3dDmg3m
 gz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=m0GiZu8zLID0eFEYzNtc/d/rbc2E3znwv6VNJxzsvXA=;
 b=ebwsWM+AaZfLcxdXWkqPhNNw6zq7sfaDI289erDAbLcezOwC7r2TycPIhp/xClphu/
 UCNGV6gsFUjQ8VX3Auz4Q3hctLLVWoerH9RjPAWA+6Hj8TR+S98RLLUEQf3xCUhJvXZW
 Kfq4BI7+bbjk4aoF8RlurcvY1SbyncFhs8j9sMn3+MwmifGww0DCE8Tl1LNViRE4n899
 ytYKQbPiWoTOuTSKMFFpqB481lECV+2C3SwIiNMM/kz3p13N+MJWy4hP9a99lVPMH7tN
 tB48byUZA1KwYTfhWhJS/66O+MMH/gKvjmhB4++x1tioxbRxlmqMc451V7w1mBFyacZK
 cPaQ==
X-Gm-Message-State: ACrzQf2jHPYYHTy9XOYxqOMumX1IurQG4GlMo4gJXCemnXG6W14murED
 lYHBc9yleUJipfSjVXenBySb4g==
X-Google-Smtp-Source: AMsMyM6XLM/RH9WGNR6ufoC8vvzvqomkeXaZ1axni1bMksT4CeQzyEhzm1cd+oc/7z3kyomHv+TvOQ==
X-Received: by 2002:a17:90b:38cb:b0:200:aaa6:6428 with SMTP id
 nn11-20020a17090b38cb00b00200aaa66428mr20116518pjb.47.1663923033565; 
 Fri, 23 Sep 2022 01:50:33 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a170902f78300b001752216ca51sm5507871pln.39.2022.09.23.01.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 01:50:33 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add BOE NT116WHM-N21 (HW: V8.1)
Date: Fri, 23 Sep 2022 16:50:28 +0800
Message-Id: <20220923085028.306790-1-sean.hong@quanta.corp-partner.google.com>
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
Cc: Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the BOE - NT116WHM-N21 (HW: V8.1) panel.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 060f4f98bc04..5069440633fd 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1885,6 +1885,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 
-- 
2.25.1

