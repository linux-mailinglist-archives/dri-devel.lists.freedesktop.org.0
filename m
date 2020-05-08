Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174821CBB01
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 00:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF98B6E2CA;
	Fri,  8 May 2020 22:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AABF6E2CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 22:59:25 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id j21so1544896pgb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gy8mRnKGCdAlapJUNLKgnq4stIzTWpMgvZsJaIARMf4=;
 b=K5ld8pUSdKEuNRDrb6rIvsCRyHYpaDMubCYD4sukObf0hIGmT4kVqWfF36QvqNYGpr
 NxoCH0TZi5eD9+cXXa8WS93UxuRODo8rjVOUshlEwZQABiMryGUnwTLF35PqcIcpj4ku
 bF32L3llPP+k2g9M6lBkn9AY84SaUi3yZ34Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gy8mRnKGCdAlapJUNLKgnq4stIzTWpMgvZsJaIARMf4=;
 b=AMHrvoJ54d85puE8dPvDBcded3GCSNf6TRYoCocaOy747a30tZ3NIIoQ5RmC5Hb11D
 62jcbNB0egFkuxZJ1Wo9npYyZkSxknAttE8asPWPi1Atfeel4H6V8Jexte4tpfpdzQgt
 fzfu7f5mN4q/opz8sZr7NyhOv+R9oY8HatwKjyA5o71OLlv3XxOcZh0SmzzxVwhqEWhU
 K4bcwp2sljrgSbSXaIkDL2K/TsQi6FHeQ2CpGeiJzwq1xInRf2eZra47xGrk7K2WBrZg
 fOYV+HGWj371b+eeMFcZZJDOhvfmUvlmdKTFJ6b1o4nkwtv/n0RA9KCNL1as2qUphX5r
 Dgtg==
X-Gm-Message-State: AGi0PuaJJroDVY43A3xDxKWcG6VrWUg2ji1AXLNYuw6BNqCnjibx30X6
 zSs7C9xXkPf1/6Wi0NSgvUfm7w==
X-Google-Smtp-Source: APiQypIh2ee0YZT2wE0RprXGN5jO2Gbnro485v/sWkDaPIfiCHYp61N2iTZmNPK4/xQdSaGusoO57A==
X-Received: by 2002:aa7:9251:: with SMTP id 17mr4911760pfp.315.1588978764710; 
 Fri, 08 May 2020 15:59:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i72sm3062874pfe.104.2020.05.08.15.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 15:59:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 3/3] panel: simple: Add BOE NV133FHM-N62
Date: Fri,  8 May 2020 15:59:02 -0700
Message-Id: <20200508155859.3.I525ebd471f5340a6a369af7bde06ef04174d2f41@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All info I could find about this panel show that it behaves the same
as the BOE NV133FHM-N61.  However, it definitely appears to be a
unique panel because reading the EDID shows "NV133FHM-N62".  We'll add
a string match for the new panel but until we find something unique
about it we'll just point at the N61's structures.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 7219436499f1..7fb7b257f968 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1173,6 +1173,7 @@ static const struct panel_desc boe_nv101wxmn51 = {
 	},
 };
 
+/* Also used for boe_nv133fhm_n62 */
 static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 	.clock = 147840,
 	.hdisplay = 1920,
@@ -1186,6 +1187,7 @@ static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 	.vrefresh = 60,
 };
 
+/* Also used for boe_nv133fhm_n62 */
 static const struct panel_desc boe_nv133fhm_n61 = {
 	.modes = &boe_nv133fhm_n61_modes,
 	.num_modes = 1,
@@ -3659,6 +3661,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv133fhm-n61",
 		.data = &boe_nv133fhm_n61,
+	}, {
+		.compatible = "boe,nv133fhm-n62",
+		.data = &boe_nv133fhm_n61,
 	}, {
 		.compatible = "boe,nv140fhmn49",
 		.data = &boe_nv140fhmn49,
-- 
2.26.2.645.ge9eca65c58-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
