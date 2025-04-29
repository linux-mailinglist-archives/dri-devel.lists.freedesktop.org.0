Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAFCAA0267
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6255210E2BC;
	Tue, 29 Apr 2025 06:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJJolMfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B5B10E277
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqQUb025683
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sxprD47J1ns4+472DQayzeIlGvHftXTVadqiV/NL7Ig=; b=jJJolMfaE1pMIhbU
 peLzegYcWzF6XcdzV73llv3xnqmOWgsgWKvCQC8HsXPd+/adfvmW6/mAXoWrJCEX
 zTYgvXCihU3pEEZ3B9ZAXNlH3ZghHpbGJzbxJUJ4h2Pg6no7oHgqny/YPScxxakZ
 KRktGzZcsfLzgsEkafpC2n8x+uJCMreOwLowD8XDYA3wdBIGQv8VwTUr6JGIBwE4
 /G0eK3NwkII+O9uAU6/E+Ii55d1c9P8Ilhcgq3SzzrzxP0duGvmEaZCTcYFYFtAO
 /FhJ66gjHfRf3+AKLuj4RLAeRRybtg2jS3v0Z1y8DNDE3ra2BKBu6KEs8Lim+O++
 s41UgQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkm28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-739515de999so4407603b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906820; x=1746511620;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxprD47J1ns4+472DQayzeIlGvHftXTVadqiV/NL7Ig=;
 b=HdpmIFi0LHKI7UIKe/Mq+B71WGu0qseAiBGlDgKOffBBLbesubxXxerczsmk2rhC1X
 hPdI+iO5bL8D853ZQIO4HvfegQm7OCKoYPs0ImAfJW0oZ78loDCTOjRjjqjSwM/yCkOn
 xcQGsYf6uG5QacVCodfsh16kcBb70nxHEtaWFXNVdRj2dwrDUZuCOjNht+A2PUPzwuL2
 fvaS9cAWqBzF11RkcsMnMqi5Y+Vsjh2btxq5MW4/aHGFCOC0WZMO0A48TEVSKVwn+0cX
 XmnEgZBuHdZxRLMssxs3Oj9uHLz3LlMN1u71WUubRTp63+U/AyEOubrCFru2CVdDz6mH
 nJvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG8TOljOMfUCDlYVB3HP4/nhe/WllfJ3W63GZuXfgPVBHej/vZydtm5Iul3R3Stip4z53Ff7fIVR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNfnh+zy0UIHEH5/xYLZ4471Tr17FuEgfjOFwAmez2alWUjixp
 f0k6A3WKi1Jk7BAv2Jf/t6k6MKDmy7NKRBRderfW5YFVJRDUHSHnSxkM95ghEULEkt1Pwjs3uhk
 pFiHRmi3n1sa4/x8590+kChlffmdFDj/Fr0RZZkM/NklTqptw0M5hlZUjydMlUkh4pg==
X-Gm-Gg: ASbGncvlDnpbGPTNfkvItCC8SAI/umNEmTMJuiZjMeP3y1bJIW93BikOWiX9M+rCmpm
 e30O+rSiMmGeBpHYB9oPoOTlJGLVnKItgjrI/6JVNRLwuBQQ1nvVT9yY97ffQqPNrY8OIBkA9UQ
 V5y3Y0mt1pCAz+LcIt8QhwP37Tgisdmbsz10LmhmuWBWoU0g6zCFHrzhW2oB2xhhL500srfB9G4
 QuGEzS34SL6jvlDiGmKS/PPWkHAqsKKVyuHOcxAeaQBCkNTnEG0qDys+JAZvwdOjRpRhV7I2JkJ
 YG8A7SVlNAliQaUTaZ9BzrKWBCa/b/5MCKvWRIYF9MFqIzSZmvEM4H01SfezcrQAH9mP7gU=
X-Received: by 2002:a05:6a00:21c6:b0:736:6151:c6ca with SMTP id
 d2e1a72fcca58-7402710658amr3514722b3a.4.1745906819986; 
 Mon, 28 Apr 2025 23:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBuFacde4OVGB/zgIWhIZTviSUq1luP80t2jNeLYY1HUnZqwFAuegWqGa+YDw1+m78dpky5g==
X-Received: by 2002:a05:6a00:21c6:b0:736:6151:c6ca with SMTP id
 d2e1a72fcca58-7402710658amr3514682b3a.4.1745906819523; 
 Mon, 28 Apr 2025 23:06:59 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:06:58 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:24 -0700
Subject: [PATCH v4 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-3-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX0Kd9axwLs1X2
 OefBXdhyJHNk2K9WmosanELMkqg0LuD0pXzhVg5wP8zI7Thv8TXpRqsW85ZSEKy+RrT3Q88zUh2
 SEhn8gZCke7twMTU7DrThJaTP8xmZ25GAQnoBESxQIL/JukdzdrtkUhK9bY8TbJ95xmW+eK8Qkt
 Om4NLQWbFS+WYN80cjrpw9/OXT4O9Rnvh6MD1N2b9kvlpcN4ruQTiFMt4rkfI+3VqPzGLlRFd7I
 ymTvz09MKRnI69cwWzd+CBFxACqTM3oRW5se3NDwuqZVrBaC37txPFnKYTmfXSIZUedIaUoIhAd
 WKm6mCOIIUjk15MOweF8Yq4BeaQFeEmwSEuzESBPhVK901mxtHv6aGy+4v78C+FB0w6vzzE66zV
 19qwDxssnBMr5jDNEESqP9oijfksA1RBXTBDZu7ve+1D3Jer+eIpUAzJZu2SHAXruCTAPlJZ
X-Proofpoint-GUID: R-8oL_eMuyIC7xgESsjcbXHI63_nKj1m
X-Proofpoint-ORIG-GUID: R-8oL_eMuyIC7xgESsjcbXHI63_nKj1m
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68106c85 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044
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

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h  |  6 ++++++
 include/uapi/linux/tee.h | 22 ++++++++++++++++------
 3 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 721522fe5c63..7bf265c4ac65 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -386,6 +386,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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
@@ -454,6 +465,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
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
@@ -654,6 +670,13 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.value.b;
 			ip.c = p->u.value.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			ip.a = (u64)p->u.ubuf.uaddr;
+			ip.b = p->u.ubuf.size;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -756,6 +779,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
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
index a54c203000ed..78bbf12f02f0 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -82,6 +82,11 @@ struct tee_param_memref {
 	struct tee_shm *shm;
 };
 
+struct tee_param_ubuf {
+	void * __user uaddr;
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
index d0430bee8292..3e9b1ec5dfde 100644
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

