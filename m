Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB7B52725
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 05:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E185210EA09;
	Thu, 11 Sep 2025 03:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+DvGnqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A9210EA09
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J10f026485
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OMgYiwriuoaEgjuQdAgHOp5QH1z5K2+Oz1UIvw1UFeo=; b=b+DvGnqvnCv/bKgq
 grwBl8YCaRiLBk+eMJIJbaXRVS+ip7RQxm3mj2enZN7H5TikYWIbu3XXgRvbdQ1v
 gEMUeIUZvx9LM7i0HyckrOJ2otRTfPMaVWn2FeOqGHq16+00f+IAS9vyIVbpLiFe
 Jh24NsLSpXu6xTvAUhOu8usDgS8hHJKAUHoSpH+UnaAhoDBth2ONDo58S/AJRld3
 WiR4UE9g0L+4rMAxxblRGDTbpSWILA8VCdcr/sziaNlA4rhhpjDJWwF4QssBsN7Y
 NYtPmgLmAmG9BT0Xuf7CyVhkUipCnmJZoL1kaDrK1Te71UbyDWZH/Z+UYL8aR9ez
 aaE+fQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0x2vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244582bc5e4so3011645ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757562093; x=1758166893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMgYiwriuoaEgjuQdAgHOp5QH1z5K2+Oz1UIvw1UFeo=;
 b=Iw7CNSZCLnud/qiX+ysRqr1GwqY3/id94A+qXY2sFdgvu0V1GtlFu0+3zYczCGZiGo
 vOnqOx0i93mFSX/mi7N66MTAIyyRICMv7eE0kTa9kMPt90VRKDQQH8un/xC/N9apmX/W
 /EWm5G0dkpDobxprFHLvlqIOTXXpJQSsJQj2dD+JELqf33zZxIEDdlLRlOCeOZbuzKoa
 DHTt48AdSCTHBeB4XKuW5qin9Z0fbfBfKQYyr1qiG6hj4J+nkfC5vR4kpM5yUD8j+zsv
 0ljV8bS63alqDSlhtNBCJ0IeXdhqCdiSVDMOm9EZj8HjQ9l+S904N3XTml666moXemVQ
 xB6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfll+gTPeXeAkvSKBYOS3XhreiNhOHqYjn8wpqmTqSeeC+cPeWz/27dZUUeoqaly7pRxYEiUkYjss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO6BoaDGIEmMe/hIVHnf76dLqfZ4QMnBtsN4d2yu/8wUmup81W
 2E4njEzroxeaWPKcXw2gzw7Ha52PGgFIU57bDyHGfEIuXSVxqzGdh+z/oe0zvq3tKTmtjFb84Jn
 xJ/rloa8v7BQwAh+9Us/YVf8sQeCpR631vGlXkRlAAlhw8OKE1YZd3uZnMXrlL3D+R6CQhQ==
X-Gm-Gg: ASbGncselbjliFVpAGgbTRZJDQNGM004pNfuAPXBTL+sFtaDUfdndEcfSCRtq6RoUtY
 1xgt7Bulv2V0RZhJ5ZH2XflhEbOycDXmOeEARhPfCt1ysmPjN/BK5avIiqXcOPvspVyI5gw+H3Z
 fTwDHHvm9Bjbw/KWyFMvX4KgmCmQn06MPNYXF8m/r4PE2iX1IHwMOW0zTWG/qamX16Ri6C3bzb6
 2wTEUbA08+49gioNPV3LpKpgoWgGEoSQ3z+VGvzi3CguJruuZM6rug/bMEsW2PmukcnyEuY+CU7
 mTKkS/LsxmBodOyCj4+MqNPJl2VAOrs0pxf24eW8DW4KHsntLQwbpIUCWdYDdh2tGe/B5x0vkKt
 nYuAzmn+NRgS0Ugz670lPwP4=
X-Received: by 2002:a17:902:ce89:b0:24d:64bc:1495 with SMTP id
 d9443c01a7336-25172e32f31mr234655085ad.41.1757562092638; 
 Wed, 10 Sep 2025 20:41:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2XBrmFI7DZlf4E83+SRzoCLNep0uvy22/JAq8l7UDLF3EEcfP3TLMWQ4bKAYhHUdaEoQscg==
X-Received: by 2002:a17:902:ce89:b0:24d:64bc:1495 with SMTP id
 d9443c01a7336-25172e32f31mr234654575ad.41.1757562092083; 
 Wed, 10 Sep 2025 20:41:32 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 20:41:31 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:18 -0700
Subject: [PATCH v11 05/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-5-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: ZRWCZsrVBQeDjE9qX7IBWooAqfyRurJC
X-Proofpoint-GUID: ZRWCZsrVBQeDjE9qX7IBWooAqfyRurJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX/auIZceUWhye
 QmiePwwvmmLgEcn9GNmyT9zlSTxxL1OeldO4FKo+Ck+ouec2cjQ8wjEEe6USK21ayY9gepA8Wag
 StYbhiRsNR3lfNS1I061ofGFy/XASjnyiYUYgTLRtmFl8iLuj30eRRoqb5hBFH+QSx2x7g344cr
 fdHTzVQrWqj3DCbpP3WqdvB1oBc65Qm3mjJPfSkq+XUkMh9MZenrNADDr4a9DJtqQCTtdvYnLUL
 MVJT/oCT+iK+2Lcrbl3L4UzNLn3PeduNrNt+qjOBuCjtvxMhvPmjiMR6mtSWRp+Gab+M5AvPbGN
 GhR9bVLY5rdUB5xYfo/3l76qnlI49y2OConX4VQwuot9UwhML/hzyfQCLsIPyguecb5TK/nxsbu
 47oATfNN
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c244ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

For drivers that can transfer data to the TEE without using shared
memory from client, it is necessary to receive the user address
directly, bypassing any processing by the TEE subsystem. Introduce
TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
userspace buffers.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h  |  6 ++++++
 include/uapi/linux/tee.h | 22 ++++++++++++++++------
 3 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index f8534a00c56c..bb2e3a6c23a3 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -457,6 +457,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			params[n].u.value.b = ip.b;
 			params[n].u.value.c = ip.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+			params[n].u.ubuf.size = ip.b;
+
+			if (!access_ok(params[n].u.ubuf.uaddr,
+				       params[n].u.ubuf.size))
+				return -EFAULT;
+
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -490,6 +501,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
 			    put_user(p->u.value.c, &up->c))
 				return -EFAULT;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			if (put_user((u64)p->u.ubuf.size, &up->b))
+				return -EFAULT;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (put_user((u64)p->u.memref.size, &up->b))
@@ -690,6 +706,13 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.value.b;
 			ip.c = p->u.value.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			ip.a = (__force u64)p->u.ubuf.uaddr;
+			ip.b = p->u.ubuf.size;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -792,6 +815,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
 			p->u.value.b = ip.b;
 			p->u.value.c = ip.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+			p->u.ubuf.size = ip.b;
+
+			if (!access_ok(params[n].u.ubuf.uaddr,
+				       params[n].u.ubuf.size))
+				return -EFAULT;
+
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			/*
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 824f1251de60..7915e8869cbd 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -82,6 +82,11 @@ struct tee_param_memref {
 	struct tee_shm *shm;
 };
 
+struct tee_param_ubuf {
+	void __user *uaddr;
+	size_t size;
+};
+
 struct tee_param_value {
 	u64 a;
 	u64 b;
@@ -92,6 +97,7 @@ struct tee_param {
 	u64 attr;
 	union {
 		struct tee_param_memref memref;
+		struct tee_param_ubuf ubuf;
 		struct tee_param_value value;
 	} u;
 };
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index d843cf980d98..0e3b735dcfca 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT	6
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT	7	/* input and output */
 
+/*
+ * These defines userspace buffer parameters.
+ */
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT	8
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
+
 /*
  * Mask for the type part of the attribute, leaves room for more types
  */
@@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
 /**
  * struct tee_ioctl_param - parameter
  * @attr: attributes
- * @a: if a memref, offset into the shared memory object, else a value parameter
- * @b: if a memref, size of the buffer, else a value parameter
+ * @a: if a memref, offset into the shared memory object,
+ *     else if a ubuf, address of the user buffer,
+ *     else a value parameter
+ * @b: if a memref or ubuf, size of the buffer, else a value parameter
  * @c: if a memref, shared memory identifier, else a value parameter
  *
- * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
- * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
- * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
- * indicates that none of the members are used.
+ * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
+ * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
+ * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
+ * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
+ * are used.
  *
  * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
  * identifier representing the shared memory object. A memref can reference

-- 
2.34.1

