Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432CFB52732
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 05:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FBD10EA19;
	Thu, 11 Sep 2025 03:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ3JPY7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C602010EA18
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ik2f006784
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=; b=KZ3JPY7dAs5KGUTq
 HFUFea0XTIvJXWVY1Q7H74X0N+OosjBE4pxWKXcpJEMGJobLna+RmCS+VAAMe3Re
 fJxsMZmoXjDwkVeQorNjFAFklvxhRt6n5xzyqM2TUE1XieTmRnI1zT0RaUuntbhG
 iQoj5Q6AzwCRT0kjJUq9atRUqT+/R2UTWwoM0vFgFcpEZYOYgU+OUATZthZw6zps
 xDEaOu4LmRnGtPsYhC+IJ9gTX/iUqzqh0hjIdncQ6jj/1s0j1q4MryROkmM68SFW
 aaJKpoZAH/CkoRL9AefPCL9pSBnSvervqrh+GgbqTfMQQOXrXxBMJuNb7EWEALkH
 ar9Tiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ae3fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24afab6d4a7so6043865ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757562103; x=1758166903;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=;
 b=XGCqsukH3RHEvJOFsT1LLlt/bgf/j3BIVUTpS9e3zlKcE7LI557MU2wt28EQGTV3nB
 JPj1qFc1wimaHxkZ/OdUjSiCVukFuTfLYa67Vcmm772giNWlrRC0t5B/y7yEuI4op207
 omyO4iSy3cSG1Zbemc/8VRSh6TJZJ2l/DwROmIH42YOUB8em0PukyUf1aFXswQtILiVJ
 arRFaUvTNKZo0+Q22glNtpy/OO14phmUDjt02PlucuZB8oPUczm77nLCg9jhP/lTdLU5
 qBk68v2pw2PmEjjksKATGkfS0F/eue8xELZIVXeojfH4fdruxjgtRUnNh48sgQg6lbW6
 a+WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY+h6SMtTXm40Bz53/H/Hg9PXqbbDDvW0II+nDf1Q4M49MEmsQE6xO2btQYgkhtiwkpusHW2NET0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznoqLI77moEfZdDuF5RAORnJxNkQ07CsxLS35I6dvD32t4KC24
 SnUlPzYhLIVVMbBwOcoNPH9X6iI/GTE8v4G3L5+kg2XjTi75s0WnngP2941M9UMG+dwEEYTX4vN
 ISsUgVBO64xxWmiM9Lak60ZcwapgtZM+2hDxBZos010H8Eypih4joMUt42Liu/F3pQ8bWyQ==
X-Gm-Gg: ASbGncu6586zvW7NsKI8zW1aojtiv6jY/7h+YfT35mTFvguyjOMYZcT8oBOGXZRYYxi
 bOw7evuM/G2itkmSYp99f24GS+57cREpAPl6YSNQuIFyRaG5BGE0IxAYTU6femWbfHPgRBLjoKv
 xWF5MY8+7t3ygi21ojbF7t+snVjmKr1YTZCBlKp1ykVZhvDpsQlljv3/2glFw/2boqwhdqsrO4y
 wrOjY7+HKLxtNFxwwYf2rtEHNbyUZerDIgvDewgyIaiFSx6VPBLn9iD6kuZKgbscJA++EkiQRI6
 +Eb2Iis44ZSTH2Yh3ohMSgXHLoHKhhw9ajt2pHieGdNbMhZegwwElHMbPa+O39rVxuCbITKXi9B
 +gdOHbNtNyRzqtBMcH7T1Q4Y=
X-Received: by 2002:a17:903:138a:b0:24c:9e2d:9a13 with SMTP id
 d9443c01a7336-25170772b3amr227810485ad.27.1757562103028; 
 Wed, 10 Sep 2025 20:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtd17Vhg+RzVHZGU8BB/FT8CYxosIKHklKDWfs0WsmhvNxis8G3SdePgjppVkj5JOpI57GYA==
X-Received: by 2002:a17:903:138a:b0:24c:9e2d:9a13 with SMTP id
 d9443c01a7336-25170772b3amr227810115ad.27.1757562102478; 
 Wed, 10 Sep 2025 20:41:42 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 20:41:41 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:24 -0700
Subject: [PATCH v11 11/11] Documentation: tee: Add Qualcomm TEE driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-11-520e867b3d74@oss.qualcomm.com>
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
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c244f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: RVxI5vbYIOG0voAS3YAAbpEFHHkiAhak
X-Proofpoint-ORIG-GUID: RVxI5vbYIOG0voAS3YAAbpEFHHkiAhak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXzSuLVe6i24Qb
 Cz8qnT1Ifmc1TYHvv+P4bEDJEHL3S6agMo76Raa4RTPDzjuDHkNFx+2k8SWkfSOHrQKBbqqspJp
 vTJ+FVqCCqHkB+nWMEZIJSTkIt/huMZQxEtZzWzI1jZ5aVaxI2fgduZCr7BNSmSSLEA4hxe79Gc
 XZejxOCBdE0BS5Rzvaj4kAJAMFc3/FNZ7IOhbHdlGqZf/l2nGx1zMBW4Z4nDL5BGUMGOxYJABJK
 bTHKxKDHokUEQCBnsWGc8lCb3Z2CXiOI7k7JcbU9N8WUlm/P3LihXrnIVv5q53sZnTR/6ZyNECS
 1uXqKZRCRVXqM+kPIErDCGInyL30jM4tLm5PM3mQ8JlyGCXFY7QteyUE1yMJV6csYCMGmuhCOnZ
 xA8HaVlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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
index bde449308736..589f8ea62bcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20860,6 +20860,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1

