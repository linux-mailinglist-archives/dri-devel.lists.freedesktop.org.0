Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E1A74267
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE31E10E1C7;
	Fri, 28 Mar 2025 02:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/bR59N+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E14F10E1C7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S2CTTa023886
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3jfdOosGMEeOE6Hk8PNjDO
 DaD0RWq4EMjLn9sxnDjA0=; b=I/bR59N+i2svfPZfzOsS+vJgbDJTxI1uaZGXV2
 8MTY/bjgwQYghV+ujfKJVo1P4zcvRXQIWLUR8T5E+u9GqlTW6Av/lz9/NdaHRosa
 0Mb6TcOyNOGEzclIlzCs5sr9hhZYy7KPjJ0e2Eudrz0uAmXUME5+hhImcQXoqPi3
 +nP8A9mNJEEfGUwu2Wb/pB1V8siZX8TqaAzhRo8OvUcIlAeuoA795ojfmpU3Uhvh
 1lknfS75kEj9/kiCvSZna0Ew7P5RA5WrQywyYLf157nwbCrrV3aXiVc3AQmp2jSA
 B+EtXGrDZdORzVU5YdrySspBUAK1UcTu56a7UxXtpByeW+Ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45njsc02b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2242ce15cc3so33065425ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743130099; x=1743734899;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3jfdOosGMEeOE6Hk8PNjDODaD0RWq4EMjLn9sxnDjA0=;
 b=cihanU8iav7w0BgbZO42GPoK51nM49KB2N8kN4+2xvwNDztrf1zWTBg/dKC29+Iriy
 TcCHDaPGNY9eOwLT4bjyuvckoHpGF9btxLblcI3O1Im5Xr64TSi+vYIYJ2UzHFR6HRP0
 El7u1Vb5l6qJkE+F9aDDn8pc4AJzyzdpAnV3hXn2hDXqcCG9DWES5rE7ARdfWY/YkMwc
 sfy+mC/9yzwCMciIIxf3INdWWDp2PJyOKk0AKNPiniK3jaEcgei/N0VIzCI4W7Dc1mgw
 aglgM1CqcdGOZxErRn3+1cgDRRIbYj9wU4zJJMLDANIXn+0INHKMORQzlY0QvbVPXpae
 nrhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVae8HbgbpfkqolnKy9bcyKdTeH7ChoQ03fGpiNapsgQA3gBXyBeGeqsmBn/fUcWYIX68qIkQ0wCXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNiAFPYD5Z9woXd2ZVo44YFYpZniESgYLQBQCNzUsE8N/q0Vzs
 sPNfw85oWFp4CB+hSkvmAwPukKvEj5eAsyr0vj7xAfOvxiely4+yKbULUwxcmYA2gzcW+EDY0y3
 f5PjVc+JmgLrABQW50KwcvXoUAZfWCOOkc8gx1MkHbFx4kWAANLcfnzZnQgkw5N5QrA==
X-Gm-Gg: ASbGncuGg8D6oIH6rEwUbpA0AAX0kxigX+JvvWkOcN5IVmAacGwpWPWuqPItJ6rA+Jq
 Ev/m7RY99DnulrfuFPkBE/Pg3azyPLLHtsSh6nr5lTk7HOtq8PuCMUxO10ZDFvnMVbK+O+RpF8f
 CqOZZF7tgao31ISKxmmk+KzTAaAVs4Uzjzg8Kc9ccLF6ciz4BNuBqTgtm6l+NQHUU7Ar8W71Poq
 jRYbb02bIbBKk/3NmYDP43EYC13aeMhvXs/3aGndDSooStD37xGr9jhQKKS2b/24odgQpuRNFOb
 cxUJP/NXt5nq/7k5FGy9RUJoIy1gkI0jOv7AxpG2C2bppkfham43omDqdgwqIaCZ/prY4SsHSPs
 =
X-Received: by 2002:a17:903:3c6b:b0:224:1935:fb7e with SMTP id
 d9443c01a7336-228048794c9mr113038315ad.24.1743130098511; 
 Thu, 27 Mar 2025 19:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESOuIIqoTW0KqpcfXXxsgieA9bXWKQuGbr8OumEyQC5gHEHSTgIO0Qt72Mqa7jh1NwHW9vAQ==
X-Received: by 2002:a17:903:3c6b:b0:224:1935:fb7e with SMTP id
 d9443c01a7336-228048794c9mr113037835ad.24.1743130097906; 
 Thu, 27 Mar 2025 19:48:17 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 19:48:17 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v3 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Thu, 27 Mar 2025 19:47:22 -0700
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALoN5mcC/5WNyw6CQAxFf4XM2pp58Iiu/A/jAocCNYGRmQE1h
 H+3kLhwp5um96Y9ZxYBPWEQx2QWHicK5HoOZpcI25Z9g0AVZ6GlThUPGKzrICLCGKhvti0EeFB
 s3Rihww7c9QYm1zbPTSozXQhm3T3W9Nw85wvnlkJ0/rVpJ7W2/xomBRLqTGqspUKp8tMwkqXe7
 vldrI5Jf7h89TtXM1cfCixtJSuT1t/cZVnec9kLATQBAAA=
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
X-Authority-Analysis: v=2.4 cv=fJk53Yae c=1 sm=1 tr=0 ts=67e60df3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=CT4NIRYFaVtSUlOmZkwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7wREFPkZUQUJm-hFOU45ThPjwYIHC-tE
X-Proofpoint-ORIG-GUID: 7wREFPkZUQUJm-hFOU45ThPjwYIHC-tE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
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

This patch series introduces a Trusted Execution Environment (TEE)
driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
and services to run securely. It uses an object-based interface, where
each service is an object with sets of operations. Clients can invoke
these operations on objects, which can generate results, including other
objects. For example, an object can load a TA and return another object
that represents the loaded TA, allowing access to its services.

Kernel and userspace services are also available to QTEE through a
similar approach. QTEE makes callback requests that are converted into
object invocations. These objects can represent services within the
kernel or userspace process.

Note: This patch series focuses on QTEE objects and userspace services.

Linux already provides a TEE subsystem, which is described in [1]. The
tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
can be used by userspace to talk to a TEE backend driver. We extend the
Linux TEE subsystem to understand object parameters and an ioctl call so
client can invoke objects in QTEE:

  - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
  - TEE_IOC_OBJECT_INVOKE

The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
used for invoking services in the userspace process by QTEE.

The TEE backend driver uses the QTEE Transport Message to communicate
with QTEE. Interactions through the object INVOKE interface are
translated into QTEE messages. Likewise, object invocations from QTEE
for userspace objects are converted into SEND/RECV ioctl calls to
supplicants.

The details of QTEE Transport Message to communicate with QTEE is
available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
needed to build the above.

This series has been tested for basic QTEE object invocations and
callback requests, including loading a TA and requesting services form
the TA.

Tested platforms: sm8650-mtp

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v3:
- Export shm_bridge create/delete APIs.
- Enable support for QTEE memory objects.
- Update the memory management code to use the TEE subsystem for all
  allocations using the pool.
- Move all driver states into the driver's main service struct.
- Add more documentations.
- Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com

Changes in v2:
- Clean up commit messages and comments.
- Use better names such as ubuf instead of membuf or QCOMTEE prefix
  instead of QCOM_TEE, or names that are more consistent with other
  TEE-backend drivers such as qcomtee_context_data instead of
  qcom_tee_context.
- Drop the DTS patch and instantiate the device from the scm driver.
- Use a single structure for all driver's internal states.
- Drop srcu primitives and use the existing mutex for synchronization
  between the supplicant and QTEE.
- Directly use tee_context to track the lifetime of qcomtee_context_data.
- Add close_context() to be called when the user closes the tee_context.
- Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com

Changes in v1:
- It is a complete rewrite to utilize the TEE subsystem.
- Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com

---
Amirreza Zarrabi (11):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      firmware: qcom: scm: add support for object invocation
      firmware: qcom: scm: remove unused arguments to the shm_brige
      firmware: qcom: tzmem: export shm_bridge create/delete
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               | 150 ++++++
 drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  10 +
 drivers/tee/qcomtee/Makefile             |  11 +
 drivers/tee/qcomtee/async.c              | 160 ++++++
 drivers/tee/qcomtee/call.c               | 759 +++++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 810 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
 drivers/tee/qcomtee/primordial_obj.c     | 116 +++++
 drivers/tee/qcomtee/qcom_scm.c           |  38 ++
 drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
 drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
 drivers/tee/qcomtee/release.c            |  48 ++
 drivers/tee/qcomtee/shm.c                | 146 ++++++
 drivers/tee/qcomtee/user_obj.c           | 710 +++++++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 159 +++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |  31 +-
 include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  15 +-
 include/linux/tee_drv.h                  |  52 ++
 include/uapi/linux/tee.h                 |  54 ++-
 28 files changed, 4434 insertions(+), 32 deletions(-)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

