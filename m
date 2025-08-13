Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6FB23D14
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 02:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6954A10E67A;
	Wed, 13 Aug 2025 00:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaEN4QjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E160410E67A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CJ3QxN012900
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SZkIak/CnogNIohVjfrGy7vKdxiGWC4sl5fGDKdZ1SU=; b=OaEN4QjCehCWwHsM
 hK3AMmhwuWjG9rB+I/eMzSo75T/wzOmzky81Bc1I3BuuE/B6eeo/EenIXS+gvU83
 5m0Hs0Jtwpo9qmURHPk4878Bhy7tvuUnfckf9xRYHLn62ifKOUruAaukiF43l6js
 1wo4EWRoKcxm5gsNhpm3o+MQmf+2aHDV+MBmYKjXa1g2rFu3Rmbg7s9VMFDS8Kjq
 XGXr9zxWP6FNUqLxn5u5Ngky4UwkutxAk2aMfjGJ6arUi4WJlERSqk6EH3r5ND1m
 pN7FOcqd+rbWBaNtTz7VvfZQPbmu62Yr5RqhUF9mjNQ6ITLRKx/d74+m9fRpqruG
 0T2mIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbd34k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2400cbd4241so96179105ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755045422; x=1755650222;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZkIak/CnogNIohVjfrGy7vKdxiGWC4sl5fGDKdZ1SU=;
 b=loU670/T/TmbFfhepoB79GdREAiCPpXcrNhuBt2kOJ/I8wIpgHSI1V+uV3eJ+xB8wQ
 kfhVlhepIjizGA/QU1wsHtqY0GB5GrmXbjFKekG9NoSAG1CgOL62DXYLb9h65LuEvM/R
 yhTFz+5M4JmCwR0dBrrixafpnlWaS601F4T3nDxc3F2S71lK3TUwmIy6M0ik+ksR0Ov6
 UArN6/FxcPyLX00D6m2U/CKhQbMRA4UTBBRIckckeJiXQkX1n0qVk9ohnORj9fKpkXQS
 UDiVbUaGIU+csczXRqRiE38nmMDWcW+x+VAj78p9/l3mwp0svNB0Wz+7o7GNA4KXuDR4
 +91A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOPcEal0U1yWLdf1CU79CDh6Pe9unGt1TfRZviiLryjk0fKkYnwnKAbPEzKuIKDpumoATq+sv4x4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1Ou3i+TCxx/QZ2wN9r6xYgnkJ+a9U2qEyCaFyKXtCIeGYkzKd
 1M8/o/TjNDED4sxdppW803UNs0ub9oHtK2lK9OFniJKQTK7g/aItyhOmv5b3Jc0IPnm+tXEImq7
 vBmiSfCre1yqL9ZToXhUyJpS6Bo8Ya+faOOAx7jHXINwvSmK5XoWf6Qmw0NlNqLkNNw/pgQ==
X-Gm-Gg: ASbGncvSTeurGfqqAjS2OkFiPcV9uSZ88C6p5aZQiTjJ+el8Y4y+lO+7wJagWfZcsUF
 ayHQH8R/dDxT+N4ucxkoBXZhRY1bzKV1HNiyT2wjb0FxPBR227z7o4LksVwpAPX4ymsJhOTggcp
 yD1QEj2aqI3ajXZq7qN4qGdxPVR3VoKndIoQkzVcI5/AyY/3QqP6JVterYJrIwpsz5NDvgQFDCS
 e/bx9aA0h8GTIJcXjkXpT0zJI6ytnRWyDI9GlBp57nuhbus00DNeNak09d0gyskIt61/lbvdUPA
 oZzhJ1ATpMLSWKvCq53zB3oxPsXfaBcHWZkT3hk4E3y2xtXVL83fBERPPx7aVgaQZrlsAFAyJUW
 bQ2gDUqMWi+HeRzylDujOO7w=
X-Received: by 2002:a17:903:3c2c:b0:243:597:a2f0 with SMTP id
 d9443c01a7336-2430d108278mr16375875ad.23.1755045422396; 
 Tue, 12 Aug 2025 17:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVTMGkjD367YhdbNapUwz7Z2X26qEDvXBYUGX4tepkb2C88xT8Wd/R5MHkhv4Ew7ZpY4TkfQ==
X-Received: by 2002:a17:903:3c2c:b0:243:597:a2f0 with SMTP id
 d9443c01a7336-2430d108278mr16375545ad.23.1755045421827; 
 Tue, 12 Aug 2025 17:37:01 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 17:37:01 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:31 -0700
Subject: [PATCH v7 02/11] tee: add close_context to TEE driver operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-2-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689bde2f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX+J+7KhHTnwqE
 MXsSyGW0G7HMaCm0qp7vF5Zg8Sgl2opfv+xtGhSSVJ8vnSyqNO8R5aAPUsevCay2SFVEXOS+7am
 fyx7f/e8Mxb6NPEfktu/tHehIr/bUwVDch4OXA2ra/Oa09ipvWlcuJjts7VvFY22cH/WCV+RIq8
 uu7uV/fKHA/5Men10l5TdPKR1UlkHOW7ZLA3kARFpn2MOxbY10EcsPnGaURVahpWwo09Er2f4cL
 Z73BeplcYLaShbbM/mxAM9GOvFQ1yiNafubOP5ZhWaNxCkG3zjJ79dF8rgGcar6gcMdiY8d8BrV
 iqizqNa2dOr7Vsv/4hWZOsk1PYXYaaY2ro9BDdRGAQ+71GWlAat5ERb6K4sfPm6KMMOaqW4DRvt
 0fjIzS47
X-Proofpoint-ORIG-GUID: VXBRcaWwGvBVVrRUu68fEzEezgrCUam5
X-Proofpoint-GUID: VXBRcaWwGvBVVrRUu68fEzEezgrCUam5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
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

The tee_context can be used to manage TEE user resources, including
those allocated by the driver for the TEE on behalf of the user.
The release() callback is invoked only when all resources, such as
tee_shm, are released and there are no references to the tee_context.

When a user closes the device file, the driver should notify the
TEE to release any resources it may hold and drop the context
references. To achieve this, a close_context() callback is
introduced to initiate resource release in the TEE driver when
the device file is closed.

Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
tee_device_get functions to tee_core.h to make them accessible
outside the TEE subsystem.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index e47a68d337b4..a2b365bcee51 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -80,6 +80,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -97,11 +98,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
 	kref_put(&ctx->refcount, teedev_ctx_release);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_put);
 
 void teedev_close_context(struct tee_context *ctx)
 {
 	struct tee_device *teedev = ctx->teedev;
 
+	if (teedev->desc->ops->close_context)
+		teedev->desc->ops->close_context(ctx);
+
 	teedev_ctx_put(ctx);
 	tee_device_put(teedev);
 }
@@ -1038,6 +1043,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1050,6 +1056,7 @@ bool tee_device_get(struct tee_device *teedev)
 	mutex_unlock(&teedev->mutex);
 	return true;
 }
+EXPORT_SYMBOL_GPL(tee_device_get);
 
 /**
  * tee_device_unregister() - Removes a TEE device
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 9bc50605227c..d3f40a03de36 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -14,12 +14,6 @@
 
 int tee_shm_get_fd(struct tee_shm *shm);
 
-bool tee_device_get(struct tee_device *teedev);
-void tee_device_put(struct tee_device *teedev);
-
-void teedev_ctx_get(struct tee_context *ctx);
-void teedev_ctx_put(struct tee_context *ctx);
-
 struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index a38494d6b5f4..284ca6b3e03a 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -65,8 +65,9 @@ struct tee_device {
 /**
  * struct tee_driver_ops - driver operations vtable
  * @get_version:	returns version of driver
- * @open:		called when the device file is opened
- * @release:		release this open file
+ * @open:		called for a context when the device file is opened
+ * @close_context:	called when the device file is closed
+ * @release:		called to release the context
  * @open_session:	open a new session
  * @close_session:	close a session
  * @system_session:	declare session as a system session
@@ -76,11 +77,17 @@ struct tee_device {
  * @supp_send:		called for supplicant to send a response
  * @shm_register:	register shared memory buffer in TEE
  * @shm_unregister:	unregister shared memory buffer in TEE
+ *
+ * The context given to @open might last longer than the device file if it is
+ * tied to other resources in the TEE driver. @close_context is called when the
+ * client closes the device file, even if there are existing references to the
+ * context. The TEE driver can use @close_context to start cleaning up.
  */
 struct tee_driver_ops {
 	void (*get_version)(struct tee_device *teedev,
 			    struct tee_ioctl_version_data *vers);
 	int (*open)(struct tee_context *ctx);
+	void (*close_context)(struct tee_context *ctx);
 	void (*release)(struct tee_context *ctx);
 	int (*open_session)(struct tee_context *ctx,
 			    struct tee_ioctl_open_session_arg *arg,
@@ -154,6 +161,24 @@ int tee_device_register(struct tee_device *teedev);
  */
 void tee_device_unregister(struct tee_device *teedev);
 
+/**
+ * tee_device_get() - Increment the user count for a tee_device
+ * @teedev: Pointer to the tee_device
+ *
+ * If tee_device_unregister() has been called and the final user of @teedev
+ * has already released the device, this function will fail to prevent new users
+ * from accessing the device during the unregistration process.
+ *
+ * Returns: true if @teedev remains valid, otherwise false
+ */
+bool tee_device_get(struct tee_device *teedev);
+
+/**
+ * tee_device_put() - Decrease the user count for a tee_device
+ * @teedev: pointer to the tee_device
+ */
+void tee_device_put(struct tee_device *teedev);
+
 /**
  * tee_device_set_dev_groups() - Set device attribute groups
  * @teedev:	Device to register
@@ -315,4 +340,25 @@ struct tee_context *teedev_open(struct tee_device *teedev);
  */
 void teedev_close_context(struct tee_context *ctx);
 
+/**
+ * teedev_ctx_get() - Increment the reference count of a context
+ * @ctx: Pointer to the context
+ *
+ * This function increases the refcount of the context, which is tied to
+ * resources shared by the same tee_device. During the unregistration process,
+ * the context may remain valid even after tee_device_unregister() has returned.
+ *
+ * Users should ensure that the context's refcount is properly decreased before
+ * calling tee_device_put(), typically within the context's release() function.
+ * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
+ * and release them simultaneously (see shm_alloc_helper()).
+ */
+void teedev_ctx_get(struct tee_context *ctx);
+
+/**
+ * teedev_ctx_put() - Decrease reference count on a context
+ * @ctx: pointer to the context
+ */
+void teedev_ctx_put(struct tee_context *ctx);
+
 #endif /*__TEE_CORE_H*/

-- 
2.34.1

