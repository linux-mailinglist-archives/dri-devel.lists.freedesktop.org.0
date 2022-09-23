Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18535E7495
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2281F10E426;
	Fri, 23 Sep 2022 07:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9958C10E3A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 05:46:19 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id go6so11935751pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 22:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rz7zDp7u3nZE/L+YT9u0XbpEYeueZmnCFYIryouZKTI=;
 b=qplLucR8pBwSMYPEnF2SKKtbq4cDJapzkW9/CTMdqQNAzgrknTKQAVbH8EJ++5vJA+
 xhv9z574lG3HDuPcrYbsPvCWuSZ4p+1NitcVNR6PWlA8nHemqEbr/xtR4L/IaSGI7AoA
 adTzqdVQm8AnLLyufTl3vL811gFj4ZcVpRkIHLOjuCLbj5oItm1UfCo65kQIdUR5bGho
 8Fo9ff279IcMtR9UI5XELo4s4Or2TH2gRYtIoBdhTiz106d/ZCq+R2qqs3r48P+zGIGl
 3qd1usH6SPU3qOOQ1DqhmkrKDZLu4CcPX3LkjhOTiilxETI4V3330KvcRu1jl0+PZDdK
 xdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rz7zDp7u3nZE/L+YT9u0XbpEYeueZmnCFYIryouZKTI=;
 b=jjs+CX+DWrgdlLzR3w2pGI9+WIgO0xFY1CEmLu/0QIRQoV6LO+FwrqmlDchB8tzton
 OMjnUVBz4FqKah0FaiwLnySwVYNfJD0SXX8WyYzxghUQOJGBVJsAqxQyRB5BM4IUgtIu
 NLiGHXfFvVWGsAlffgagBb8GTKrIlZIu5SUcI9O4MKaW4/ROFrNyv639u4Zb0QwoI6qd
 gjIhq8LuTTsv1zVbEpZFJIIll6oS1owBnHxmoeZ2ha3zN6gWqga6lriIkI9wKsvg5prO
 nl/eBLm1d0kF1OoWK/wTxdBFKDZKCbj7bNAYn1EFud+G1pU22CqjqR3t31wQ8YWkYA0P
 uyQA==
X-Gm-Message-State: ACrzQf2zPztGHWhpRe5Tn3HgxrDOopOQLEGQldQXLf6XPfbMfw2d+chQ
 6FHO+3RdwoVS1SVsK2pCn3R6bw==
X-Google-Smtp-Source: AMsMyM68hbMFb6kwhJm3g05WhgnMCkPkO/6+oLPU5PV7bz1oUK73SSnkwkVTboXgK2jefgE7Mz4Ppg==
X-Received: by 2002:a17:902:d402:b0:178:98e5:7c0c with SMTP id
 b2-20020a170902d40200b0017898e57c0cmr7081957ple.84.1663911979182; 
 Thu, 22 Sep 2022 22:46:19 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902a3cf00b0017691eb7e17sm4983579plb.239.2022.09.22.22.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 22:46:18 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add BOE NT116WHM-N21
Date: Fri, 23 Sep 2022 13:46:14 +0800
Message-Id: <20220923054614.302440-1-sean.hong@quanta.corp-partner.google.com>
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

Add support for the BOE - NT116WHM-N21 (HW: V8.2) panel.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 060f4f98bc04..8cf81395ba36 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1886,6 +1886,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
-- 
2.25.1

