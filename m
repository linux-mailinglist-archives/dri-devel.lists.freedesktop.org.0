Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC5AC48BF
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465710E435;
	Tue, 27 May 2025 06:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzA0Q4Mf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1B610E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:20 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4K3RW012741
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ygugRm4SsXMkb/d+FivUiOwn/n8fxWFcMiA6Lz8ODvY=; b=WzA0Q4MfOh83M+fD
 7oRXp45i0ixKCECLgsV34qTA/i9+n7Hzb5XL4oCQj6roNNE9jK7PswgsAxTwaUge
 OWXqZk28jxjeLFnkco7pAGfZoe4Y/3BUmx6IM+CkyK6HkPuDWM4fmttF9iQUb9hy
 Nqoywfe/j5+UM7C/ubbpT7aXTgIoBSn6kZcXwqCLhKSA5B/8lgJXFEW6j4acAyVJ
 cfCnL+PsRT5YEik6jArF0YPdQ0AkgSeLmIQBDNtFKGV/DvqsAEwKfd/J604uDU8e
 N+N2miyVyBg5r5n6eM0hmEEhZQft0tm3pPakovMwYruFRByuPTe421CiO4nVmHe+
 MRmu8A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w6918au1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b1fa2cad5c9so1739158a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 23:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748329039; x=1748933839;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygugRm4SsXMkb/d+FivUiOwn/n8fxWFcMiA6Lz8ODvY=;
 b=EFRNdcITfD4tjsXE7csdPJSfiXJJrc2iFxbCZXufaSUvwi09Ml37i0h6hCO85XCSdE
 dZQDJCuTH/lv+tstCEoly7Qh+rkpBzKlJkPZrsUczSn7dt0uoon+Zs7a/zNiO2FsI40K
 dIM/b7wLkjBbr7JJfwshdRhOa5uSW42e0IqQiP209aCXd4gNgtZcnFIPGcCMbobZSsqT
 PRPxjuskxfYScpi756gGpWPuvSr/q9rhRuofBLyUaZbnn9vNhz1kcc8jI4/bi9RNNUZX
 WcG2gT8MAjrCaCd3T4jVVX6vIHiwzy+hAAdZQsV/fEUgOdxPW0SA98Pdhgl7sSglEur2
 Kbsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd2OqhCdfwrvpswmAyGWEzVnrX7wPUKYVeVPJC55osMYV5eIyf0cOaDMZbljbQ99YIjONWvlrqZkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUFB8uAsIhd1iUtNpudrlg+R0/ES8mVIDHpMq8xt3iYEEKmB0+
 9+qBpWRCg0T7QgI2CoX3cRsy2L1IAhFMFUZf+7NG1SlRsbv1usQXB3EBEkI+c3YXIaUMklMgqIt
 a3qMtFDaBuwRbCyvSZZKoBXf3XaEQssg9oslB297pT5PdnWEmeAkD0IGcccE6wliApW9GgA==
X-Gm-Gg: ASbGnctwqLrLIMXs7ZPQTTxh7Y+6Zy4YYDJxdqw+Vbg9LPXOpjJNsmDlp39/eaUBuek
 Ts9UUc17w54iyQEoXmVLFZpjAzFwVFoq2+ntWof4dNcYgJnkP0WBhU3hfw4yR4ae1W/r8gb1zcQ
 a6ypNHAMYn8r3aauDS/kqbOuEx3lyb772iPYUHqqyUlKhC+V5IYTEuYa2Rbzh+7vMINGXgjinex
 6j9jX93vman2+TUrQNc636kcDYr5HHDQWeVPdTiImu/hQp/yflSQkc3fE8DokTj+QqLfDhnndi2
 eq6F3QKIN7npq5QBWuiaEaeRc2bAIQV90GaOqzRa/g6vUYt5wYINOPUhw4xWTCK/wpkm504=
X-Received: by 2002:a05:6a20:9d90:b0:215:db66:2a32 with SMTP id
 adf61e73a8af0-2188c34144cmr16951456637.33.1748329038790; 
 Mon, 26 May 2025 23:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXEN+b4LBU0sjDfJGjW0s5KtMVUe6w1X1BROAUzJDl+VzOFSY+j3GfW20682wQFapRYyItgQ==
X-Received: by 2002:a05:6a20:9d90:b0:215:db66:2a32 with SMTP id
 adf61e73a8af0-2188c34144cmr16951418637.33.1748329038363; 
 Mon, 26 May 2025 23:57:18 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 23:57:17 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:47 -0700
Subject: [PATCH v5 02/12] tee: add close_context to TEE driver operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-2-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6835624f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Kd_oBK1yoHD2-LA7YVtjyQj3UXLznmwI
X-Proofpoint-ORIG-GUID: Kd_oBK1yoHD2-LA7YVtjyQj3UXLznmwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX9gvG1LUpQpu2
 vnH2AXWG840M/qDNddSuuaXFWHa51/j93IS4kdSQUrVMl7HztjVxvALm/ru0BbMuKUNwxViBAmV
 /KLfsjw8Ek3DNs8LH6FOmixSbLUzaek7eCdDX6sbRuy7qITi7Ip14qfsF2wIlDn6kYmExepzHFu
 xlPONUq8resqm2+ZoHE+ob5qXR0H5dOHDKHoe25wITTs9t4SX96MHae6vIkuwTGIChKl2kiTE3d
 WYSE0AIU9hEun7ME5pamkJ2eXS06FF5kyFCxcJZlbttEFABZWsafDfUfqvXn4TnbWNjpMTB7MGz
 SRo1iEd6J3PlaQP+2dGELPotsaLlnVrLKG9vzLJIqfBnfamsTWkVb7ypTSB2xUm7PnJJaOUSOU+
 eq66mGFHjq1aSFmEg5ZNFewye3dE/wc1/OF+t8350kmCqMpVndGKrZ3c9K/vX6a2WwOfeWHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054
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
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 133447f25065..b9ea5a85278c 100644
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

