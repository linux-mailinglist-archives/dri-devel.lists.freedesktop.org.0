Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A373E63BC16
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 09:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3E910E39B;
	Tue, 29 Nov 2022 08:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C65B10E3A0;
 Tue, 29 Nov 2022 08:51:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l11so18821135edb.4;
 Tue, 29 Nov 2022 00:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=F3BLC6fjBiitgUFKsGVyTVAd7kZmy7Whapxwc6oWLXJG2YEVH6tfowU3+qwLpDxLxm
 BYBoPEs29A5J+sEPdBpDeQ4VzYuYwTfzcbdm4sWHgYt21XjcGvlJH51EG3kBZ8PNS3Fc
 0ocfDufO/9u32Foc/LoNNEcj/5tnGjxfz9B++VlKxKZJ9vUJYsvT8knVy19XCqTApAxA
 QFIyydAvQFMFKz3vun5Ro66pHwIByRIGuUg01/mGLIioPZmit58rco0JTDyKHWF1oOtQ
 2kMvEBzVn/6A7jFpoIK9DsYVkrqAZ/pZ8PtsxPhAhF9H0LkXnOKDvV+g3tos+OzoQBZw
 7+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=MGLXYrZxz3mGr0Rj/uAl79qvMwAVD/DmjJO7yf5fEgejWBwZmSWZlca/GHn2H0kTL7
 IOzAZ05b8IKl25BeOZPaA8Ugd3sruZsEHmb/DqHEomIXqG3uSMtfINWmTRIFBV04OOtN
 CX94Ux62RCkByNLrbNZXOFPtVfBnlnmCqF9jwWnIh6a53S9M/7i1k38lyVWgM6FldXYM
 tFBjY5f/vpoxPq8owRFsFKR5FcMkYj63pNaB+ZZiWx4OC+wvfA06z8ryb1R6MzJPjqoc
 hXfE/SSolPrLH8OWKKp+FSMGyyMF2MxnDL1GDnJHAcfjMFUM74mzHKGXAnDEhWC/ygLf
 XHdA==
X-Gm-Message-State: ANoB5pntSW1Q3YF7PsUEfsDqbpBlw+jsInnXFdrzSQPLYNNS3K50wepr
 vd80FhndbDxk0OjyW03WkrY=
X-Google-Smtp-Source: AA0mqf7jKhZ7QKnwHguva3IWUuFk9/+/O92m4VQX+VxAVGvVd4Kt2AlyTWN0negQts5Celyb9XWVcg==
X-Received: by 2002:a05:6402:2b8b:b0:468:cae8:f5a6 with SMTP id
 fj11-20020a0564022b8b00b00468cae8f5a6mr52228379edb.263.1669711879597; 
 Tue, 29 Nov 2022 00:51:19 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 kz1-20020a17090777c100b0078de26f66b9sm5873219ejc.114.2022.11.29.00.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 00:51:19 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v3 5/5] drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
Date: Tue, 29 Nov 2022 09:50:45 +0100
Message-Id: <20221129085047.49813-6-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
References: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
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

