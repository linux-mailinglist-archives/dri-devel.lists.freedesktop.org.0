Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F9CAC48B9
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779AC10E3E9;
	Tue, 27 May 2025 06:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSfV867V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAB110E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QMP1TW023955
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=R/XXNjqqqmQQ2nBiWKgZ1m
 TILSavzSgd6ug36jOlfis=; b=MSfV867VdhsCNe0rGUbEtX/PvyT5LkhMrb4fZJ
 TuQ6t78H6Rz7c+O2LhlM3nuQKGzln9EHnlk3PfDmYddMLwRHoXurMwi/VEVQ+XS0
 WpRAyv9+NM8FP+L/NBozkfIXOE8rOjvJn58jrKAk+n5gui/ByMNZ5FOkDo5U6HAb
 neC4+KJbIqdc0s2MxrJ+WMGnQwBk3WfBdHQAzspyVzukh5pIe+jHrHRdnGulpd8I
 MAFvAb4Ah7UucGXmGjTLL9RaMHFi3wcvpbnyVOahgJFB0UA8Pc7Odzg9Paj+g6VI
 jDijS8jPxozCeDdJTA3UjqrVmL9X1KcRFjQJRkVM3Tl/eibw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejwx85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7425efba1a3so2509221b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 23:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748329035; x=1748933835;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R/XXNjqqqmQQ2nBiWKgZ1mTILSavzSgd6ug36jOlfis=;
 b=Gb8JWk4g+z3ybCCWmXXyCIfUo+NnP/vRmm6lzJu7c7GGRs002Kjz88aHfUREwbyHS0
 y2KBmZnzPePDP91sHsbqawDuJ2JscVF6hEPg8BBmZZAOgcTBcW1l+TG4u+TuqA5KTinG
 klRN6DZYS/lssViIJnpV704+PqVfgXNTev7lKQNYwj9GAsFMXTQGU/umhbQeLGm/sfp3
 YR3cuDimnm65ETAuei4o/KGoDKyx9w2wwAvyDrwpHEIOyC8WICg5NrnqMseWiTQ4cQf6
 2WWFlJHwTpvI0BtlwND/PuyVUZs2mbJZ+BQwwAy7voc6DOhbOqsDWpUo8nGtyOnL5nNW
 fceg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCAp09CgxaVhSHn3iBby9GGUiXnxxbJGBLRSax0zypsuc2qOdPx9dClJes+X63jHL39n8biursulg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbUjFj52CA2sIM1yTz8k6BzHw7SqKOZJD/HGCihUjVQa5D6DNd
 sFXWxIon/FLE9LI1zRrn7ndmPfLopNMrSNJpdnBVqjNZAL1GwbQhDKN2PhSurRG7jBSdH/HUP+0
 Zl2ZVFwgcUmITXbHA2pDS8Z5bW2HQTQT63MG2j78weODkkfh+oVQlpDICEkiAPwkMLQey2w==
X-Gm-Gg: ASbGncuCleMUI94IGqxDLQpeMclw3mPYuDPGwLf3juUkOT4XAXKeUR0DtKRYuatpr9E
 phk2XEHS8ByzomUfCuVAMsmjCJ9zFcHTZw8iQXjVSZDWIr2syKIbzKYfzoynFaY2T+74Wyrn62O
 2yYaOsJfqPJ+x0Iipe+GwXtlrixgmokBOFa4uXJSqc0uAxnNvxUp5GTcOPLZNxN7Soxl1TyM+dh
 hzLGRX73798A20ROpdARM/0hRo3TihZwe+3ZfgZchCj9TBNT9bVjBA41IjFoRB4O+v9DzSdf4gB
 CuL0cr8mgYtCK8Exr4AftBya45o2xqcWxloO7QEzIrL02h1OUWR+fITIb0KZnt0DxpgP+RI=
X-Received: by 2002:a62:f24d:0:b0:746:2217:5863 with SMTP id
 d2e1a72fcca58-7462217598emr3300908b3a.6.1748329035356; 
 Mon, 26 May 2025 23:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZrfcH3Sb55ANTjm+eWz4bJbtObaXuc1t3YV5MjNkK73rAKu9ia6cV/91JxIDr6Urj8Gki2g==
X-Received: by 2002:a62:f24d:0:b0:746:2217:5863 with SMTP id
 d2e1a72fcca58-7462217598emr3300873b3a.6.1748329034886; 
 Mon, 26 May 2025 23:57:14 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 23:57:14 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v5 00/12] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Mon, 26 May 2025 23:56:45 -0700
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1iNWgC/5XNwU7DMAwG4FeZcsZT4qTJ4LT3QByy1FmDaEObt
 oCmvjteJdQDHMrF8h/F338ThYZERTwdbmKgOZWUOw7Vw0GExndXglRzFijRKB7Qh9zCSARTSd1
 13UqBjzQ2eRqhpRby5RW0xWCtNrJCJ9h6Hyimz7Xn+YVzk8qYh6+1dlb31/82zAokxEoiRalIK
 nvupxRSF458Lu4dM/64/Gu/i+zioyMfallrE3+7enM1ur2uZtdFUznpNJ6wPudSjv3k3/i83XC
 z4QZPe3HDuPXKaGukt+HyB74syzdaoFNc7gEAAA==
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
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6835624c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=wdamrMJRu_bT6IjY2ZgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6uv8bEhj7tW1tkRCbusayIbE2fFZQLXh
X-Proofpoint-GUID: 6uv8bEhj7tW1tkRCbusayIbE2fFZQLXh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1MyBTYWx0ZWRfXyT89Qm3/WDAV
 fEqW0ejjW57zJnu+YEvoopTWzwMJ2AZI+NBP7OWRdic0F57DehilRHkw1MgKqyXUfq+pCSveo0E
 +X0wJx9aA7W2G+WXGqVfQQlTLeA15Au/GeDLIMJSZX9Fe5OC2q+Gqh4zUCwVatdWzmohON97eNe
 t5e4djXld9JRHYPI3ZYi7xiAbdYpmUUr99NLm54HURC/oCs+7B8vg3LSAozQEdJ78JzLOdriXe7
 +l70iP43VQEH+VofhAX9sonvqIS6AkWIaEQxYQuNH/Dbj825ZnAskwUmZIOcmy5+fXrzxNnHZss
 9h4oiq/1fdzP53C6+EGcrIL1es1e4ufw7+SvdfBTB5nd+4LLHUr/Njx8Pp1ZMIw+6NnG2r7v/vs
 aZGrlq09kvHLLKkxPutNyvrPKUfFMQxZMaq1ZDcD4PBvO6mcOF2bJdpkNhW0oLFndZMKRbSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270053
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
available in [PATCH 12/12] Documentation: tee: Add Qualcomm TEE driver.

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

Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v5:
- Remove references to kernel services and public APIs.
- Support auto detection for failing devices (e.g., RB1, RB4).
- Add helpers for obtaining client environment and service objects.
- Query the QTEE version and print it.
- Move remaining static variables, including the object table, to struct
  qcomtee.
- Update TEE_MAX_ARG_SIZE to 4096.
- Add a dependancy to QCOM_TZMEM_MODE_SHMBRIDGE in Kconfig
- Reorganize code by removing release.c and qcom_scm.c.
- Add more error messages and improve comments.
- updated Tested-by:, Acked-by:, and Reviewed-by: tags
- Link to v4: https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com

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
Amirreza Zarrabi (12):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      tee: increase TEE_MAX_ARG_SIZE to 4096
      firmware: qcom: scm: add support for object invocation
      firmware: qcom: scm: remove unused arguments to the shm_brige
      firmware: qcom: tzmem: export shm_bridge create/delete
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               | 150 +++++
 MAINTAINERS                              |   8 +
 drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  57 +-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  11 +
 drivers/tee/qcomtee/Makefile             |   9 +
 drivers/tee/qcomtee/async.c              | 183 ++++++
 drivers/tee/qcomtee/call.c               | 833 +++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 930 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 172 ++++++
 drivers/tee/qcomtee/primordial_obj.c     | 116 ++++
 drivers/tee/qcomtee/qcomtee.h            | 266 +++++++++
 drivers/tee/qcomtee/qcomtee_msg.h        | 251 +++++++++
 drivers/tee/qcomtee/qcomtee_object.h     | 309 ++++++++++
 drivers/tee/qcomtee/shm.c                | 150 +++++
 drivers/tee/qcomtee/user_obj.c           | 694 +++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |  10 +-
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  56 +-
 27 files changed, 4528 insertions(+), 33 deletions(-)
---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

