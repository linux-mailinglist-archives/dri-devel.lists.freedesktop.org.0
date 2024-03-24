Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB2887C10
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 10:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082D110E084;
	Sun, 24 Mar 2024 09:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=g.clemson.edu header.i=@g.clemson.edu header.b="uYSKwQ7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB99B10E14B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 02:05:28 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-611639a0e4eso187347b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 19:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=g.clemson.edu; s=google; t=1711245927; x=1711850727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/3eJdLTiaJ5WbBvAcx/Ng3C1DgyvhQmSTdGW5VESX1g=;
 b=uYSKwQ7NT/tn6gGNQET1OUtNmI1x2ahHuNHZthhFT9qOIfl7gbn7pZ8DjMetAxg4zk
 ae9XiP5GVEYFon9aRAe8dg/2sXlNRBLyYBJu05pOjouxYlzE2yi/CNg/wtpDTaXq7dWK
 ppapvz+NtsEKGR1VLeDXPdkq78uAGNj60BYfSg5g+CIh08wPSO7n2VUs1YkcZLchvBYV
 mcNn9T/5528NI4zwn8T2s4uCTEVRNkdV+JzBVxxv6sUeYo8gIISKzjCNpv4C2RuuZ0rd
 cJLI95AcNiwn6KrDd9zM4ByVSp8j9ruohPfsjLXRkTESmsjJGu3Up7lfrFgXyXasfYkQ
 1b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711245927; x=1711850727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/3eJdLTiaJ5WbBvAcx/Ng3C1DgyvhQmSTdGW5VESX1g=;
 b=j+CYnRwN/NG8ZgUmW88soK9AZaKuIOxDNVAwv6H9XBG4Ae8CnZ+ubrKpaYRn68eGQP
 lE8+oqSpvHXhwW3//7Ef1PQjqrw940ryP5cfAo23OzEUAeXsCsUkmKP7yfx52EmchjAc
 dMzL3MOpVDLG6E1swgvLvoPoQVTDAEVrDOmXbx3BIeg8yDB1CwHL+mf6nIiLmjTtGwJe
 44NWf415j9gpgsOG8qSu8nExmOgPnKxetXjsn+sU3cTv4DaaJGQ62M9tZ71bZM34dcYS
 AyMeqT7Gol/mq9YK1koYXKSfVROb178WavxlvSsFag1jTngazuousWw92eIXBcjHeWy0
 ajgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDrTcOsEqc95mKGRijAGK8o/u5jkAiFJ2hBaQAkrao931l8csWvp1EBw2ECdi+bE3iXG890eohUDkHm6TZm2jg7atA+KWv2s8SXf2b9uGf
X-Gm-Message-State: AOJu0YyB3yNH7HvjE5yw29261HDtClOIz2U2gA2ubhw0oWEb1BUZp/CV
 2ClznlSTu0dO8Q0e0KxRl/0vOOJOaFAw/yRBPT48YWpXZJCPYbtnzjW/vdw6uQ==
X-Google-Smtp-Source: AGHT+IH7bshBEpXrBz6f2reJsiz2RhBfp0ItfogGGdyRW9iUolZWkHGVZWa0gAFa4N3dG6Moby7prA==
X-Received: by 2002:a05:690c:6c07:b0:610:d7a7:43cc with SMTP id
 ir7-20020a05690c6c0700b00610d7a743ccmr1641236ywb.19.1711245927372; 
 Sat, 23 Mar 2024 19:05:27 -0700 (PDT)
Received: from mephi-laptop.localnet (130-127-40-81.lever.resnet.clemson.edu.
 [130.127.40.81]) by smtp.gmail.com with ESMTPSA id
 g2-20020a815202000000b0060a08edc81dsm518716ywb.4.2024.03.23.19.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 19:05:27 -0700 (PDT)
From: Emilio Mendoza Reyes <emendoz@g.clemson.edu>
To: neil.armstrong@linaro.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: Promote warn_dev to WARN for invalid calls in
 drm_panel.c
Date: Sat, 23 Mar 2024 22:04:47 -0400
Message-ID: <2388112.ElGaqSPkdT@mephi-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Sun, 24 Mar 2024 09:12:44 +0000
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

From: Emilio Mendoza Reyes <emendoz@clemson.edu>

This patch is the second of a set of two.

In the kernel docs there is a todo:
Link: https://www.kernel.org/doc/html/v6.8/gpu/todo.html#clean-up-checks-for-already-prepared-enabled-in-panels

The first patch addresses removing the duplicated code. This second
patch addresses promoting instances of dev_warn to WARN as it is an
error in other code for these functions to be called in the invalid
state that triggers the checks.

Signed-off-by: Emilio Mendoza Reyes <emendoz@clemson.edu>
- ---
 drivers/gpu/drm/drm_panel.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index cfbe020de54e..0b7602c8b387 100644
- --- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -114,7 +114,9 @@ int drm_panel_prepare(struct drm_panel *panel)
 		return -EINVAL;
 
 	if (panel->prepared) {
- -		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
+		const char *name = dev_name(panel->dev);
+
+		WARN(1, "Unexpected attempt to prepare an already prepared panel by %s\n", name);
 		return 0;
 	}
 
@@ -162,7 +164,9 @@ int drm_panel_unprepare(struct drm_panel *panel)
 		return -EINVAL;
 
 	if (!panel->prepared) {
- -		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
+		const char *name = dev_name(panel->dev);
+
+		WARN(1, "Unexpected attempt to unprepare an already unprepared panel by %s\n", name);
 		return 0;
 	}
 
@@ -208,7 +212,9 @@ int drm_panel_enable(struct drm_panel *panel)
 		return -EINVAL;
 
 	if (panel->enabled) {
- -		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
+		const char *name = dev_name(panel->dev);
+
+		WARN(1, "Unexpected attempt to enable an already enabled panel by %s\n", name);
 		return 0;
 	}
 
@@ -246,7 +252,9 @@ int drm_panel_disable(struct drm_panel *panel)
 		return -EINVAL;
 
 	if (!panel->enabled) {
- -		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
+		const char *name = dev_name(panel->dev);
+
+		WARN(1, "Unexpected attempt to disable an already disabled panel by %s\n", name);
 		return 0;
 	}
 
- -- 
2.44.0

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTcaZbABwnECYA0cZI0LAN3EqikFgUCZf+KPwAKCRA0LAN3Eqik
FgImAQCqtDgta8+cyU8aAaWN2QTflyiHrNWqB1YmPkVggV1xSwEAx6Ge9YOH7vNL
hmew94ipW21OuQzIeHtSjLpqJ5Creww=
=aLEl
-----END PGP SIGNATURE-----



