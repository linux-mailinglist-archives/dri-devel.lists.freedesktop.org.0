Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9925F463692
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EFE897E7;
	Tue, 30 Nov 2021 14:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14CF6E082
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:23:09 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3PZj3rjsz9vJy9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rAsG_T2oAkl for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 08:23:09 -0600 (CST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3PZj1dS1z9vJy4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:23:09 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3PZj1dS1z9vJy4
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3PZj1dS1z9vJy4
Received: by mail-pg1-f200.google.com with SMTP id
 m5-20020a654c85000000b00325a50f232bso1197564pgt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuQ42+umRcpPW+VMKGxj6sWr71Sv5xh4Rg14DLaks5k=;
 b=c7PDDDKGgIZzG8yK7s1dvsTrFzqOP94TJTfQVgUjUC1vIiHeToWPdM4TJ1y3yXSmYf
 S2cYQfUp9hdbA4DSGc2PMmQKeXQZnwcqb070hXLX3b+xPSIGu+0Op3gVRzNOGjF1pD/0
 8t+lsuotEN0QtcM2vkxayvnWsrI54FcCCsKjvqVcvkZEzzTF5/BpfpQur+zwdMNIUtw/
 8OrjqfVlT6P5wBfzZZdG+684uSzDiVJzo/FOhO8vBC/B2DwMITSTQrFrJvfV5k/ZQC0K
 6E2LOSzTfr440hfYhpyVOdTJf3wWIPPGquu6v2MRNl5srgnpWc5VVdRo8CVQvDOd20A+
 syXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuQ42+umRcpPW+VMKGxj6sWr71Sv5xh4Rg14DLaks5k=;
 b=G8h8PAPNm09dE2BVc16hoxOnvGJtnOBf0Oh2STGhJ3EruRiSwp8+gnHnk8cdfap9Gd
 Kxp3tvUjl1MTlyfI3RmwSeinInN8Qqb0oJxICD6s6Wzun0/jkQBeYJkTFlIAArJEzpKe
 bOOATQd0764a0BZhKXyPcSmu4u66q2JprS1JJD5KNQsnObZil3GV2UaKr/PSc8MwHBt6
 FCQDZUreEJH+ErWoWMGYvzoeeOdSV8jXxJKuh8q5GUqCLWP5IRTJxSQuW3YoVkaATZRl
 13WbCizJZ0uqAoZvg5CueSj2n0DNEmjz2C6eSmvi3yYilbYCf7LRhubcLp7YVbZXzI7N
 qqZw==
X-Gm-Message-State: AOAM532NLrXj26d15CiBK/gia2pEBf6Y3iIzrmYNZZG95DUKCqUk0XAD
 Pp9ohOQgjdqNexeG0sz5/1EudrHbyrhF077sh5nNe7LvZJm/Yn/p/KREUkY7Ts1w6oHH+dZiUg2
 /ZlrlYoG/vZwT9wMfDmMWMDGH2XDKynOx
X-Received: by 2002:a05:6a00:23cc:b0:49f:bfaa:e2f6 with SMTP id
 g12-20020a056a0023cc00b0049fbfaae2f6mr46262401pfc.35.1638282188540; 
 Tue, 30 Nov 2021 06:23:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7y6QAe/YFHa5MXhGbQbbmD70LSJp+V4les/R1HFBQdmHJN0uEme/9FJ4o644D87kOv1DP1w==
X-Received: by 2002:a05:6a00:23cc:b0:49f:bfaa:e2f6 with SMTP id
 g12-20020a056a0023cc00b0049fbfaae2f6mr46262379pfc.35.1638282188275; 
 Tue, 30 Nov 2021 06:23:08 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id d1sm22593883pfv.194.2021.11.30.06.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 06:23:07 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/komeda: Fix an undefined behavior bug in
 komeda_plane_add()
Date: Tue, 30 Nov 2021 22:23:01 +0800
Message-Id: <20211130142301.155586-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In komeda_plane_add(), komeda_get_layer_fourcc_list() is assigned to
formats and used in drm_universal_plane_init().
drm_universal_plane_init() passes formats to
__drm_universal_plane_init(). __drm_universal_plane_init() further
passes formats to memcpy() as src parameter, which could lead to an
undefined behavior bug on failure of komeda_get_layer_fourcc_list().

Fix this bug by adding a check of formats.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_KOMEDA=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 61f1c4a8ab75 ("drm/komeda: Attach komeda_dev to DRM-KMS")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index d63d83800a8a..dd3f17e970dd 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -265,6 +265,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       layer->layer_type, &n_formats);
+	if (!formats) {
+		err = -ENOMEM;
+		goto cleanup;
+	}
 
 	err = drm_universal_plane_init(&kms->base, plane,
 			get_possible_crtcs(kms, c->pipeline),
-- 
2.25.1

