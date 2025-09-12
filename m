Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E464EB54171
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 06:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C01710E422;
	Fri, 12 Sep 2025 04:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="maeNwf1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E79410E41A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:08:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BISxCH002381
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=; b=maeNwf1F+KqV/B09
 GtrNuOj9VsKp8/indOeA/tp7PIqvqOgB0XvIZkZuKnJuhuNhhlGT5xrlUKumPPQl
 61EhqbLE+O1bLU9K5pnTBp6DbhJDAED/bC60gnvEziBinzmbIwRKKI5LU5XarMsK
 TUe7d4dFy3/E8mpnP2AalvLD6ydWhv8Us+JIynxCqLvio5Q2uDhWUpDA1bU1ClJZ
 28oAOHl+c+ZVszJ1NyyO7VGIyzBJ9en7iGiKecFwV+GucH90LBa9Q3KpVIgEM+xt
 2NYl8E8evrO2QsEN3BYZfSUHfBlghVFHIcJUKPHpRtq8SAind5kJTqIvteNzd4NN
 /KKN8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsjab9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:08:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32b51a481feso1395941a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 21:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757650086; x=1758254886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=;
 b=MMf93ILLJSBLGcvb/C1/8OocuxSUTIpCmgyf9877M8F+jQWo+yyVx2nhd0z8tVgfF/
 uTlpH6RrrfqSmNmYXX21SlcIbtIedXfYMQRcW7YuAAQvdHir7QceFqASNiRSZJu+8f9v
 vOGebcRD/FyvWCJeSwLenZJpL4JRdckgmAN2/TbPo1W9BxavCcqY9a4kSRY4o4ZQ5XCS
 qIw9cPkjZlqUGnD4o+cjDhsMVsCaLagBdjRJN8kZ0GXtOH95khlhQKeX2+61JWMJNcgw
 YxF465F8CxictqtVkM4pHVrOUmA2R2Kv++9Y6lpt5HjdzbrfORVnwHGiD8b9++J0ISPl
 UQOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIXnhdDVck2Abo/m2vvrYzVOhIf8q3IaP/hKBQ/W0L90SMrQtLaqwLWU3PrZKnL2LrrMP6cCCTTug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydGYIIOQoNKILuXriVPOFsFthY7AT+36toU/xv2cBFBNLvsRBK
 XzxXe1hLm8NtbCqf+GUVocqNX8Ujqncg2YPz/2i9tk98taSuc9bGtQuhz28jqyj/4QiTCZow0Ua
 GTM+KUb/mjDXiKG7ziL8b0vkrH0veeEBVb5ZSNY2iS0ExYCqmPdq0MW4l+2fS95Rfn8tdmQ==
X-Gm-Gg: ASbGncs0cdOuJM8/shX2HT64v6LFkYkZOh4lZV/HG8VI4+wwBKFckh+glnIkllZwUNi
 jAiOtPKy4TzU6OP6NkhKJqZqv2uZ+Ps1TSOIdZnZdpgNaBAK8VekbCy0geEFocN/zjqIFaajlmw
 sAOvPYtOVVPNJT92bcz/2aO8wIG6CuWYaYdK+EfCqfzRMTw42+tq5iw3oSDl6nKzRnATbM0LvZD
 3Rg/zGycTh5jJe4ZHOs3oGGUZr2tm4hyTt2awSO9DQYFJhFrlVbIRkkUW/DuHJRsy9uiY5TVwxV
 79Ek51xNCEePm9nFNQpwcKnATJK2ssvkYIA8ZPnScnSLCaIurUO0sq2mVXcd3jPj2K/Du82OPAr
 FwJNVwLy877F3por7AlIYwf0=
X-Received: by 2002:a17:90b:35c3:b0:325:25fb:9128 with SMTP id
 98e67ed59e1d1-32de4c33d52mr1818633a91.9.1757650085551; 
 Thu, 11 Sep 2025 21:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX1RaQl33ilIfwxao3aJgpnfFU7FLqmjTzLfuny6Mj/xGDe+7OnVCAMTCzx6nAXfuI73Atcg==
X-Received: by 2002:a17:90b:35c3:b0:325:25fb:9128 with SMTP id
 98e67ed59e1d1-32de4c33d52mr1818571a91.9.1757650085067; 
 Thu, 11 Sep 2025 21:08:05 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 21:08:04 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:50 -0700
Subject: [PATCH v12 11/11] Documentation: tee: Add Qualcomm TEE driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-11-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bD-oKwMkMs4Wa17emEo7u9jwOFUzTEQG
X-Proofpoint-GUID: bD-oKwMkMs4Wa17emEo7u9jwOFUzTEQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxbTo/2Vuxqjv
 ZLDqmP52pb2wwx8NRi5XYEGFIfOP1w7KHQxGJyn8RPY1amGF+PJNCnZP8b26N0YVBAqGqSQjf1V
 sQ+q0jkuysqLRdzyiC+o34cfeNFtHs6yLvqHUJVY3c9/8BK3ROsw8CC30SzFS+JQvQCj39aj2+1
 ZCZ3TT4Sj2Otx9o3iIyesIgUgawgfqqGm6WZCrChL5YHwnWKsPdyQ93ZiquRokpdu2MPBJ2zCU9
 7ZB7E6HFzsc5VK2H338AcVQmihklW5gOY52Wy8woaZn1SAkBVdW7BrNHJc22rtZ8EI4AamBM/H3
 2cu/eSPwbpNp7CFtNyNvbCxa90pn601ZsKOI8ewwRQO+usm1ZmLfYk7Uhv7WZWZiLZhMMBWD4qy
 vX1fEI+k
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c39ca6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

