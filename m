Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F253FA74270
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FF710E96E;
	Fri, 28 Mar 2025 02:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKFdtpjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DF310E968
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REf6LG022968
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dXaMJm9zqA3fJKLXrRirVlQ9wrTmTCRFVGcozylZPRI=; b=IKFdtpjC8VKKhmYz
 2ehnPxqVsHWyfabiFeHrZyYIu7W6S5awlHyBUDSeKl+9a4Z6kd0YmWPLnnoTig6y
 sfldBvBDowgiwKIF22TnYrvglpZLdGDzDmEhyIenM1Un3Qdq4AT7fOpObTh1BGC2
 52LeVRFy8GqNRBDg/VL9fYXqUE2lzay8J9/+4yCdCXwRhvYZpg960QFDS6S8o0Gf
 rFBugqsFtgc+2YoHKP8v09BD10oT0EOPyUmmUV3PDL+3hWxpTih9n6wddfD5jf0s
 yakNpDoZvsU3yqtkm3ub3jq1luL5LGdeM4t1IHaIBu98jFTXpbFHwRtsdnaSPmgr
 kPgZeQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mxp32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2254bdd4982so40378795ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743130106; x=1743734906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXaMJm9zqA3fJKLXrRirVlQ9wrTmTCRFVGcozylZPRI=;
 b=OGB5UIcyTTgu1giSPn97R33gUogIAKoE+YT8HZSqBXhYozwj/yP+AlaN/B0ijvTHEV
 HNeWOet/PoQd7PsRYi6DyvHV35U6XM98vQ5OYg4LUl/QoLtpAtaNdLAIuZ8NVNrCvBxz
 u8NAbbpZNgcUPW6hZGIA3su5/nTj9cZ6MVTdOZXd56kdAO7wdedTpPCGsCfvMKhyXvat
 jCcM/Yc8KCx7Z/Wzm0B6VcrUEyubjKTVi7EsBMCiwK01DcyOfY7GrSLYWpenNxDsIpLu
 DQbnRWqkW54VsfP7WzrjMRj+IeHyWCxLrZFr7VlcvhQWp3MTTS8TjAAVs5D9B2lEelsT
 ESHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURrkLlDZYWq/OdP7kkQsIz3rv5jUsSS8JJXPoi5DRt7sHO/LUuUqnl1sHjl6bI9ktsqUllEK6e1IU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycTCWTrHUKhaubM5mYadeiXroiyvaQ1MVBrM8KtTaRWZVsxG6K
 qQl7Sq1ubpb9L1hVaucaB1Hy3GBZXuLiQnwUs1lt93Pz3rul9hf76nvA0FMfMacQbGD/mXIE42D
 7cjzoNlbUhC+1Dy3wLG2K/ykjnaojVSEvLcd9jvBRgsN9iIccm88rhSiOnuCUw6HHRA==
X-Gm-Gg: ASbGncsmGJX1bazy0T0XbFqH4RMpIDgesXavBYsBt94LM5IaELBqA2LIIRP3uCi9sBc
 GSHEkChSBC9fIz6i28wYaTIWvmB1T1Kfggex7YzUP+mpfNZNIm54OrDzRaPXSsCievfE8pEvz42
 1VnG4MTDkF9rTLKlrXrrJWDl0tOWReBUb/co4qU8Qxo2854ZrKlyZxenDUQ5gPUzeeCvTYlE7yH
 huKp7GMjKcVA7dfbaLTLNG/Ea01g8xE36Df4lqCixYk6ki7opPRL/I1f57eZ9qdw9nPvEppCxVh
 J09lAfMf6H9s73sCfkpyEaati0FwCQ7YbVfIg5JWmAk39JmxlNk7B8VryCVzKfBzBMfLEfDGc+k
 =
X-Received: by 2002:a17:903:1a2b:b0:224:1ec0:8a1a with SMTP id
 d9443c01a7336-2280499f4eemr94297645ad.51.1743130105265; 
 Thu, 27 Mar 2025 19:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNjza1z6gH275OkS0At9YL1i0hKuTz3UL6jwLK6lBZkGA4hYsY/ESBxG4QkMLJE2yYaYW1Fw==
X-Received: by 2002:a17:903:1a2b:b0:224:1ec0:8a1a with SMTP id
 d9443c01a7336-2280499f4eemr94297115ad.51.1743130104524; 
 Thu, 27 Mar 2025 19:48:24 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 19:48:24 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:27 -0700
Subject: [PATCH v3 05/11] firmware: qcom: scm: add support for object
 invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-5-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e60dfb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QjOkjP_JwCzxlRGNz8Wg1P_kaK2UXKmM
X-Proofpoint-ORIG-GUID: QjOkjP_JwCzxlRGNz8Wg1P_kaK2UXKmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017
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

Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
the secure world, accessed via objects. A QTEE client can invoke these
objects to request services. Similarly, QTEE can request services from
the nonsecure world using objects exported to the secure world.

Add low-level primitives to facilitate the invocation of objects hosted
in QTEE, as well as those hosted in the nonsecure world.

If support for object invocation is available, the qcom_scm allocates
a dedicated child platform device. The driver for this device communicates
with QTEE using low-level primitives.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 128 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |  27 +++++++
 3 files changed, 162 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..bff1b0d3306e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2084,6 +2084,124 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
+#ifdef CONFIG_QCOMTEE
+
+/**
+ * qcom_scm_qtee_invoke_smc() - Invoke a QTEE object.
+ * @inbuf: start address of memory area used for inbound buffer.
+ * @inbuf_size: size of the memory area used for inbound buffer.
+ * @outbuf: start address of memory area used for outbound buffer.
+ * @outbuf_size: size of the memory area used for outbound buffer.
+ * @result: result of QTEE object invocation.
+ * @response_type: response type returned by QTEE.
+ *
+ * @response_type determines how the contents of @inbuf and @outbuf
+ * should be processed.
+ *
+ * Return: On success, return 0 or <0 on failure.
+ */
+int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+			     phys_addr_t outbuf, size_t outbuf_size,
+			     u64 *result, u64 *response_type)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMCINVOKE,
+		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
+		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
+		.args[0] = inbuf,
+		.args[1] = inbuf_size,
+		.args[2] = outbuf,
+		.args[3] = outbuf_size,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	*response_type = res.result[0];
+	*result = res.result[1];
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
+
+/**
+ * qcom_scm_qtee_callback_response() - Submit response for callback request.
+ * @buf: start address of memory area used for outbound buffer.
+ * @buf_size: size of the memory area used for outbound buffer.
+ * @result: Result of QTEE object invocation.
+ * @response_type: Response type returned by QTEE.
+ *
+ * @response_type determines how the contents of @buf should be processed.
+ *
+ * Return: On success, return 0 or <0 on failure.
+ */
+int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
+				    u64 *result, u64 *response_type)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMCINVOKE,
+		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
+		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
+		.args[0] = buf,
+		.args[1] = buf_size,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	*response_type = res.result[0];
+	*result = res.result[1];
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
+
+static void qcom_scm_qtee_free(void *data)
+{
+	struct platform_device *qtee_dev = data;
+
+	platform_device_unregister(qtee_dev);
+}
+
+static int qcom_scm_qtee_init(struct qcom_scm *scm)
+{
+	struct platform_device *qtee_dev;
+	int ret;
+
+	/* Setup QTEE interface device. */
+	qtee_dev = platform_device_alloc("qcomtee", -1);
+	if (!qtee_dev)
+		return -ENOMEM;
+
+	qtee_dev->dev.parent = scm->dev;
+
+	ret = platform_device_add(qtee_dev);
+	if (ret) {
+		platform_device_put(qtee_dev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
+}
+
+#else
+
+static int qcom_scm_qtee_init(struct qcom_scm *scm)
+{
+	return 0;
+}
+
+#endif /* CONFIG_QCOMTEE */
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2319,6 +2437,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	ret = qcom_scm_qseecom_init(scm);
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
+	/*
+	 * Initialize the QTEE object interface.
+	 *
+	 * This only represents the availability for QTEE object invocation
+	 * and callback support. On failure, ignore the result. Any subsystem
+	 * depending on it may fail if it tries to access this interface.
+	 */
+	ret = qcom_scm_qtee_init(scm);
+	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
+
 	return 0;
 
 err:
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84..a25202e99f7c 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -152,6 +152,13 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_SVC_GPU			0x28
 #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
 
+/* ARM_SMCCC_OWNER_TRUSTED_OS calls */
+
+#define QCOM_SCM_SVC_SMCINVOKE			0x06
+#define QCOM_SCM_SMCINVOKE_INVOKE_LEGACY	0x00
+#define QCOM_SCM_SMCINVOKE_CB_RSP		0x01
+#define QCOM_SCM_SMCINVOKE_INVOKE		0x02
+
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
 #define QCOM_SCM_ENOMEM		-5
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 983e1591bbba..bf5e64f6deba 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -176,4 +176,31 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
+#ifdef CONFIG_QCOMTEE
+
+int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+			     phys_addr_t outbuf, size_t outbuf_size,
+			     u64 *result, u64 *response_type);
+int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
+				    u64 *result, u64 *response_type);
+
+#else /* CONFIG_QCOMTEE */
+
+static inline int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+					   phys_addr_t outbuf,
+					   size_t outbuf_size, u64 *result,
+					   u64 *response_type)
+{
+	return -EINVAL;
+}
+
+static inline int qcom_scm_qtee_callback_response(phys_addr_t buf,
+						  size_t buf_size, u64 *result,
+						  u64 *response_type)
+{
+	return -EINVAL;
+}
+
+#endif /* CONFIG_QCOMTEE */
+
 #endif

-- 
2.34.1

