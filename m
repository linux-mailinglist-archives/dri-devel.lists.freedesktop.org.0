Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42CAA0273
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF05910E2D0;
	Tue, 29 Apr 2025 06:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxBOyeiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0852D10E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq9Yr011902
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pw0rd5bbftIaO3W4VpK12WfhwQcOHW8+t1g2YsM9EwI=; b=FxBOyeiA9/nLs5A8
 yxpP4lKiNAIbsQKPD1FvfO68PIZINmxdZgmscriQC7jzsVcTK8HAdzniE6y2ARiK
 IusueYOXYq1AdhWakDgyIx+MpYtaX6KiVIEz8zDKHUcjoe57uuVLU1C2WxblVhWK
 wpi0uYRBo3xyHkoNi0XuhlfRpSdVyywSrQstxmY4TINdiQLhNznryq85/gtyQ/rM
 WDrJ/FX45CrvfpkjSwc/jrgoa37ZdlmoqrEEuDMkaNKrf8Z/QLBegB5eFy9NnAtK
 YSl022n77RVgOr5MoERH7t3StTnz9u45ziap4uRsiBQPf/4lOUGaoaDcJ3VTHS32
 Ket7pg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323csq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-af5310c1ac1so3189286a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906833; x=1746511633;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pw0rd5bbftIaO3W4VpK12WfhwQcOHW8+t1g2YsM9EwI=;
 b=U5/mXLdoslIhoA3mvbzhLrzLRiCU8itqFSMAjpI7VUiZZ/vLjSuftpNYPo2dp9ppMy
 TWUUxTe/V4rx/er5xJclSTYekgOGx7uDEjGwaDO73EU/GdG2w6F+HmizXrPqzF5cdfgp
 3HYWldHSBcraRhlQhZoKpFLs/RHIehrF43Kf8rtaZXiD+tARuj9wS4+qh8KjoQ5x5gfy
 18XmExujRkcJI+36uStRD4xOznAo3/NGOB3DuYpK/OCTMKrkd2/7tEFNHeunVy7sPVGF
 kYCMNIUyvA5bTR5XP0/OkzXJGzz/pQl3c0Ve5XRP52DAhr2O9p08USpxi8iKt6WysNB8
 N51w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMcNgR82+j5jkj9pDw7D0BtUolJ/Ax9j6O7gl5ScqYRvdww+ic3PGluIvfTBQFCVCdnzzt1VV5Hc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlOotknvvLvbZTBLbmDoM3TmozdKwmkVkmsLcFeioJdsACkncE
 wJIwRCyvBps+DpnD66R31ZtdA60TG9e9kYeHjVQ7JAQ3OamdhrEcY0He57l6eaQ6dTiJGtpVWW7
 IqrL0kcpUzajz48Q+ssr9eu3780AYdlmGolST/KR5EYnElDitTIUXVL3Rdaln1+rP7A==
X-Gm-Gg: ASbGncujf4gg4eaDCpIlIvcIf0wTYXHrGsbFcqITCWoRPBoQBjfl5zdsBxRigWUjQTh
 arNAGHL37PIurwibAe2NNsg5+8X5FdXgTjvMEkLd4PVXgDeHZYVmPSJwig+ATEkFQWIkmaOUy3o
 Z2kNX3iimxbR6oFxnSKbHsbFeSjHy0SRygdYEiaCVBO7c00QUTRigUebL1PDd8UVeE89A6llCbb
 cmUcI8HxaixXoho44+IvpLSZcXVrhqcQr2loNJye/Y2HkWfDYQkNXb02pl/x5TL7YNVXtSVFK1n
 ZeLjgN5G0iKA7plHxuStDKpBFxYOOgsb7zHqJkGnTsUfTHn1S/bMrPwTw7mo3SWp0AamVyQ=
X-Received: by 2002:a05:6a20:43a1:b0:1f3:40a9:2c36 with SMTP id
 adf61e73a8af0-209561ed550mr2627429637.10.1745906833301; 
 Mon, 28 Apr 2025 23:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHdv2z3Dz3XdkSIvWGqI4vBe4abfk4+xgF4r2Y6iDadu24W/3/ymgSO5Ode7BHoDl3Xv8RUQ==
X-Received: by 2002:a05:6a20:43a1:b0:1f3:40a9:2c36 with SMTP id
 adf61e73a8af0-209561ed550mr2627395637.10.1745906832886; 
 Mon, 28 Apr 2025 23:07:12 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:07:12 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:32 -0700
Subject: [PATCH v4 11/11] Documentation: tee: Add Qualcomm TEE driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-11-6a143640a6cb@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=68106c92 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=4VYrYejmMApVX9KxlZkA:9
 a=QEXdDO2ut3YA:10 a=M0EVDjxxv-UA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 7B3aYKBCDPnZhQfyFqH_bqMyndDD0ok5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX0sMkM3nAv4/7
 D+BJTX78XsTk45KZ5pbyBF+7rHMlHxe8YDubgNPQ1mcc1eWVHDkV6SU6mpGuoohiFZN4WlxKgYP
 YPf7knhRcd0a+/knF9FEHIOoQzNFwsRLoK5aP79Uxbz9dCfw4eByAjmdP3EUcPM7X46uKskNSaq
 MbzOGF8OM3bfAUT1bieABCIGg+hB8ql9FEp0Zim7s5PxUtPACnOFBrOHcBKY8y8OuoGl2FeOUwK
 Tk+NNeZ+YmSDBKS7Jd52OrLu1nDS4Q51Dm5iNEzdyxeVeSw0op4nTPtFl/yqQk+6q8IWS6P8MY9
 YnY/NG7FDwCSlA4dC53F/GnPjj2Ohfx2GE7vreujOxBXs0OoHnWkYBkjDfbDOc4JKpzUI8rLLc6
 2Q/A2xA0dQAiThqqcsn/OQ2hbmL/GOO3/i8E6ML1tjuPr1dbx7WelcijLNruaahiE0NLCYRE
X-Proofpoint-ORIG-GUID: 7B3aYKBCDPnZhQfyFqH_bqMyndDD0ok5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044
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
 Documentation/tee/index.rst |   1 +
 Documentation/tee/qtee.rst  | 150 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 3 files changed, 152 insertions(+)

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
index 000000000000..8ae4da17c3a7
--- /dev/null
+++ b/Documentation/tee/qtee.rst
@@ -0,0 +1,150 @@
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
+Manager (SCM) [3] used internally by the driver [4].
+
+In a QTEE-based system, services are represented as objects with a series of
+operations that can be called to produce results, including other objects.
+
+When an object is hosted within QTEE, executing its operations is referred
+to as direct invocation. QTEE can invoke objects hosted in the kernel or
+userspace using a method known as callback requests.
+
+The SCM provides two functions for direct invocation and callback request:
+
+- QCOM_SCM_SMCINVOKE_INVOKE for direct invocation. It can return either
+  a result or a callback request.
+- QCOM_SCM_SMCINVOKE_CB_RSP submits a response for a previous callback request.
+
+The QTEE Transport Message [5] is stacked on top of the SCM driver functions.
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
+The QTEE driver provides the qcomtee_object, which represents an object within
+both QTEE and the kernel. To access any service in QTEE, a client needs to
+invoke an instance of this object. Any structure intended to represent a service
+for export to QTEE should include an instance of qcomtee_object::
+
+	struct driver_service {
+		struct qcomtee_object object;
+		...
+	};
+
+	#define to_driver_service_object(o) container_of((o), struct driver_service, object)
+
+	static int driver_service_dispatch(struct qcomtee_object *object, u32 op,
+					   struct qcomtee_arg *args)
+	{
+		struct driver_service *so = to_driver_service_object(object);
+
+		switch(op) {
+		case OBJECT_OP1:
+			...
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	static void driver_service_object_release(struct si_object *object)
+	{
+		struct driver_service *so = to_driver_service_object(object);
+		kfree(so);
+	}
+
+	struct si_object_operations driver_service_ops = {
+		.release = driver_service_object_release;
+		.dispatch = driver_service_dispatch;
+	};
+
+	void service_init(void)
+	{
+		struct driver_service *so = kzalloc(sizeof(*so), GFP_KERNEL);
+
+		/* Initialize so->object as a callback object. */
+		qcomtee_object_user_init(&so->object, QCOMTEE_OBJECT_TYPE_CB_OBJECT,
+					 &driver_service_ops, "driver_service_object");
+
+		/* Invoke a QTEE object and pass/register 'so->object' with QTEE. */
+		...
+	}
+	module_init(service_init);
+
+The QTEE driver utilizes qcomtee_object to encapsulate userspace objects. When
+a callback request is made, it translates into calling the dispatch operation.
+For userspace objects, this is converted into requests accessible to callback
+servers and available through generic TEE API IOCTLs.
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
+      \/       /\      ||                                   | TEE Internal |
+   +-------+   ||      ||                                   | API          |
+   | TEE   |   ||      ||   +--------+--------+             +--------------+
+   | Client|   ||      ||   | TEE    | QTEE   |             | QTEE         |
+   | API   |   \/      \/   | subsys | driver |             | Trusted OS   |
+   +-------+----------------+----+-------+----+-------------+--------------+
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
+[4] drivers/tee/qcomtee/qcom_scm.c
+
+[5] drivers/tee/qcomtee/qcomtee_msg.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 88a9ad34bcf6..79259219d292 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20261,6 +20261,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 F:	include/linux/firmware/qcom/qcom_tee.h
 

-- 
2.34.1

