Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6FC4E8A08
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 22:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EB610E9A5;
	Sun, 27 Mar 2022 20:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF8D10E9A5
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 20:27:21 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id t19so10817998qtc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 13:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F3hjlPSVIAxtbY58vgKZo5hIDqv6kEHWLWVqSFJ4ZSo=;
 b=KyseOB6WJoPy8paxKDRHuo+7E5/x77j/AImNjj74E9zuh/l+SNrYa7D+R+toqjKMog
 ihRAmdhGVpSDv1T9Off+ljLqkDHvncUMdxipJ1GqZj3Vdo5QUox8hzrT3KVOhcI/gshI
 +y8hQWBFVfihPJmnKKTwrS/hVLET5dEpo47oX8B+GgEuWikwQ13xPT9K0RZpmmgvaJjA
 XrO5RbMOZMr5Rj0YpsQx3BY7GPF5Srti4++QRz9quUmmXZywis3EqmlnA7ZhZSp6E1TN
 pWu/HQsPOfRAlSNl7OIsLdnrOkZ8oKytKTC6jExXXihi8bmLRz7bqhT35qyY98uDXlGy
 WBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F3hjlPSVIAxtbY58vgKZo5hIDqv6kEHWLWVqSFJ4ZSo=;
 b=noJiSwZxerqSQ4pR7uhrzLQub9PCXvIVUWEh/QPdg2As2JX87a+5Lj51Ie9q0PGpyj
 T2w8SPMrUP1/5l2E201KZg1XA0XzY7yTb9twljRgTmjTXwQ2P64tYIrjbt2Qr5tWND+P
 y4QoTinaS30ShVdrgtaRiKwbNQAu8iFOtGECytsUdNDUCq/3n/bfqO028lWZRE2pI6Wo
 w8i6saAj12r6k3A5uVh1d8nOyTI7fk1yIKIy6sVNBTceUti0yGi5MYiWtJKEnyRURgMj
 cDE2eGcrGgAb+5cTvUmJvwPzlJ4hJwU25jpHdinuFjIy8ZyJlU7/DZrjEoXc1+EbwELC
 JBwQ==
X-Gm-Message-State: AOAM533jFoNPu4RwHAxpDSaFO7MDHrbpTbFp1clgrO9hdgXjSgRz+eaB
 tnWBfxunL3KgXIUiWmU/iBbpdg==
X-Google-Smtp-Source: ABdhPJzwbBIIWZkS6IsPTXyW4uRSvhJ1reCjUxWXQ9t2W3+TtI+gO5TDpyF0jJJhzyqmM6V8jiTRdQ==
X-Received: by 2002:ac8:5f4c:0:b0:2e1:e565:f427 with SMTP id
 y12-20020ac85f4c000000b002e1e565f427mr19160608qta.32.1648412840582; 
 Sun, 27 Mar 2022 13:27:20 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm6720386qkk.52.2022.03.27.13.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:27:20 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/adreno: update headers
Date: Sun, 27 Mar 2022 16:25:56 -0400
Message-Id: <20220327202643.4053-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20220327202643.4053-1-jonathan@marek.ca>
References: <20220327202643.4053-1-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds a7xx changes for the kernel driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a7xx.xml.h       | 666 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h |  63 +-
 2 files changed, 716 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx.xml.h

diff --git a/drivers/gpu/drm/msm/adreno/a7xx.xml.h b/drivers/gpu/drm/msm/adreno/a7xx.xml.h
new file mode 100644
index 0000000000000..45ef4289ac52b
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a7xx.xml.h
@@ -0,0 +1,666 @@
+#ifndef A7XX_XML
+#define A7XX_XML
+
+/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng headergen tool in this git repository:
+http://github.com/freedreno/envytools/
+git clone https://github.com/freedreno/envytools.git
+
+The rules-ng-ng source files this header was generated from are:
+- freedreno/registers/adreno.xml                     (    627 bytes, from 2022-03-27 15:04:47)
+- freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2020-11-18 00:17:12)
+- freedreno/registers/adreno/a2xx.xml                (  90810 bytes, from 2021-08-06 17:44:41)
+- freedreno/registers/adreno/adreno_common.xml       (  14631 bytes, from 2022-03-27 14:52:08)
+- freedreno/registers/adreno/adreno_pm4.xml          (  70334 bytes, from 2022-03-27 20:01:26)
+- freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2021-08-27 13:03:56)
+- freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-03-22 19:23:46)
+- freedreno/registers/adreno/a5xx.xml                ( 149512 bytes, from 2022-03-21 16:05:18)
+- freedreno/registers/adreno/a6xx.xml                ( 184954 bytes, from 2022-03-22 19:23:46)
+- freedreno/registers/adreno/a6xx_gmu.xml            (  11331 bytes, from 2021-08-06 17:44:41)
+- freedreno/registers/adreno/a7xx.xml                (  20004 bytes, from 2022-03-27 20:01:42)
+- freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2020-11-18 00:17:12)
+- freedreno/registers/adreno/adreno_control_regs.xml (   6038 bytes, from 2022-03-22 19:23:46)
+- freedreno/registers/adreno/adreno_pipe_regs.xml    (   2924 bytes, from 2022-03-22 19:23:46)
+
+Copyright (C) 2013-2022 by the following authors:
+- Rob Clark <robdclark@gmail.com> (robclark)
+- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+
+enum a7xx_event {
+	CCU_INVALIDATE_DEPTH = 24,
+	CCU_INVALIDATE_COLOR = 25,
+	CCU_RESOLVE_CLEAN = 26,
+	CCU_FLUSH_DEPTH = 28,
+	CCU_FLUSH_COLOR = 29,
+	CCU_RESOLVE = 30,
+	CCU_END_RESOLVE_GROUP = 31,
+	CCU_CLEAN_DEPTH = 32,
+	CCU_CLEAN_COLOR = 33,
+	CACHE_RESET = 48,
+	CACHE_CLEAN = 49,
+	CACHE_FLUSH7 = 50,
+	CACHE_INVALIDATE7 = 51,
+};
+
+#define REG_A7XX_RBBM_GBIF_CLIENT_QOS_CNTL			0x00000011
+
+#define REG_A7XX_RBBM_GBIF_HALT					0x00000016
+
+#define REG_A7XX_RBBM_GBIF_HALT_ACK				0x00000017
+
+#define REG_A7XX_RBBM_INTERFACE_HANG_INT_CNTL			0x0000001f
+
+#define REG_A7XX_RBBM_INT_CLEAR_CMD				0x00000037
+
+#define REG_A7XX_RBBM_INT_0_MASK				0x00000038
+#define A7XX_RBBM_INT_0_MASK_GPUIDLE				0x00000001
+#define A7XX_RBBM_INT_0_MASK_AHBERROR				0x00000002
+#define A7XX_RBBM_INT_0_MASK_CPIPCINT0				0x00000010
+#define A7XX_RBBM_INT_0_MASK_CPIPCINT1				0x00000020
+#define A7XX_RBBM_INT_0_MASK_ATBASYNCFIFOOVERFLOW		0x00000040
+#define A7XX_RBBM_INT_0_MASK_GPCERROR				0x00000080
+#define A7XX_RBBM_INT_0_MASK_SWINTERRUPT			0x00000100
+#define A7XX_RBBM_INT_0_MASK_HWERROR				0x00000200
+#define A7XX_RBBM_INT_0_MASK_CCU_CLEAN_DEPTH_TS			0x00000400
+#define A7XX_RBBM_INT_0_MASK_CCU_CLEAN_COLOR_TS			0x00000800
+#define A7XX_RBBM_INT_0_MASK_CCU_RESOLVE_CLEAN_TS		0x00001000
+#define A7XX_RBBM_INT_0_MASK_PM4CPINTERRUPT			0x00008000
+#define A7XX_RBBM_INT_0_MASK_PM4CPINTERRUPTLPAC			0x00010000
+#define A7XX_RBBM_INT_0_MASK_RB_DONE_TS				0x00020000
+#define A7XX_RBBM_INT_0_MASK_CACHE_CLEAN_TS			0x00100000
+#define A7XX_RBBM_INT_0_MASK_CACHE_CLEAN_TS_LPAC		0x00200000
+#define A7XX_RBBM_INT_0_MASK_ATBBUSOVERFLOW			0x00400000
+#define A7XX_RBBM_INT_0_MASK_HANGDETECTINTERRUPT		0x00800000
+#define A7XX_RBBM_INT_0_MASK_OUTOFBOUNDACCESS			0x01000000
+#define A7XX_RBBM_INT_0_MASK_UCHETRAPINTERRUPT			0x02000000
+#define A7XX_RBBM_INT_0_MASK_DEBUGBUSINTERRUPT0			0x04000000
+#define A7XX_RBBM_INT_0_MASK_DEBUGBUSINTERRUPT1			0x08000000
+#define A7XX_RBBM_INT_0_MASK_TSBWRITEERROR			0x10000000
+#define A7XX_RBBM_INT_0_MASK_ISDBCPUIRQ				0x40000000
+#define A7XX_RBBM_INT_0_MASK_ISDBUNDERDEBUG			0x80000000
+
+#define REG_A7XX_RBBM_INT_2_MASK				0x0000003a
+
+#define REG_A7XX_RBBM_SP_HYST_CNT				0x00000042
+
+#define REG_A7XX_RBBM_SW_RESET_CMD				0x00000043
+
+#define REG_A7XX_RBBM_RAC_THRESHOLD_CNT				0x00000044
+
+#define REG_A7XX_RBBM_CLOCK_CNTL				0x000000ae
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_SP0				0x000000b0
+
+#define REG_A7XX_RBBM_CLOCK_CNTL2_SP0				0x000000b4
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_SP0				0x000000b8
+
+#define REG_A7XX_RBBM_CLOCK_HYST_SP0				0x000000bc
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_TP0				0x000000c0
+
+#define REG_A7XX_RBBM_CLOCK_CNTL2_TP0				0x000000c4
+
+#define REG_A7XX_RBBM_CLOCK_CNTL3_TP0				0x000000c8
+
+#define REG_A7XX_RBBM_CLOCK_CNTL4_TP0				0x000000cc
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_TP0				0x000000d0
+
+#define REG_A7XX_RBBM_CLOCK_DELAY2_TP0				0x000000d4
+
+#define REG_A7XX_RBBM_CLOCK_DELAY3_TP0				0x000000d8
+
+#define REG_A7XX_RBBM_CLOCK_DELAY4_TP0				0x000000dc
+
+#define REG_A7XX_RBBM_CLOCK_HYST_TP0				0x000000e0
+
+#define REG_A7XX_RBBM_CLOCK_HYST2_TP0				0x000000e4
+
+#define REG_A7XX_RBBM_CLOCK_HYST3_TP0				0x000000e8
+
+#define REG_A7XX_RBBM_CLOCK_HYST4_TP0				0x000000ec
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_RB0				0x000000f0
+
+#define REG_A7XX_RBBM_CLOCK_CNTL2_RB0				0x000000f4
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_CCU0				0x000000f8
+
+#define REG_A7XX_RBBM_CLOCK_HYST_RB_CCU0			0x00000100
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_RAC				0x00000104
+
+#define REG_A7XX_RBBM_CLOCK_CNTL2_RAC				0x00000105
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_RAC				0x00000106
+
+#define REG_A7XX_RBBM_CLOCK_HYST_RAC				0x00000107
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM			0x00000108
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM			0x00000109
+
+#define REG_A7XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM			0x0000010a
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_UCHE				0x0000010b
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_UCHE				0x0000010f
+
+#define REG_A7XX_RBBM_CLOCK_HYST_UCHE				0x00000110
+
+#define REG_A7XX_RBBM_CLOCK_MODE_VFD				0x00000111
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_VFD				0x00000112
+
+#define REG_A7XX_RBBM_CLOCK_HYST_VFD				0x00000113
+
+#define REG_A7XX_RBBM_CLOCK_MODE_GPC				0x00000114
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_GPC				0x00000115
+
+#define REG_A7XX_RBBM_CLOCK_HYST_GPC				0x00000116
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_HLSQ_2			0x00000117
+
+#define REG_A7XX_RBBM_CLOCK_CNTL_GMU_GX				0x00000118
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_GMU_GX			0x00000119
+
+#define REG_A7XX_RBBM_CLOCK_HYST_GMU_GX				0x0000011a
+
+#define REG_A7XX_RBBM_CLOCK_MODE_HLSQ				0x0000011b
+
+#define REG_A7XX_RBBM_CLOCK_DELAY_HLSQ				0x0000011c
+
+#define REG_A7XX_RBBM_CLOCK_HYST_HLSQ				0x0000011d
+
+#define REG_A7XX_RBBM_INT_0_STATUS				0x00000201
+
+#define REG_A7XX_RBBM_STATUS					0x00000210
+#define A7XX_RBBM_STATUS_CPAHBBUSYCXMASTER			0x00000001
+#define A7XX_RBBM_STATUS_CPAHBBUSYCPMASTER			0x00000002
+#define A7XX_RBBM_STATUS_CPBUSY					0x00000004
+#define A7XX_RBBM_STATUS_GFXDBGCBUSY				0x00000008
+#define A7XX_RBBM_STATUS_VBIFGXFPARTBUSY			0x00000010
+#define A7XX_RBBM_STATUS_TSEBUSY				0x00000020
+#define A7XX_RBBM_STATUS_RASBUSY				0x00000040
+#define A7XX_RBBM_STATUS_RBBUSY					0x00000080
+#define A7XX_RBBM_STATUS_CCUBUSY				0x00000100
+#define A7XX_RBBM_STATUS_A2DBUSY				0x00000200
+#define A7XX_RBBM_STATUS_LRZBUSY				0x00000400
+#define A7XX_RBBM_STATUS_COMDCOMBUSY				0x00000800
+#define A7XX_RBBM_STATUS_PCDCALLBUSY				0x00001000
+#define A7XX_RBBM_STATUS_PCVSDBUSY				0x00002000
+#define A7XX_RBBM_STATUS_TESSBUSY				0x00004000
+#define A7XX_RBBM_STATUS_VFDBUSY				0x00008000
+#define A7XX_RBBM_STATUS_VPCBUSY				0x00010000
+#define A7XX_RBBM_STATUS_UCHEBUSY				0x00020000
+#define A7XX_RBBM_STATUS_SPBUSY					0x00040000
+#define A7XX_RBBM_STATUS_TPL1BUSY				0x00080000
+#define A7XX_RBBM_STATUS_VSCBUSY				0x00100000
+#define A7XX_RBBM_STATUS_HLSQBUSY				0x00200000
+#define A7XX_RBBM_STATUS_GPUBUSYIGNAHBCP			0x00400000
+#define A7XX_RBBM_STATUS_GPUBUSYIGNAHB				0x00800000
+
+#define REG_A7XX_RBBM_STATUS3					0x00000213
+
+#define REG_A7XX_RBBM_CLOCK_MODE_CP				0x00000260
+
+#define REG_A7XX_RBBM_CLOCK_MODE_BV_LRZ				0x00000284
+
+#define REG_A7XX_RBBM_CLOCK_MODE_BV_GRAS			0x00000285
+
+#define REG_A7XX_RBBM_CLOCK_MODE2_GRAS				0x00000286
+
+#define REG_A7XX_RBBM_CLOCK_MODE_BV_VFD				0x00000287
+
+#define REG_A7XX_RBBM_CLOCK_MODE_BV_GPC				0x00000288
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_CP(uint32_t i0) { return 0x00000300 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_RBBM(uint32_t i0) { return 0x0000031c + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_PC(uint32_t i0) { return 0x00000324 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_VFD(uint32_t i0) { return 0x00000334 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_HLSQ(uint32_t i0) { return 0x00000344 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_VPC(uint32_t i0) { return 0x00000350 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_CCU(uint32_t i0) { return 0x0000035c + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_TSE(uint32_t i0) { return 0x00000366 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_RAS(uint32_t i0) { return 0x0000036e + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_UCHE(uint32_t i0) { return 0x00000376 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_TP(uint32_t i0) { return 0x0000038e + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_SP(uint32_t i0) { return 0x000003a6 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_RB(uint32_t i0) { return 0x000003d6 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_VSC(uint32_t i0) { return 0x000003e6 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_LRZ(uint32_t i0) { return 0x000003ea + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_CMP(uint32_t i0) { return 0x000003f2 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_UFC(uint32_t i0) { return 0x000003fa + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR2_HLSQ(uint32_t i0) { return 0x00000410 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR2_CP(uint32_t i0) { return 0x0000041c + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR2_SP(uint32_t i0) { return 0x0000042a + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR2_TP(uint32_t i0) { return 0x00000442 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR2_UFC(uint32_t i0) { return 0x0000044e + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_PC(uint32_t i0) { return 0x00000460 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_VFD(uint32_t i0) { return 0x00000470 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_VPC(uint32_t i0) { return 0x00000480 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_TSE(uint32_t i0) { return 0x0000048c + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_RAS(uint32_t i0) { return 0x00000494 + 0x2*i0; }
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_LRZ(uint32_t i0) { return 0x0000049c + 0x2*i0; }
+
+#define REG_A7XX_RBBM_PERFCTR_CNTL				0x00000500
+
+static inline uint32_t REG_A7XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00000507 + 0x1*i0; }
+
+#define REG_A7XX_RBBM_PERFCTR_GPU_BUSY_MASKED			0x0000050b
+
+#define REG_A7XX_RBBM_ISDB_CNT					0x00000533
+
+#define REG_A7XX_RBBM_NC_MODE_CNTL				0x00000534
+
+#define REG_A7XX_RBBM_SNAPSHOT_STATUS				0x00000535
+
+#define REG_A7XX_CP_RB_BASE					0x00000800
+
+#define REG_A7XX_CP_RB_CNTL					0x00000802
+
+#define REG_A7XX_CP_RB_RPTR_ADDR				0x00000804
+
+#define REG_A7XX_CP_RB_RPTR					0x00000806
+
+#define REG_A7XX_CP_RB_WPTR					0x00000807
+
+#define REG_A7XX_CP_SQE_CNTL					0x00000808
+
+#define REG_A7XX_CP_CP2GMU_STATUS				0x00000812
+
+#define REG_A7XX_CP_HW_FAULT					0x00000821
+
+#define REG_A7XX_CP_INTERRUPT_STATUS				0x00000823
+#define A7XX_CP_INTERRUPT_STATUS_OPCODEERROR			0x00000001
+#define A7XX_CP_INTERRUPT_STATUS_UCODEERROR			0x00000002
+#define A7XX_CP_INTERRUPT_STATUS_CPHWFAULT			0x00000004
+#define A7XX_CP_INTERRUPT_STATUS_REGISTERPROTECTION		0x00000010
+#define A7XX_CP_INTERRUPT_STATUS_VSDPARITYERROR			0x00000040
+#define A7XX_CP_INTERRUPT_STATUS_ILLEGALINSTRUCTION		0x00000080
+#define A7XX_CP_INTERRUPT_STATUS_OPCODEERRORLPAC		0x00000100
+#define A7XX_CP_INTERRUPT_STATUS_UCODEERRORLPAC			0x00000200
+#define A7XX_CP_INTERRUPT_STATUS_CPHWFAULTLPAC			0x00000400
+#define A7XX_CP_INTERRUPT_STATUS_REGISTERPROTECTIONLPAC		0x00000800
+#define A7XX_CP_INTERRUPT_STATUS_ILLEGALINSTRUCTIONLPAC		0x00001000
+#define A7XX_CP_INTERRUPT_STATUS_OPCODEERRORBV			0x00002000
+#define A7XX_CP_INTERRUPT_STATUS_UCODEERRORBV			0x00004000
+#define A7XX_CP_INTERRUPT_STATUS_CPHWFAULTBV			0x00008000
+#define A7XX_CP_INTERRUPT_STATUS_REGISTERPROTECTIONBV		0x00010000
+#define A7XX_CP_INTERRUPT_STATUS_ILLEGALINSTRUCTIONBV		0x00020000
+
+#define REG_A7XX_CP_PROTECT_STATUS				0x00000824
+
+#define REG_A7XX_CP_STATUS_1					0x00000825
+
+#define REG_A7XX_CP_SQE_INSTR_BASE				0x00000830
+
+#define REG_A7XX_CP_MISC_CNTL					0x00000840
+
+#define REG_A7XX_CP_CHICKEN_DBG					0x00000841
+
+#define REG_A7XX_CP_DBG_ECO_CNTL				0x00000843
+
+#define REG_A7XX_CP_APRIV_CNTL					0x00000844
+
+#define REG_A7XX_CP_PROTECT_CNTL				0x0000084f
+
+static inline uint32_t REG_A7XX_CP_PROTECT_REG(uint32_t i0) { return 0x00000850 + 0x1*i0; }
+
+#define REG_A7XX_CP_CONTEXT_SWITCH_CNTL				0x000008a0
+
+#define REG_A7XX_CP_CONTEXT_SWITCH_SMMU_INFO			0x000008a1
+
+#define REG_A7XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR	0x000008a3
+
+#define REG_A7XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR	0x000008a5
+
+#define REG_A7XX_CP_CONTEXT_SWITCH_NON_PRIV_RESTORE_ADDR	0x000008a7
+
+#define REG_A7XX_CP_CONTEXT_SWITCH_LEVEL_STATUS			0x000008ab
+
+static inline uint32_t REG_A7XX_CP_PERFCTR_CP_SEL(uint32_t i0) { return 0x000008d0 + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_CP_BV_PERFCTR_CP_SEL(uint32_t i0) { return 0x000008e0 + 0x1*i0; }
+
+#define REG_A7XX_CP_CRASH_SCRIPT_BASE				0x00000900
+
+#define REG_A7XX_CP_CRASH_DUMP_CNTL				0x00000902
+
+#define REG_A7XX_CP_CRASH_DUMP_STATUS				0x00000903
+
+#define REG_A7XX_CP_SQE_STAT_ADDR				0x00000908
+
+#define REG_A7XX_CP_SQE_STAT_DATA				0x00000909
+
+#define REG_A7XX_CP_DRAW_STATE_ADDR				0x0000090a
+
+#define REG_A7XX_CP_DRAW_STATE_DATA				0x0000090b
+
+#define REG_A7XX_CP_ROQ_DBG_ADDR				0x0000090c
+
+#define REG_A7XX_CP_ROQ_DBG_DATA				0x0000090d
+
+#define REG_A7XX_CP_MEM_POOL_DBG_ADDR				0x0000090e
+
+#define REG_A7XX_CP_MEM_POOL_DBG_DATA				0x0000090f
+
+#define REG_A7XX_CP_SQE_UCODE_DBG_ADDR				0x00000910
+
+#define REG_A7XX_CP_SQE_UCODE_DBG_DATA				0x00000911
+
+#define REG_A7XX_CP_IB1_BASE					0x00000928
+
+#define REG_A7XX_CP_IB1_REM_SIZE				0x0000092a
+
+#define REG_A7XX_CP_IB2_BASE					0x0000092b
+
+#define REG_A7XX_CP_IB2_REM_SIZE				0x0000092d
+
+#define REG_A7XX_CP_ALWAYS_ON_COUNTER				0x00000980
+
+#define REG_A7XX_CP_AHB_CNTL					0x0000098d
+
+#define REG_A7XX_CP_APERTURE_CNTL_HOST				0x00000a00
+
+#define REG_A7XX_CP_APERTURE_CNTL_CD				0x00000a03
+
+#define REG_A7XX_CP_BV_PROTECT_STATUS				0x00000a61
+
+#define REG_A7XX_CP_BV_HW_FAULT					0x00000a64
+
+#define REG_A7XX_CP_BV_DRAW_STATE_ADDR				0x00000a81
+
+#define REG_A7XX_CP_BV_DRAW_STATE_DATA				0x00000a82
+
+#define REG_A7XX_CP_BV_ROQ_DBG_ADDR				0x00000a83
+
+#define REG_A7XX_CP_BV_ROQ_DBG_DATA				0x00000a84
+
+#define REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR			0x00000a85
+
+#define REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA			0x00000a86
+
+#define REG_A7XX_CP_BV_SQE_STAT_ADDR				0x00000a87
+
+#define REG_A7XX_CP_BV_SQE_STAT_DATA				0x00000a88
+
+#define REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR			0x00000a96
+
+#define REG_A7XX_CP_BV_MEM_POOL_DBG_DATA			0x00000a97
+
+#define REG_A7XX_CP_BV_RB_RPTR_ADDR				0x00000a98
+
+#define REG_A7XX_CP_RESOURCE_TBL_DBG_ADDR			0x00000a9a
+
+#define REG_A7XX_CP_RESOURCE_TBL_DBG_DATA			0x00000a9b
+
+#define REG_A7XX_CP_BV_APRIV_CNTL				0x00000ad0
+
+#define REG_A7XX_CP_BV_CHICKEN_DBG				0x00000ada
+
+#define REG_A7XX_CP_LPAC_DRAW_STATE_ADDR			0x00000b0a
+
+#define REG_A7XX_CP_LPAC_DRAW_STATE_DATA			0x00000b0b
+
+#define REG_A7XX_CP_LPAC_ROQ_DBG_ADDR				0x00000b0c
+
+#define REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR			0x00000b27
+
+#define REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA			0x00000b28
+
+#define REG_A7XX_CP_SQE_AC_STAT_ADDR				0x00000b29
+
+#define REG_A7XX_CP_SQE_AC_STAT_DATA				0x00000b2a
+
+#define REG_A7XX_CP_LPAC_APRIV_CNTL				0x00000b31
+
+#define REG_A7XX_CP_LPAC_ROQ_DBG_DATA				0x00000b35
+
+#define REG_A7XX_CP_LPAC_FIFO_DBG_DATA				0x00000b36
+
+#define REG_A7XX_CP_LPAC_FIFO_DBG_ADDR				0x00000b40
+
+static inline uint32_t REG_A7XX_VSC_PERFCTR_VSC_SEL(uint32_t i0) { return 0x00000cd8 + 0x1*i0; }
+
+#define REG_A7XX_UCHE_MODE_CNTL					0x00000e01
+
+#define REG_A7XX_UCHE_WRITE_THRU_BASE				0x00000e07
+
+#define REG_A7XX_UCHE_TRAP_BASE					0x00000e09
+
+#define REG_A7XX_UCHE_GMEM_RANGE_MIN				0x00000e0b
+
+#define REG_A7XX_UCHE_GMEM_RANGE_MAX				0x00000e0d
+
+#define REG_A7XX_UCHE_CACHE_WAYS				0x00000e17
+
+#define REG_A7XX_UCHE_CLIENT_PF					0x00000e19
+
+static inline uint32_t REG_A7XX_UCHE_PERFCTR_UCHE_SEL(uint32_t i0) { return 0x00000e1c + 0x1*i0; }
+
+#define REG_A7XX_UCHE_GBIF_GX_CONFIG				0x00000e3a
+
+#define REG_A7XX_UCHE_CMDQ_CONFIG				0x00000e3c
+
+#define REG_A7XX_PDC_GPU_ENABLE_PDC				0x00001140
+
+#define REG_A7XX_PDC_GPU_SEQ_START_ADDR				0x00001148
+
+#define REG_A7XX_VBIF_XIN_HALT_CTRL1				0x00003081
+
+#define REG_A7XX_VBIF_TEST_BUS_OUT_CTRL				0x00003084
+
+#define REG_A7XX_VBIF_TEST_BUS1_CTRL0				0x00003085
+
+#define REG_A7XX_VBIF_TEST_BUS1_CTRL1				0x00003086
+
+#define REG_A7XX_VBIF_TEST_BUS2_CTRL0				0x00003087
+
+#define REG_A7XX_VBIF_TEST_BUS2_CTRL1				0x00003088
+
+#define REG_A7XX_VBIF_TEST_BUS_OUT				0x0000308c
+
+#define REG_A7XX_VBIF_PERF_CNT_SEL0				0x000030d0
+
+#define REG_A7XX_VBIF_PERF_CNT_SEL1				0x000030d1
+
+#define REG_A7XX_VBIF_PERF_CNT_SEL2				0x000030d2
+
+#define REG_A7XX_VBIF_PERF_CNT_SEL3				0x000030d3
+
+#define REG_A7XX_VBIF_PERF_CNT_LOW0				0x000030d8
+
+#define REG_A7XX_VBIF_PERF_CNT_LOW1				0x000030d9
+
+#define REG_A7XX_VBIF_PERF_CNT_LOW2				0x000030da
+
+#define REG_A7XX_VBIF_PERF_CNT_LOW3				0x000030db
+
+#define REG_A7XX_VBIF_PERF_CNT_HIGH0				0x000030e0
+
+#define REG_A7XX_VBIF_PERF_CNT_HIGH1				0x000030e1
+
+#define REG_A7XX_VBIF_PERF_CNT_HIGH2				0x000030e2
+
+#define REG_A7XX_VBIF_PERF_CNT_HIGH3				0x000030e3
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_EN0				0x00003100
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_EN1				0x00003101
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_EN2				0x00003102
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_LOW0				0x00003110
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_LOW1				0x00003111
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_LOW2				0x00003112
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_HIGH0			0x00003118
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_HIGH1			0x00003119
+
+#define REG_A7XX_VBIF_PERF_PWR_CNT_HIGH2			0x0000311a
+
+#define REG_A7XX_GBIF_SCACHE_CNTL0				0x00003c01
+
+#define REG_A7XX_GBIF_SCACHE_CNTL1				0x00003c02
+
+#define REG_A7XX_GBIF_QSB_SIDE0					0x00003c03
+
+#define REG_A7XX_GBIF_QSB_SIDE1					0x00003c04
+
+#define REG_A7XX_GBIF_QSB_SIDE2					0x00003c05
+
+#define REG_A7XX_GBIF_QSB_SIDE3					0x00003c06
+
+#define REG_A7XX_GBIF_HALT					0x00003c45
+
+#define REG_A7XX_GBIF_HALT_ACK					0x00003c46
+
+#define REG_A7XX_GBIF_PERF_PWR_CNT_EN				0x00003cc0
+
+#define REG_A7XX_GBIF_PERF_PWR_CNT_CLR				0x00003cc1
+
+#define REG_A7XX_GBIF_PERF_CNT_SEL				0x00003cc2
+
+#define REG_A7XX_GBIF_PERF_PWR_CNT_SEL				0x00003cc3
+
+#define REG_A7XX_GBIF_PERF_CNT_LOW0				0x00003cc4
+
+#define REG_A7XX_GBIF_PERF_CNT_LOW1				0x00003cc5
+
+#define REG_A7XX_GBIF_PERF_CNT_LOW2				0x00003cc6
+
+#define REG_A7XX_GBIF_PERF_CNT_LOW3				0x00003cc7
+
+#define REG_A7XX_GBIF_PERF_CNT_HIGH0				0x00003cc8
+
+#define REG_A7XX_GBIF_PERF_CNT_HIGH1				0x00003cc9
+
+#define REG_A7XX_GBIF_PERF_CNT_HIGH2				0x00003cca
+
+#define REG_A7XX_GBIF_PERF_CNT_HIGH3				0x00003ccb
+
+#define REG_A7XX_GBIF_PWR_CNT_LOW0				0x00003ccc
+
+#define REG_A7XX_GBIF_PWR_CNT_LOW1				0x00003ccd
+
+#define REG_A7XX_GBIF_PWR_CNT_LOW2				0x00003cce
+
+#define REG_A7XX_GBIF_PWR_CNT_HIGH0				0x00003ccf
+
+#define REG_A7XX_GBIF_PWR_CNT_HIGH1				0x00003cd0
+
+#define REG_A7XX_GBIF_PWR_CNT_HIGH2				0x00003cd1
+
+#define REG_A7XX_GRAS_NC_MODE_CNTL				0x00008602
+
+static inline uint32_t REG_A7XX_GRAS_PERFCTR_TSE_SEL(uint32_t i0) { return 0x00008610 + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_GRAS_PERFCTR_RAS_SEL(uint32_t i0) { return 0x00008614 + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_GRAS_PERFCTR_LRZ_SEL(uint32_t i0) { return 0x00008618 + 0x1*i0; }
+
+#define REG_A7XX_RB_NC_MODE_CNTL				0x00008e08
+
+static inline uint32_t REG_A7XX_RB_PERFCTR_RB_SEL(uint32_t i0) { return 0x00008e10 + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_RB_PERFCTR_CCU_SEL(uint32_t i0) { return 0x00008e18 + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_RB_PERFCTR_CMP_SEL(uint32_t i0) { return 0x00008e2c + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_RB_PERFCTR_UFC_SEL(uint32_t i0) { return 0x00008e30 + 0x1*i0; }
+
+#define REG_A7XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST			0x00008e3b
+
+#define REG_A7XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD			0x00008e3d
+
+#define REG_A7XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE		0x00008e50
+
+static inline uint32_t REG_A7XX_VPC_PERFCTR_VPC_SEL(uint32_t i0) { return 0x0000960b + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_PC_PERFCTR_PC_SEL(uint32_t i0) { return 0x00009e42 + 0x1*i0; }
+
+static inline uint32_t REG_A7XX_VFD_PERFCTR_VFD_SEL(uint32_t i0) { return 0x0000a610 + 0x1*i0; }
+
+#define REG_A7XX_SP_NC_MODE_CNTL				0x0000ae02
+
+static inline uint32_t REG_A7XX_SP_PERFCTR_HLSQ_SEL(uint32_t i0) { return 0x0000ae60 + 0x1*i0; }
+
+#define REG_A7XX_SP_READ_SEL					0x0000ae6d
+
+static inline uint32_t REG_A7XX_SP_PERFCTR_SP_SEL(uint32_t i0) { return 0x0000ae80 + 0x1*i0; }
+
+#define REG_A7XX_TPL1_NC_MODE_CNTL				0x0000b604
+
+static inline uint32_t REG_A7XX_TPL1_PERFCTR_TP_SEL(uint32_t i0) { return 0x0000b610 + 0x1*i0; }
+
+#define REG_A7XX_SP_AHB_READ_APERTURE				0x0000c000
+
+#define REG_A7XX_RBBM_SECVID_TRUST_CNTL				0x0000f400
+
+#define REG_A7XX_RBBM_SECVID_TSB_TRUSTED_BASE			0x0000f800
+
+#define REG_A7XX_RBBM_SECVID_TSB_TRUSTED_SIZE			0x0000f802
+
+#define REG_A7XX_RBBM_SECVID_TSB_CNTL				0x0000f803
+
+#define REG_A7XX_RBBM_SECVID_TSB_STATUS				0x0000fc00
+
+
+#endif /* A7XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h b/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
index 7aecf920f9b90..9eeedd261b733 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
@@ -8,19 +8,20 @@ This file was generated by the rules-ng-ng headergen tool in this git repository
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2021-01-30 18:25:22)
-- /home/robclark/tmp/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2020-12-31 19:26:32)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/a2xx.xml                (  90810 bytes, from 2021-06-21 15:24:24)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  14609 bytes, from 2021-11-24 23:05:10)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  69086 bytes, from 2022-03-03 16:41:33)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2021-11-24 23:05:10)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113358 bytes, from 2022-01-31 23:06:21)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149512 bytes, from 2022-01-31 23:06:21)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 184954 bytes, from 2022-03-03 16:41:33)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11331 bytes, from 2021-07-22 15:21:56)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2021-01-30 18:25:22)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   6038 bytes, from 2021-07-22 15:21:56)
-- /home/robclark/tmp/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2924 bytes, from 2021-07-22 15:21:56)
+- freedreno/registers/adreno.xml                     (    627 bytes, from 2022-03-27 15:04:47)
+- freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2020-11-18 00:17:12)
+- freedreno/registers/adreno/a2xx.xml                (  90810 bytes, from 2021-08-06 17:44:41)
+- freedreno/registers/adreno/adreno_common.xml       (  14631 bytes, from 2022-03-27 14:52:08)
+- freedreno/registers/adreno/adreno_pm4.xml          (  70177 bytes, from 2022-03-27 20:02:31)
+- freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2021-08-27 13:03:56)
+- freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-03-22 19:23:46)
+- freedreno/registers/adreno/a5xx.xml                ( 149512 bytes, from 2022-03-21 16:05:18)
+- freedreno/registers/adreno/a6xx.xml                ( 184954 bytes, from 2022-03-22 19:23:46)
+- freedreno/registers/adreno/a6xx_gmu.xml            (  11331 bytes, from 2021-08-06 17:44:41)
+- freedreno/registers/adreno/a7xx.xml                (  20004 bytes, from 2022-03-27 20:01:42)
+- freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2020-11-18 00:17:12)
+- freedreno/registers/adreno/adreno_control_regs.xml (   6038 bytes, from 2022-03-22 19:23:46)
+- freedreno/registers/adreno/adreno_pipe_regs.xml    (   2924 bytes, from 2022-03-22 19:23:46)
 
 Copyright (C) 2013-2022 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
@@ -301,6 +302,8 @@ enum adreno_pm4_type3_packets {
 	CP_REG_WRITE = 109,
 	CP_START_BIN = 80,
 	CP_END_BIN = 81,
+	CP_WAIT_TIMESTAMP = 20,
+	CP_THREAD_CONTROL = 23,
 };
 
 enum adreno_state_block {
@@ -482,6 +485,12 @@ enum reg_tracker {
 	UNK_EVENT_WRITE = 4,
 };
 
+enum cp_thread {
+	CP_SET_THREAD_BR = 1,
+	CP_SET_THREAD_BV = 2,
+	CP_SET_THREAD_BOTH = 3,
+};
+
 #define REG_CP_LOAD_STATE_0					0x00000000
 #define CP_LOAD_STATE_0_DST_OFF__MASK				0x0000ffff
 #define CP_LOAD_STATE_0_DST_OFF__SHIFT				0
@@ -2361,5 +2370,33 @@ static inline uint32_t CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(uint32_t val)
 
 #define REG_CP_START_BIN_BODY_DWORDS				0x00000004
 
+#define REG_CP_THREAD_CONTROL_0					0x00000000
+#define CP_THREAD_CONTROL_0_THREAD__MASK			0x00000003
+#define CP_THREAD_CONTROL_0_THREAD__SHIFT			0
+static inline uint32_t CP_THREAD_CONTROL_0_THREAD(enum cp_thread val)
+{
+	return ((val) << CP_THREAD_CONTROL_0_THREAD__SHIFT) & CP_THREAD_CONTROL_0_THREAD__MASK;
+}
+#define CP_THREAD_CONTROL_0_CONCURRENT_BIN_DISABLE		0x08000000
+#define CP_THREAD_CONTROL_0_SYNC_THREADS			0x80000000
+
+#define REG_CP_WAIT_TIMESTAMP_0					0x00000000
+#define CP_WAIT_TIMESTAMP_0_REF__MASK				0x00000003
+#define CP_WAIT_TIMESTAMP_0_REF__SHIFT				0
+static inline uint32_t CP_WAIT_TIMESTAMP_0_REF(uint32_t val)
+{
+	return ((val) << CP_WAIT_TIMESTAMP_0_REF__SHIFT) & CP_WAIT_TIMESTAMP_0_REF__MASK;
+}
+#define CP_WAIT_TIMESTAMP_0_MEMSPACE__MASK			0x00000010
+#define CP_WAIT_TIMESTAMP_0_MEMSPACE__SHIFT			4
+static inline uint32_t CP_WAIT_TIMESTAMP_0_MEMSPACE(uint32_t val)
+{
+	return ((val) << CP_WAIT_TIMESTAMP_0_MEMSPACE__SHIFT) & CP_WAIT_TIMESTAMP_0_MEMSPACE__MASK;
+}
+
+#define REG_CP_WAIT_TIMESTAMP_ADDR				0x00000001
+
+#define REG_CP_WAIT_TIMESTAMP_VALUE				0x00000003
+
 
 #endif /* ADRENO_PM4_XML */
-- 
2.26.1

