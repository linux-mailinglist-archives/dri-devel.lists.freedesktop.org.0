Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55E73923E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC3810E363;
	Wed, 21 Jun 2023 22:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5AD10E363
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:06:43 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1ad1d53beadso968822fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687385202; x=1689977202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VK9EJjesr9P3CeGnBxj7w+Jge1+/260eNRMnSd/AWFY=;
 b=UGRErG+7Xy+fBMtJKjUiBVrQF1B9cgoqrRJxs4C6fdph+vZpOxg6ZinJbIMhj+hk+5
 1xRuv0y1CCBIX+n6pt66rmQtvVPuT6xN/7NB5bBYvQAbijMvaNgWlehKCcMVxq19ECHs
 /LMZyLbnLdTavQV9zJ7JkgtAbKfiHLiP070EJlrugoIxlEhbTBzunaaphBmBL4cO5jGH
 cUVwlgTTCjdJQMhD2ShTwFy5Ata5SOnbaaAfoYkLuNPgoZS37WpGAGdkmfeQfmv0af9m
 7UgxHNP/PYdq0XzBqJW2FtOoFMBjs/sRzGAWh02z/g/rKehxFOR8LT+hDomK7l6BOj77
 BvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687385202; x=1689977202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VK9EJjesr9P3CeGnBxj7w+Jge1+/260eNRMnSd/AWFY=;
 b=avv9YauTusMRuw18KU4PG+Wb7QeqPzbIXfrVYu7jHOEyMSkHhQzVrcwM9Fk72DH49f
 aYo6GVDgDJuUX2RPqhydalYYze9nAue+rdgdF7dwW1qkeNdIkC7GYILMQ3spqBlGf2rL
 LVAUHqEI7ugDgndLhOccwjs6kJHiLqVzOO5/yZVks5Z7rCcx4Pzlmq5ACP44EadHfmL9
 +aaeF2+UNJ+Xs4j8UDe4Px/dLNLyV1Ru9E8qcUKkK6qSf5V7tFQAmeSuK0eRFNGApZcu
 V7lh8ykEaxJr2AGArdqHjIMx2vmSWrhQFKQov+kjsh0PmKme3ZbvokiA01/l3AOijstf
 /4rQ==
X-Gm-Message-State: AC+VfDzDzsHm9dLjx664gjrT1jZSLqahBYSAr2upiSh5MKOir3h5UlZz
 4oCRN/N9kR6Rlw8kd2cJNNk=
X-Google-Smtp-Source: ACHHUZ5EU0tVGQtCBM8PEcdQptblwpRNDVTB+HV2siF07Hzgj2O1eHmahk0OLXsBaOSPVV/lNLe+zg==
X-Received: by 2002:a05:6870:c806:b0:1a9:caa1:9571 with SMTP id
 ee6-20020a056870c80600b001a9caa19571mr12981633oab.34.1687385202229; 
 Wed, 21 Jun 2023 15:06:42 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a9d7d07000000b006af8b60e2c3sm2288987otn.74.2023.06.21.15.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 15:06:41 -0700 (PDT)
From: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/3] drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK
Date: Wed, 21 Jun 2023 19:06:15 -0300
Message-ID: <20230621220615.1253571-4-samsagax@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621220615.1253571-1-samsagax@gmail.com>
References: <20230621220615.1253571-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add quirk orientation for AYA NEO GEEK. One of the more recent devices by
the brand. The name appears without spaces in dmi strings. The board
name is completely different to the previous models making it difficult
to reuse their quirks despite being the same resolution and mounting.

Tested by the JELOS team that has been patching their own kernel for a
while now and confirmed by users in the AYA NEO and ChimeraOS discord
servers.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 962e74afa8e5..757bbeb7071c 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -194,6 +194,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AYA NEO Founder"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO GEEK */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "GEEK"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* AYA NEO NEXT */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-- 
2.41.0

