Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90716617E03
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B7A10E297;
	Thu,  3 Nov 2022 13:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D62010E297
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:37:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y16so2778547wrt.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQObRj1fLljMghwTGdyG7iiJYiKrhA/G2GUNBFCKkL4=;
 b=moxz4QNk4yCb2aQKy6jQXahW8ajOrZtC/diHD7ZWobwQKBrhHqNZI3L8x6S4yuUxEb
 rBm1527B8GEjc3Evo4RRqMHD160JLzBo1zhgm9LT4b7rhNj6W5SCQhjJPA0IGW5GUOpq
 ZTCPE3BEZAH3o3ugBWCMz4R1ZfDBB750HbKtsRUWexuUsjFpTrP09j8KBLahcT4m/hWO
 B1cnLQAbpbk5TAC7himNSXrQ6SWaFDVv98RNg5iaXR9aQz8ubwJ4xCRbslQbxYvhj2cB
 L2yFnxhNibz9eQd2b6JYU/rZSVXMlNDNG+5Psrj7yI1BTutqfd6kcxp3b/pdM7DNv9Aw
 jTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQObRj1fLljMghwTGdyG7iiJYiKrhA/G2GUNBFCKkL4=;
 b=o7ZdkFS0Nf7PvCAG1oHvkwSEijOxYXG7RtLCE2FfGMMASRvB6BvFT8fTOm/a9wMVMz
 lRRHMQ3zGFyZZuUGmIt4HIBkXcNj5pjeoJOTFvC22Qm5XcphD5drYd9kN8unJJa6Jak0
 dajNGKimJHhFqLmcMPZy/1TNjEM6C36du2LaOFEW/K6+C0D5FnJuJuIUgmtLj/qmb2AK
 d7i2QTY6bLAEPq/WKEwGashfaVEaw6GNRqjyKqn0nG2LSpOPXhVmCaZ0XOk+Zj02zlVI
 xlCp/DEZ7XNAkzs7gljrGMtx6GRfzs2VdNJP4+sclpuCAwU1uE/8UpCb9jJlx1nI1oP9
 pYbg==
X-Gm-Message-State: ACrzQf2Vqhgpl4piDZ96w4xHsaC2asfbpVKbv4IVaAlf1dnPjsMOXsxl
 KT4hK5ntAktOfS3ZEauqeeg=
X-Google-Smtp-Source: AMsMyM6VJhNaQLv2eovD9bo01zxxi/6VKi2YUfWTTpGGyKS+fCjLc2njBZf9ROSGWp5O4FwsZnRENQ==
X-Received: by 2002:a05:6000:1e0b:b0:236:8a6e:8d with SMTP id
 bj11-20020a0560001e0b00b002368a6e008dmr18586010wrb.20.1667482651976; 
 Thu, 03 Nov 2022 06:37:31 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 bt12-20020a056000080c00b00236576c8eddsm929171wrb.12.2022.11.03.06.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:37:31 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: make a couple of read-only arrays static const
Date: Thu,  3 Nov 2022 13:37:30 +0000
Message-Id: <20221103133730.80940-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate two read-only arrays on the stack but instead make
them static const . Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4671dc23abe0..50d488cc840e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3916,8 +3916,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
 	struct drm_display_mode *newmode;
 	struct drm_device *dev = connector->dev;
 	const struct cvt_timing *cvt;
-	const int rates[] = { 60, 85, 75, 60, 50 };
-	const u8 empty[3] = { 0, 0, 0 };
+	static const int rates[] = { 60, 85, 75, 60, 50 };
+	static const u8 empty[3] = { 0, 0, 0 };
 
 	for (i = 0; i < 4; i++) {
 		int width, height;
-- 
2.38.1

