Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798BFB033DD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 02:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE67910E1CC;
	Mon, 14 Jul 2025 00:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx3SdW3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164D10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMq6DB017291
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ytumVm0CoQT2UiSI9m4EbOedIWBaTexPn7wx5CCAvew=; b=Hx3SdW3jIaJ2J6kn
 qs34+ISXzB3q/nhpt/OvBf9CeFhOdrG2AZUhj3X8IoS0GfUUlyUMahWMRQrX+sou
 hIeoJidq+je9jw0pm6kQOk7ZFcIJc/Pu6ZZf9qcHDtOTvYPDnX0hhZdJgOl3GMzf
 VX08q7RaIU/r3t1MkjjYeal6yc+Q1FxW9UyAjNGQDIszdAbEo3Nq3kn25L5fSVd1
 i66kzfI5GADoeLojAyGk/x5EB5plrIvxoC73rWwidbVSMcoYbwdvs7zEkGFtKhw8
 OV4OtQmkP2lJ85t/w+Z8A0R4NVeHbWoHhzGf3lHjdlNuSZVH2qmtz1cYPur9nhHt
 2xGUZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a1b5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-313d6d671ffso3371115a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 17:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752454239; x=1753059039;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytumVm0CoQT2UiSI9m4EbOedIWBaTexPn7wx5CCAvew=;
 b=Pt2X6PmLjiSaTLJjpP8e6NkT3aTcnPRCgM7vMAryrTyzRuxcphENIMwFlXRk5487Ok
 5CGsto0aSQlvnq8NiWYtTJ9Pi6Q5FKzR/vvj2KMNbi+19mroA/1CNq3xSHnb2PILchR5
 tVB+wpAbIaujzxIBYICaKBwis2HLPhj3uU+zIohnRpqoMEZC0Ir6hYKDPbVYdXyCe63I
 ivdyfbvmi4GtIZrPMovJbm+fkEUs7ILt8X1kSO+K9v6tGIBpdY/Bi6jeYz/QOqDG2fuO
 aSdOzdapiF1MYsNe1XWBviyV8jjqmz/mr6pkxDGn0xWJen7/mXhLT1/qaAjSBvplE5rc
 8AhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWagJi+5BMH3wYy7fcVPOwYJcuwfAv2D5kd60iOWgZO50AHx6Je10yFefAoiJOx96pzxpUDdTwCLzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQfxilaxR4HstTboBq9zcWj8LhLu/8bRdAq8fZMns6DZRZnv/y
 bg3Q2NzoTla+F2LLGYG025UV7hymyofvjddINM4Hp0Qv3M1V+7mB9nbKAiDm3BNjorXyL7dTPoc
 ZzugaOtOBSx7dprcV8XJCQXtzdgr05QRRt8abwgxbe32SETRdSsnx9KUQWoIuz7HhGywIYQ==
X-Gm-Gg: ASbGncvaL0Em/AhVE4WloE+PjAq5+6qQybu811b1PN4eBqmQ4STVr18LGN0tyhEn9Us
 h9ZCjLZ4XsMYRDVrZL9HGnNC5v8247DuKy+vROr1/+GBM8KY7oOsCRGLe4bRTFzRjTz5ubG912M
 W9AL+R08Sazyjh+yR9ApVcl2OK5rnSc+ZxWcD1Zqcgak0U03J7mVeOMqENZnBNMxaKGS80nQg9C
 h4xPRy82kb6lrULh4yjjLi3sruBGD2uN1MUt76jtYJGM4cybtSw61tvAwHiDg3cTLBsAiNUsaCa
 YVb7ZbH06FqSXBWPxQ3s9z7XJ0XYoOpsT712TMgUsagNn/wsSBtm8wu/9MLVgGEoOm8s0g7yPMl
 NUp/N6THMxwzF0SWQVko1v2I=
X-Received: by 2002:a17:90b:5804:b0:311:b005:93d4 with SMTP id
 98e67ed59e1d1-31c50e2c50dmr15386680a91.25.1752454239094; 
 Sun, 13 Jul 2025 17:50:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3jGL0eHjBRDOFcNGYXTZVoUK2+ayeWgQN5DlcGBALaaf5nl7YCP7GQ2hWPGEb1tdZhuWi8g==
X-Received: by 2002:a17:90b:5804:b0:311:b005:93d4 with SMTP id
 98e67ed59e1d1-31c50e2c50dmr15386649a91.25.1752454238650; 
 Sun, 13 Jul 2025 17:50:38 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 17:50:37 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:24 -0700
Subject: [PATCH v6 12/12] Documentation: tee: Add Qualcomm TEE driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-12-697fb7d41c36@oss.qualcomm.com>
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
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: RS3gJ2pQOos-MKj_S8w_IEyQbzYsTg6z
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=68745460 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: RS3gJ2pQOos-MKj_S8w_IEyQbzYsTg6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX7tbVcW322akT
 myuO04WNI+07vmGbX9c/7yyT/NLNiqS7uzYkYDy+qMYmeiFVo26ReZ7B5REITje1QJm/xttfDcT
 AO+ngvxCIrKVr5SS2Tt4Cfx/xY+BI0hxRmjodi7LvI63/W5h0CkP7LpFMe4TDtyb8YgzepNPDXD
 IJcwMBJGAfPNBDIgTg3Q6FLmzoRAPoOKLnrC6p/PIbbgdu3qWYS/EbTTXTWMlLyc6UU/IjJg8zt
 EgbOl3HOT8U9SvPCdbN4+ibhITIjtcszw1goK3oPtwf/ABWbwQNVZP8gbvRMBYRloWO5cDoe2HF
 pjf1YLYzIBB57bJE9be5GJ1Ilysx8xT9+RBdj09ffb8+mOzYxh8NPSO1329edGpLPe75D8POmAY
 UJLSXh7qBxv67tXPH82bavSciw3zf4yRig/xjVj56L+bFTiTLZIXMBkNlhcwRKgMMrZX9cUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140002
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
index 9fc58f48fa14..391fc6e6defc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20706,6 +20706,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1

