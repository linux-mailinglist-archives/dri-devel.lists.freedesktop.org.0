Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5865281E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 21:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956DA10E409;
	Tue, 20 Dec 2022 20:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2943110E409
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:58:34 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 b4-20020a253404000000b006fad1bb09f4so15254080yba.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xKXJYD4y3GZm6HnbUvNVngViJ+1dwURTi8LZvK89erU=;
 b=RXCH9eozNGJe68h9FMYrzQJhw22LY0QHXX6+wB2um85IcAi5F13jRtC7I0TNFbJIar
 RwQvRrrx7hfydCNo0RhFfUO89kcOUdFDqQDCHOt4/Iifcm1/zFd3wX+48WBj+rWbV1ZT
 v2kGq6yI4qZj5C14WmsSZIK8enEWBQbGS4KpYT3VvM6NafsmikBtRWx1bcZPBkCYeEXM
 ZrCsjNSciIkJu9ZGo027Kyo7DBkJ1Y4VcNjzH5HCVG73UcVlirgFm+ql7XrJ363COUiG
 EKvLb1wejLOUOro1C4+BpciF34R+J4JCJcXFqZCJ6R1Ks5lIbZ2NAuvIVUL3cfOq/oLc
 sNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKXJYD4y3GZm6HnbUvNVngViJ+1dwURTi8LZvK89erU=;
 b=kXN1nhHoPXRLKQJOCDeEJs2NWYOLLUaHX1ok0XcsI2ObjUrSGslNsUIN0TDLkJkpeg
 qSa7YYWcMxYTRnm3XuK9KyS7p0NDkUlj5nqPgt5xnyEHjCsxTONWhd+DetfHOiuoFIjh
 znckAMEaXx1z9KKGztpYSFsY2sGejMKC3TRPn35+t6sePRKBSFvJDKOHfm5TWF2AiG5A
 LfuRzwsO4KGiHgN3oFOsD+Pp2TB6yIDCo4ZvSbLhdK1FDY3FJNANQNRr/vkNsobV/8st
 mQqxcOrF/g1ee7Cx/RiVlUP2dkfP8y4SXCLSfD8veSdmIU7xl0ymunC9IzwZTS5uq25w
 rLqw==
X-Gm-Message-State: ANoB5plYjfQeGFj5bXDLeAQy0Pj0whzIXmmM9foIREvr487aW+MG6z4q
 B9cfpAZiGEiE7XAg1JBZEIGTPXA=
X-Google-Smtp-Source: AA0mqf62lrjKa/xKuoPUB06pOfTcVG9jO7sxI6hq7SOB/NNrncyWkccriCLbejKVXjezqQgqvYhpWDE=
X-Received: from ptf16.nyc.corp.google.com
 ([2620:0:1003:314:ef24:68f2:407a:84b9])
 (user=ptf job=sendgmr) by 2002:a0d:e783:0:b0:3bc:d289:f4b6 with SMTP id
 q125-20020a0de783000000b003bcd289f4b6mr4168855ywe.417.1671569913163; Tue, 20
 Dec 2022 12:58:33 -0800 (PST)
Date: Tue, 20 Dec 2022 15:58:26 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221220205826.178008-1-ptf@google.com>
Subject: [PATCH] drm: Add orientation quirk for Lenovo ideapad D330-10IGL
From: Patrick Thompson <ptf@google.com>
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Patrick Thompson <ptf@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel is 800x1280 but mounted on a detachable form factor sideways.

Signed-off-by: Patrick Thompson <ptf@google.com>
---

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 52d8800a8ab86..3659f0465a724 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -304,6 +304,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Ideapad D330-10IGL (HD) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
 		.matches = {
 		  /* Non exact match to match all versions */
-- 
2.39.0.314.g84b9a713c41-goog

