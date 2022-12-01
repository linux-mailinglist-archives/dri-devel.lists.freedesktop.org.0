Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36B63EDD7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048C10E5BC;
	Thu,  1 Dec 2022 10:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA5510E125;
 Thu,  1 Dec 2022 10:31:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ha10so3144430ejb.3;
 Thu, 01 Dec 2022 02:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2njBXO/jcTn1hW9BCGP1JQWTyTb5ivQ7E5VaL+5F8g=;
 b=cc2+71zSLRd6aORczf6VwydiioGC5ERV4dEKqnoGWiupso+Zv97xJSaSUG9NoDOC4L
 Ox8vRi1EW3ddGkNSkgRnFIfJF4Z1HJ+IqQzf6OMKQVUoXcDDzo6wQ/7T5G+PMfoqF2HT
 YHqD1xge3JGgEmQ4bp37AjPDJ5KlrfVRSPDWi+VadiEDN504svPMnqkzxq2E2YWemhoJ
 69UTZGCNiYHy6FZ+dJgUR0l6zpobBAk663+rjTcWedCXVKNJJliORPf1dJdGo+UvW3z2
 VTsYOkcE+SYDqeSA5RY2mBDon1V/qwuQUF9nrkPADmDUHbWMWwJWP1lU2bWA9ZgXMAdZ
 tzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q2njBXO/jcTn1hW9BCGP1JQWTyTb5ivQ7E5VaL+5F8g=;
 b=dcGFXy+iysasmx0+LtbaztobCtoIKMe4gPdtNxRQsiM9WorEMwx5z7tuW09VqJK9vS
 Y6LUv3ryiZatSw9QBOSVF0wc1dv1bW1ka+KevxOIwM0dmDCmLFpwkyZ3mFg5slDSPAtF
 9geEr+6HOb2r33hpC9ZXvVUlr/YAny0Y3LmTeXi3Ij09QI+gbWvXmRo9hL+SNiRudHQF
 E+uf1UfNzwu4++DyNvDNpt6Ra1E+45dJRRL5drnVQV4IIweNkYNJcX+8yqLgguo/xCST
 LM4w4xKRFAtXvwV6yHM81RStwLN+ecptMo/t7/qlRgY5UePYPdhC9uqa7V7PzDEq6BqX
 lk2A==
X-Gm-Message-State: ANoB5plZI1yiZ6wAwspR8IfLEzG1iQv3i7ScV7c7fguN16aBYR/+oIny
 qdsOSJOv+ARdUE0TlbK/Npo=
X-Google-Smtp-Source: AA0mqf4roDdJ7X5AOMeo4c+BOzUOX3iZ5+TSETAMFDa6FBYU0p4nnryzGSyIFtBehtaFMD5MYiKeew==
X-Received: by 2002:a17:907:7670:b0:78d:b713:7247 with SMTP id
 kk16-20020a170907767000b0078db7137247mr33837303ejc.706.1669890663829; 
 Thu, 01 Dec 2022 02:31:03 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b007c07b23a79bsm1592400eja.213.2022.12.01.02.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:31:03 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v5 7/7] drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
Date: Thu,  1 Dec 2022 11:30:23 +0100
Message-Id: <20221201103026.53234-8-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
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

