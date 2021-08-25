Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FDC3F70D8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 10:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B594890BB;
	Wed, 25 Aug 2021 08:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983BB89A5C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 07:09:23 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id 2so6406750pfo.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=fA/w6VbuGM8pz72LZbM00XZwUh+fEwMznPqSYKJlrlM=;
 b=URLbWU5XNwcCMf30tqDUV8PDQOM8J0XqWN6maA7XjM1ag3xXS5ZtP/h0SzOMl6wgZy
 QOsIdwEu5X8pEWLQeEsvgSLXD1qx3qnWYzcMZeaaE9SD85UXD7jSSFJ8RwU92ldd1w/J
 F36TTnl3PZWb9K9uaUzW1TvITaNWP9mlkb5AkFbDmD0e1ZjyWcUsD2IkPGl0dPPcsIu0
 ZJ2xwI1JUOXnDZwXanBsX0TmX7MAcIoWxKPpJUbA86QYPLnc4QodpZw1QiwaeyYAYdra
 CPF/S12tn930YF2sh+FVa2cMMa7fYUIv8+mzyvFzEoHBjYmbkNBNjniRnowU7eXpvgdx
 zKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=fA/w6VbuGM8pz72LZbM00XZwUh+fEwMznPqSYKJlrlM=;
 b=TcEtdrtX12Cz9cSRQjBdIqXZGInuntbI5XR+eyIZizEIFQcllETrGSoxBhlBKwllx4
 MYRS6Gvu3SBlkjyCnlG03EHnhUpEeitkrM5uGou12Tr8Fgz48w9wlXCEsfUV9vFntwtP
 8o0O3n3/xIWo6Pc9Y+ba+YgkarnPWsn+LNaZjApltD64XfwdPoOJASUouo8PGOzcYiaq
 R9JgPRxdsspTmyxUMMVzpy6Y5CV5I7UhidQD92hh8FmxkWkujikgvafRKzcyJM2UfmlD
 30Qr1y63Xb4/UMKxKPoK9RYltx5GC1nlAHq8fLIS3xWNJD+NU3andWeRd/wFJO2sEO6o
 jG5g==
X-Gm-Message-State: AOAM532t2yV8hxndoWOxT+fF+ZrTGLf8qm8lRY0ywqEzPbQHprRuEDMp
 4a7CXxmeyyORjPy/9oRBP1o+IcFgayck6w==
X-Google-Smtp-Source: ABdhPJyKOzOQVI/q9iVV98cWvqgD2qR0NFOXa7awEdU8hf0TZ+I7tOdIoZAWdHOQHQ5JugPUZkrswg==
X-Received: by 2002:a63:f154:: with SMTP id o20mr40451123pgk.172.1629875363168; 
 Wed, 25 Aug 2021 00:09:23 -0700 (PDT)
Received: from image-900X5T-900X5U ([39.117.32.248])
 by smtp.gmail.com with ESMTPSA id l12sm24748818pgc.41.2021.08.25.00.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 00:09:22 -0700 (PDT)
Date: Wed, 25 Aug 2021 16:09:17 +0900
From: Jongpil Jung <jongpuls@gmail.com>
To: ajax@redhat.com, daniel@fooishbar.org, airlied@gmail.com,
 robdclark@gmail.com, thierry.reding@gmail.com, cpaul@redhat.com,
 a.hajda@samsung.com
Cc: dri-devel@lists.freedesktop.org, jongpil19.jung@samsung.com
Subject: [PATCH 1/1] drm: Added orientation quirk for Samsung Chromebook Bugzzy
Message-ID: <20210825070917.GA16957@image-900X5T-900X5U>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 25 Aug 2021 08:03:11 +0000
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

Bugzzy has different type of panel from clamshell.
So we need to add quirk to change orientation.

Signed-off-by: Jongpil Jung <jongpuls@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 902cc1a71e45..3c85afd3ef17 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -66,6 +66,12 @@ static const struct drm_dmi_panel_orientation_data vios_lth17 = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data samsung_bugzzy = {
+	.width = 1600,
+	.height = 2560,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct dmi_system_id orientation_data[] = {
 	{	/* Asus T100HA */
 		.matches = {
@@ -108,6 +114,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
 		},
 		.driver_data = (void *)&vios_lth17,
+	}, {    /* Samsung Bugzzy */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Google"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Bugzzy"),
+		},
+		.driver_data = (void *)&samsung_bugzzy,
 	},
 	{}
 };
-- 
2.25.1

