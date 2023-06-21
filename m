Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485E73923D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA8C10E364;
	Wed, 21 Jun 2023 22:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4297C10E363
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:06:39 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-19fa4346498so5708195fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687385198; x=1689977198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQMestEn/hdlzpB5zrBs/mLTvQ8FPA3kTSATXYwATVw=;
 b=ON+QySyTk+k1EmIF4cKflvdxh0hEKrIBQj/d93hLrwCL5QG8j2LlbkC8Sjp6PJjgP/
 sXwIYop426LtO2UjNY18rsxmKIi5o3KPE0hokl0nxLr56jnAcM/p8IwNy/+gkhHzipLc
 yxoDS85YOJQDH2LqTpZbPiaV1o+frqoHGm9l7BPgd5PMjaLKPTZ5p4z+r3cC+ppVFW38
 amfVcMuogKrivP5Kl4ZhQsPAxJAJaJSEb5GJuIzi0CdAcbg3JRGitbdML8N8Uwm/VcOJ
 Erv1WuPB6hk+k8W/Fsv/155/+o0dr7enufiHQwcprDBSfHAjxfP5P7+LvEbc/da3XiLF
 lHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687385198; x=1689977198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQMestEn/hdlzpB5zrBs/mLTvQ8FPA3kTSATXYwATVw=;
 b=fv8ainZjmtvgyLicVVhEsU4acL4HPC4Yfv5Hv/gz5m3IcIFPJkJJU57hnb9DboRvRm
 mx9G4DWefYdVg2+omoNvQRtkN4lp+P7q2XnuWetZfT5d7HLQXPgkZwtV2+4oPnrv5whL
 oLzU2kUPql25Sf4RuSvq+dj9ANbUjzOzwf4hJY5T6oApt/xfA61x+2RI6ufRyN4UaUux
 5xc6aOY/zOsRBIqPJ+ob6Zsdfxzgh3FnlMxus874t6g4bFE4Cif7mpI2RqURDCAB6eKS
 9j2v8q9ywXP2JwWo5VYB++h+sdjmZmygzf49Ok8s1CGvu704Xqz7D+5f4RsPjuBfvBp3
 CKSA==
X-Gm-Message-State: AC+VfDxp+FyPaHFdfSALx94MhA47TYmDdKja60Ws8AL5kwvuccudTNVw
 dTgfmThN35eLG9sbHPXWhaw=
X-Google-Smtp-Source: ACHHUZ5mcVIug7DfzVDfAYuIUvMjJZGQYEYybZq0mCyfRAZVLgdmN9aS2VO7k+HsYU9TbgZj2uvUBA==
X-Received: by 2002:a05:6870:4350:b0:1a3:1962:9123 with SMTP id
 x16-20020a056870435000b001a319629123mr11058534oah.31.1687385197942; 
 Wed, 21 Jun 2023 15:06:37 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a9d7d07000000b006af8b60e2c3sm2288987otn.74.2023.06.21.15.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 15:06:37 -0700 (PDT)
From: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/3] drm: panel-orientation-quirks: Add quirk for AYA NEO
 Founder edition
Date: Wed, 21 Jun 2023 19:06:14 -0300
Message-ID: <20230621220615.1253571-3-samsagax@gmail.com>
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

Add quirk orientation for AYA NEO Founder. The name appears with spaces in
dmi strings as other devices of the brand. The panel is the same as the
NEXT and 2021 models. Those could not be reused as the former has VENDOR
name as "AYANEO" without spaces and the latter has "AYADEVICE".

Tested by the JELOS team that has been patching their own kernel for a
while now and confirmed by users in the AYA NEO and ChimeraOS discord
servers.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4b428792a3b6..962e74afa8e5 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -188,6 +188,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
 		},
 		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {	/* AYA NEO Founder */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AYA NEO Founder"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* AYA NEO NEXT */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-- 
2.41.0

