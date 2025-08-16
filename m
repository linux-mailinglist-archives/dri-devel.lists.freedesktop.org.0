Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9BB28EF1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED87210E399;
	Sat, 16 Aug 2025 15:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqY31cXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13C910E39D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G8UFNf028126
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=; b=AqY31cXiT6LNE/Wa
 gfDPIHid5llWAV+6h/L8oaVxSgGk7ykXtRHfxq9ITeYFd7x+h+dOgXww8mpMSWEB
 EOMxUY6YlNQZqiPz3Mb63xp0Y91aavwQCqk6BPtt4/xXxE+IcYxMQX//pXGgAsKx
 jqRl+Fa+nG3TjKdzeo1RGfYrwc8O2bMaqK57GtZARGvuVa33M8GoCdAb4w9qk9d4
 po9G9mEOb/Al0+GzrZgcnDO/BZwhGoeZ+XTD0TUoNCGSTMjJ7dKgZa1qY116e6iC
 zC7aacZZHGrzVPCxcFRNtNcv+0TQyBelKxl0Z72d7IMZV26/X7h5NIYGzSsNSZC1
 AsHgrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7rt01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109be525eso78604211cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357591; x=1755962391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=;
 b=tcXU/OqPFUkrbZUcOki67nQdSnF8GaLUthY9Z/1Ype4/6Slrgr1KGRRvedlC48iLnD
 ZacIY5hXDiqXFI5wzxriqQ5/OGQ5W1KSnCaWuoeaQhMz9pMgUucWYfnq5FFiCJqXsBKB
 LKBMsNPEFsEwOX19QOAHRHmjRHBYVAhvHfLLOpQ1gC+90tVe8RjtzV4B+CDurlg2bSEG
 qYpXZhG7rqOqJ4+Up4KJxTuCS0D8O+8F9+pQ8ByQV1GaaIaoo1Jiyto7tUPEr9akTX/e
 MQ9BlIScRkPM69OOCxj4zewV6e8qodM1Fqy8eLV/0ysxkPyamWM5RRb7ZKmdy350S4VY
 YDDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXawITGj0aTvFiH4CIqzXuUHySbVOTIiaDCyuDHXQpEscRAhw6H6cHwIxXqC1NgOVCDqCpbDcp+7Dw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaBBLJdvJLUcISWokNPWn5/xH75h45XUJoSmngBbZakzOOJRSN
 1aPGuYweQNWIreufRGzY/xZp6AEuRPSg4hieneymah8GINLy3950ja8zV4qPDskS5gWb1tWGicD
 ITRT4BWAadnIy+qMhgUL/SnQtgZIOxOn4D8n5j60t6giG16L3x2zfAEB62VgmLZNokVgzBms=
X-Gm-Gg: ASbGncvbIG+WDK7sbhkH6fKuVS3lvnq8aKeq1Yd9XtvM2eDnIcvLcaK1GilmjMR7TrT
 T6Hc3wSN8VHluRi1VcaJfxjr2McKoxGNE54BVbvWlFZnkvyEQOi+xYraz22S4nK4AHhXWEPe4NH
 4VDSFSGEUrbFGk3Uv99sQovT7R8J++Hfysg54OqRptfLzscPZ0hOmsCbgMLvoPRSylR6YDTFcRH
 8JhkgqsDIyycDlLQJnca5TVM+nyK69o0DS2ECg3InWfb4QHsFn915h6Q4Z9OC9VEbSC31TTzr+X
 GDpuDCVWc5IfYq4Av3tyNir0gntGpVHugd4yZnZAo7R50HvmMs37k2KaG5Jq9k2qrjn+CrPWdY/
 A+T2uiOfY2eVs7HYJINDeqLhF71npEyWBmAWCCnhWgsetwm9BwgB9
X-Received: by 2002:ac8:57cb:0:b0:4b0:69d6:85a2 with SMTP id
 d75a77b69052e-4b12a72d48bmr37236191cf.31.1755357591160; 
 Sat, 16 Aug 2025 08:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKh/+i8IQ8KfC/PGtL5WbCPyvf0DWbyUBL4UoteG6uU57Gcw4lUvCyN3nBm4+guZJlXMKsYA==
X-Received: by 2002:ac8:57cb:0:b0:4b0:69d6:85a2 with SMTP id
 d75a77b69052e-4b12a72d48bmr37235531cf.31.1755357590637; 
 Sat, 16 Aug 2025 08:19:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:40 +0300
Subject: [PATCH v2 6/8] drm/vc4: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-6-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9kPXh1enzh44Jx+JV9Ql6fG94nEVIAR8Tv81e1DfnG4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGigoYmi7Z2qV4qHuc0EhD2k/N7ZfvDfuxN8wZARRRVrlbSLw
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJooKGJAAoJEIs8ij4CKSjVHcQH/3sm
 ploBZcGyn9igFEwOb7KK+duurcQL+8IUikUxpNTsSBzPUpiPsu1e2gHAun/BzV28c7qAbGwav92
 TaclcXxDkLxqc9FMEZJ1M3OC0myfyvBNMomGmZNtKq8+WdLN/tEfh2JO0Vl3yUV8wOs6aPtLZ/H
 l0C2G+hwInuwe4NU0htEWKNERFlXfSTW6Z8j/+rMDxp5WjrESKCLI+Pd4iHWfg/rVESJNzH52G1
 NmBfh+DTMCXVvLwtvWMwgN2QdOVl9O0pFeflRZX/gd04fcYREOyi3UzGvHdVXPgAoYpkiHw5mqi
 LABSKrPzJMFKH49LcYJDRuJcbaGH+5TXRmkLwzI=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX/q4CWz86AXHr
 sEnD8MIKQKGugvMk/Wf3nnwcyYdxN96TJLzFA08xeJnKaAfohrAGZAxePfeSt9PtbCnv/wvfR0K
 Fpjh4h30IBKY4cm7YKUqN7h+Z6201bmIdxcR9BQUETdC0ljixykE4HpjNePHdDxHzB8zoujyaXM
 k5sND8N1+MXvBG6GawlV8RPlRWPzoJeUcue+jJDmwebhsMlKx05GOSywsRRjK6J572Cl4/3Czp1
 +smqIjrBiH02iJyfL7W1qPPnhohaKz4SbUTa90YLgpGESwAmipp3ZktZ8ZE9DEQ0oi1kR6LWeYt
 s69f2psztGpama3cY4BowM95c2EdKPzygdXUfvdx8OK7JCLPpUDvMNg87qXFxfDLoRux4a5Olwd
 +uH4SAog
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a0a198 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=hRdDZflY9wZGYtDLNskA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 5V_3pV2109jK0R8IZkgwUybV2syTjOua
X-Proofpoint-ORIG-GUID: 5V_3pV2109jK0R8IZkgwUybV2syTjOua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 42acac05fe47861ced226a4f64661f545e21ddb5..fef4e4ee47cf41d40de47c5201f0349dc36c56bd 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -377,7 +377,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -601,10 +600,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.47.2

