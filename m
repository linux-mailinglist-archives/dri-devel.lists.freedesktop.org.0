Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2F64062A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 12:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A65B10E704;
	Fri,  2 Dec 2022 11:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970EE10E6DF;
 Fri,  2 Dec 2022 11:52:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id fy37so10953666ejc.11;
 Fri, 02 Dec 2022 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2njBXO/jcTn1hW9BCGP1JQWTyTb5ivQ7E5VaL+5F8g=;
 b=PGqEPPKLMPgV0vs1JO0S4lzeqt1JVLn2xyAx1A9+XqqmsQA4aW7b2OGtkWZTtYA3Eg
 Z0+OCjTBDGEUvJZVWwBhd4GXirMMRQWepVJWj/kIkaFdxGN+0cyEeAOP4CaqICWSop+5
 MhGsjaaGZUC02+BGwqJO78pXzl3AeZS+nSd5P8SiZAMc0ekU8MnPvuR36J3dJrJeUihs
 TlZjIuRUSmjtDzZorkt5kjUVuaspXtG+JM7dVqZNvCLb4YSjE3/fFfBfUYgFPwAHCPx1
 xqXOSZ7Ud8M8UwiehMREoc+zKjdd6BdHaTn2sP6dtAoUTzIuFgAnPJGWLXVYc6Mg9oe3
 W06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q2njBXO/jcTn1hW9BCGP1JQWTyTb5ivQ7E5VaL+5F8g=;
 b=gSps517bysJvgJmLciKwsn6YJs+vu8jQbHR2ZcivJ6zzC6HuyGTYZII7e1mxdOwSPj
 DyE/qdEpvbR1Uuc31oOizIANgvVB/h+b4TfB6USm4ozpnyj2Wqzb+BKMydxCWv+wc+So
 vWrOpeFz3FcYeF/j5jQMy9MhAwyc2m+pK/gMKu9/O9tVySxROvSI/azpem15cQc+IGXo
 N8J+ZTqwMRVnuX4OTGIih5k9Gyab5/EY+TUjCFgHIwMqA+SUfOB3VnaYDhBf6PkqNl5m
 yvITmpI+dKjCnq8A8V1PvGSPURBsOWZgCbtmWAJp5arN/gc8+/PoLxWB62+3RevYCsLg
 tbrw==
X-Gm-Message-State: ANoB5pmL9l2TEOWeK3NxsfzPZiWv/fyz9YzLF84Epa1D6QXaywzXgEB2
 3E/JNYXthVlE/3zA+M5qbOQ=
X-Google-Smtp-Source: AA0mqf4fSMzOzi3Zl9q8HAMPixjYiZvqfbProtvQ+lQZi/7zRZUXdlor2DZsqaqo4HlonrVcIFxykg==
X-Received: by 2002:a17:906:d0da:b0:7ad:9891:8756 with SMTP id
 bq26-20020a170906d0da00b007ad98918756mr60667631ejb.203.1669981964923; 
 Fri, 02 Dec 2022 03:52:44 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 03:52:44 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v6 7/8] drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
Date: Fri,  2 Dec 2022 12:52:19 +0100
Message-Id: <20221202115223.39051-8-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a compute-only module marketed towards AI and vision
acceleration. This particular version can be found on the Amlogic A311D
SoC.

The feature bits are taken from the Khadas downstream kernel driver
6.4.4.3.310723AAA.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 44df273a5aae..66b8ad6c7d26 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -134,6 +134,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x90044250,
 		.minor_features11 = 0x00000024,
 	},
+	{
+		.model = 0x8000,
+		.revision = 0x7120,
+		.product_id = 0x45080009,
+		.customer_id = 0x88,
+		.eco_id = 0,
+		.stream_count = 8,
+		.register_max = 64,
+		.thread_count = 256,
+		.shader_core_count = 1,
+		.vertex_cache_size = 16,
+		.vertex_output_buffer_size = 1024,
+		.pixel_pipes = 1,
+		.instruction_count = 512,
+		.num_constants = 320,
+		.buffer_size = 0,
+		.varyings_count = 16,
+		.features = 0xe0287cac,
+		.minor_features0 = 0xc1799eff,
+		.minor_features1 = 0xfefbfadb,
+		.minor_features2 = 0xeb9d6fbf,
+		.minor_features3 = 0xedfffced,
+		.minor_features4 = 0xd30dafc7,
+		.minor_features5 = 0x7b5ac333,
+		.minor_features6 = 0xfc8ee200,
+		.minor_features7 = 0x03fffa6f,
+		.minor_features8 = 0x00fe0ef0,
+		.minor_features9 = 0x0088003c,
+		.minor_features10 = 0x108048c0,
+		.minor_features11 = 0x00000010,
+	},
 };
 
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
-- 
2.38.1

