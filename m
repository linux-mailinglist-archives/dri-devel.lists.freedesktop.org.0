Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2C1CBAFF
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 00:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AC56E21D;
	Fri,  8 May 2020 22:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059766E21D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 22:59:22 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id js4so978783pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 15:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4yPuc1IBO0Fpnm5cH3RYbHF1/VvJ8rseVz+WFhHEck=;
 b=VPEPKfr0LpFXRwKZseBAaugcPZIisNSbI8QDDiJ5iM7IDfqVfeloezY7Mx5OmrxuXJ
 n0fWKGZ6VaznJFxuCz+eQRHIKwjre+sRj8KVs5Rwrq+C/UWwJDgi5xda9Gf7lFEVTATy
 pryaY5dZVtK7IlkgvcMQje0Wi0ArhUEKlGh3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4yPuc1IBO0Fpnm5cH3RYbHF1/VvJ8rseVz+WFhHEck=;
 b=WjuxV0+qEYey0A0Tko0M/LeFlR5EMrn7ej69798ZqURhoAtoGe2AoqszzNG9K6eMJf
 nPjnC8t1xq8uHa2sbQQtOnwge6CZ0h2IwPhC9eudLTRy46D3AIqMT2h7+UtFtYSFmRrE
 Peg0UUBc6CgMaehc1esMCwfFuzl7xpbhJl6SBA5TgaMSqAWAO3qxLT00pcp3xBnKXvuZ
 ljQ61fnmgJAsmSZA3EPi6FotGHURk28ewD5xvHpy+P53b8b5SJvZ9t1Y1yA3F2n+BI0P
 9c1fywBc+ZbSY4Pn6X5GAFtCOT7Zx85Q4I7H5XdzbmOALOQI6WIgb8mcY9IzPkfgUy3v
 ORYA==
X-Gm-Message-State: AGi0Pubc9xoRyeD7fP7f+alfYzCzVE7abF3K4rG5kzXEWfnQxuuwta9y
 e7/j7bhQkL8/64pPTZIszjPiug==
X-Google-Smtp-Source: APiQypLq9GOG18q+UNqlsvudYEAfECHIF4Ub5kQ4kC7q+ReXKvIaZAAJMf/RFYQ9gNVjy8LNt8MdNw==
X-Received: by 2002:a17:902:23:: with SMTP id 32mr4625148pla.40.1588978762408; 
 Fri, 08 May 2020 15:59:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i72sm3062874pfe.104.2020.05.08.15.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 15:59:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/3] panel: simple: Fix size and bpp of BOE NV133FHM-N61
Date: Fri,  8 May 2020 15:59:00 -0700
Message-Id: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
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

The BOE NV133FHM-N61 is documented in the original commit to be a
13.3" panel, but the size listed in our struct doesn't match.
Specifically:

  math.sqrt(30.0 * 30.0 + 18.7 * 18.7) / 2.54 ==> 13.92

Searching around on the Internet shows that the size that was in the
structure was the "Outline Size", not the "Display Area".  Let's fix
it.

Also the Internet says that this panel supports 262K colors.  That's
6bpp, not 8bpp.

Fixes: b0c664cc80e8 ("panel: simple: Add BOE NV133FHM-N61")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d6c29543e510..7219436499f1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1189,10 +1189,10 @@ static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 static const struct panel_desc boe_nv133fhm_n61 = {
 	.modes = &boe_nv133fhm_n61_modes,
 	.num_modes = 1,
-	.bpc = 8,
+	.bpc = 6,
 	.size = {
-		.width = 300,
-		.height = 187,
+		.width = 294,
+		.height = 165,
 	},
 	.delay = {
 		.hpd_absent_delay = 200,
-- 
2.26.2.645.ge9eca65c58-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
