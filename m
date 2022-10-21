Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB2606E2C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 05:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105B310E41F;
	Fri, 21 Oct 2022 03:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3E210E41F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 03:10:29 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id g28so1349699pfk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 20:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lqy88kgcdqgVJZiFTICz5DdP4bxwc+5bmeTWZHzDx0Y=;
 b=Vm54pQmKTiZYDhJDqnLWts3Q4KaijkpvkPRKZ9iQIKybieWKuKKPyBdS4kLqddffpX
 oBPvk9kzrb3bqPp2Igg7kQSlAjJv6bMQnSawt11kJvEk6NI6LbbD5QxeMRcm1GDvorvG
 2hUYsWjpDTbw4GQckWvdL4ZmqqcfZVLnUxcbgSUWOIwCIE0O8AKD9S+2QHb5xNIwpif8
 AZJRj0ySLjZ4rkBkhNP5Mxkx9dE0hlH+DHGwB2FWCaR436+aQAOl39ttvPpSZ7wbYzLY
 UcvWT5YjUvwi092vPjeOuu4vtDfd21Ltmgc/374RLBhDBMyY0vaRwGPcBInr6D/u0x6x
 RAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lqy88kgcdqgVJZiFTICz5DdP4bxwc+5bmeTWZHzDx0Y=;
 b=VAStaz7D/Io6FbVd0f5arg9KWCU00T8J/WiTZYDv5IPp43mW62YGJELUDdN7uS32v/
 ERWvBSN4Exp9KNi8dgbl0VdB8Ik5FzeFV83CR76thDG1KZ1AW3AkSpVYOzeOF8n6F/LR
 n5YaD6raR+1XBqR6Qf7UCxBoXKhvbHaEwAILe1EK/8jgl1XQH0+kE78x5KJ/dIww7ZTl
 xiQp7LPs8WeU0J/KPoZ0y+BhGjxpBhq0mruDa8MyD7X9h3SyKkNYKXbWoaUthqMQ6LNM
 +pxiNh9vFhCEpOfEEWe28sszVI7AXAIY2+j2+lyYTyPxl9TTQZxw6D2j4boI4zzvtswP
 wyWQ==
X-Gm-Message-State: ACrzQf1n6VRIs7wy7pxZk8tag50zfyUIZfjgQq3uX9LyP7uul4+NPEzV
 rTVjqILQ5w2Vp2IZbl4Pof46eg==
X-Google-Smtp-Source: AMsMyM6N78wjujSI1lfFxzM6CMjAXO093s8B96q91MqDf39PAYKlSzniPHslFTatE4kIY2Lf8F+WSQ==
X-Received: by 2002:a63:485f:0:b0:458:764a:2224 with SMTP id
 x31-20020a63485f000000b00458764a2224mr14235293pgk.620.1666321829224; 
 Thu, 20 Oct 2022 20:10:29 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 i34-20020a632222000000b0045913a96837sm12459499pgi.24.2022.10.20.20.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 20:10:28 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add INX N116BGE-EA2 (HW: C4)
Date: Fri, 21 Oct 2022 11:10:24 +0800
Message-Id: <20221021031024.2899082-1-sean.hong@quanta.corp-partner.google.com>
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

Add support for the INX - N116BGE-EA2 (HW: C4) panel.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 4b39d1dd9140..82c81622a169 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1885,6 +1885,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, "N116BCN-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1153, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
-- 
2.25.1

