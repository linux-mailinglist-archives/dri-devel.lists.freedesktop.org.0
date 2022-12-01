Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8063EC4D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C763510E593;
	Thu,  1 Dec 2022 09:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D23A10E58E;
 Thu,  1 Dec 2022 09:22:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy37so2671542ejc.11;
 Thu, 01 Dec 2022 01:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=AEJ5Dr7zB416GNoTNHNKS9rh5+Y2xhjAKHwoZGCbN23KANzvgKbjQsTMwcHfU9//gc
 7eEuqNfoarSzqd6Hub73JzuxHzfZ3zuKU8KbpyRTmxVxZ8jxQLHg56ngi90cCF+1I+IA
 ETujKamyy5Lki/kXzCCBzo3ZCdibteSRokDjyYZX6sa+sYTcCUzC47vjDpeOoHjJTFgi
 LldbFFMwGZoiqaX8LPCS0KrhY+dGHtSyCwpi8DfDbiKu4JcKUTRiGGW0qYhoXcVNL1xz
 C1ymFTKcSVgFRNt9TI20M1niY9gxYghKhHzmRWDYslmPMfNQ9FTKs+DyFqKxnbtnlWCx
 997A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=pv32yiNwzd7J+jni0NoqPQfQonBgH2apurHi+UepgvowHHElbP8alu0F8oSJFJiBT0
 tNIKGWZON8aVz4l/gm5KtLuashgkTJScpvaaIAsniDlUdJITw6fBsteywPk0KTVomVX6
 Kdo7Vl0h+Ftb4g5gnDiuDHLoltHZz9hu0ikOllQHVlmTMRLfr9b87tnaM+zfqDtUvjRN
 yKAxZpRVdH78yo+b6kIGJzv17KlGZ96t/zJETCtFty5zLg5gqMiNF76zs12AhxDhxckS
 Dfm3YN9KPCAk80w6yXBh2D2h63b3O0fxzCrE/vAQQgv1Lvkez8ehBDgAXQMp7rHgs4ao
 hAxA==
X-Gm-Message-State: ANoB5pnk6aAPikA3PDzVuocoDoi4GKPeI2wMZGR0jxOHAof8B6Exmz9k
 v6aT9R2HAk7e+IiZtXQA35c=
X-Google-Smtp-Source: AA0mqf4U7Jfjt9v07Np5vCGzYbUwDTHC1Yq1KbW+C75UIdsapP471QhHYnSvQepDZC4sLwYcl3Z1lw==
X-Received: by 2002:a17:906:1ecf:b0:7ad:902c:d1d6 with SMTP id
 m15-20020a1709061ecf00b007ad902cd1d6mr43010098ejj.143.1669886525782; 
 Thu, 01 Dec 2022 01:22:05 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:22:05 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v4 5/7] drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
Date: Thu,  1 Dec 2022 10:21:26 +0100
Message-Id: <20221201092131.62867-6-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
References: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
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
index f2fc645c7956..3f6fd9a3c088 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -130,6 +130,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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

