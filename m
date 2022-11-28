Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7AA63A6FD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFECC10E203;
	Mon, 28 Nov 2022 11:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F8510E203;
 Mon, 28 Nov 2022 11:18:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o30so8205344wms.2;
 Mon, 28 Nov 2022 03:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=eLtpnITDJBZ4eC9WuN+NwFAZ7Z6Q9wtGvKkEguievQ+59Mk2Ve17OmAit8TaOcxvKM
 9ZVS4Ku1Nbf2k5IO7W8uxcSf/xPiLO/HtBHmKUuAPB48FVoe7n0eO2FwZD5M1i94g2FS
 afj8vKngWtKaGuxQQ59gHYv0zRK6ZGxdOVzWZA2sYo4g87HI3JnSqci+zlw/ZzoSyfWz
 o79Ua3SmWjCeMIkSmoyJYckXE1qH8nQRbGgNFMmC+JQPfN91W26JPbkdF5+b1h+NyUCD
 ovpRky4zA4/Tt+nO4cQ56RGCL94I9sx9n0gEHo/QXuuVIQCPX1VYYfcgkbuPt+FJFFHS
 1J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=7ZtnQpZkb2gNjvy96fYzjnglEDx5PUVC/AnsYFFM/Xa+Hx4ZP8vYQd0Gs3yhbtZVx3
 unuMngIxQiJZPuEWHCIYpxdUmbuGltA/0BqzIg+sGT5dIJMq7wj6EnVKe2qU3fCSQlxg
 oOaA4KBWw/j9HgkJhHJAQSrjo7wJoh3jxDxFXrolMMbpEJIn96r8TW+5sWJ/BFZku1fb
 yHJpRzkWS7S3KU1EpzLpqRLzsi5nYO+rDE97ghrT9ZfmcxvSVP76qwsucaEyWMd6F7mx
 a3UuDUonKYlvIPxDFVBOWtm5x6I56y4SQmvCHhhWsHt9YJ8jOW3Nm8ZOja9bnOmeF1ea
 B2LA==
X-Gm-Message-State: ANoB5pnFmQVr9UzcFQMWlMW6mjmuhNkNJAbPeA62yk7S45ORA7nUuA9o
 c9MJJiUJBrQrBArP8ZFX1Fs=
X-Google-Smtp-Source: AA0mqf69eWYyZgMKdOGsUq0UPtisowcqx0w0ysK/Ur6civ9KWMfHY8SUYDhnxbdliyF6bhrfjnFrfQ==
X-Received: by 2002:a05:600c:3d94:b0:3d0:552e:8d86 with SMTP id
 bi20-20020a05600c3d9400b003d0552e8d86mr4812413wmb.112.1669634284975; 
 Mon, 28 Nov 2022 03:18:04 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 g3-20020adffc83000000b0024207ed4ce0sm7711817wrr.58.2022.11.28.03.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 03:18:04 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v2 5/5] drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
Date: Mon, 28 Nov 2022 12:17:38 +0100
Message-Id: <20221128111740.39003-6-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
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

