Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07414089A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A126E0A6;
	Mon, 13 Sep 2021 10:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DEF6E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:59:28 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so6200886pjn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHMZuCBFOg4nU4Z2pc8C/3IHJsW+iWPKImwcSRTfnZo=;
 b=RvKi9adbGcBHGtXJLAmUL52Qmn/rv0u8eil2Hs6a8Q2wwVB+M3oGst76Kc8zRaDZ6E
 Z1Oa8+OH00xQUBVNkjv2q0FVaNiZl86Rds10kOvmlFShdSdTB4ZffDkqHnXfSlRaEC7c
 uQsksj+d2VFY+Q7giFt9zuZ83diH8zjhFlPEutnZUD6Da/z6BXCdrA+y/IWqWBYFc4aH
 bLHpvSoWQsm4MazmrnPrVnCB2Um8fKqkoQ4Vj855GnI/nzqMwetHXXW8KE1GhohidSI1
 fbCZrMqgMXQA1Xp9jSGdVxY4a/MB/sG8eyxRdxYIRrSjdFh+4vS23BnYiMVlyaSxoWff
 aHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHMZuCBFOg4nU4Z2pc8C/3IHJsW+iWPKImwcSRTfnZo=;
 b=iiG869tL0Mgt5L3bJ++Wdqsy+qg2rUrSGTFX2i5ZIUc70U/uvm7SM9WX62vHJcDqh9
 KLHW0irYHz07EdHqcZAnRoMpwsPp/gPBUoZaqQC3f7WCwqi3bE/xfivtNQe1OkG0GiGZ
 RjNpJdrnMbNL+2m5NX1C+8PmpTt8xbrizhjCxXeo7rQKSqv12e6nP8jcpOvF2KdD6LhG
 7+EC+CFVzulP06sxWj9c3iUm0xTurw7qzhE68K3XuJFHde51DxZpWOlIDH21cFfl0M3+
 zUrv2zEd8IG7UJI2kzkDvvClnO9x/Ec8pIU3SevCeleCQmGI9b3UtyitaYbgqGuxziOt
 RtJQ==
X-Gm-Message-State: AOAM531FRj9T+CIMGCLXby2nRRbiuxU97FLxk0COBLfYl4QrWYQ42rZ3
 kA7toUj2+gyba3T0OiuxypOJWw==
X-Google-Smtp-Source: ABdhPJy1guPJn7N3DJdSqzNu26pConiFh+toPSDCQ7+vTWVEIGK7Jz82JveAXRkc6yq8T8V/EoXf+w==
X-Received: by 2002:a17:90b:224b:: with SMTP id
 hk11mr12381590pjb.76.1631530767693; 
 Mon, 13 Sep 2021 03:59:27 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id l22sm8279641pgo.45.2021.09.13.03.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:59:27 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v5 0/5] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Mon, 13 Sep 2021 18:59:15 +0800
Message-Id: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compared to v4, update init code and porch setting and revert DSI LS mode  in 
drm/panel: boe-tv101wum-nl6
 
-	.clock = 162383,
+	.clock = 166594,
 	.hdisplay = 1200,
 	.hsync_start = 1200 + 40,
 	.hsync_end = 1200 + 40 + 8,
 	.htotal = 1200 + 40 + 8 + 28,
 	.vdisplay = 2000,
 	.vsync_start = 2000 + 26,
-	.vsync_end = 2000 + 26 + 1,
-	.vtotal = 2000 + 26 + 1 + 94,
+	.vsync_end = 2000 + 26 + 2,
+	.vtotal = 2000 + 26 + 2 + 148,
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };

-	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-		      MIPI_DSI_MODE_LPM,
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO
+			| MIPI_DSI_MODE_VIDEO_HSE
+			| MIPI_DSI_CLOCK_NON_CONTINUOUS
+			| MIPI_DSI_MODE_VIDEO_BURST,
...
...
...

yangcong (5):
  drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  drm/panel: support for BOE and INX video mode panel
  dt-bindings: boe, tv101wum-n16: Add compatible for boe tv110c9m-ll3
    and inx hj110iz-01a
  drm/panel: Update BOE and INX init code to support touch function

 .../display/panel/boe,tv101wum-nl6.yaml       |   7 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 745 +++++++++++++++++-
 2 files changed, 750 insertions(+), 2 deletions(-)

-- 
2.25.1

