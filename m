Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD72AA5884
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 01:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4D810E07A;
	Wed, 30 Apr 2025 23:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocKlaSSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC22210E07A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 23:14:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH1NMQ001242
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 23:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 odCpJRBkGnkQbAVJ54CCIY9nGqNy0fI6XSD+YjlnOUM=; b=ocKlaSSf4rZznEqF
 Klk2nTYXgyM3yQqj0f+HHnqeMnyaKhX9F/PL7MT8U3PlpTTYxW29GL+T5iVYdm1Z
 8h0sKJ7XCboBile201QJ1663cBiIuXyFFXHQY35X7vAEB5svVQz6bbMt4GKCAXr5
 dOycvaSdxCpakKgmaTYZGOVPx7+eJGZjlFGEsU+mtsZ/sGkmecsfqT8byFM+6NOT
 +PLPiwcOgMPwixoXM776MycPPlFAK2eY890GaZV7LU5OtnhZcK4jfPrRY1fKRvJG
 OWxvhGuPRJyE+BozIqzNCKgAd8qKKC46dplxCtyecTpR2zzHar4qBCbA5ExWNol3
 GhYpKg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9uu4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 23:14:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b1c122308dcso382130a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746054871; x=1746659671;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odCpJRBkGnkQbAVJ54CCIY9nGqNy0fI6XSD+YjlnOUM=;
 b=TlmiLaeyNbA/B9rkG2w7DWPlavlqPJ4ixLATDV2INBOK2wKT75moHtfe7wF2ioDsBR
 r92Z10D1UQVTdwC5GRfb8TpQoQwqpsT1jwJy70pCHY2XSj4H/SHUcOtxooeDTwQfHfTh
 NdQQJ7liwTzFFsqcwLbUupaK3YCjVe2GOb5yJtLwQuOOWkmBPBnpGp85ao4CkgRi2gg6
 4B3BnkJNh7Dna1qKU1rCmtSjxc9cA6sRxT96TEDORouFM8jm7WMkYc4TnvIxVMih1yG5
 xVfovsTM2FeFRHhH8oLJeL8hnTOqbxT6i0AglNO0S3NOym+z/n3CODyRJpFbk3WXIopw
 3asQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgCAISOkF6rd8YqN1E4KUlaMMzUR0FbKYdlw7ZF4OMXDDR84cY4QYAynHPHkzkrAMvNrvl7/BLBIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzsje4BhHg8qiiumPeqZlCRlMCivJQTMKeky5rAFtmCi6nFu+w1
 4H5iMi6qE3vrVH12n3qOKKawuVpWgFAffEbjTk/pmBS55RSBCCbFz03ADJehj2TIHvHAwlTPjCI
 1cIIwwpBbb+E04a0554FtpMhFfUL1zsgWcQcp3BHmWgylckQcZiA2qEZbe16KODQ/XQ==
X-Gm-Gg: ASbGncudiyBZRG/h9Fuy4vavK3IujazRcfWmebilLA5tNaCgftATOWmCGu9n1ZDJeim
 v/uhGYdgf/r7Bbym/qwc+OSU4/SWBbbDOHpD+rXZv1ZOF7MvQD0ZkuL8cADinBmY0EYbYDJLFJO
 gqfVuI4qZ/fRDWwzLorkGHyx7VK7LYa2IV+Xl76B5MxurMagToaua9nvB9T0R3mVrvAzbwhDdTU
 8HqDxE7hNdErHYjcatH1nbpuWfyoaVaulB5l6kQ6kcompPogZTyKIWuvFNSg1YMzeDwCGMSbaVy
 LT9wCJi7ik0GLHvIPSh941pCYSadT+ZjtouvH3nSiaJZvcWmDZ87agZbo2B8FuXNTV6kIcw19SI
 1zHj9wCGl2w==
X-Received: by 2002:a17:903:1a8d:b0:224:1c41:a4bc with SMTP id
 d9443c01a7336-22e08429b31mr5652775ad.12.1746054871028; 
 Wed, 30 Apr 2025 16:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMYLGkrCoGsf8O1o1c38XJ3QdnATZaLR6dCLDwA6FQ9TVDkH5bWY3cAJLlloAMZ3VnSyvqFw==
X-Received: by 2002:a17:903:1a8d:b0:224:1c41:a4bc with SMTP id
 d9443c01a7336-22e08429b31mr5652325ad.12.1746054870632; 
 Wed, 30 Apr 2025 16:14:30 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7c5asm128540485ad.122.2025.04.30.16.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 16:14:30 -0700 (PDT)
Message-ID: <40e28045-7b27-4f7b-8c57-51127fb4e062@oss.qualcomm.com>
Date: Thu, 1 May 2025 09:14:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: neil.armstrong@linaro.org, Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <3c4e3ed8-ceaf-45c7-a52c-dc7b8209418b@linaro.org>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <3c4e3ed8-ceaf-45c7-a52c-dc7b8209418b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4WRxIrGzC0D9ho0-H1BR_IjLLh6RWVqv
X-Proofpoint-ORIG-GUID: 4WRxIrGzC0D9ho0-H1BR_IjLLh6RWVqv
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6812aed8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=LnoSvLFi0Bb5zeF9BfQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE3MyBTYWx0ZWRfX4Jh3s72g14PM
 YIavJIHmBOoG8BvBCNpl+KfB23kJPvhbPDHAV8OvASLbPX+SAQcgiQqW4fZFZPMai1ZG8qNPE6d
 y6P4XpzdpRVhpGRqdxPv7HV5arR7wEtkeQO4p1MNPW7B9fGzOtG2xO4k19cjN81a071QZFeELhQ
 lRN5wdBUndbO2M8Bcc3pbyNCaEPEfiVL1G3KVcg1DKTN/SD0Rp1stUx6VN+986N8wUJ/225EkTB
 SDqSXkAcdceusCtxgH6g+X1otUGSd4AJEA6/zjz8E+vXfwlYPYGYxdZZrLMBslGR0CvKU4TWzRo
 6vLtcp8C7eaR10ImELqfmw09yc6CR8afLNcUlxUaaYnpeAd+sop83Mv7GW4aeNs8EuQcnYd0GUc
 j42gXmvesZr1O4Sjho8mkIaz5JPRY3IkD9LH7Dbci7nt/fts7a4sVRNttzxHPIavVXB8Gvi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300173
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

Hi Neil,

On 4/29/2025 11:01 PM, neil.armstrong@linaro.org wrote:
> On 29/04/2025 08:06, Amirreza Zarrabi wrote:
>> This patch series introduces a Trusted Execution Environment (TEE)
>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>> and services to run securely. It uses an object-based interface, where
>> each service is an object with sets of operations. Clients can invoke
>> these operations on objects, which can generate results, including other
>> objects. For example, an object can load a TA and return another object
>> that represents the loaded TA, allowing access to its services.
>>
>> Kernel and userspace services are also available to QTEE through a
>> similar approach. QTEE makes callback requests that are converted into
>> object invocations. These objects can represent services within the
>> kernel or userspace process.
>>
>> Note: This patch series focuses on QTEE objects and userspace services.
>>
>> Linux already provides a TEE subsystem, which is described in [1]. The
>> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
>> can be used by userspace to talk to a TEE backend driver. We extend the
>> Linux TEE subsystem to understand object parameters and an ioctl call so
>> client can invoke objects in QTEE:
>>
>>    - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>>    - TEE_IOC_OBJECT_INVOKE
>>
>> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
>> used for invoking services in the userspace process by QTEE.
>>
>> The TEE backend driver uses the QTEE Transport Message to communicate
>> with QTEE. Interactions through the object INVOKE interface are
>> translated into QTEE messages. Likewise, object invocations from QTEE
>> for userspace objects are converted into SEND/RECV ioctl calls to
>> supplicants.
>>
>> The details of QTEE Transport Message to communicate with QTEE is
>> available in [PATCH 11/11] Documentation: tee: Add Qualcomm TEE driver.
>>
>> You can run basic tests with following steps:
>> git clone https://github.com/quic/quic-teec.git
>> cd quic-teec
>> mkdir build
>> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
>>
>> https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
>> needed to build the above.
>>
>> This series has been tested for basic QTEE object invocations and
>> callback requests, including loading a TA and requesting services form
>> the TA.
>>
>> Tested platforms: sm8650-mtp
>>
>> [1] https://www.kernel.org/doc/Documentation/tee.txt
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> Changes in v4:
>> - Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
>> - Rename object to id in struct tee_ioctl_object_invoke_arg.
>> - Replace spinlock with mutex for qtee_objects_idr.
>> - Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
>> - More code cleanup following the comments.
>> - Cleanup documentations.
>> - Update MAINTAINERS file.
>> - Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com
>>
>> Changes in v3:
>> - Export shm_bridge create/delete APIs.
>> - Enable support for QTEE memory objects.
>> - Update the memory management code to use the TEE subsystem for all
>>    allocations using the pool.
>> - Move all driver states into the driver's main service struct.
>> - Add more documentations.
>> - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
>>
>> Changes in v2:
>> - Clean up commit messages and comments.
>> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>>    instead of QCOM_TEE, or names that are more consistent with other
>>    TEE-backend drivers such as qcomtee_context_data instead of
>>    qcom_tee_context.
>> - Drop the DTS patch and instantiate the device from the scm driver.
>> - Use a single structure for all driver's internal states.
>> - Drop srcu primitives and use the existing mutex for synchronization
>>    between the supplicant and QTEE.
>> - Directly use tee_context to track the lifetime of qcomtee_context_data.
>> - Add close_context() to be called when the user closes the tee_context.
>> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
>>
>> Changes in v1:
>> - It is a complete rewrite to utilize the TEE subsystem.
>> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
>>
>> ---
>> Amirreza Zarrabi (11):
>>        tee: allow a driver to allocate a tee_device without a pool
>>        tee: add close_context to TEE driver operation
>>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>>        firmware: qcom: scm: add support for object invocation
>>        firmware: qcom: scm: remove unused arguments to the shm_brige
>>        firmware: qcom: tzmem: export shm_bridge create/delete
>>        tee: add Qualcomm TEE driver
>>        qcomtee: add primordial object
>>        qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
>>        Documentation: tee: Add Qualcomm TEE driver
>>
>>   Documentation/tee/index.rst              |   1 +
>>   Documentation/tee/qtee.rst               | 150 ++++++
>>   MAINTAINERS                              |   8 +
>>   drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
>>   drivers/firmware/qcom/qcom_scm.h         |   7 +
>>   drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
>>   drivers/tee/Kconfig                      |   1 +
>>   drivers/tee/Makefile                     |   1 +
>>   drivers/tee/qcomtee/Kconfig              |  10 +
>>   drivers/tee/qcomtee/Makefile             |  11 +
>>   drivers/tee/qcomtee/async.c              | 160 ++++++
>>   drivers/tee/qcomtee/call.c               | 770 +++++++++++++++++++++++++++++
>>   drivers/tee/qcomtee/core.c               | 815 +++++++++++++++++++++++++++++++
>>   drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
>>   drivers/tee/qcomtee/primordial_obj.c     | 115 +++++
>>   drivers/tee/qcomtee/qcom_scm.c           |  38 ++
>>   drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
>>   drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
>>   drivers/tee/qcomtee/release.c            |  48 ++
>>   drivers/tee/qcomtee/shm.c                | 146 ++++++
>>   drivers/tee/qcomtee/user_obj.c           | 713 +++++++++++++++++++++++++++
>>   drivers/tee/tee_core.c                   | 127 ++++-
>>   drivers/tee/tee_private.h                |   6 -
>>   include/linux/firmware/qcom/qcom_scm.h   |  31 +-
>>   include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
>>   include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>>   include/linux/tee_core.h                 |  54 +-
>>   include/linux/tee_drv.h                  |  12 +
>>   include/uapi/linux/tee.h                 |  54 +-
>>   29 files changed, 4427 insertions(+), 32 deletions(-)
>> ---
>> base-commit: 33035b665157558254b3c21c3f049fd728e72368
>> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>>
>> Best regards,
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> # /unittest -d
> [test_print_diagnostics_info][52] 831360          = Total bytes as heap
> [test_print_diagnostics_info][53] 111707          = Total bytes allocated from heap
> [test_print_diagnostics_info][54] 700160          = Total bytes free on heap
> [test_print_diagnostics_info][55] 15280           = Total bytes overhead
> [test_print_diagnostics_info][56] 4213            = Total bytes wasted
> [test_print_diagnostics_info][57] 454160          = Largest free block size
> 
> [test_print_diagnostics_info][60] SUCCESS.
> # /unittest -l / /smcinvoke_skeleton_ta64.mbn 0
> [test_read_file][246] File //smcinvoke_skeleton_ta64.mbn, size: 32856 Bytes.
> [test_load_sample_ta][199] SUCCESS.
> 
> Thanks,
> Neil

Thanks Neil for the tests.

Regards,
Amir


