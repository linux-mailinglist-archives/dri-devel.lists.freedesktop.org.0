Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A025AA0269
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FE810E2BE;
	Tue, 29 Apr 2025 06:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMehnZR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19410E148
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqKuS012626
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=zMMsCZN8LQ3t7/Q7EfRJ4k
 BvhvXv0NewE2HNWY5NzV0=; b=KMehnZR7Xct1O98Ld9O61zlRt+HHWYJTTJ9Fem
 sBgt3R/JXpRafTSXPYNpT9xpJIBEqR6CI5I3oQZgkK1iG2vqOnwmAMan6SLQtWEi
 g5Ywju+ea02N8Zzv/E6Dn2isKY9OlLy7fWR2DzDZmrUhTw+KZWKXtDPyvZWUzrHd
 j4qHmwTZXZs1WJEYB0ejGDB7hTS5JAdUV4z0Z9hPQjWPD/d5irqdyNSAm/8irDz+
 J+gOpC+5oSP1gLAPgXCCNQO30/0DZIPzkLZYeYwzPT14NfRZxR2CjTADYhn2Igi6
 H6iL2ItY154cMXnRiaTjes+kaO+8wmbvMcI3pPbJIcNdtkdA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323cqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:06:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7394772635dso3769215b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906815; x=1746511615;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zMMsCZN8LQ3t7/Q7EfRJ4kBvhvXv0NewE2HNWY5NzV0=;
 b=mIcGYmTrrD/iBEm4ux1S10KeMLalO/mqn6/92HziqYA1dqcMI/PI8ZzymiPgqzmRkp
 N36cLcXjJMYSaQj8XarKJoM9YPJfgN0I6OLzKr/4e+hfa3qXolBjYUnrUvUg/m6sfHHl
 lNF5+lYkz9pXmavE1Ff7moCdOOkZGVxSo9BunuIXIUR973KnMH9kUjf80+YF55gxw1t0
 4M5Udlc8fUKVSrT3ycILECOt3g4rIPE2Q7+jL5XVuH2kCr8Gd8Lh83SBZg8Mnn4Q2a0y
 RZ8g+BSMCvcbnCRsTciT8vwfQf6MZqI86nVhBPu7SYiVnBk/EBWJbKS3VENvqFbm94BC
 yOlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrnB5AkPqMNV8N6PX1MJD+aRysCxKT0ec3dNnY6/xoL52FdZdUwQ85lA/jAcG4Ir4su2QHDWEt/po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHrhFF4/g8jaOi9htItTTeUsgJvIGIOq/5EMM1rlrw+/na+/jY
 TvetZaQrOmehUv0eAJsaoVvoM+8z/kWY1f/Zt7R6HJyeHq7a+YCye1Ves7Z00xUlnYeSVrytPW4
 G90IWaN9rciTYMxVyM/W21+39yM29AjOAePxXMyjN27SwOmqOAnaIGi+XJuvmhnCX/g==
X-Gm-Gg: ASbGncu+Z/tpRWD0UAfUr8q3MYTQyLg88hZfDInpRCjBYiJpFmnptTrghMcpiuLdsXj
 HavaX1wIaOyrkcEN3U2XZbrAlk5eRUfWZzUNbNLz1dzesqpdYi1WBxIL6MZO5Q9+YhjM1HlB/4C
 s2ls0WduyVJ/DK6LF26tQdJ2h5KlivyoyC/TcD24kZf3r8AbjXUK2NHQdtPjGPzEdj2E4FD9Y+e
 YMU/hoGvWIv2svf8Rn6K/mwMngI3CjPkpAe9UKqxyX3jjYzwKyK6J33YYfe+KypA09FGrl6wk4t
 /cXq2i9mcgtF34Mwwiz0R8KIa9A5CMPXT2f6ETIeNeUWd5J1La1AUIkyn0RfAZEhghAyYcc=
X-Received: by 2002:a05:6a00:a28:b0:736:5725:59b4 with SMTP id
 d2e1a72fcca58-73ff7255d50mr16226199b3a.3.1745906815163; 
 Mon, 28 Apr 2025 23:06:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuXLjbPivePMa3SRH1zyQCTTvNXe5AVPLmb03PDJa/O/Y1wyCDPC/W8/0MtYyIjWaGw+TwPg==
X-Received: by 2002:a05:6a00:a28:b0:736:5725:59b4 with SMTP id
 d2e1a72fcca58-73ff7255d50mr16226169b3a.3.1745906814704; 
 Mon, 28 Apr 2025 23:06:54 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:06:54 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v4 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Mon, 28 Apr 2025 23:06:21 -0700
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1sEGgC/5XNwW7CMAwG4FdBOc8ocdJm48R7IA4ldaintaFNW
 zahvjum07TDLuxi+Y/i77+pTANTVrvNTQ00c+bUSXAvGxWaqjsTcC1ZoUZnZEAfUgsjEUyZu/O
 65QxXHps0jdBSC+n0DrbEUJbW6QK9EusyUOTPtedwlNxwHtPwtdbO5vH634bZgIZYaKSoDWlT7
 vuJA3dhK+fq0THjjyu/nndRXHzzVIVa19bFv679dS36Z10rro+u8NpbfMV6n3Le9lP1IeftN74
 syx02MO6RkQEAAA==
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
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=68106c80 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CT4NIRYFaVtSUlOmZkwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xcMyUWXiNvO9TNVLvCC2z0OCCqam2ujx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX9RXPPJBohwS1
 bullDzi84kP5Yui9/KxrenvY+p+7RFOXDLtYjLe3a9fFocnkZOFA3r7+TR2SzZYy+vWYhR3HEYx
 bAvRYrdFgsXGn/CJxucpCz61UZj8ru4Ct3FzAd6qTv0gcDmjyTYJQXjWk3fxwH0keWQLBjf7iiE
 Zd9JacCGV5G2Wua0aIM9EtSuk5fc1w7tWh8eoKR5g4nDoMzbGz71txW1xSKEPWbYu2czrPjbmzw
 lKTIc348yZ7oGnfDHflkilnVKMW0y20GzJrnUvXGci0+UgMo8DJEWjhAy43HI0/tryCEjwUaOLh
 M+6VNO9vPJnCOzDt9TRia5YQLoFG/OLugjyrOd/zZIF7s8V5JNRcj7dPpb3YMTYKDaxmthgmIKM
 ETI+Pe2c4Tw7PE3cWcfpZU/BzsO+XZXN+bDsKhyF6VTlpl5MiGWvShBA+atbveAR1CCXaLhB
X-Proofpoint-ORIG-GUID: xcMyUWXiNvO9TNVLvCC2z0OCCqam2ujx
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
available in [PATCH 11/11] Documentation: tee: Add Qualcomm TEE driver.

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
needed to build the above.

This series has been tested for basic QTEE object invocations and
callback requests, including loading a TA and requesting services form
the TA.

Tested platforms: sm8650-mtp

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v4:
- Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
- Rename object to id in struct tee_ioctl_object_invoke_arg.
- Replace spinlock with mutex for qtee_objects_idr.
- Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
- More code cleanup following the comments.
- Cleanup documentations.
- Update MAINTAINERS file.
- Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com

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
 MAINTAINERS                              |   8 +
 drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  10 +
 drivers/tee/qcomtee/Makefile             |  11 +
 drivers/tee/qcomtee/async.c              | 160 ++++++
 drivers/tee/qcomtee/call.c               | 770 +++++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 815 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
 drivers/tee/qcomtee/primordial_obj.c     | 115 +++++
 drivers/tee/qcomtee/qcom_scm.c           |  38 ++
 drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
 drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
 drivers/tee/qcomtee/release.c            |  48 ++
 drivers/tee/qcomtee/shm.c                | 146 ++++++
 drivers/tee/qcomtee/user_obj.c           | 713 +++++++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |  31 +-
 include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  54 +-
 29 files changed, 4427 insertions(+), 32 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

