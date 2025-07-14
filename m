Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F4B033CD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 02:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787A710E1BA;
	Mon, 14 Jul 2025 00:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJs0HsEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D13B10E1BA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DKl5Sv028045
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ct2fCjbgJR4REN2qV7vOkpthMxmpDjsm7VxJohO9sZ0=; b=PJs0HsEtgFHbJ3/s
 1Gn9ZT1UzOQjj8RO7IiM20BHTgn/ySGtOPjNW8uGY5zAQGQEY6Pvldv32IoPHh2U
 Js+7k40jxZFRcVEs4KJvzTFBh/EUiOuxVyLS4wsgGZKsCtYrB5fopLoS3GcpNBEh
 soQpDKZEhBolnEXk43dD3JWrt4Nc42Tv3FEXzytBUHJ0FEr0XyIV6BDB9Aw72THk
 0Br4pVCqOQlczXE5jdySd/IpdFWuudp8995zBgJsGgpCX82CxFCAkzOgzVb/WAC3
 rV3f8vnPJM0SojOH7Oia9IQvy07dmwoYcRvf8X0IXi18kO3odQf4HdBlZasHjbfH
 Omx6iQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uh0aasjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c37558eccso3248135a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 17:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752454223; x=1753059023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ct2fCjbgJR4REN2qV7vOkpthMxmpDjsm7VxJohO9sZ0=;
 b=rAfvQZ3GnAxaQZiQTLq4j79jIO1jLlDEYZ7icYON/tea6lFa8ve3zMO6iHYFiqpHXG
 bCJ0yzyN4/dzQfE75++UWZnG0gk2+W8Z0ksxf/wTALr85+IWVkQWwQqQLRafcGEV9LWw
 ithCUZn4UypLjAgq/WxW+LSAIqgROo6XlQgWn/fRkaxCSraZhwkg1rduqWGdHQqXKzrp
 UbZe8Lo4JXnbRJ3MFhZMpiR/L/T8JWqcW1p0CtB/lY/jVDKNiDSodIb38XV0Km5+ZHxF
 xkAAu7I9YKxmQDKfgTXFGe9SJK0N0JPA/AXFinWLs4nqzMn3UsrxmmevwPZDVnQds81j
 jYXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3rMoYn62fpn/TjSR3T9GTfUGuf9n4rTBATa+ViKTO3XldWpwqD3LJc2UQLgiDNHnWijugbo580Tk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUaT38A/W4pCTHEJliEA09gIcs4VMATTNy+D2ZNGB07/9XBVFJ
 lWDo9YNaZXjdCj2AOCIJAb9qdaShd4g/Ukyh1F5p5LlTJH0BgIkOvOx0efvixdFRjP01PUN7Uxi
 hFGAdVzwNSWXEuzkSsSIo2HuzE/+R2JCN8p/U02xfxwUpFFjeMk8SncERpmTZr2ZwKBR6Wg==
X-Gm-Gg: ASbGncvQIBff5XbX5EQKf+02Gke3rwTAj1Tr/e8uw0jjlpeQs1naNLRrFBHTDuEXYPU
 OwKcVY5XMImIIt+Vebjvr/x0sWjD/9IJVSPDqvPiTLS6NHpQ0/GSDUUhXhy/18mA2qA4R6v9LHm
 bHOfEvAoLQWFNNsRFWTzi5Wo6yn+7I/TzG2Os3hhqxkIGvT2oHEFRspdib2N3hlI7aew64GJhfJ
 kXYplihCwa4RKJLPxUkXtX5L2vPEfAQBJrjqGnCGI9lfJAgwqji/5Z+GpkpcAEiDoWYup26Uhpj
 YEX6K43OWkyk7zSVwJMKsbEWoLFF+HVeAjfZvmXaprM9zUk2FwuRcjxZAO7jVfWDuxzPyXL4oC9
 6OGu5YK1bnV6tJNe1K52GtWM=
X-Received: by 2002:a17:903:32cd:b0:235:f45f:ed49 with SMTP id
 d9443c01a7336-23dede7d57cmr157639715ad.33.1752454223106; 
 Sun, 13 Jul 2025 17:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRvCzZx5+d3JANtyF1yGNZHHvelXYTT1n9iuGKmxng2HkXNTyORmuj/a9u8CgR2vAWn3cpxg==
X-Received: by 2002:a17:903:32cd:b0:235:f45f:ed49 with SMTP id
 d9443c01a7336-23dede7d57cmr157639265ad.33.1752454222644; 
 Sun, 13 Jul 2025 17:50:22 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 17:50:22 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:15 -0700
Subject: [PATCH v6 03/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-3-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfXxgWaDB8GxDEI
 UNUYsUZONR9EhQZdPLEZ0uno3aJ1pgO1AdloxrDdyc3gcjsnv2oDEAfLJddRdVnK9Gie/LiFII5
 dXaImbGmltrTau878cPLeELgjx0tzRCPxOqeEt5W6YzJM9Wji6k3M/o6+K0sKnBxlGt7yJHUqDg
 4MIcWTgztCV+vn8tbuDlaPt2bA6Ug6NfUzhXXI4DzyqV2UKr0qZAnIG0GVXglqL+JEEDiYvE5X/
 vISfYBNywgYpBmZGopJ30z811RBu7btnmlhvydrZhfzw0JJDLkxObjYe301SLuZdMftWl0NmQHr
 fAZ62dYdFy0nS+C5ip+DMkVAts8FZ5jGK64O5ZumBdppxPvETqcpKgnMZ2W30Uc0PHqavL+tGtv
 +gzMV7GbYSJeAAoQqlShKzVLLI0sG0V7UolVNav0R9xrpeyr1knfqkoxobzmr6ZBLVpisz6C
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68745450 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BqoaXti5mJ4IW25W7IFId34u339JTVwU
X-Proofpoint-GUID: BqoaXti5mJ4IW25W7IFId34u339JTVwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002
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
index b9ea5a85278c..74e40ed83fa7 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -387,6 +387,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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
@@ -455,6 +466,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
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
@@ -655,6 +671,13 @@ static int params_to_supp(struct tee_context *ctx,
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
@@ -757,6 +780,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
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

