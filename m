Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7007DAA0265
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6144210E297;
	Tue, 29 Apr 2025 06:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQAwOahF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB0510E2BC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:06:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq1Au003100
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dnQ9ZvYmV3x3P6q8kxc8hFtmLDbG/Ebqq3P0pryF11M=; b=dQAwOahFBkP6mJIx
 cPHWb7aG6pA+zzilINQNCxYb7bSH46qPC+02Fj7txiHB2cdi+6aEdEY0rA9Qc91L
 ROtrefsQ70nm/R8tijnTYBSq5hPSr1Qn3SO62dOpGQAQMELcEeUApSj/hiibh1Xw
 xJ7ehz7puGgpostzR6SbSsUIgEFfmccBJamwVlphv4x2qdV0SxGqLAm5AswR6TPz
 ljKWO0kMXXeRId717WS4wbiCKYiDW/G6qK5yb5s6lrPA7IWofDZUkmCc0NwgAXd5
 ohTEpV0mqdVzML7Rw57/7Antq/qUh3rqLhqQR+6Z5TOYaMnsCwYVzbfO5thqGh/l
 n1b7UA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbadcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:06:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-73c205898aaso3895318b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906818; x=1746511618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dnQ9ZvYmV3x3P6q8kxc8hFtmLDbG/Ebqq3P0pryF11M=;
 b=PShDt2urOeET0kakkjYZJ8tvXOe5yLRKUlYJvyye1B461QMo1nqnV4zMhrTHSf5tbN
 2yQnFTyJ7H6nz3Me3tPGnU1OTeAR4BQG2EH05PZPeiUclN30EMvt8FU4oM1XmQBcR7Zm
 oy9hPfua8J1Nv3X4kMiIUkvnoDN3I13iossJGpBK8sE4JNC7nlDi1TikC9XWF1IMCKdv
 QyJfUbt5F/0WZSMMVR+QYkh9dJe/m47mA+CbURneEMqB2gaX1g6OEbsMO4QOTugYaXRq
 C7fR2IZGvecQWHygBLN2DD7Suz2qtgieU/aoul3swywOu8Z19mNQHrV7LnkZ9P4v0CH2
 KExw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAOAnS+ksZOkRzwt5GWX1T7dfJvm55wpdeEGCDo3/ReXam0q3I8v1fi3e33VJi0UPlr1sGPEM0lIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg1tfBKhjN0414eZ/NMsJ8Fyni/LDSvkRIYZW9CpEMKefR4jeb
 hSw7ig2TzfQ0mW+L5+/rCHrURxnq7u+9gc7bwKhRW4hQXNw+5DQrrU1pibwrD5zNpANexdrBtZT
 X5S2kfXpnSLtw2n+UzZvDsyhTaMPypzcwQ2SCV+aR8H1O3yYpYnOBpZbBXtUilLv2zA==
X-Gm-Gg: ASbGncus+4zgh2qFXkO6y4IgvOQHY9QE+XjIb4rz7I87p1jl0bc7V7BuggZ985GRlKF
 jGcv53DNdNQPTTFTj1mA09AKXMODpVzSz/WhNVYrUoT76f4BuGYEYpU+qUcocf/s7FvqhPrPlhw
 Fy6l0OA7bHkdU2GPRbkNouuPBkz4QcFMTNi9xitNhu4OPKzKunHgMEKXMfK8f4VHlRjWI5TPGiX
 aWc/AutjefxoSxqIHbcEp93akolLoYLXOhxX5xRKrrhFwxYC8GlAGzxWnz7Rg/drRezJ7nIDDHO
 x2+EKV+QULmc92L9NFp9B8dpkftVeWnGpr4yirzS+eRnCnf5jbxOZTEVPCkQduROcTucjMg=
X-Received: by 2002:a05:6a21:3e05:b0:1ee:e96a:d9ed with SMTP id
 adf61e73a8af0-2095b1f5f89mr2175858637.7.1745906818204; 
 Mon, 28 Apr 2025 23:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHulkgSXpMufhY1kolwNeYf5vPD6BLjF1B7cv5zN7UHcdV02UCghJAy548hFwhdTnMqNVbqg==
X-Received: by 2002:a05:6a21:3e05:b0:1ee:e96a:d9ed with SMTP id
 adf61e73a8af0-2095b1f5f89mr2175831637.7.1745906817824; 
 Mon, 28 Apr 2025 23:06:57 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:06:57 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:23 -0700
Subject: [PATCH v4 02/11] tee: add close_context to TEE driver operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-2-6a143640a6cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NSBTYWx0ZWRfX15vg9Dl4IdZf
 MOJfSzjqBW2VhTGVg+TJ1yhmIZibxRCBGPytJwnm6RY0QU/ox4LSUE8N9k/dDm61if962/Km1ct
 H8ssB9lb14yxlfD3Hl4m/8qYfRt1VN4yXG7Jz7I3ZHz9ihlx7sS6IK7NsXCiEftZrCFt4hDpmvr
 pMOaDNv1wCGl9guTJV1jtajs3RPkY09Vt5y6b4YuR/QmxGGh5EeOojTK90HV3Wn72NLIBGTmywP
 X8RZtzf1hnFicJzmdi1daAOJxwP7UO9qo8QfQrdY57RaaLMy561j0V3gKGULZAhRR7CTR5tVZqL
 nBCeInVMZQy6CLdHA8APCnsCWygedpOt2oarti1hktnRDgg39Vm0jCWYCTFUDELgKXdEdiKePMp
 jkdPTxv1M/2rFlQ02CqNgq2DKigvi739rjiPPXH7p397ECJWE2HKOmT6QYnPPVq7V14NtRuq
X-Proofpoint-GUID: xg1Wzn_DTQoOjtQ7VWUXvaLiwuMAvGae
X-Proofpoint-ORIG-GUID: xg1Wzn_DTQoOjtQ7VWUXvaLiwuMAvGae
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=68106c83 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290045
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

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 24edce4cdbaa..721522fe5c63 100644
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
@@ -1037,6 +1042,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1049,6 +1055,7 @@ bool tee_device_get(struct tee_device *teedev)
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

