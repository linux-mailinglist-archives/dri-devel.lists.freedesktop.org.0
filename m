Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363DFB0361C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890DF10E3F4;
	Mon, 14 Jul 2025 05:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="j69Wd0QA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18A010E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:42:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMdoTw014318;
 Mon, 14 Jul 2025 05:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V0hC9PfCmnsN5ZKtZhvGxq28kOT6Ykij//h1Uuh6B+8=; b=j69Wd0QALy716Eks
 VjTuLGJAbbkP61NdHJzLpbhDwgyoYirdZVH9dTAGNXwPM9yz2h/t/0G+7ZwfRBXn
 lupHEGPG25XLGOd1mARPpUxnMemQ2D+Ld5LlHL1NyQRfbVjh4mIJR8yp0kFPuwr6
 5/CA83oAV8UtC987FE4BOaUpEYVcikcMaIeicMQrQ1SpaImEy8hZAt9E2pmuIzr4
 s14P4px5zFDlqaj4ZGDlLDaDG5GLSlP0Dt62qCWmFoX87DE+0KUZtgqaWDGV/FsT
 lOCDupPvJzWSrkBaRCcXZ1SjnRLiNfrLVqneeCp+ZR7nKUxCEw84e61uEXerjS5U
 42I8YA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut3ac6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jul 2025 05:42:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56E5g8eF018504
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jul 2025 05:42:09 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 13 Jul 2025 22:42:05 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v7 3/4] misc: fastrpc: Cleanup the domain names
Date: Mon, 14 Jul 2025 11:11:32 +0530
Message-ID: <20250714054133.3769967-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687498b1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=ql8Nfxkq940Eb9atYOsA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: F1kfaNTesx-swJrGcPljE6DsKvD_awUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzMSBTYWx0ZWRfX0LPgaO36elvk
 03pzVyTA9IA7s/UhFd8TxnK6+l9RBhVbvm/66T4rbBQCE4OosqnttnHQDevyla65fjQKVWXVjig
 vmr+5DSSb597Q4FYg04sbElZ7BXv0/r0m3d4RkzJmt6pAVilLS3MXkBj7IjQ7pi1+uvke4PW9uw
 /ORPwFy1JpvOJZ4y5GDHykNptbm95jLU1zKvuGCvywoBazASPHydFdtLn+mYBqd6y+2hgexbvhg
 H+cC6h84PzJ7dZzej1sAE3zcsPvSr9vPGieACukORoqZEbenkd2/cQ5UPWgpfeSI4npkNp/N7Rw
 PRAQmVecxqgKIRgzj/DHXtwuRiYonThVOAM2wfwlXqDW8L22q4+fNuPJXR+iLlVJ5FfWtYMgQ61
 7r7bTN/DkOTPxghUBgSEp8wsV6GRUFrZhperUlPIxsbf6gNLNTuSbAN5urzjkQZ6mc2TZtoe
X-Proofpoint-ORIG-GUID: F1kfaNTesx-swJrGcPljE6DsKvD_awUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140031
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

Currently the domain ids are added for each instance of domains, this is
totally not scalable approach. Clean this mess and create domain ids for
only domains not its instances.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c      | 50 ++++++++++++++++---------------------
 include/uapi/misc/fastrpc.h |  2 +-
 2 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..85b6eb16b616 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,8 +27,6 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
-#define CDSP1_DOMAIN_ID (4)
-#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -106,8 +104,6 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
-static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
-						"sdsp", "cdsp", "cdsp1" };
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -1723,7 +1719,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	uint32_t attribute_id = cap->attribute_id;
 	uint32_t *dsp_attributes;
 	unsigned long flags;
-	uint32_t domain = cap->domain;
 	int err;
 
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -1741,7 +1736,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
-			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
+			 "Warning: DSP capabilities not supported\n");
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
@@ -1769,17 +1764,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 		return  -EFAULT;
 
 	cap.capability = 0;
-	if (cap.domain >= FASTRPC_DEV_MAX) {
-		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
-			cap.domain, err);
-		return -ECHRNG;
-	}
-
-	/* Fastrpc Capablities does not support modem domain */
-	if (cap.domain == MDSP_DOMAIN_ID) {
-		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
-		return -ECHRNG;
-	}
 
 	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
 		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
@@ -2255,6 +2239,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
 	return err;
 }
 
+static int fastrpc_get_domain_id(const char *domain)
+{
+	if (!strncmp(domain, "adsp", 4))
+		return ADSP_DOMAIN_ID;
+	else if (!strncmp(domain, "cdsp", 4))
+		return CDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "mdsp", 4))
+		return MDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "sdsp", 4))
+		return SDSP_DOMAIN_ID;
+
+	return -EINVAL;
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2272,15 +2270,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return err;
 	}
 
-	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
-		if (!strcmp(domains[i], domain)) {
-			domain_id = i;
-			break;
-		}
-	}
+	domain_id = fastrpc_get_domain_id(domain);
 
 	if (domain_id < 0) {
-		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
+		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
 		return -EINVAL;
 	}
 
@@ -2330,21 +2323,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
+		/* Unsigned PD offloading is only supported on CDSP */
 		data->unsigned_support = false;
-		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
 			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
-	case CDSP1_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
-		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
 			goto err_free_data;
 
-		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
 			goto err_deregister_fdev;
 		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..c6e2925f47e6 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
 };
 
 struct fastrpc_ioctl_capability {
-	__u32 domain;
+	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
 	__u32 capability;   /* dsp capability */
 	__u32 reserved[4];
-- 
2.34.1

