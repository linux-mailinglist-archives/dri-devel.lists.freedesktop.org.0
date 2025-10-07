Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D2BC0342
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 07:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8496710E16B;
	Tue,  7 Oct 2025 05:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jn63fSad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990A610E16B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 05:38:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972Xj8r029299
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 05:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=u5VbFaNdj1KsSZoq81OM0MFIv5v/4ss3PBG
 tpWI2cVs=; b=jn63fSadN0a6wR0srsn1S09I88b1muAcvYXufevs2vrpP4eyJZL
 YqxvDB//wh9gONskomLqLlIvKvKHbP1uecS46fu60yiFGTne5AIE0OoW+Zcbmpum
 c5hx9FhDUC4Adl75QHG7GX81+hYyj1/Vwcc7r/v7zW1ekoEJJRX6DT5lvp0NjxI3
 f8VYVn/sunDzH+iWpSrZQjlnCMOQvmZKzhSpkkAM62IRGEKXrAIXuvl96XU8YOAQ
 tRUEWM9mjB7fwMRa3wuPiySotF2Gj6LqbfH9jsEZc7rkhr8EwxaKIny14iUo5GS9
 7QQN8yZBm7uU+6eS+dDbqnimnO2XwIolgaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1p32u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 05:38:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4dfc05dec2fso221763681cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 22:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759815535; x=1760420335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u5VbFaNdj1KsSZoq81OM0MFIv5v/4ss3PBGtpWI2cVs=;
 b=AN6Pp3reEX+G2mECUbdDMABBvc9xla9Vk89dX5Q5S7OaWkbcbdCYdxOSetX1wgfF6k
 Ns+wVV+AAFVl88Q20rtYB56zQz2Wn2uT4ELbhHS5agvcj/H4g9ZdebYzCPU+uOb8XDy+
 sQAEJ7d70oTmGR0LfiZqUopQnPAFmcQZow69r4zkZHZxezwi1hwX1KgABDZeKWdME0b/
 LSPMvobgEs9JSstbfik7nzmrm9RfEhphAeBxX4pN2450wh28TC63VSW960RJCHK/CXqX
 yX6RifRQDQYWIwSnXBpGMTuTfloIuwL6typuF0f3xboyURHv3OLfdmW1M+A7s/Q0Ox1z
 ES0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2TCsq9qEnIh3BmJ9yJvm93khY75CaPry1juT00SnYlwOCP316pswUD2Tw/9jtfmCCeL173dOqDw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPAt4azY7Sosk+xuypmig0w8jzFIoEnXqEG9KZ7sbkm4bj+tyk
 4xB1LjaSmPW9I2HnHflGKtTa1+KjSR5cqpAC9dzAKwwqbsShRnXzeJlbkIaXGH/NBnnTdpHRjjP
 vZR1bh/aqdGO7KTl4MG7S6QPyxO0S0vNiXlaPWa0zSVy7nGg9DFglGSzQ8wYmrYbZhGtbJxk=
X-Gm-Gg: ASbGnctK+zmePqzqB+2IShQd+jPTwXFskekD96AaVVatZda+Zcww8huXFKWQ7L4aYGK
 GbgODEFrsfiO2EWunkN8QI1XkoqcVfklKzWBiKA6tP2xwSHPqA9bFJdsIzttopQjU5OXFQK3O0f
 rYj96ZTk0Z4Z6v/FvvERedn3LU7wT+va4FAmWcKk4tms/OuvA2N92dKvAf8zD5X70X6piZNQU3A
 cbf+LQg5HjlxNKCTcbC57fdOwBgKHxdGPbjM/q8J+c8voMdr1cxz7DgEg0nz5jAWZb8rbF5bXU2
 hQ8v9/BNF+f00D4SWG5EOr+xBV79UbQqjKoab4pBoZ15S13R60KEvyuLHLz1M3tzqGHwPhEPC1h
 8JZCeIbFZYg==
X-Received: by 2002:a05:622a:446:b0:4b6:15d:b3f7 with SMTP id
 d75a77b69052e-4e576a5c2e6mr214458861cf.12.1759815534707; 
 Mon, 06 Oct 2025 22:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHILkrqUNaq2KlDxS2cga8lcDXCJEqx3IiH5NckbA+jy0DSn6hkossQwJsWjs8+vyaBrocQXQ==
X-Received: by 2002:a05:622a:446:b0:4b6:15d:b3f7 with SMTP id
 d75a77b69052e-4e576a5c2e6mr214458671cf.12.1759815534248; 
 Mon, 06 Oct 2025 22:38:54 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a7ee4esm1289021966b.28.2025.10.06.22.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 22:38:53 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
Subject: [PATCH] accel/qaic: Add support to export dmabuf fd
Date: Tue,  7 Oct 2025 07:38:53 +0200
Message-ID: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZpKfm_uVmRu2dXvT8zsxz5qDtd7ErVFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX85fGZ9wAD43I
 jOkwNqVl1KNUuAsod0j+GfbAChM1Rn0aP7yub/d9+WtYjb+fayMyxT0bx+I8G0k9dx5i3MjT7Z8
 IQ3Pk24/OAMAEJlW2DvBDcXxeeQi8Sca2rtPepQVWasnmu5pBzM+BkExvD9IS39pMiTfGVsZb/1
 mdxLA67nXG0swWiS0sn38DCpQ8UC/WsjA4XtPgDd/3OEuz/Pwu2Gky4IaPtQz2C/U9ipd1A306/
 /5UYZZUygCON09vE44YB1CFxCEcnDAugUotNSQbGZzB/StQlT835fP5Z4Av6cBNrXXQ8ZIA2va8
 XCB5PWwV7q/UqO+QsfKYdDDCaQVlkGJw2gVdwokLTVcS7kBVk044Ov1DEn7zaiEhse4RJlhcwzH
 lBK+32AYOIwJ5ptZa+pkNGj9kDwyFg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e4a770 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=maDFTXuAomIAUVjzP7IA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZpKfm_uVmRu2dXvT8zsxz5qDtd7ErVFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
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

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Add support to export BO as DMABUF to enable userspace to reuse buffers
and reduce number of copy.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..63248c7215d2 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -643,8 +643,36 @@ static void qaic_free_object(struct drm_gem_object *obj)
 	kfree(bo);
 }
 
+static struct sg_table *qaic_get_sg_table(struct drm_gem_object *obj)
+{
+	struct qaic_bo *bo = to_qaic_bo(obj);
+	struct scatterlist *sg, *sg_in;
+	struct sg_table *sgt, *sgt_in;
+	int i;
+
+	sgt_in = bo->sgt;
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	if (sg_alloc_table(sgt, sgt_in->orig_nents, GFP_KERNEL)) {
+		kfree(sgt);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg = sgt->sgl;
+	for_each_sgtable_sg(sgt_in, sg_in, i) {
+		memcpy(sg, sg_in, sizeof(*sg));
+		sg = sg_next(sg);
+	}
+
+	return sgt;
+}
+
 static const struct drm_gem_object_funcs qaic_gem_funcs = {
 	.free = qaic_free_object,
+	.get_sg_table = qaic_get_sg_table,
 	.print_info = qaic_gem_print_info,
 	.mmap = qaic_gem_object_mmap,
 	.vm_ops = &drm_vm_ops,
-- 
2.43.0

