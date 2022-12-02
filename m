Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3405640627
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 12:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB9310E6E1;
	Fri,  2 Dec 2022 11:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B596110E6DF;
 Fri,  2 Dec 2022 11:52:43 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id d14so1212460edj.11;
 Fri, 02 Dec 2022 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcT8YWVtzB1GH3wOdz9aZTQd5ehiQWJpYZBWZtycvm8=;
 b=n6rSQm2scPUp8G7dkrFMvAlrmDdT5HqkEFLp5tVgjnDhobTyndc90glH9j1b0mNhM4
 PlCdqyRunGFcWaw40v1XO1FSXh9aTfLBBrupdRpb73kotN52w4f1n2ij3hFHRPRX2wa4
 kacKVYbnJWeQHWjvGMvFfVlMplLd/isdSbjz2AqBN0jDpGu7R2+DvXsdJd7fNvJf4Zhq
 3kTdiH0gyp40Vejo7JRT3g8aEMXlLccp97tvG1j6mQExD9L9JFARULn1LNhUHNas2AKl
 vp6Xn+JSyYqlVspuDjrELJGnySjWwMg2YjB61h3wwHglmL06xvpYDgkkhBaBCSJ8wvgk
 0mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vcT8YWVtzB1GH3wOdz9aZTQd5ehiQWJpYZBWZtycvm8=;
 b=GjKn/efnOEPB0chzUeaKteTKNVBzULXYJH/TYGnzgScPRarz5EDWav/gocaTnM5biz
 dioz7eSVyrLzoe72581fHS3/PP40Syjujv2zxlOjziNbWbWMBGy3/mAc1TPVOxfNhs+D
 uKetOyJ4cPevnqoYGtraz1XoinlK1o1PQDMA3Q+Ijp/nKpcKSs1RsmQLL82PuB/rhO1F
 nEwtGCtCExU7B6Ijb0T76l7+aMv8VJDiQn8FLQsvgMv5PdlpWva01Vtr/Bc/CkzBy/UM
 ygbPIvknDIdO2/r7Cuv+xYfjbsqrLfLdFkvjxhQszejgJepPbQGf1X0kXiol8ZxMnySs
 7AEA==
X-Gm-Message-State: ANoB5plpY2LBXMbRyQ4cxXEj7OHiDtKHmkr3GW/9KKxBKLf9uvruamPN
 KWW4IdQF/l+mMnam2fLfVEs=
X-Google-Smtp-Source: AA0mqf7z5O8rS3mctV42J+CAKDbBvQEW1qpHWHU4cS8Gyjn6lrLWf90VBV+FexZaVWvv37D7WFdRNw==
X-Received: by 2002:a05:6402:1f89:b0:458:caec:8f1e with SMTP id
 c9-20020a0564021f8900b00458caec8f1emr62952822edc.280.1669981962298; 
 Fri, 02 Dec 2022 03:52:42 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 03:52:41 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v6 5/8] drm/etnaviv: Add nn_core_count to chip feature struct
Date: Fri,  2 Dec 2022 12:52:17 +0100
Message-Id: <20221202115223.39051-6-tomeu.vizoso@collabora.com>
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

We will use these for differentiating between GPUs and NPUs, as the
downstream driver does.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 3 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..c8f3ad2031ce 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -50,6 +50,9 @@ struct etnaviv_chip_identity {
 	/* Number of shader cores. */
 	u32 shader_core_count;
 
+	/* Number of Neural Network cores. */
+	u32 nn_core_count;
+
 	/* Size of the vertex cache. */
 	u32 vertex_cache_size;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index f2fc645c7956..44df273a5aae 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -16,6 +16,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 128,
 		.shader_core_count = 1,
+		.nn_core_count = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -47,6 +48,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -78,6 +80,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -109,6 +112,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 1024,
 		.shader_core_count = 4,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 2,
-- 
2.38.1

