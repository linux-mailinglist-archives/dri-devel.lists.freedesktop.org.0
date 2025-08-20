Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6813EB2E8BE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 01:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C6110E80D;
	Wed, 20 Aug 2025 23:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUohvgVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9110E80D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGmQan005374
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=; b=UUohvgVAC6/xeBx0
 nF9dddAlvTdXBpQPclk9dzrpmCD2+oqqo+Uo67Zyci1m042Roh4vvXjEphIPRCnC
 xBo3E3WdSEXGrSAnumZwrMm7+emvHFW3xNMfV6j9JQcJPlqClFdBpK6OvPohHK6a
 p3BUYaTRLQoC2gkQ2+ZzKP9vU2idHGb5wDD72/7MemqPsjOb8OzD/jwQYWuGiFh5
 wwOFk6XMKScxpgWJGRiUlmOh5RG5DjuU8PQZW43DWCzfULV+1x3OfmTKIxNIRWoS
 71beTJTVz2hNxW8Zx3ixgME44f21ENFxquT8QZa/G8Z6mldeht3oAu7y+EM3sfGD
 8vrEAw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293a8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b47175d5a90so266422a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755733146; x=1756337946;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=;
 b=o67zmjkwsrmLPWL/P7vPjtuL0CIPGn/KbEVyF6ladHVqRrMw5h35I52K/08ERXIfIL
 PT9Mh8Opc8hHfVMWv3Sdu808vKI8SbiK0RDIq9mYo0V+Rh9sXfdUmOMbY986eJsEXmJ7
 eOXaTo8GS8TTqsdzuAcUHsTFECygKwz93Aw5TeL3PdF2sAKjgOyFNB88aYJ38l1a+DIP
 sFntOetgRUNnZ3kCc1UY7pN1ClNdbxjzZ+/wz9Izx8aTO50518iM//SMFxlva2TYpm8+
 /SKO+hO3MuqE9ULWeBiSLf0Q6uGvdZIINZzhWdOLNTIFtNTH46Y5oXflAsKmgTdalZWr
 8KEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMUiBzHVCsK0EOW3e7KpUow9AD8bmaD7D7cAK5nWRdVoZkbaOvYj3IxZojNLSWBtC2dmpmO3fYrXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA81KjbQ7ciTkkYBV0qd61vPv5adv8CwPySBUByL+WuWdujVjH
 t0w++UdiBWbw8LouTmdtGtCpDRKQu6HkYjptE/Pyu6krRScYCgcvpUZ4CPyCLb4YbE0iAeAfKJR
 Weh941DIu7fDLrIr7vfrKGqLFpLhbyTxIb9kIeFYYxH3jdVO6fc1iZTJX/S77RXQaRYV/MyN70f
 M4+0Ri
X-Gm-Gg: ASbGnctEpg5VH9WPswZv/uZnj7wnKFtpReLfa7ViNeNCjVzqkT5a8AAlT1QOVl5jJev
 VGzypQkuno/AZShKnRueYs2Qn2fifp9y/UFqBH1SuNdNrKdpkVSe4u4ebVTWYTN4hCfGIfql8SE
 BNIAYjjsMUYDjKhzdeNOv3oUm318eUxZNbQieZZBR1EGDThDusQUMtqHoKypJdwCrpGwj50HfbY
 MJo3M8R7PRzyroAbruoFpkBG/AjqOwnePfMk3btMHok81UZHQQBu6JTLHCGx6MuDJERE5XnLNDw
 WW8qo55faORdvPePzG9ZgTmUKjhscrMlvI47eVu7Wqns4sk1sooFk91ooATUYzkzuvZXQmLSeZx
 HBWKclmyfDCVHfWGcqGVm+pA=
X-Received: by 2002:a05:6a20:3d88:b0:243:78a:827f with SMTP id
 adf61e73a8af0-24330b8dcbamr357842637.55.1755733146335; 
 Wed, 20 Aug 2025 16:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW+KaAV/nBrLnv/qlXOwf4dct+JxrcsmBBWHr84rfokHUyeJCKYtrKukW6uPfBBauTFRM8aw==
X-Received: by 2002:a05:6a20:3d88:b0:243:78a:827f with SMTP id
 adf61e73a8af0-24330b8dcbamr357794637.55.1755733145802; 
 Wed, 20 Aug 2025 16:39:05 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 16:39:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:49 -0700
Subject: [PATCH v8 02/11] tee: add close_context to TEE driver operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-2-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a65c9b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vW786Nh8dam5xaiWQhtq5BxZbQvu4bxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8c4ygDxDV6Yw
 JUHAqLO2zN/UD2Bkm+FxUB/y4hZuEUpK0unVxXce9vbik6jRZrtxh+0PpPImLVTT47qmRMGoUD3
 Mj1/wj1y9WMyJE2ZvQuWVw193OtHDPXcjoFSshT+3+Jt/C0DpZEBTr+gw9zWVjfYjfxKQoRkjer
 pWBEGB1E4e4Dtb8sDo8u8yQI/a2OxqzkdcuvLLOqoCgPN83EOrfhd7NbsQ2ZOgRWF3VDYKlDW/1
 44DhhF+q4vrMOT8nTXG/DnXdIgoEjU/aU09pWUVhhwH9NYb1rHWupV9KNYfhufXTzCyWCNqOqJR
 LWT1Y9hTwKt5C9FwMlrGFosMgTvrOw5juQFeE8C4fWi/cQJjAP5awKhILVz27DR3HhZB7EL1lRk
 zgaINVuCzjLXMZBslzXv3nujCkvSwg==
X-Proofpoint-GUID: vW786Nh8dam5xaiWQhtq5BxZbQvu4bxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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
index 33091aa21be0..0b4c65dc14cc 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -79,6 +79,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -96,11 +97,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
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
@@ -1001,6 +1006,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1013,6 +1019,7 @@ bool tee_device_get(struct tee_device *teedev)
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

