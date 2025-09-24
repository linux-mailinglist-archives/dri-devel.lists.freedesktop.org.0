Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36613B9CB4D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 01:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F0A10E815;
	Wed, 24 Sep 2025 23:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg0f5uth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D35410E25F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD1Ofk025119
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qV9ItHEjUJjFkqDNpm9AeYOsqDGDG7ItIfgn6ExfwT4=; b=Yg0f5uthwx6AaL/P
 P7cs8rJ5XpNB5ycMU3Tp7LmY20kT0I6puAV9yO0T6NaO1O2+4/tT4Uu+vRfjh7Ql
 305dn67StXGN26L4R/eEQbckvVR2EDueWByB7aDDxlYiyNOvSjVzcxwaCWoA85h5
 8y1tP+FYqahZCajiPZ4WO34mVEkcS7/3PXxAE/P13h5qxy8OqsI4QiDkwf2DG+1G
 zi4Z0Vy1Q281nR9iPJ3m3g0PTv4F/G8JknKwgQkzvV3XbYm/QsT43hNZ93e8tklO
 P8+ZwzjnSVzL/QjRlsestfTTb7wdF1FHchMg8s1eQ3WxHlfXF+4xN4jdXPHZdb2K
 AuGTHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv163nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-268141f759aso2867745ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 16:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758757604; x=1759362404;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qV9ItHEjUJjFkqDNpm9AeYOsqDGDG7ItIfgn6ExfwT4=;
 b=ITr1iZCDuYwgMMNvK5arkpTh7Z2SdUjV/U3e8dPiufZRd4UbVnacyboVpBWXga2N6S
 PUcA1/Vci0hN7+r3YbSWinTb4o5H+gG1RkyIgX8TNCW12yUmF+lHod8x3lE6Bfdtshs9
 MgVZZAM2uRlfAXx+XEVEZW/p0hsHeAHGcDyuismPPCklh6JN+Hl13JqqLrd4aZ+irxWd
 02y0hu8O+997L6iLmz3cNXvcccBOOo+k2RjpQy8eaHXNRXKLoxVctvxH63xS8fI45RUy
 kNTOPDEzP/ve37tDo6MsLpmg7PE9GdNc7BWbaTdQwu2zpQsBdwPPSzQhP7K315W1yaPf
 FSSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKFtjK0wvYDWV/VbXhU7KhpRuTVpwpGQLH5aPf0NyNwvBQ/De2IYAMwW/BvxKvVKUjazh0R1mAzGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydMIrIXGUnM7Qx7v33uBQTi2/bFedLyYDKz7H7KxRHE8IfMdsZ
 uGV04wuP6DCZ1yVdkO2xfHNjZfWLzhR6qYXHNrhJQWCQLuUgBZeQgzbcvr6VGgRuBJXa/N1lOhX
 rXWla6Seo4zPS/Jx3y+BDJsIP/QSwdvHDDKYC+qPfus3DeGRoyisRQE19mgFGaIUjKln3fKc=
X-Gm-Gg: ASbGnctkEVeZR02RVy2wGrPk27PIG5Ds5kf71oWeLzR6tIVe40TCtc2zgQlaYiIhayP
 SIOPy611MWZDpVSA1+Y9aFWw3FrfZQGX2Ccxdgux/vOQ2IWQNUcMfzwfuYiGhiQzLYkIyz0aMc2
 ukPbBhmaksaM5LYGflxApQ2CKVt5fiq5YRk5hnQut/4zLk4SgdBlQFdc9WKqf6neyb/TB2pMoPs
 OgRx1fb2kF+OYaa52m/SgZ3NtrfDvzdKjPispOrTUIHaJKrRJVEGa7QutDmVmuCTBrTouUnel23
 0asbVzShrb+mUVh7iTaT0tljEjkmyvDEWiCdAVTjRcsPxPPxUqouz0JM5nQAFZtDo9VnjG+LTP+
 ONUCo71TVUyDlM+Y=
X-Received: by 2002:a17:902:f549:b0:264:ee2:c3f5 with SMTP id
 d9443c01a7336-27ed49d5b3cmr14796465ad.19.1758757604041; 
 Wed, 24 Sep 2025 16:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOMv8i7DNIHjAdTVSla7dHPR+o+BJeTxoyB6uM935XGng2Q0Dmiyk/mferG3jgoimXPzgtug==
X-Received: by 2002:a17:902:f549:b0:264:ee2:c3f5 with SMTP id
 d9443c01a7336-27ed49d5b3cmr14796295ad.19.1758757603597; 
 Wed, 24 Sep 2025 16:46:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed69959e1sm4318405ad.103.2025.09.24.16.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:46:43 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:46:36 -0700
Subject: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
In-Reply-To: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757601; l=6515;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=S19jilbj7iYbywe2b8F10V99zSDUKUvU/DzMK/hBxow=;
 b=DNgEpFTgVe2sbcpunAFV7X15WOVL8mlV92KXOkA9sPgNknw1oVLYtjduNcqerSSD9T2lZUNFL
 djxGIULhiihDKYeMkFhhf9WjhZUOH0Ygh/l/vrUOYmsJWO8A+K2Bspn
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 3N4AcQbpGbhtGmISm7e90BossKd2kIFF
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d482e5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SMfjFN7pHoWw_NirdsAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX0ynU2zVrVLoM
 Pb8ykMHpf2fcJ7bAtSBtGLBWh9h8Yjr6duo64NyRStk1r+4lbod13GDhWqwSw5HH/Y214WKBlGh
 uFopB2xh3yZsCLWYgr5lZ0feJq4dKepVXx0iO4j/HZ/z0TjLj1vGyWYvVWnbZaUPaRtWTEGqIIA
 QuWIG/QwRkEq1NG2packJ6P9eOjZOzE7ajShtdtSAHap0p58PYA50APQK4gC4E1bpNOheoAJWtM
 wxiJNW89/wvZGFEnoI8gesuJDbG/CtX80p4ovi7Gat6k4DqmBI1HM3/2J9bJZNvCbJnLBreWzDm
 HVh89KVvKPZrlK9r04TFnoayyKrprMw0nl7fgGD+PUC8h/0I6J4mhrsOeJ/7w1HAyS+xWM8sc9K
 5DgcRjIR
X-Proofpoint-ORIG-GUID: 3N4AcQbpGbhtGmISm7e90BossKd2kIFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
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

From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>

Implement the new IOVA formatting required by the DSP architecture change
on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
physical address. This placement is necessary for the DSPs to correctly
identify streams and operate as intended.
To address this, add an iova-format flag which determines the SID position
within the physical address. Set SID position to bit 56 when iova_format
is enabled; otherwise, default to legacy 32-bit placement.
Initialize the flag to 0 and update to 1 based on SoC-specific compatible
string from the root node.
This change ensures consistent SID placement across DSPs.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 8e1d97873423..db396241b8ce 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -33,7 +33,6 @@
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
 #define FASTRPC_MAX_CRCLIST	64
-#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
@@ -105,6 +104,26 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/*
+ * By default, the sid will be prepended adjacent to smmu pa before sending
+ * to DSP. But if the compatible Soc found at root node specifies the new
+ * addressing format to handle pa's of longer widths, then the sid will be
+ * prepended at the position specified in this macro.
+ */
+#define SID_POS_IN_IOVA 56
+
+/* Default width of pa bus from dsp */
+#define DSP_DEFAULT_BUS_WIDTH 32
+
+/* Extract smmu pa from consolidated iova */
+#define IOVA_TO_PHYS(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
+
+/*
+ * Prepare the consolidated iova to send to dsp by prepending the sid
+ * to smmu pa at the appropriate position
+ */
+#define IOVA_FROM_SID_PA(sid, phys, sid_pos) (phys += sid << sid_pos)
+
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -255,6 +274,7 @@ struct fastrpc_session_ctx {
 	int sid;
 	bool used;
 	bool valid;
+	u32 sid_pos;
 };
 
 struct fastrpc_channel_ctx {
@@ -278,6 +298,7 @@ struct fastrpc_channel_ctx {
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
+	u32 iova_format;
 };
 
 struct fastrpc_device {
@@ -391,8 +412,11 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	uint32_t sid_pos = (buf->fl->sctx ? buf->fl->sctx->sid_pos :
+					    DSP_DEFAULT_BUS_WIDTH);
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  FASTRPC_PHYS(buf->phys));
+			  IOVA_TO_PHYS(buf->phys, sid_pos));
 	kfree(buf);
 }
 
@@ -442,7 +466,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf = *obuf;
 
 	if (fl->sctx && fl->sctx->sid)
-		buf->phys += ((u64)fl->sctx->sid << 32);
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->phys, fl->sctx->sid_pos);
 
 	return 0;
 }
@@ -687,7 +711,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
 		return -ENOMEM;
 
 	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
-			      FASTRPC_PHYS(buffer->phys), buffer->size);
+			      IOVA_TO_PHYS(buffer->phys, buffer->fl->sctx->sid_pos),
+			      buffer->size);
 	if (ret < 0) {
 		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
 		kfree(a);
@@ -736,7 +761,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 	dma_resv_assert_held(dmabuf->resv);
 
 	return dma_mmap_coherent(buf->dev, vma, buf->virt,
-				 FASTRPC_PHYS(buf->phys), size);
+				 IOVA_TO_PHYS(buf->phys, buf->fl->sctx->sid_pos), size);
 }
 
 static const struct dma_buf_ops fastrpc_dma_buf_ops = {
@@ -793,7 +818,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		map->phys = sg_phys(map->table->sgl);
 	} else {
 		map->phys = sg_dma_address(map->table->sgl);
-		map->phys += ((u64)fl->sctx->sid << 32);
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid, map->phys,
+				 fl->sctx->sid_pos);
 	}
 	map->size = len;
 	map->va = sg_virt(map->table->sgl);
@@ -2153,11 +2179,14 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
-	dev_set_drvdata(dev, sess);
+	/* Configure where sid will be prepended to pa */
+	sess->sid_pos =
+		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);
 
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
+	dev_set_drvdata(dev, sess);
 	if (sessions > 0) {
 		struct fastrpc_session_ctx *dup_sess;
 
@@ -2256,6 +2285,19 @@ static int fastrpc_get_domain_id(const char *domain)
 	return -EINVAL;
 }
 
+struct fastrpc_soc_data {
+	u32 dsp_iova_format;
+};
+
+static const struct fastrpc_soc_data kaanapali_soc_data = {
+	.dsp_iova_format = 1,
+};
+
+static const struct of_device_id qcom_soc_match_table[] = {
+	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
+	{},
+};
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2264,6 +2306,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	const char *domain;
 	bool secure_dsp;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
+	struct device_node *root;
+	const struct of_device_id *match;
+	const struct fastrpc_soc_data *soc_data = NULL;
+	u32 iova_format = 0;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return -ENODEV;
+
+	match = of_match_node(qcom_soc_match_table, root);
+	of_node_put(root);
+	if (!match || !match->data) {
+		dev_dbg(rdev, "no compatible SoC found at root node\n");
+	} else {
+		soc_data = match->data;
+		iova_format = soc_data->dsp_iova_format;
+	}
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
 	if (err) {
@@ -2343,7 +2402,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		err = -EINVAL;
 		goto err_free_data;
 	}
-
+	/* determine where sid needs to be prepended to pa based on iova_format */
+	data->iova_format = iova_format;
 	kref_init(&data->refcount);
 
 	dev_set_drvdata(&rpdev->dev, data);

-- 
2.25.1

