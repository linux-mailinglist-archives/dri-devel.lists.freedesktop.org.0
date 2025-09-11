Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46FB5271F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 05:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24DF10E09C;
	Thu, 11 Sep 2025 03:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACTLiRJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1647010E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IVbu025747
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bbBBMhrEsv7qNRzxrU8e8X
 M5/n7nt7EZOvuba+FCRVY=; b=ACTLiRJ+Zvy4113ynxQUei6fxkMHO/y0WdGAJZ
 WaxmWLN1muPG3nBGymCqQ7me5csE8Ru5/kWKjbUQXbPdE4a6SCYFUyCw3VDCfx1g
 fp0519IVcHx3JUY8IbhLdJk9gPBbGWLGNRs0uZQY/Rva/CNoMgl9ww2HnrjvwRy5
 SJx3eg2XJYvZE9L8wGm2/Rc/oc2cFElG9dLfSqaQo8vj2dUGr1hFeirMRo9SfD5v
 /bV+zRO5kj5rARoRyXMPGArEo1wGpe5PVowmdBaqgmD/NKFzZxxYf4jlkonNhgiC
 n1M2+sGvKv2z1NTIHUhDYWSau3zs65cRvgQJqzbT3IE2WCag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0x2va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25bdf8126ceso4955145ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757562084; x=1758166884;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbBBMhrEsv7qNRzxrU8e8XM5/n7nt7EZOvuba+FCRVY=;
 b=i3ZKJtq0LzG8daRJqzyeAGWI9V3D/dkfJyawPdWy5kPPG0s6QxErKYDVVitpT/TUUA
 2ltgfaDpNcSP1+sgm9xLZWTgbycDiaicgz5XpBH1rPPLNvuy2AA1w15ipHmUmo2BIU1t
 RoiENptUkiLTdtXBaL5yPil2/YHiJia3/r/0LWV4fllLmtUkAJXNoDns82DBxidQQJxn
 8f0nuRvDU4nkrK22tfaexykIfaHFEjEofr62kRA5NJUZifoQlBWUxckIgQkgEeNB/VkO
 ksPkE7tOPkTH+1dN3zuE5hMvT9ZBaDvj0MV2mMCWQzjY9GPjKSBzpLrHUGStt8xTwRuA
 IYHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIbHNkgtqXZtBQYKmTI2TjPpN8Rsr/hjB1ELP85hUpHY1130TNhT9xh8gegZs9+oAtfbwiS4iS6Og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8W5Hi4dITrSFk6in2UVNOEtXVWcFDKBR3GSZcs+UYBT9joizr
 QvFaw4R+hJaChGnJrYeIqFGblwQGp7jCq2Uj2QxbP+3OLnkWX6zrs41E9pR9IbuMjlBkf1tFMu+
 3UJDCd+rtQD0fDrWFdVyKkqKNYo2n4S3a8bPTrnOOb4DhJ9h1lpV88hN3II7BBH081u+xjKUFQ7
 ua/XhL
X-Gm-Gg: ASbGncsdMIIwk8Z3llT/YzxbFWzCkuem6qoiWP21F6pmx8ryScGTrUoxK9ZEnM5B8BW
 1r1Zu5wcWT/dKI/RmFLWx9FsUVCErBU+HgPFHRmdmoIGupJezX1/q/Fe5KHCX44wHgSg3diRNuv
 n8IKOng7P0ggZMNJTPeOxpFRLqH6iwLdaPrOynTeLNp/afhNMPMQg968m1jBwl0ZdnvG50yitbM
 xh0zeFVyOFOEmljm7wQMjvu1tKf31QUh8Y0PZO/spVi9WREl/eGO+9AHaU9DGWHQYwrheJG+4/Q
 4CIeEOMfcn9DhaWkZjtptt7ws+hATWRFQXLZBJ7St5wdMU9NBFnayYD1w70VS8SlRGKfaO4bMs4
 TFBjy1NbpNVTdBDAW56+iES8=
X-Received: by 2002:a17:902:d2d2:b0:24c:a269:b6d7 with SMTP id
 d9443c01a7336-25173119564mr235107365ad.50.1757562084062; 
 Wed, 10 Sep 2025 20:41:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8qcHgo4cD6gRiRDNlWwY1szN/7aP4dEmiQtEyfRn8ayLHkhE0u89NwT6FLhgbuQXXpTNTw==
X-Received: by 2002:a17:902:d2d2:b0:24c:a269:b6d7 with SMTP id
 d9443c01a7336-25173119564mr235106915ad.50.1757562083355; 
 Wed, 10 Sep 2025 20:41:23 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 20:41:22 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v11 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Wed, 10 Sep 2025 20:41:13 -0700
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpEwmgC/5XTzWrDMAwA4FcZOc9Fkn+zU99j7OA4duuxJmucZ
 Bul7z6nMFLYAt7FWML6ZJB9qZIfok/V08OlGvwcU+y7HCA+PlTuaLuDZ7HNiYqABOaFnV1/YqP
 3bEqxO9x2KbGPOB77aWQnf2J988q4IqcUFyBJV9l6H3yIn7dGzy85PsY09sPXre+MS/a/HWZkw
 IIE8gHQA6r9eYoudm6Xy6ulx0w/bj5V7lJ2qdbeuhZaLsJvl68uJ13q8uzqIKQGzclQu+9T2p0
 n+5bLTysuVlyQKcVFxpVFwZUAq1yzgcsVl6RKcZnxPBzPibCBpt7A1Ypr5KW4Wm5e69DoVqDja
 gPXK26weJY6485ri1ZrYYBv4OYOJyjFzTJQUEoZCMiN3cDrFa8BS/E645ZsIJ5tauUGjnCv18V
 /B5ZHDg1qI6UPHP/gr9frNxFrDd4fBAAA
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: MInua94P9NX9rBrEQw_s6aDXl10h4Ivr
X-Proofpoint-GUID: MInua94P9NX9rBrEQw_s6aDXl10h4Ivr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX39X8GmQJnQxR
 yA2iyDYrlNHjENrPL5vabPwtQFdBVaSS3ENzmveWSF60hbt9LoPT8ubay+6JCeIL22goeZW7gQS
 4fpqSriae2n8Bl3oysqaJ+lSwe1rNeeKFIa2+XbC0zdwEb/1WEfWIj0sCrAe+PMkT1olJ9sWdZj
 Ld06YKy1I7RH1mpNQdycPWfcfbrXcjPT6wTVZRpf4g5ePjZsYJFeyCJrc3Sq846TRAdqW2TOVeh
 PWiH3NHUlYikVkfqtmlxBnKBK9UTKNwk098mVG5EzqQXNHa7jtMVL1iDxFbBKxdRcCvwOdvJMlk
 wzgubp30oY/5QfEPwpPcRx+RmesbWGLQ50LVGZ/OkOejcVeWYx8d8O3o8Iv3pMiwZFf8pbKDFd3
 YGcOdz/Y
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c244e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hlSAHII3iifkWu_GNqkA:9
 a=huaRTxWe2eLa42Ba:21 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

More comprehensive tests are availabe at
https://github.com/qualcomm/minkipc.

root@qcom-armv8a:~# qtee_supplicant &
root@qcom-armv8a:~# qtee_supplicant: process entry PPID = 378
Total listener services to start = 4
Opening CRequestTABuffer_open
Path /data/
register_service ::Opening CRegisterTABufCBO_UID
Calling TAbufCBO Register
QTEE_SUPPLICANT RUNNING
 
root@qcom-armv8a:~# smcinvoke_client -c /data 1
Run callback obj test...
Load /data/tzecotestapp.mbn, size 52192, buf 0x1e44ba0.
System Time: 2024-02-27 17:26:31
PASSED - Callback tests with Buffer inputs.
PASSED - Callback tests with Remote and Callback object inputs.
PASSED - Callback tests with Memory Object inputs.
TEST PASSED!
root@qcom-armv8a:~#
root@qcom-armv8a:~# smcinvoke_client -m /data 1
Run memory obj test...
Load /data/tzecotestapp.mbn, size 52192, buf 0x26cafba0.
System Time: 2024-02-27 17:26:39
PASSED - Single Memory Object access Test.
PASSED - Two Memory Object access Test.
TEST PASSED!

This series has been tested for QTEE object invocations, including
loading a TA, requesting services from the TA, memory sharing, and
handling callback requests to a supplicant.

Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v11:
- Rebased on next.
- Link to v10:
  https://lore.kernel.org/r/20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com

Changes in v10:
- Remove all loggings in qcom_scm_qtee_init().
- Reorder patches.
- Link to v9:
  https://lore.kernel.org/r/20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com

Changes in v9:
- Remove unnecessary logging in qcom_scm_probe().
- Replace the platform_device_alloc()/add() sequence with
  platform_device_register_data().
- Fixed sparse warning.
- Fixed documentation typo.
- Link to v8:
  https://lore.kernel.org/r/20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com

Changes in v8:
- Check if arguments to qcom_scm_qtee_invoke_smc() and
  qcom_scm_qtee_callback_response() are NULL.
- Add CPU_BIG_ENDIAN as a dependency to Kconfig.
- Fixed kernel bot errors.
- Link to v7:
  https://lore.kernel.org/r/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com

Changes in v7:
- Updated copyrights.
- Updated Acked-by: tags.
- Fixed kernel bot errors.
- Link to v6:
  https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com

Changes in v6:
- Relocate QTEE version into the driver's main service structure.
- Simplfies qcomtee_objref_to_arg() and qcomtee_objref_from_arg().
- Enhanced the return logic of qcomtee_object_do_invoke_internal().
- Improve comments and remove redundant checks.
- Improve helpers in qcomtee_msh.h to use GENMASK() and FIELD_GET().
- updated Tested-by:, Acked-by:, and Reviewed-by: tags
- Link to v5:
  https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com

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
Amirreza Zarrabi (11):
      firmware: qcom: tzmem: export shm_bridge create/delete
      firmware: qcom: scm: add support for object invocation
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      tee: increase TEE_MAX_ARG_SIZE to 4096
      tee: add Qualcomm TEE driver
      tee: qcom: add primordial object
      tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               |  96 ++++
 MAINTAINERS                              |   7 +
 drivers/firmware/qcom/qcom_scm.c         | 119 ++++
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  12 +
 drivers/tee/qcomtee/Makefile             |   9 +
 drivers/tee/qcomtee/async.c              | 182 ++++++
 drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
 drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
 drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
 drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
 drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
 drivers/tee/qcomtee/shm.c                | 150 +++++
 drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  56 +-
 27 files changed, 4410 insertions(+), 28 deletions(-)
---
base-commit: 8b8aefa5a5c7d4a65883e5653cf12f94c0b68dbf
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

