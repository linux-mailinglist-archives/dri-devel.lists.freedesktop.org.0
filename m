Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD546356E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 14:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DDE6E570;
	Tue, 30 Nov 2021 13:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7146E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:26:37 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3NKS57t5z9vKM1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYn3_72UX8yw for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 07:26:36 -0600 (CST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3NKS33Bfz9vKM9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:26:36 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3NKS33Bfz9vKM9
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3NKS33Bfz9vKM9
Received: by mail-pl1-f199.google.com with SMTP id
 n13-20020a170902d2cd00b0014228ffc40dso8226204plc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBS+mZ2iVM3nHnjNJPASEgQ/1xp2sRvwZZLo9zAhZ+g=;
 b=LEltKdDXxT46GNxTBJ/4F5cZvsfSfXUzH8HKDOjLSnnhCRfKVZe6Mz2G4Khay/TeFT
 KgYPbKes7yZQtJ+drFLi8M3Dm2r8WFNy76kFwplunV7KC8UxgTNdr7ExZJyfvGyvU/z7
 JWBk4Dy6zcbv1q00KWW4RCidihgISmUcVnykuDGFOfNNL13IQmlIwhpHVJ7PMI8ilr07
 7fT96HELphQbiOhAq012wbDxH/SXvLv2h2DqoaYUIVW8Lcbt5UAtmS9p1QOzyQOsqpfO
 sQsifFoVMm28IppldvNHv9PqNogpvmzXUzSHWViX71U0eh/ZLl3qur0DJy5Ltipzgh9A
 pwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBS+mZ2iVM3nHnjNJPASEgQ/1xp2sRvwZZLo9zAhZ+g=;
 b=zaBrqgNA0xe43CioH6L2Ja2xIW7Coxi3qNpoDQCkfLEPSqNA6+fRI0CvYRAFdTSctg
 BhLgm4tJO5e9/RfxQIQkBdI5AyrK1+Xj1LTfYfyWR9LoCaZSdQNvfuHlke1pb+9vrSnB
 alXj+iUvZiq5nDavRmoM/sZIf1LYcN6X59ernTbpj/oOiUTjrKDN6K5zhIPxEF255tUB
 HP35/6CSQ+RWFAyZbw12u2Q7knD8Ub73AzrfEY6X0NB5Mv7EgliwrErVE/3RzxLcZr82
 F0jAXv2qA1MweIgpedwvHiTG+SYWwyq6l4l1lskFARsqlDYUl5kjhzQUV/iFQDd6oiDr
 w/gg==
X-Gm-Message-State: AOAM532HMLmKO75S2SpclMvFDw8HgTsEw4VlIfvLkygspDE02lZ8un1b
 a25HWy900/a58YUiJ1x+qVMjWf/nq2AJd39aYbRpR5F7AxYMUAhs4CgwJ3mNL6ClGSSmroatAhQ
 nI8s0dgsOgpWpDIgsZPUVKLPrMsHNfNLp
X-Received: by 2002:a63:111d:: with SMTP id g29mr39643307pgl.49.1638278795667; 
 Tue, 30 Nov 2021 05:26:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuqPlPxAmiDNb3+ejvmnH8PEECcYwGXN6Y4pYfO0AsmmKmIvGisaHHVkTfKaUlbQrEd+O/eA==
X-Received: by 2002:a63:111d:: with SMTP id g29mr39643285pgl.49.1638278795435; 
 Tue, 30 Nov 2021 05:26:35 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id mz7sm2604105pjb.7.2021.11.30.05.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:26:35 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/gma500/cdv_intel_lvds: Fix a wild pointer dereference in
 cdv_intel_lvds_get_modes()
Date: Tue, 30 Nov 2021 21:26:29 +0800
Message-Id: <20211130132629.130713-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode and used in drm_mode_probed_add().
drm_mode_probed_add() passes mode->head to list_add_tail().
list_add_tail() will further call __list_add() and there is a
dereference of mode->head in __list_add(), which could lead to a wild
pointer dereference on failure of drm_mode_duplicate().

Fix this bug by adding a checking of mode

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_GMA500=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 6a227d5fd6c4 ("gma500: Add support for Cedarview")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 9e1cdb11023c..56aec41ebb1a 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -310,6 +310,9 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
 	if (mode_dev->panel_fixed_mode != NULL) {
 		struct drm_display_mode *mode =
 		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
+		if (!mode)
+			return -ENOMEM;
+
 		drm_mode_probed_add(connector, mode);
 		return 1;
 	}
-- 
2.25.1

