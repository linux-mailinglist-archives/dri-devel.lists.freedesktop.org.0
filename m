Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D8B3F3EF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776BF10E585;
	Tue,  2 Sep 2025 04:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx4vpK2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A13810E57F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:56:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SO0A025567
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 04:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4C5VhC/4pFCnYsmQJ5EmNbV8HXu0TRSksgnPURzlR3I=; b=Tx4vpK2WBWhiCtNY
 sm8/FoCB0SlXn37FORfYCgOjeQemeJ+LUOOETXQnEpU3iT1gg48+xYQYmiqqEDjH
 YlLvUrEakatZJT2NVCkbY8cC1x0OY4F28Xd89XznVUJb6yGUmoebgKRG9OMfZASS
 cVB+1BG8wKyNAk8rId4bZlpUCSiZ0jW0y2HCxJgJ9tJ1cQt1nh5nlA/6noek+//f
 3lr9VfvgN2Ogih1uKI0Y40B0KWdbBNOm6OTbb+JmIJnk+7IdDbq4f7ICQkKJiXV4
 7hOBQeX0qItaRIg7VEu2hEnVwuUVNMUcXIz1lrWg3kACSeXjqt3ZCYTboFHAW90v
 G5CdVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxjv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:56:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24a9cc916baso19034335ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 21:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756788989; x=1757393789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4C5VhC/4pFCnYsmQJ5EmNbV8HXu0TRSksgnPURzlR3I=;
 b=GnilQnAPApj14k6XmUFbBrBPck5tunSsCeUCsOIFW2+Szigza/7U5mO2b1Pjv14mOU
 ImfV2hULwFqZJwSI+Il0wMjvkX8Tza1HBIpGliQMYVKWnIWve32Efdo5ThlbuYC3geKF
 2I2+i/bXxyJkukYdRUg80gn3XQsf/GJ8hfuQ9JJuGPjtUCTAlX1XSCk3mnXplTgKrFON
 3Mai0LKywyu84I+zwkTLFXOq0jgWmJI/p+exumvkAREgdj4oFtO3copAbpxJeqkeJINv
 qMjdOBr/C/nS1dzX8m32QLaYNjA6TYYQ7aT1i+Bt8VYp16dRU2koDfOggKaD7YQUZxJx
 oSTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjy95wlWM3ZfN3k3o0tdfWS+grOw26jnfpJth1y2Jo3BSFnQh/O6FjwEQd96eT3r47gbAT/EgekKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxChEdZKkT/SxJkBxtke4KphWmoTzWMuVrxIGcmJZtEOsIhYKJM
 LTmCRvx7lb0rWk5gh/+oJBNukj/tYx7vIdNEDTTZk0YJraacVAnju0y1AitpOmh93OQkA482EYu
 /L5GLWg1/2P05KhzwIXdnOfHuW/Y5UP/uoEbEhkYylMvGmkUR+1Pi83VdY6LnwNVba2xbqw==
X-Gm-Gg: ASbGncvovsrZjdLBGsrt4WusZl0580fF8tnCX5btRRxuyti9rqmBF/EhvceuRM6hl90
 JCF/hUph1d+ReX9IzOeg02Og8J8lV1pyj6JUVNVMsndwvz4kUIY48pXNv/kI6NnShxXxpRiPxpM
 FBWukbA79ye5JqUYsRFcOduIjmpYraF/C/1Wt0dpZAyHvFsvngcDKLMFmbPvmeBcI+CY/j13WNx
 5ECqNAwoCtM527XduJyvSsR7twVDUJ14Uwcx34fLbOZTTmFRmEHWM4ZmwiyNGxydETnys+ODnaw
 oDmvO0uLbIbxX0giHPSWmLLwqVM/8Ay0fClRBqAU7ykLgHN/dnraJai69yekRpd9h62Gm5Mlhnc
 xPdTdX0T96Bi/MpaHp9tzZpI=
X-Received: by 2002:a17:902:d502:b0:246:fdf7:2c71 with SMTP id
 d9443c01a7336-24944af12e2mr132951155ad.47.1756788988610; 
 Mon, 01 Sep 2025 21:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7F0eEjJmAaiuShpIkxQfExITaVHfEaEVCThMdzzbDlLzUzKrz3dCFXLdIOBLWZwLgt+OxrA==
X-Received: by 2002:a17:902:d502:b0:246:fdf7:2c71 with SMTP id
 d9443c01a7336-24944af12e2mr132950855ad.47.1756788988089; 
 Mon, 01 Sep 2025 21:56:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:56:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:58 -0700
Subject: [PATCH v9 11/11] Documentation: tee: Add Qualcomm TEE driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-11-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXyoO0BU5Et7ml
 57tA3fSdySR9b1wk62OzMo2jy7BbphVPdREx3jNSOQ0PXYDmKwP3GWmSa0kp5AZvkR5n+pN7sgs
 vVGx9RSeIb61N2jyQVgs6+YsYXQrRDEA/lfwNnfg1OAlCCfLZeBLVsRLFG5RtHD/3CEn0vdQgHS
 ZwtM2Ms0pQfhL8wdth1ZvCEwQC+GBkMFjlc0TGxcBo0W1ZCnSLKUXQinqJhN6gXJHe80KKPEvLs
 wmfxnKIYW0uW5WgjMjS60L6+Hilx5y77LUdoW7gKn7e0ekrw+UC0JcD/ZIB+7VNW8Pez5WV6C8J
 yMYDA6f4mxQ54e1Q7Nkxh4oMM76i56EyQpUHvR9rsUugLFBfxU1NFYjnQ3QFoATo51KoWuBv3gT
 rnbwgdEW
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b678fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: bGXvtjuv4GqQXIIouXfI2Dv03v1Of3rO
X-Proofpoint-GUID: bGXvtjuv4GqQXIIouXfI2Dv03v1Of3rO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

Add documentation for the Qualcomm TEE driver.

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 Documentation/tee/index.rst |  1 +
 Documentation/tee/qtee.rst  | 96 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  1 +
 3 files changed, 98 insertions(+)

diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
index 4be6e69d7837..62afb7ee9b52 100644
--- a/Documentation/tee/index.rst
+++ b/Documentation/tee/index.rst
@@ -11,6 +11,7 @@ TEE Subsystem
    op-tee
    amd-tee
    ts-tee
+   qtee
 
 .. only::  subproject and html
 
diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
new file mode 100644
index 000000000000..2fa2c1bf6384
--- /dev/null
+++ b/Documentation/tee/qtee.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+QTEE (Qualcomm Trusted Execution Environment)
+=============================================
+
+The QTEE driver handles communication with Qualcomm TEE [1].
+
+The lowest level of communication with QTEE builds on the ARM SMC Calling
+Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
+Manager (SCM) [3] used internally by the driver.
+
+In a QTEE-based system, services are represented as objects with a series of
+operations that can be called to produce results, including other objects.
+
+When an object is hosted within QTEE, executing its operations is referred
+to as "direct invocation". QTEE can also invoke objects hosted in the non-secure
+world using a method known as "callback request".
+
+The SCM provides two functions to support direct invocation and callback requests:
+
+- QCOM_SCM_SMCINVOKE_INVOKE: Used for direct invocation. It can return either
+  a result or initiate a callback request.
+- QCOM_SCM_SMCINVOKE_CB_RSP: Used to submit a response to a callback request
+  triggered by a previous direct invocation.
+
+The QTEE Transport Message [4] is stacked on top of the SCM driver functions.
+
+A message consists of two buffers shared with QTEE: inbound and outbound
+buffers. The inbound buffer is used for direct invocation, and the outbound
+buffer is used to make callback requests. This picture shows the contents of
+a QTEE transport message::
+
+                                      +---------------------+
+                                      |                     v
+    +-----------------+-------+-------+------+--------------------------+
+    | qcomtee_msg_    |object | buffer       |                          |
+    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
+    +-----------------+-------+--------------+--------------------------+
+    <---- header -----><---- arguments ------><- in/out buffer payload ->
+
+                                      +-----------+
+                                      |           v
+    +-----------------+-------+-------+------+----------------------+
+    | qcomtee_msg_    |object | buffer       |                      |
+    |  callback       |  id   | offset, size |                      | (outbound buffer)
+    +-----------------+-------+--------------+----------------------+
+
+Each buffer is started with a header and array of arguments.
+
+QTEE Transport Message supports four types of arguments:
+
+- Input Object (IO) is an object parameter to the current invocation
+  or callback request.
+- Output Object (OO) is an object parameter from the current invocation
+  or callback request.
+- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
+  to store parameter to the current invocation or callback request.
+- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
+  to store parameter from the current invocation or callback request.
+
+Picture of the relationship between the different components in the QTEE
+architecture::
+
+         User space               Kernel                     Secure world
+         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
+   +--------+   +----------+                                +--------------+
+   | Client |   |callback  |                                | Trusted      |
+   +--------+   |server    |                                | Application  |
+      /\        +----------+                                +--------------+
+      ||  +----------+ /\                                          /\
+      ||  |callback  | ||                                          ||
+      ||  |server    | ||                                          \/
+      ||  +----------+ ||                                   +--------------+
+      ||       /\      ||                                   | TEE Internal |
+      ||       ||      ||                                   | API          |
+      \/       \/      \/   +--------+--------+             +--------------+
+   +---------------------+  | TEE    | QTEE   |             | QTEE         |
+   |   libqcomtee [5]    |  | subsys | driver |             | Trusted OS   |
+   +-------+-------------+--+----+-------+----+-------------+--------------+
+   |      Generic TEE API        |       |   QTEE MSG                      |
+   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
+   +-----------------------------+       +---------------------------------+
+
+References
+==========
+
+[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
+
+[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
+
+[3] drivers/firmware/qcom/qcom_scm.c
+
+[4] drivers/tee/qcomtee/qcomtee_msg.h
+
+[5] https://github.com/quic/quic-teec
diff --git a/MAINTAINERS b/MAINTAINERS
index 5086db700aeb..bac9436f65c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20984,6 +20984,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1

