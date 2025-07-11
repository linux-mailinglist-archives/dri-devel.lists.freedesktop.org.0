Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32358B0140D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A53310E9B1;
	Fri, 11 Jul 2025 07:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jxp0VuLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7D910E9B1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:05:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X9FS003861
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SoKVKTsiukewm3ljbd64Wt96q6hc2VUc7V4Rim9dDL0=; b=Jxp0VuLXxm9TOetg
 yvP8rCMMLsJ92GvlQPr8Id3OwbATfRWL1+W9bfvSFuuOL5GccnKfYwAmIsm1mvJ6
 KL3PgBKuAtBwBRwUi0UQbNagW1wgIGY+bt7TVHiheyST6e+xFRFd2Xf9Xg58EfeG
 ++D79vmhB3qAjzeTTfC4vInNWvIIA9G87KXAnBBMMd7kWSZQXgMBw3OZeY0kLuNe
 LGCWDkT96HRbtz1S8ip9mEe3NOTYFxAAPA0ErkUlAzBrN9UYfe7WHTw0/jNu2tfM
 N3mdYns7mAhQ/UejpF1AJr4wzUPlS4BHHOExf6F1T1ftvclrLSGyPWyr4cv/SoBy
 +pXDww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnyned-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:05:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234a102faa3so13874705ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 00:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752217545; x=1752822345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SoKVKTsiukewm3ljbd64Wt96q6hc2VUc7V4Rim9dDL0=;
 b=ea+54DdEDok7Oul+pf4bk6Y83W+mMyNHmKnr8k1oWgW4YovjBgd8h9j6ejI4yWe8jL
 88GHqaXbBAbzp3KebxU4W37cNdi5h4em1Uh/1jUGzXUdDDuZnOa8eJa4N11J2XV8DGbF
 GmR2F9ddeHLmtEZiKfVG9v45p42bTdba7lW8abU2N/j6qhgG/3OYcBhozyPTkEgQQ8rW
 fpYcM19tISFxE2iGLI68vNpWy/LU5yeoTwHjMwdfvlVTb3MHkCigLTRKiaGrCSjkoH6P
 yiO9XzZ8IRvEghUA2/vNbCWo6RbwdTQT3KzpBxK3Zfl96SyH5uStHN+6EKLtEPuFgwYB
 jVPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWVEuHCdw/Swk9J/aZeNKyoMG/NyKgMCcgq4d0UrpY0LY/xaU8Xpv28F3sSgSle7SbDo+gyJ+QhwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGn4rplHEjBn5iK3TNBNXuMrPu4okv3MklrWe8VEE41pDHn1Nr
 wt+5TnwFbK98VsUIKUhB6vR8Nn4k+YYTe3u6AvrXl1k8gCvOuFtbhraAUCGVIp1kc3HwnCtQePB
 L1rztp3m+kJugIb+aNr9Mn7hDO3Rs0KwQ7KYhIkQxWRXpVDK13lcAgxipjUGqD7vKj0t4Mw==
X-Gm-Gg: ASbGncuJjWJI2TWzLfGXf82Az9vkGeK58G/7oXukFi0z7+/XxRbFkxcyVR2C0ukdWuv
 uWSwT9o39sZ/sv44WeSpzGAtDySUlXuOlv/Q7ByoACaz9SVzj+Tle4ee4sqOVQ3xsHTw8yfUDoc
 pewX9nV7XxQzBXKIoTfFe/nZqWRXnJsFLRiGaYxtlg+Ef/159YRfzYmbrMfNaxH++lEng1lyvhh
 0pm2ayaJ7uIV40QQgLGpAa03KNTTK9NmYt18sOXVr5x11Jcdr8SQDlSWrBmzJEwWxfmXOsjvo3K
 e5eaeWrHQljWc/vmgyhruyklfU94KCSDezTHwSnM2i1QnQYMnVX+aSEe3OcrvQtaCueFdoI/nD1
 7OYdpYdftlpp4OjwJiDQxXbS0Cx1vs0m47dD11A==
X-Received: by 2002:a17:902:dacd:b0:234:ed31:fc94 with SMTP id
 d9443c01a7336-23dede7da1dmr27390335ad.26.1752217543049; 
 Fri, 11 Jul 2025 00:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfjSJHLgeM0M2Do31N1+QAgovoXnm79w652zr7NP0Nag3gzoTLyJzqF5x/s+jPBKpVC5odEA==
X-Received: by 2002:a17:902:dacd:b0:234:ed31:fc94 with SMTP id
 d9443c01a7336-23dede7da1dmr27389035ad.26.1752217540883; 
 Fri, 11 Jul 2025 00:05:40 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de433e51asm37908045ad.180.2025.07.11.00.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 00:05:40 -0700 (PDT)
Message-ID: <dd4cacef-e1ac-4d40-a88a-49ac5b377c46@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:05:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] tee: add Qualcomm TEE driver
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>
 <aGu47p_f1tN6ZXfN@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aGu47p_f1tN6ZXfN@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA0OCBTYWx0ZWRfX6v6JaDGX5U39
 7cW27UbZm16szt7X4sJtCYVMaZa0ar51uQ26mMJHM8bOMjVc5iGuVWQKyUCJrZeZp650ZssQRog
 OMAg4RZBK0Ffm0u/SGjJ7hX9VnC+7rQMmwZdyDwr6QetWxvF+/RvQaDo4KwFHhGe8uWAqaw4mfZ
 8WUKsZNdL1zpKPVCvZ6jJUOAw1cP/qMgbxtsytTHU6fPSlU8qEQg0Tceu6uI1TJMs3JjlxK6q7d
 fiYtLGTuVYvSPqXiO6odmNkG9N5tTMuM+b0MY5kBmFaDHf8+udWIYcZeQb9EUqmnzM4vFGrJgJR
 +ljiF9x/iV7LxM0wSWsg9N7UVaPNo5PcVdM2mOkQoF5d+ffMVNhIrwNLBZ98KbZOCCRgK58H2S3
 GcanaG1HnL3YCrNf/NzEhyO40VTAXNj6TIbMBc9fDObx1/aFhcYP5C2I/I3CEl32O+1m2zEY
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6870b7ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Nxq99-um2cliUNZAr6EA:9 a=ZUfRvDxL3zDVfLMF:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5u3Jld4AECb46gQ_TaL8rIArXthgLjd-
X-Proofpoint-GUID: 5u3Jld4AECb46gQ_TaL8rIArXthgLjd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110048
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

Hi Sumit,

Thank you so much for the comments.
Sorry for the large patch.

On 7/7/2025 10:09 PM, Sumit Garg wrote:
> Hi Amir,
> 
> On Mon, May 26, 2025 at 11:56:54PM -0700, Amirreza Zarrabi wrote:
>> Introduce qcomtee_object, which represents an object in both QTEE and
>> the kernel. QTEE clients can invoke an instance of qcomtee_object to
>> access QTEE services. If this invocation produces a new object in QTEE,
>> an instance of qcomtee_object will be returned.
>>
>> Similarly, QTEE can request services from by issuing a callback
>> request, which invokes an instance of qcomtee_object.
>>
>> Implement initial support for exporting qcomtee_object to userspace
>> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
>> through the TEE subsystem.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                          |   7 +
>>  drivers/tee/Kconfig                  |   1 +
>>  drivers/tee/Makefile                 |   1 +
>>  drivers/tee/qcomtee/Kconfig          |  11 +
>>  drivers/tee/qcomtee/Makefile         |   7 +
>>  drivers/tee/qcomtee/async.c          | 183 +++++++
>>  drivers/tee/qcomtee/call.c           | 827 +++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/core.c           | 921 +++++++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/qcomtee.h        | 224 +++++++++
>>  drivers/tee/qcomtee/qcomtee_msg.h    | 251 ++++++++++
>>  drivers/tee/qcomtee/qcomtee_object.h | 309 ++++++++++++
>>  drivers/tee/qcomtee/shm.c            | 153 ++++++
>>  drivers/tee/qcomtee/user_obj.c       | 694 ++++++++++++++++++++++++++
>>  include/uapi/linux/tee.h             |   1 +
>>  14 files changed, 3590 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e20de38ffa54..99fe1ae22ae0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20511,6 +20511,13 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
>>  F:	drivers/net/ethernet/qualcomm/rmnet/
>>  F:	include/linux/if_rmnet.h
>>  
>> +QUALCOMM TEE (QCOMTEE) DRIVER
>> +M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/tee/qcomtee/
>> +F:	include/linux/firmware/qcom/qcom_tee.h
>> +
>>  QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>  M:	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>  L:	linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
>> index 61b507c18780..3a995d7f0d74 100644
>> --- a/drivers/tee/Kconfig
>> +++ b/drivers/tee/Kconfig
>> @@ -16,5 +16,6 @@ if TEE
>>  source "drivers/tee/optee/Kconfig"
>>  source "drivers/tee/amdtee/Kconfig"
>>  source "drivers/tee/tstee/Kconfig"
>> +source "drivers/tee/qcomtee/Kconfig"
>>  
>>  endif
>> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
>> index 5488cba30bd2..74e987f8f7ea 100644
>> --- a/drivers/tee/Makefile
>> +++ b/drivers/tee/Makefile
>> @@ -6,3 +6,4 @@ tee-objs += tee_shm_pool.o
>>  obj-$(CONFIG_OPTEE) += optee/
>>  obj-$(CONFIG_AMDTEE) += amdtee/
>>  obj-$(CONFIG_ARM_TSTEE) += tstee/
>> +obj-$(CONFIG_QCOMTEE) += qcomtee/
>> diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
>> new file mode 100644
>> index 000000000000..e0ef254a3ccf
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/Kconfig
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +# Qualcomm Trusted Execution Environment Configuration
>> +config QCOMTEE
>> +	tristate "Qualcomm TEE Support"
>> +	select QCOM_SCM
>> +	select QCOM_TZMEM_MODE_SHMBRIDGE
>> +	help
>> +	  This option enables the Qualcomm Trusted Execution Environment (QTEE)
>> +	  driver. It provides an API to access services offered by QTEE and
>> +	  its loaded Trusted Applications (TAs). Additionally, it facilitates
>> +	  the export of userspace services provided by supplicants to QTEE.
>> diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
>> new file mode 100644
>> index 000000000000..600af2b8f1c1
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +obj-$(CONFIG_QCOMTEE) += qcomtee.o
>> +qcomtee-objs += async.o
>> +qcomtee-objs += call.o
>> +qcomtee-objs += core.o
>> +qcomtee-objs += shm.o
>> +qcomtee-objs += user_obj.o
>> diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
>> new file mode 100644
>> index 000000000000..b2dedca983f7
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/async.c
>> @@ -0,0 +1,183 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include "qcomtee.h"
>> +
>> +#define QCOMTEE_ASYNC_VERSION_1_0 0x00010000U /* Maj: 0x0001, Min: 0x0000. */
>> +#define QCOMTEE_ASYNC_VERSION_1_1 0x00010001U /* Maj: 0x0001, Min: 0x0001. */
>> +#define QCOMTEE_ASYNC_VERSION_1_2 0x00010002U /* Maj: 0x0001, Min: 0x0002. */
>> +#define QCOMTEE_ASYNC_VERSION_CURRENT QCOMTEE_ASYNC_VERSION_1_2
>> +
>> +#define QCOMTEE_ASYNC_VERSION_MAJOR(n) upper_16_bits(n)
>> +#define QCOMTEE_ASYNC_VERSION_MINOR(n) lower_16_bits(n)
>> +
>> +#define QCOMTEE_ASYNC_VERSION_CURRENT_MAJOR \
>> +	QCOMTEE_ASYNC_VERSION_MAJOR(QCOMTEE_ASYNC_VERSION_CURRENT)
>> +#define QCOMTEE_ASYNC_VERSION_CURRENT_MINOR \
>> +	QCOMTEE_ASYNC_VERSION_MINOR(QCOMTEE_ASYNC_VERSION_CURRENT)
>> +
>> +/**
>> + * struct qcomtee_async_msg_hdr - Asynchronous message header format.
>> + * @version: current async protocol version of the remote endpoint.
>> + * @op: async operation.
>> + *
>> + * @version specifies the endpoint's (QTEE or driver) supported async protocol.
>> + * For example, if QTEE sets @version to %QCOMTEE_ASYNC_VERSION_1_1, QTEE
>> + * handles operations supported in %QCOMTEE_ASYNC_VERSION_1_1 or
>> + * %QCOMTEE_ASYNC_VERSION_1_0. @op determines the message format.
>> + */
>> +struct qcomtee_async_msg_hdr {
>> +	u32 version;
>> +	u32 op;
>> +};
>> +
>> +/* Size of an empty async message. */
>> +#define QCOMTEE_ASYNC_MSG_ZERO sizeof(struct qcomtee_async_msg_hdr)
>> +
>> +/**
>> + * struct qcomtee_async_release_msg - Release asynchronous message.
>> + * @hdr: message header as &struct qcomtee_async_msg_hdr.
>> + * @counts: number of objects in @object_ids.
>> + * @object_ids: array of object IDs that should be released.
>> + *
>> + * Available in Maj = 0x0001, Min >= 0x0000.
>> + */
>> +struct qcomtee_async_release_msg {
>> +	struct qcomtee_async_msg_hdr hdr;
>> +	u32 counts;
>> +	u32 object_ids[] __counted_by(counts);
>> +};
>> +
>> +/**
>> + * qcomtee_get_async_buffer() - Get the start of the asynchronous message.
>> + * @oic: context used for the current invocation.
>> + * @async_buffer: return buffer to extract from or fill in async messages.
>> + *
>> + * If @oic is used for direct object invocation, the whole outbound buffer
>> + * is available for the async message. If @oic is used for a callback request,
>> + * the tail of the outbound buffer (after the callback request message) is
>> + * available for the async message.
>> + *
>> + * The start of the async buffer is aligned, see qcomtee_msg_offset_align().
>> + */
>> +static void qcomtee_get_async_buffer(struct qcomtee_object_invoke_ctx *oic,
>> +				     struct qcomtee_buffer *async_buffer)
>> +{
>> +	struct qcomtee_msg_callback *msg;
>> +	unsigned int offset;
>> +	int i;
>> +
>> +	if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY)) {
>> +		/* The outbound buffer is empty. Using the whole buffer. */
>> +		offset = 0;
>> +	} else {
>> +		msg = (struct qcomtee_msg_callback *)oic->out_msg.addr;
>> +
>> +		/* Start offset in a message for buffer arguments. */
>> +		offset = qcomtee_msg_buffer_args(struct qcomtee_msg_callback,
>> +						 qcomtee_msg_args(msg));
>> +
>> +		/* Add size of IB arguments. */
>> +		qcomtee_msg_for_each_input_buffer(i, msg)
>> +			offset += qcomtee_msg_offset_align(msg->args[i].b.size);
>> +
>> +		/* Add size of OB arguments. */
>> +		qcomtee_msg_for_each_output_buffer(i, msg)
>> +			offset += qcomtee_msg_offset_align(msg->args[i].b.size);
>> +	}
>> +
>> +	async_buffer->addr = oic->out_msg.addr + offset;
>> +	async_buffer->size = oic->out_msg.size - offset;
>> +}
>> +
>> +/**
>> + * async_release() - Process QTEE async release requests.
>> + * @oic: context used for the current invocation.
>> + * @msg: async message for object release.
>> + * @size: size of the async buffer available.
>> + *
>> + * Return: Size of the outbound buffer used when processing @msg.
>> + */
>> +static size_t async_release(struct qcomtee_object_invoke_ctx *oic,
>> +			    struct qcomtee_async_msg_hdr *async_msg,
>> +			    size_t size)
>> +{
>> +	struct qcomtee_async_release_msg *msg;
>> +	struct qcomtee_object *object;
>> +	int i;
>> +
>> +	msg = (struct qcomtee_async_release_msg *)async_msg;
>> +
>> +	for (i = 0; i < msg->counts; i++) {
>> +		object = qcomtee_idx_erase(oic, msg->object_ids[i]);
>> +		qcomtee_object_put(object);
>> +	}
>> +
>> +	return struct_size(msg, object_ids, msg->counts);
>> +}
>> +
>> +/**
>> + * qcomtee_fetch_async_reqs() - Fetch and process asynchronous messages.
>> + * @oic: context used for the current invocation.
>> + *
>> + * Calls handlers to process the requested operations in the async message.
>> + * Currently, only supports async release requests.
>> + */
>> +void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_async_msg_hdr *async_msg;
>> +	struct qcomtee_buffer async_buffer;
>> +	size_t consumed, used = 0;
>> +	u16 async_msg_ver;
>> +
>> +	qcomtee_get_async_buffer(oic, &async_buffer);
>> +
>> +	while (async_buffer.size - used > QCOMTEE_ASYNC_MSG_ZERO) {
>> +		async_msg = (struct qcomtee_async_msg_hdr *)(async_buffer.addr +
>> +							     used);
>> +		/*
>> +		 * QTEE assumes that the unused space of the async buffer is
>> +		 * zeroed; so if version is zero, the buffer is unused.
>> +		 */
>> +		if (!async_msg->version)
>> +			goto out;
>> +
>> +		async_msg_ver = QCOMTEE_ASYNC_VERSION_MAJOR(async_msg->version);
>> +		/* Major version mismatch is a compatibility break. */
>> +		if (async_msg_ver != QCOMTEE_ASYNC_VERSION_CURRENT_MAJOR) {
>> +			pr_err("Async message version mismatch (%u != %u)\n",
>> +			       async_msg_ver,
>> +			       QCOMTEE_ASYNC_VERSION_CURRENT_MAJOR);
>> +
>> +			goto out;
>> +		}
>> +
>> +		switch (async_msg->op) {
>> +		case QCOMTEE_MSG_OBJECT_OP_RELEASE:
>> +			consumed = async_release(oic, async_msg,
>> +						 async_buffer.size - used);
>> +			break;
>> +		default:
>> +			pr_err("Unsupported async message %u\n", async_msg->op);
>> +			goto out;
>> +		}
>> +
>> +		/* Supported operation but unable to parse the message. */
>> +		if (!consumed) {
>> +			pr_err("Unable to parse async message for op %u\n",
>> +			       async_msg->op);
>> +			goto out;
>> +		}
>> +
>> +		/* Next async message. */
>> +		used += qcomtee_msg_offset_align(consumed);
>> +	}
>> +
>> +out:
>> +	/* Reset the async buffer so async requests do not loop to QTEE. */
>> +	memzero_explicit(async_buffer.addr, async_buffer.size);
>> +}
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> new file mode 100644
>> index 000000000000..cd117295fce3
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -0,0 +1,827 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/slab.h>
>> +#include <linux/tee.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/xarray.h>
>> +
>> +#include "qcomtee.h"
>> +
>> +/* QTEE version. */
>> +static u32 qtee_version;
> 
> Why not make this as a local variable?
> 

Moved to struct qcomtee.

>> +
>> +static int find_qtee_object(struct qcomtee_object **object, unsigned long id,
>> +			    struct qcomtee_context_data *ctxdata)
>> +{
>> +	int err = 0;
>> +
>> +	guard(rcu)();
> 
> Is there any real advantage of using rcu here instead of qtee_lock?
>

Both idr_find() and qcomtee_object_get() are already rcu-safe.
find_qtee_object() is called in a loop for every object in the param array
in nearly all cases, so it's reasonable to do this without a mutex.

>> +	/* Object release is RCU protected. */
>> +	*object = idr_find(&ctxdata->qtee_objects_idr, id);
>> +	if (!qcomtee_object_get(*object))
>> +		err = -EINVAL;
>> +
>> +	return err;
>> +}
>> +
>> +static void del_qtee_object(unsigned long id,
>> +			    struct qcomtee_context_data *ctxdata)
>> +{
>> +	struct qcomtee_object *object;
>> +
>> +	scoped_guard(mutex, &ctxdata->qtee_lock)
>> +		object = idr_remove(&ctxdata->qtee_objects_idr, id);
>> +
>> +	qcomtee_object_put(object);
>> +}
>> +
>> +/**
>> + * qcomtee_context_add_qtee_object() - Add a QTEE object to the context.
>> + * @param: TEE parameter representing @object.
>> + * @object: QTEE object.
>> + * @ctx: context to add the object.
>> + *
>> + * It assumes @object is %QCOMTEE_OBJECT_TYPE_TEE and the caller has already
>> + * issued qcomtee_object_get() for @object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_context_add_qtee_object(struct tee_param *param,
>> +				    struct qcomtee_object *object,
>> +				    struct tee_context *ctx)
>> +{
>> +	int ret;
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	scoped_guard(mutex, &ctxdata->qtee_lock)
>> +		ret = idr_alloc(&ctxdata->qtee_objects_idr, object, 0, 0,
>> +				GFP_KERNEL);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	param->u.objref.id = ret;
>> +	/* QTEE Object: QCOMTEE_OBJREF_FLAG_TEE set. */
>> +	param->u.objref.flags = QCOMTEE_OBJREF_FLAG_TEE;
>> +
>> +	return 0;
>> +}
>> +
>> +/* Retrieve the QTEE object added with qcomtee_context_add_qtee_object(). */
>> +int qcomtee_context_find_qtee_object(struct qcomtee_object **object,
>> +				     struct tee_param *param,
>> +				     struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	/* 'qtee_objects_idr' stores QTEE objects only. */
>> +	if (!(param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE))
>> +		return -EINVAL;
> 
> This check is already performed by the caller of this API, hence it can
> be dropped here.
> 

Dropped.

>> +
>> +	return find_qtee_object(object, param->u.objref.id, ctxdata);
>> +}
>> +
>> +/**
>> + * qcomtee_context_del_qtee_object() - Delete a QTEE object from the context.
>> + * @param: TEE parameter representing @object.
>> + * @ctx: context for deleting the object.
>> + *
>> + * The @param has been initialized by qcomtee_context_add_qtee_object().
>> + */
>> +void qcomtee_context_del_qtee_object(struct tee_param *param,
>> +				     struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	/* 'qtee_objects_idr' stores QTEE objects only. */
>> +	if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE)
>> +		del_qtee_object(param->u.objref.id, ctxdata);
>> +}
>> +
>> +/**
>> + * qcomtee_objref_to_arg() - Convert OBJREF parameter to QTEE argument.
>> + * @arg: QTEE argument.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @param is an OBJREF.
>> + * It does not set @arg.type; the caller should initialize it to a correct
>> + * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
>> + * the caller should manage to put it afterward.
>> + *
>> + * For user objects (i.e. (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_USER)),
>> + * qcomtee_user_param_to_object() calls qcomtee_object_get() to keep a
>> + * temporary copy for the driver as the release of objects are asynchronous
>> + * and they may go away even before returning from the invocation.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
>> +			  struct tee_context *ctx)
>> +{
>> +	int err;
>> +
>> +	/* param is a NULL object: */
>> +	if (param->u.objref.id == TEE_OBJREF_NULL) {
>> +		arg->o = NULL_QCOMTEE_OBJECT;
>> +
>> +		return 0;
>> +	}
>> +
>> +	/* param is a callback object: */
>> +	if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_USER) {
>> +		err = qcomtee_user_param_to_object(&arg->o, param, ctx);
>> +	/* param is a QTEE object: */
>> +	} else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE) {
>> +		err = qcomtee_context_find_qtee_object(&arg->o, param, ctx);
>> +	} else {
>> +		err = -EINVAL;
>> +	}
>> +
>> +	if (err)
>> +		arg->o = NULL_QCOMTEE_OBJECT;
>> +
>> +	return err;
>> +}
> 
> This API can rather be simplified as follows:
> 
> int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
> 			  struct tee_context *ctx)
> {
> 	arg->o = NULL_QCOMTEE_OBJECT;
> 	if (param->u.objref.id == TEE_OBJREF_NULL)
> 		return 0;
> 
> 	if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_USER)
> 		return qcomtee_user_param_to_object(&arg->o, param, ctx);
> 	else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE)
> 		return qcomtee_context_find_qtee_object(&arg->o, param, ctx);
> 
> 	return -EINVAL;
> }
> 
> I think you can look at similar improvements at other places too.
> 

Done, also qcomtee_objref_from_arg().

>> +
>> +/**
>> + * qcomtee_objref_from_arg() - Convert QTEE argument to OBJREF param.
>> + * @param: TEE parameter.
>> + * @arg: QTEE argument.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @arg is of %QCOMTEE_ARG_TYPE_IO or %QCOMTEE_ARG_TYPE_OO.
>> + * It does not set @param.attr; the caller should initialize it to a
>> + * correct type.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>> +			    struct tee_context *ctx)
>> +{
>> +	struct qcomtee_object *object;
>> +	int err;
>> +
>> +	/* param should be of OBJREF. */
>> +	if (param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
>> +	    param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT &&
>> +	    param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT)
>> +		return -EINVAL;
>> +
>> +	object = arg->o;
>> +
>> +	switch (typeof_qcomtee_object(object)) {
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		param->u.objref.id = TEE_OBJREF_NULL;
>> +		err = 0;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		if (is_qcomtee_user_object(object))
>> +			err = qcomtee_user_param_from_object(param, object,
>> +							     ctx);
>> +		else
>> +			err = -EINVAL;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +		err = qcomtee_context_add_qtee_object(param, object, ctx);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * qcomtee_params_to_args() - Convert TEE parameters to QTEE arguments.
>> + * @u: QTEE arguments.
>> + * @params: TEE parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @u has at least @num_params + 1 entries and has been initialized
>> + * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_params_to_args(struct qcomtee_arg *u,
>> +				  struct tee_param *params, int num_params,
>> +				  struct tee_context *ctx)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < num_params; i++) {
>> +		switch (params[i].attr) {
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
>> +			u[i].b.uaddr = params[i].u.ubuf.uaddr;
>> +			u[i].b.size = params[i].u.ubuf.size;
>> +
>> +			if (params[i].attr ==
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
>> +				u[i].type = QCOMTEE_ARG_TYPE_IB;
>> +			else /* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
>> +				u[i].type = QCOMTEE_ARG_TYPE_OB;
>> +
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>> +			u[i].type = QCOMTEE_ARG_TYPE_IO;
>> +			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
>> +				goto out_failed;
>> +
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>> +			u[i].type = QCOMTEE_ARG_TYPE_OO;
>> +			u[i].o = NULL_QCOMTEE_OBJECT;
>> +			break;
>> +		default:
>> +			goto out_failed;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_to_arg(). */
>> +	for (i--; i >= 0; i--) {
>> +		if (u[i].type != QCOMTEE_ARG_TYPE_IO)
>> +			continue;
>> +
>> +		qcomtee_user_object_set_notify(u[i].o, false);
>> +		if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
>> +			qcomtee_object_put(u[i].o);
>> +
>> +		qcomtee_object_put(u[i].o);
> 
> Any reason for double qcomtee_object_put()? double free?
> 

I updated the comments to include more details.

An object hosted in the non-secure world can be released via asynchronous messages.
This means the object may be gone even before the QTEE call returns. We hold a
temporary reference in the driver for each local object sent to QTEE. So even
if QTEE releases it, the object remains valid until the very last moment - when
we process the response.

>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * qcomtee_params_from_args() - Convert QTEE arguments to TEE parameters.
>> + * @params: TEE parameters.
>> + * @u: QTEE arguments.
>> + * @num_params: number of elements in the parameter array.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * @u should have already been initialized by qcomtee_params_to_args().
>> + * This also represents the end of a QTEE invocation that started with
>> + * qcomtee_params_to_args() by releasing %QCOMTEE_ARG_TYPE_IO objects.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_params_from_args(struct tee_param *params,
>> +				    struct qcomtee_arg *u, int num_params,
>> +				    struct tee_context *ctx)
>> +{
>> +	int i, np;
>> +
>> +	qcomtee_arg_for_each(np, u) {
>> +		switch (u[np].type) {
>> +		case QCOMTEE_ARG_TYPE_OB:
>> +			/* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
>> +			params[np].u.ubuf.size = u[np].b.size;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_IO:
>> +			/* IEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT */
>> +			qcomtee_object_put(u[np].o);
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OO:
>> +			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
>> +			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_IB:
>> +		default:
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_from_arg(). */
>> +	for (i = 0; i < np; i++) {
>> +		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
>> +			qcomtee_context_del_qtee_object(&params[i], ctx);
>> +	}
>> +
>> +	/* Release any IO and OO objects not processed. */
>> +	for (; u[i].type; i++) {
> 
> Why the loop here is not bounded to number of params?
> 

It wasn’t necessary, since u is already initialized to mirror params
in qcomtee_params_to_args(). However, I added it anyway just to be safe.

>> +		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
>> +		    u[i].type == QCOMTEE_ARG_TYPE_IO)
>> +			qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/* TEE Device Ops. */
>> +
>> +static int qcomtee_params_check(struct tee_param *params, int num_params)
>> +{
>> +	int io = 0, oo = 0, ib = 0, ob = 0;
>> +	int i;
>> +
>> +	/* QTEE can accept 64 arguments. */
>> +	if (num_params > QCOMTEE_ARGS_MAX)
>> +		return -EINVAL;
>> +
>> +	/* Supported parameter types. */
>> +	for (i = 0; i < num_params; i++) {
>> +		switch (params[i].attr) {
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +			ib++;
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +			ob++;
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>> +			io++;
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>> +			oo++;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	/*  QTEE can accept 16 arguments of each supported types. */
>> +	if (io > QCOMTEE_ARGS_PER_TYPE || oo > QCOMTEE_ARGS_PER_TYPE ||
>> +	    ib > QCOMTEE_ARGS_PER_TYPE || ob > QCOMTEE_ARGS_PER_TYPE)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
>> +static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>> +				     int num_params)
>> +{
>> +	/* Some privileged operations recognized by QTEE. */
>> +	if (op == QCOMTEE_ROOT_OP_NOTIFY_DOMAIN_CHANGE ||
>> +	    op == QCOMTEE_ROOT_OP_ADCI_ACCEPT ||
>> +	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
>> +	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
>> +	 * credential object represents a privileged client for QTEE and
>> +	 * is used by the kernel only.
>> +	 */
>> +	if (op == QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS && num_params == 2) {
>> +		if (params[0].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
>> +		    params[1].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT) {
>> +			if (params[0].u.objref.id == TEE_OBJREF_NULL)
>> +				return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_object_invoke() - Invoke a QTEE object.
>> + * @ctx: TEE context.
>> + * @arg: ioctl arguments.
>> + * @params: parameters for the object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_object_invoke(struct tee_context *ctx,
>> +				 struct tee_ioctl_object_invoke_arg *arg,
>> +				 struct tee_param *params)
>> +{
>> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_arg *u __free(kfree) = NULL;
>> +	struct qcomtee_object *object;
>> +	int i, ret, result;
>> +
>> +	if (qcomtee_params_check(params, arg->num_params))
>> +		return -EINVAL;
>> +
>> +	/* First, handle reserved operations: */
>> +	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>> +		del_qtee_object(arg->id, ctxdata);
>> +
>> +		return 0;
>> +	}
>> +
>> +	/* Otherwise, invoke a QTEE object: */
>> +	oic = qcomtee_object_invoke_ctx_alloc(ctx);
>> +	if (!oic)
>> +		return -ENOMEM;
>> +
>> +	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
>> +	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
>> +	if (!u)
>> +		return -ENOMEM;
>> +
>> +	/* Get an object to invoke. */
>> +	if (arg->id == TEE_OBJREF_NULL) {
>> +		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
>> +		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
>> +			return -EINVAL;
>> +
>> +		object = ROOT_QCOMTEE_OBJECT;
>> +	} else if (find_qtee_object(&object, arg->id, ctxdata)) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = qcomtee_object_do_invoke(oic, object, arg->op, u, &result);
>> +	if (ret) {
>> +		qcomtee_arg_for_each_input_object(i, u) {
>> +			qcomtee_user_object_set_notify(u[i].o, false);
>> +			qcomtee_object_put(u[i].o);
>> +		}
>> +
>> +		goto out;
>> +	}
>> +
>> +	if (!result) {
>> +		/* Assume service is UNAVAIL if unable to process the result. */
>> +		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
>> +			result = QCOMTEE_MSG_ERROR_UNAVAIL;
>> +	} else {
>> +		/*
>> +		 * qcomtee_params_to_args() gets a copy of IO for the driver to
>> +		 * make sure they do not get released while in the middle of
>> +		 * invocation. On success (!result), qcomtee_params_from_args()
>> +		 * puts them; Otherwise, put them here.
>> +		 */
>> +		qcomtee_arg_for_each_input_object(i, u)
>> +			qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	arg->ret = result;
>> +out:
>> +	qcomtee_object_put(object);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_supp_recv() - Wait for a request for the supplicant.
>> + * @ctx: TEE context.
>> + * @op: requested operation on the object.
>> + * @num_params: number of elements in the parameter array.
>> + * @params: parameters for @op.
>> + *
>> + * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT.
>> + * On input, it provides a user buffer. This buffer is used for parameters of
>> + * type %TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT in qcomtee_cb_params_from_args().
>> + * On output, the object ID and request ID are stored in the meta parameter.
>> + *
>> + * @num_params is updated to the number of parameters that actually exist
>> + * in @params on return.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_supp_recv(struct tee_context *ctx, u32 *op, u32 *num_params,
>> +			     struct tee_param *params)
>> +{
>> +	struct qcomtee_user_object_request_data data;
>> +	void __user *uaddr;
>> +	size_t ubuf_size;
>> +	int i, ret;
>> +
>> +	if (!*num_params)
>> +		return -EINVAL;
>> +
>> +	/* We expect the first parameter to be an INOUT + meta parameter. */
> 
> Lets write comments in impertive mood, no "We" or "I" here and other
> places in this patch-set.
> 

Ack.

>> +	if (params->attr !=
>> +	    (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT | TEE_IOCTL_PARAM_ATTR_META))
>> +		return -EINVAL;
>> +
>> +	/* Other parameters are none. */
>> +	for (i = 1; i < *num_params; i++)
>> +		if (params[i].attr)
>> +			return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(params->u.value.a, 8))
>> +		return -EINVAL;
>> +
>> +	/* User buffer and size from meta parameter. */
>> +	uaddr = u64_to_user_ptr(params->u.value.a);
>> +	ubuf_size = params->u.value.b;
>> +	/* Process TEE parameters. +/-1 to ignore the meta parameter. */
>> +	ret = qcomtee_user_object_select(ctx, params + 1, *num_params - 1,
>> +					 uaddr, ubuf_size, &data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	params->u.value.a = data.object_id;
>> +	params->u.value.b = data.id;
>> +	params->u.value.c = 0;
>> +	*op = data.op;
>> +	*num_params = data.np + 1;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_supp_send() - Submit a response for a request.
>> + * @ctx: TEE context.
>> + * @errno: return value for the request.
>> + * @num_params: number of elements in the parameter array.
>> + * @params: returned parameters.
>> + *
>> + * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT.
>> + * It specifies the request ID this response belongs to.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num_params,
>> +			     struct tee_param *params)
>> +{
>> +	int req_id;
>> +
>> +	if (!num_params)
>> +		return -EINVAL;
>> +
>> +	/* We expect the first parameter to be an OUTPUT + meta parameter. */
>> +	if (params->attr != (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT |
>> +			     TEE_IOCTL_PARAM_ATTR_META))
>> +		return -EINVAL;
>> +
>> +	req_id = params->u.value.a;
>> +	/* Process TEE parameters. +/-1 to ignore the meta parameter. */
>> +	return qcomtee_user_object_submit(ctx, params + 1, num_params - 1,
>> +					  req_id, errno);
>> +}
>> +
>> +static int qcomtee_open(struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
>> +
>> +	ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
>> +	if (!ctxdata)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * In the QTEE driver, the same context is used to refcount resources
>> +	 * shared by QTEE. For example, teedev_ctx_get() is called for any
>> +	 * instance of callback objects (see qcomtee_user_param_to_object()).
>> +	 *
>> +	 * Maintain a copy of teedev for QTEE as it serves as a direct user of
>> +	 * this context. The teedev will be released in the context's release().
>> +	 *
>> +	 * tee_device_unregister() will remain blocked until all contexts
>> +	 * are released. This includes contexts owned by the user, which are
>> +	 * closed by teedev_close_context(), as well as those owned by QTEE
>> +	 * closed by teedev_ctx_put() in object's release().
>> +	 */
>> +	if (!tee_device_get(ctx->teedev))
>> +		return -EINVAL;
>> +
>> +	idr_init(&ctxdata->qtee_objects_idr);
>> +	mutex_init(&ctxdata->qtee_lock);
>> +	idr_init(&ctxdata->reqs_idr);
>> +	INIT_LIST_HEAD(&ctxdata->reqs_list);
>> +	mutex_init(&ctxdata->reqs_lock);
>> +	init_completion(&ctxdata->req_c);
>> +
>> +	ctx->data = no_free_ptr(ctxdata);
>> +
>> +	return 0;
>> +}
>> +
>> +/* This is called when the user closes the device. */
> 
> Comment here can be rather phrased as:
> 
> /* Gets called when the user closes the device */
> 
> Ditto for other places too.
> 

Ack.

>> +static void qcomtee_close_context(struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_object *object;
>> +	int id;
>> +
>> +	/* Process QUEUED or PROCESSING requests. */
>> +	qcomtee_requests_destroy(ctxdata);
>> +	/* Release QTEE objects. */
>> +	idr_for_each_entry(&ctxdata->qtee_objects_idr, object, id)
>> +		qcomtee_object_put(object);
>> +}
>> +
>> +/* This is called when the final reference to the context goes away. */
>> +static void qcomtee_release(struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	idr_destroy(&ctxdata->qtee_objects_idr);
>> +	idr_destroy(&ctxdata->reqs_idr);
>> +	kfree(ctxdata);
>> +
>> +	/* There is nothing shared in this context with QTEE. */
>> +	tee_device_put(ctx->teedev);
>> +}
>> +
>> +static void qcomtee_get_version(struct tee_device *teedev,
>> +				struct tee_ioctl_version_data *vers)
>> +{
>> +	struct tee_ioctl_version_data v = {
>> +		.impl_id = TEE_IMPL_ID_QTEE,
>> +		.gen_caps = TEE_GEN_CAP_OBJREF,
>> +	};
>> +
>> +	*vers = v;
>> +}
>> +
>> +/**
>> + * qcomtee_get_qtee_feature_list() - Query QTEE features versions.
>> + * @ctx: TEE context.
>> + * @id: ID of the feature to query.
>> + * @version: version of the feature.
>> + *
>> + * This function is used to query the verion of features supported by QTEE.
>> + */
>> +static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>> +					  u32 *version)
>> +{
>> +	struct qcomtee_object_invoke_ctx *oic __free(kfree);
>> +	struct qcomtee_object *client_env, *service;
>> +	struct qcomtee_arg u[3] = { 0 };
>> +	int result;
>> +
>> +	oic = qcomtee_object_invoke_ctx_alloc(ctx);
>> +	if (!oic)
>> +		return;
>> +
>> +	client_env = qcomtee_object_get_client_env(oic);
>> +	if (client_env == NULL_QCOMTEE_OBJECT)
>> +		return;
>> +
>> +	/* Get ''FeatureVersions Service'' object. */
>> +	service = qcomtee_object_get_service(oic, client_env,
>> +					     QCOMTEE_FEATURE_VER_UID);
>> +	if (service == NULL_QCOMTEE_OBJECT)
>> +		goto out_failed;
>> +
>> +	/* IB: Feature to query. */
>> +	u[0].b.addr = &id;
>> +	u[0].b.size = sizeof(id);
>> +	u[0].type = QCOMTEE_ARG_TYPE_IB;
>> +
>> +	/* OB: Version returned. */
>> +	u[1].b.addr = version;
>> +	u[1].b.size = sizeof(*version);
>> +	u[1].type = QCOMTEE_ARG_TYPE_OB;
>> +
>> +	qcomtee_object_do_invoke(oic, service, QCOMTEE_FEATURE_VER_OP_GET, u,
>> +				 &result);
>> +
>> +out_failed:
>> +	qcomtee_object_put(service);
>> +	qcomtee_object_put(client_env);
>> +}
>> +
>> +static const struct tee_driver_ops qcomtee_ops = {
>> +	.get_version = qcomtee_get_version,
>> +	.open = qcomtee_open,
>> +	.close_context = qcomtee_close_context,
>> +	.release = qcomtee_release,
>> +	.object_invoke_func = qcomtee_object_invoke,
>> +	.supp_recv = qcomtee_supp_recv,
>> +	.supp_send = qcomtee_supp_send,
>> +};
>> +
>> +static const struct tee_desc qcomtee_desc = {
>> +	.name = "qcomtee",
>> +	.ops = &qcomtee_ops,
>> +	.owner = THIS_MODULE,
>> +};
>> +
>> +static int qcomtee_probe(struct platform_device *pdev)
>> +{
>> +	struct workqueue_struct *async_wq;
>> +	struct tee_device *teedev;
>> +	struct tee_shm_pool *pool;
>> +	struct tee_context *ctx;
>> +	struct qcomtee *qcomtee;
>> +	int err;
>> +
>> +	qcomtee = kzalloc(sizeof(*qcomtee), GFP_KERNEL);
>> +	if (!qcomtee)
>> +		return -ENOMEM;
>> +
>> +	pool = qcomtee_shm_pool_alloc();
>> +	if (IS_ERR(pool)) {
>> +		err = PTR_ERR(pool);
>> +
>> +		goto err_free_qcomtee;
>> +	}
>> +
>> +	teedev = tee_device_alloc(&qcomtee_desc, NULL, pool, qcomtee);
>> +	if (IS_ERR(teedev)) {
>> +		err = PTR_ERR(teedev);
>> +
>> +		goto err_pool_destroy;
>> +	}
>> +
>> +	qcomtee->teedev = teedev;
>> +	qcomtee->pool = pool;
>> +	err = tee_device_register(qcomtee->teedev);
>> +	if (err)
>> +		goto err_unreg_teedev;
>> +
>> +	platform_set_drvdata(pdev, qcomtee);
>> +	/* Start async wq. */
>> +	async_wq = alloc_ordered_workqueue("qcomtee_wq", 0);
>> +	if (!async_wq)
>> +		goto err_unreg_teedev;
>> +
>> +	qcomtee->wq = async_wq;
>> +	/* Driver context used for async operations of teedev. */
>> +	ctx = teedev_open(qcomtee->teedev);
>> +	if (IS_ERR(ctx)) {
>> +		err = PTR_ERR(ctx);
>> +
>> +		goto err_dest_wq;
>> +	}
>> +
>> +	qcomtee->ctx = ctx;
>> +	/* Init Object table. */
>> +	qcomtee->xa_last_id = 0;
>> +	xa_init_flags(&qcomtee->xa_local_objects, XA_FLAGS_ALLOC);
>> +	/* Get QTEE verion. */
>> +	qcomtee_get_qtee_feature_list(qcomtee->ctx,
>> +				      QCOMTEE_FEATURE_VER_OP_GET_QTEE_ID,
>> +				      &qtee_version);
>> +
>> +	pr_info("QTEE version %u.%u.%u\n",
>> +		QTEE_VERSION_GET_MAJOR(qtee_version),
>> +		QTEE_VERSION_GET_MINOR(qtee_version),
>> +		QTEE_VERSION_GET_PATCH(qtee_version));
>> +
>> +	return 0;
>> +
>> +err_dest_wq:
>> +	destroy_workqueue(qcomtee->wq);
>> +err_unreg_teedev:
>> +	tee_device_unregister(qcomtee->teedev);
>> +err_pool_destroy:
>> +	tee_shm_pool_free(pool);
>> +err_free_qcomtee:
>> +	kfree(qcomtee);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * qcomtee_remove() - Device Removal Routine.
>> + * @pdev: platform device information struct.
>> + *
>> + * It is called by the platform subsystem to alert the driver that it should
>> + * release the device.
>> + *
>> + * QTEE does not provide an API to inform it about a callback object going away.
>> + * However, when releasing QTEE objects, any callback object sent to QTEE
>> + * previously would be released by QTEE as part of the object release.
>> + */
>> +static void qcomtee_remove(struct platform_device *pdev)
>> +{
>> +	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
>> +
>> +	teedev_close_context(qcomtee->ctx);
>> +	/* Wait for RELEASE operations to be processed for QTEE objects. */
>> +	tee_device_unregister(qcomtee->teedev);
>> +	destroy_workqueue(qcomtee->wq);
>> +	tee_shm_pool_free(qcomtee->pool);
>> +	kfree(qcomtee);
>> +}
>> +
>> +static const struct platform_device_id qcomtee_ids[] = { { "qcomtee", 0 }, {} };
>> +MODULE_DEVICE_TABLE(platform, qcomtee_ids);
>> +
>> +static struct platform_driver qcomtee_platform_driver = {
>> +	.probe = qcomtee_probe,
>> +	.remove = qcomtee_remove,
>> +	.driver = {
>> +		.name = "qcomtee",
>> +	},
>> +	.id_table = qcomtee_ids,
>> +};
>> +
>> +module_platform_driver(qcomtee_platform_driver);
>> +
>> +MODULE_AUTHOR("Qualcomm");
>> +MODULE_DESCRIPTION("QTEE driver");
>> +MODULE_VERSION("1.0");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>> new file mode 100644
>> index 000000000000..0e7f3ab8242a
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/core.c
>> @@ -0,0 +1,921 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/firmware/qcom/qcom_scm.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/xarray.h>
>> +
>> +#include "qcomtee.h"
>> +
>> +/* This is the QTEE root object. */
>> +struct qcomtee_object qcomtee_object_root = {
>> +	.name = "root",
>> +	.object_type = QCOMTEE_OBJECT_TYPE_ROOT,
>> +	.info.qtee_id = QCOMTEE_MSG_OBJECT_ROOT,
>> +};
>> +
>> +/* Next argument of type @type after index @i. */
>> +int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
>> +			  enum qcomtee_arg_type type)
>> +{
>> +	while (u[i].type != QCOMTEE_ARG_TYPE_INV && u[i].type != type)
>> +		i++;
>> +	return i;
>> +}
>> +
>> +/*
>> + * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
>> + * of the QCOMTEE_OBJECT_TYPE_CB type.
>> + */
>> +#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
>> +#define QCOMTEE_OBJECT_ID_END (U32_MAX)
>> +
>> +#define QCOMTEE_OBJECT_SET(p, type, ...) \
>> +	__QCOMTEE_OBJECT_SET(p, type, ##__VA_ARGS__, 0UL)
>> +#define __QCOMTEE_OBJECT_SET(p, type, optr, ...)           \
>> +	do {                                               \
>> +		(p)->object_type = (type);                 \
>> +		(p)->info.qtee_id = (unsigned long)(optr); \
>> +	} while (0)
>> +
>> +static struct qcomtee_object *
>> +qcomtee_qtee_object_alloc(struct qcomtee_object_invoke_ctx *oic,
>> +			  unsigned int object_id)
>> +{
>> +	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
>> +	struct qcomtee_object *object;
>> +
>> +	object = kzalloc(sizeof(*object), GFP_KERNEL);
>> +	if (!object)
>> +		return NULL_QCOMTEE_OBJECT;
>> +
>> +	/* If failed, "no-name". */
>> +	object->name = kasprintf(GFP_KERNEL, "qcomtee-%u", object_id);
>> +	QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_TEE, object_id);
>> +	kref_init(&object->refcount);
>> +	/* A QTEE object requires a context for async operations. */
>> +	object->info.qcomtee_async_ctx = qcomtee->ctx;
>> +	teedev_ctx_get(object->info.qcomtee_async_ctx);
>> +
>> +	return object;
>> +}
>> +
>> +static void qcomtee_qtee_object_free(struct qcomtee_object *object)
>> +{
>> +	/* See qcomtee_qtee_object_alloc(). */
>> +	teedev_ctx_put(object->info.qcomtee_async_ctx);
>> +
>> +	kfree(object->name);
>> +	kfree(object);
>> +}
>> +
>> +static void qcomtee_do_release_qtee_object(struct work_struct *work)
>> +{
>> +	struct qcomtee_object *object;
>> +	struct qcomtee *qcomtee;
>> +	int ret, result;
>> +
>> +	/* RELEASE does not require any argument. */
>> +	struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };
>> +
>> +	object = container_of(work, struct qcomtee_object, work);
>> +	qcomtee = tee_get_drvdata(object->info.qcomtee_async_ctx->teedev);
>> +	/* Get the TEE context used for asynchronous operations. */
>> +	qcomtee->oic.ctx = object->info.qcomtee_async_ctx;
>> +
>> +	ret = qcomtee_object_do_invoke_internal(&qcomtee->oic, object,
>> +						QCOMTEE_MSG_OBJECT_OP_RELEASE,
>> +						args, &result);
>> +
>> +	/* Is it safe to retry the release? */
> 
> Does this means we could be in a dead loop here? Would a WARN_ONCE()
> with a bailout better here?
> 

-EAGAIN only occurs when QTEE is overloaded and unable to process the
request immediately. We do not expect this to happen in a dead loop.
We cannot drop the release requests, as doing so would cause the QTEE
object table to fill up and become unresponsive.

>> +	if (ret == -EAGAIN) {
>> +		queue_work(qcomtee->wq, &object->work);
>> +	} else {
>> +		if (ret || result)
>> +			pr_err("%s release failed, ret = %d (%x)\n",
>> +			       qcomtee_object_name(object), ret, result);
>> +		qcomtee_qtee_object_free(object);
>> +	}
>> +}
>> +
>> +static void qcomtee_release_qtee_object(struct qcomtee_object *object)
>> +{
>> +	struct qcomtee *qcomtee =
>> +		tee_get_drvdata(object->info.qcomtee_async_ctx->teedev);
>> +
>> +	INIT_WORK(&object->work, qcomtee_do_release_qtee_object);
>> +	queue_work(qcomtee->wq, &object->work);
>> +}
>> +
>> +static void qcomtee_object_release(struct kref *refcount)
>> +{
>> +	struct qcomtee_object *object;
>> +	const char *name;
>> +
>> +	object = container_of(refcount, struct qcomtee_object, refcount);
>> +
>> +	/*
>> +	 * qcomtee_object_get() is called in a RCU read lock. synchronize_rcu()
>> +	 * to avoid releasing the object while it is being accessed in
>> +	 * qcomtee_object_get().
>> +	 */
>> +	synchronize_rcu();
>> +
>> +	switch (typeof_qcomtee_object(object)) {
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +		qcomtee_release_qtee_object(object);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		name = object->name;
>> +
>> +		if (object->ops->release)
>> +			object->ops->release(object);
>> +
>> +		kfree_const(name);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +/**
>> + * qcomtee_object_get() - Increase the object's reference count.
>> + * @object: object to increase the reference count.
>> + *
>> + * Context: The caller should hold RCU read lock.
>> + */
>> +int qcomtee_object_get(struct qcomtee_object *object)
>> +{
>> +	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
>> +		return kref_get_unless_zero(&object->refcount);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_object_put() - Decrease the object's reference count.
>> + * @object: object to decrease the reference count.
>> + */
>> +void qcomtee_object_put(struct qcomtee_object *object)
>> +{
>> +	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
>> +		kref_put(&object->refcount, qcomtee_object_release);
>> +}
>> +
>> +static int qcomtee_idx_alloc(struct qcomtee_object_invoke_ctx *oic,
>> +			     u32 *idx, struct qcomtee_object *object)
>> +{
>> +	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
>> +
>> +	/* Every ID allocated here has QCOMTEE_MSG_OBJECT_NS_BIT set. */
>> +	return xa_alloc_cyclic(&qcomtee->xa_local_objects, idx, object,
>> +			       XA_LIMIT(QCOMTEE_OBJECT_ID_START,
>> +					QCOMTEE_OBJECT_ID_END),
>> +			       &qcomtee->xa_last_id, GFP_KERNEL);
>> +}
>> +
>> +struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
>> +					 u32 idx)
>> +{
>> +	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
>> +
>> +	if (idx < QCOMTEE_OBJECT_ID_START || idx > QCOMTEE_OBJECT_ID_END)
>> +		return NULL_QCOMTEE_OBJECT;
>> +
>> +	return xa_erase(&qcomtee->xa_local_objects, idx);
>> +}
>> +
>> +/**
>> + * qcomtee_object_id_get() - Get an ID for an object to send to QTEE.
>> + * @oic: context to use for the invocation.
>> + * @object: object to assign an ID.
>> + * @object_id: object ID.
>> + *
>> + * This is called on the path to QTEE to construct the message; see
>> + * qcomtee_prepare_msg() and qcomtee_update_msg().
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_object_id_get(struct qcomtee_object_invoke_ctx *oic,
>> +				 struct qcomtee_object *object,
>> +				 unsigned int *object_id)
>> +{
>> +	u32 idx;
>> +
>> +	switch (typeof_qcomtee_object(object)) {
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		if (qcomtee_idx_alloc(oic, &idx, object) < 0)
>> +			return -ENOSPC;
>> +
>> +		*object_id = idx;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +		*object_id = object->info.qtee_id;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		*object_id = QCOMTEE_MSG_OBJECT_NULL;
>> +
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* Release object ID assigned in qcomtee_object_id_get. */
>> +static void qcomtee_object_id_put(struct qcomtee_object_invoke_ctx *oic,
>> +				  unsigned int object_id)
>> +{
>> +	qcomtee_idx_erase(oic, object_id);
>> +}
>> +
>> +/**
>> + * qcomtee_local_object_get() - Get the object referenced by the ID.
>> + * @oic: context to use for the invocation.
>> + * @object_id: object ID.
>> + *
>> + * It is called on the path from QTEE.
>> + * It is called on behalf of QTEE to obtain an instance of an object
>> + * for a given ID. It increases the object's reference count on success.
>> + *
>> + * Return: On error, returns %NULL_QCOMTEE_OBJECT.
>> + *         On success, returns the object.
>> + */
>> +static struct qcomtee_object *
>> +qcomtee_local_object_get(struct qcomtee_object_invoke_ctx *oic,
>> +			 unsigned int object_id)
>> +{
>> +	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
>> +	struct qcomtee_object *object;
>> +
>> +	guard(rcu)();
>> +	object = xa_load(&qcomtee->xa_local_objects, object_id);
>> +	/* It already checks for %NULL_QCOMTEE_OBJECT. */
>> +	qcomtee_object_get(object);
>> +
>> +	return object;
>> +}
>> +
>> +/**
>> + * qcomtee_object_user_init() - Initialize an object for the user.
>> + * @object: object to initialize.
>> + * @ot: type of object as &enum qcomtee_object_type.
>> + * @ops: instance of callbacks.
>> + * @fmt: name assigned to the object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_object_user_init(struct qcomtee_object *object,
>> +			     enum qcomtee_object_type ot,
>> +			     struct qcomtee_object_operations *ops,
>> +			     const char *fmt, ...)
>> +{
>> +	va_list ap;
>> +	int ret;
>> +
>> +	kref_init(&object->refcount);
>> +	QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_NULL);
>> +
>> +	va_start(ap, fmt);
>> +	switch (ot) {
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		ret = 0;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		object->ops = ops;
>> +		if (!object->ops->dispatch)
>> +			return -EINVAL;
>> +
>> +		/* If failed, "no-name". */
>> +		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
>> +		QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_CB);
>> +
>> +		ret = 0;
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +	va_end(ap);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_object_type() - Returns the type of object represented by an ID.
>> + * @object_id: object ID for the object.
>> + *
>> + * This is similar to typeof_qcomtee_object(), but instead of receiving an
>> + * object as an argument, it receives an object ID. It is used internally
>> + * on the return path from QTEE.
>> + *
>> + * Return: Returns the type of object referenced by @object_id.
>> + */
>> +static enum qcomtee_object_type qcomtee_object_type(unsigned int object_id)
>> +{
>> +	if (object_id == QCOMTEE_MSG_OBJECT_NULL)
>> +		return QCOMTEE_OBJECT_TYPE_NULL;
>> +
>> +	if (object_id & QCOMTEE_MSG_OBJECT_NS_BIT)
>> +		return QCOMTEE_OBJECT_TYPE_CB;
>> +
>> +	return QCOMTEE_OBJECT_TYPE_TEE;
>> +}
>> +
>> +/**
>> + * qcomtee_object_qtee_init() - Initialize an object for QTEE.
>> + * @oic: context to use for the invocation.
>> + * @object: object returned.
>> + * @object_id: object ID received from QTEE.
>> + *
>> + * Return: On failure, returns < 0 and sets @object to %NULL_QCOMTEE_OBJECT.
>> + *         On success, returns 0
>> + */
>> +static int qcomtee_object_qtee_init(struct qcomtee_object_invoke_ctx *oic,
>> +				    struct qcomtee_object **object,
>> +				    unsigned int object_id)
>> +{
>> +	int ret = 0;
>> +
>> +	switch (qcomtee_object_type(object_id)) {
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		*object = NULL_QCOMTEE_OBJECT;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		*object = qcomtee_local_object_get(oic, object_id);
>> +		if (*object == NULL_QCOMTEE_OBJECT)
>> +			ret = -EINVAL;
>> +
>> +		break;
>> +
>> +	default: /* QCOMTEE_OBJECT_TYPE_TEE */
>> +		*object = qcomtee_qtee_object_alloc(oic, object_id);
>> +		if (*object == NULL_QCOMTEE_OBJECT)
>> +			ret = -ENOMEM;
>> +
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * ''Marshaling API''
>> + * qcomtee_prepare_msg  - Prepare the inbound buffer for sending to QTEE
>> + * qcomtee_update_args  - Parse the QTEE response in the inbound buffer
>> + * qcomtee_prepare_args - Parse the QTEE request from the outbound buffer
>> + * qcomtee_update_msg   - Update the outbound buffer with the response for QTEE
>> + */
>> +
>> +static int qcomtee_prepare_msg(struct qcomtee_object_invoke_ctx *oic,
>> +			       struct qcomtee_object *object, u32 op,
>> +			       struct qcomtee_arg *u)
>> +{
>> +	struct qcomtee_msg_object_invoke *msg;
>> +	unsigned int object_id;
>> +	int i, ib, ob, io, oo;
>> +	size_t off;
>> +
>> +	/* Use the input message buffer in 'oic'. */
>> +	msg = oic->in_msg.addr;
>> +
>> +	/* Start offset in a message for buffer arguments. */
>> +	off = qcomtee_msg_buffer_args(struct qcomtee_msg_object_invoke,
>> +				      qcomtee_args_len(u));
>> +
>> +	/* Get the ID of the object being invoked. */
>> +	if (qcomtee_object_id_get(oic, object, &object_id))
>> +		return -ENOSPC;
>> +
>> +	ib = 0;
>> +	qcomtee_arg_for_each_input_buffer(i, u) {
>> +		void *ptr;
>> +
>> +		/* Overflow already checked in qcomtee_msg_buffers_alloc(). */
>> +		msg->args[ib].b.offset = off;
>> +		msg->args[ib].b.size = u[i].b.size;
>> +
>> +		ptr = qcomtee_msg_offset_to_ptr(msg, off);
>> +		/* Userspace client or kernel client!? */
>> +		if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
>> +			memcpy(ptr, u[i].b.addr, u[i].b.size);
>> +		else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
>> +			return -EINVAL;
>> +
>> +		off += qcomtee_msg_offset_align(u[i].b.size);
>> +		ib++;
>> +	}
>> +
>> +	ob = ib;
>> +	qcomtee_arg_for_each_output_buffer(i, u) {
>> +		/* Overflow already checked in qcomtee_msg_buffers_alloc(). */
>> +		msg->args[ob].b.offset = off;
>> +		msg->args[ob].b.size = u[i].b.size;
>> +
>> +		off += qcomtee_msg_offset_align(u[i].b.size);
>> +		ob++;
>> +	}
>> +
>> +	io = ob;
>> +	qcomtee_arg_for_each_input_object(i, u) {
>> +		if (qcomtee_object_id_get(oic, u[i].o, &msg->args[io].o)) {
>> +			/* Put whatever we got. */
>> +			qcomtee_object_id_put(oic, object_id);
>> +			for (io--; io >= ob; io--)
>> +				qcomtee_object_id_put(oic, msg->args[io].o);
>> +
>> +			return -ENOSPC;
>> +		}
>> +
>> +		io++;
>> +	}
>> +
>> +	oo = io;
>> +	qcomtee_arg_for_each_output_object(i, u)
>> +		oo++;
>> +
>> +	/* Set object, operation, and argument counts. */
>> +	qcomtee_msg_init(msg, object_id, op, ib, ob, io, oo);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_update_args() - Parse the QTEE response in the inbound buffer.
>> + * @u: array of arguments for the invocation.
>> + * @oic: context to use for the invocation.
>> + *
>> + * @u must be the same as the one used in qcomtee_prepare_msg() when
>> + * initializing the inbound buffer.
>> + *
>> + * On failure, it continues processing the QTEE message. The caller should
>> + * do the necessary cleanup, including calling qcomtee_object_put()
>> + * on the output objects.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_update_args(struct qcomtee_arg *u,
>> +			       struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_msg_object_invoke *msg;
>> +	int i, ib, ob, io, oo;
>> +	int ret = 0;
>> +
>> +	/* Use the input message buffer in 'oic'. */
>> +	msg = oic->in_msg.addr;
>> +
>> +	ib = 0;
>> +	qcomtee_arg_for_each_input_buffer(i, u)
>> +		ib++;
>> +
>> +	ob = ib;
>> +	qcomtee_arg_for_each_output_buffer(i, u) {
>> +		void *ptr;
>> +
>> +		/* QTEE can override the size to a smaller value. */
>> +		u[i].b.size = msg->args[ob].b.size;
>> +
>> +		ptr = qcomtee_msg_offset_to_ptr(msg, msg->args[ob].b.offset);
>> +		/* Userspace client or kernel client!? */
>> +		if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
>> +			memcpy(u[i].b.addr, ptr, u[i].b.size);
>> +		else if (copy_to_user(u[i].b.uaddr, ptr, u[i].b.size))
>> +			ret = -EINVAL;
>> +
>> +		ob++;
>> +	}
>> +
>> +	io = ob;
>> +	qcomtee_arg_for_each_input_object(i, u)
>> +		io++;
>> +
>> +	oo = io;
>> +	qcomtee_arg_for_each_output_object(i, u) {
>> +		if (qcomtee_object_qtee_init(oic, &u[i].o, msg->args[oo].o))
>> +			ret = -EINVAL;
>> +
>> +		oo++;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_prepare_args() - Parse the QTEE request from the outbound buffer.
>> + * @oic: context to use for the invocation.
>> + *
>> + * It initializes &qcomtee_object_invoke_ctx->u based on the QTEE request in
>> + * the outbound buffer. It sets %QCOMTEE_ARG_TYPE_INV at the end of the array.
>> + *
>> + * On failure, it continues processing the QTEE message. The caller should
>> + * do the necessary cleanup, including calling qcomtee_object_put()
>> + * on the input objects.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_prepare_args(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_msg_callback *msg;
>> +	union qcomtee_msg_arg *arg;
>> +	int i, ret = 0;
>> +
>> +	/* Use the output message buffer in 'oic'. */
>> +	msg = oic->out_msg.addr;
>> +
>> +	qcomtee_msg_for_each_input_buffer(i, msg) {
>> +		arg = &msg->args[i];
>> +		oic->u[i].b.addr =
>> +			qcomtee_msg_offset_to_ptr(msg, arg->b.offset);
>> +		oic->u[i].b.size = arg->b.size;
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_IB;
>> +	}
>> +
>> +	qcomtee_msg_for_each_output_buffer(i, msg) {
>> +		arg = &msg->args[i];
>> +		oic->u[i].b.addr =
>> +			qcomtee_msg_offset_to_ptr(msg, arg->b.offset);
>> +		oic->u[i].b.size = arg->b.size;
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_OB;
>> +	}
>> +
>> +	qcomtee_msg_for_each_input_object(i, msg) {
>> +		if (qcomtee_object_qtee_init(oic, &oic->u[i].o, msg->args[i].o))
>> +			ret = -EINVAL;
>> +
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_IO;
>> +	}
>> +
>> +	qcomtee_msg_for_each_output_object(i, msg)
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_OO;
>> +
>> +	/* End of Arguments. */
>> +	oic->u[i].type = QCOMTEE_ARG_TYPE_INV;
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcomtee_update_msg(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_msg_callback *msg;
>> +	int i, ib, ob, io, oo;
>> +
>> +	/* Use the output message buffer in 'oic'. */
>> +	msg = oic->out_msg.addr;
>> +
>> +	ib = 0;
>> +	qcomtee_arg_for_each_input_buffer(i, oic->u)
>> +		ib++;
>> +
>> +	ob = ib;
>> +	qcomtee_arg_for_each_output_buffer(i, oic->u) {
>> +		/* Only reduce size; never increase it. */
>> +		if (msg->args[ob].b.size < oic->u[i].b.size)
>> +			return -EINVAL;
>> +
>> +		msg->args[ob].b.size = oic->u[i].b.size;
>> +		ob++;
>> +	}
>> +
>> +	io = ob;
>> +	qcomtee_arg_for_each_input_object(i, oic->u)
>> +		io++;
>> +
>> +	oo = io;
>> +	qcomtee_arg_for_each_output_object(i, oic->u) {
>> +		if (qcomtee_object_id_get(oic, oic->u[i].o, &msg->args[oo].o)) {
>> +			/* Put whatever we got. */
>> +			for (oo--; oo >= io; oo--)
>> +				qcomtee_object_id_put(oic, msg->args[oo].o);
>> +
>> +			return -ENOSPC;
>> +		}
>> +
>> +		oo++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* Invoke a callback object. */
>> +static void qcomtee_cb_object_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +				     struct qcomtee_msg_callback *msg)
>> +{
>> +	int i, errno;
>> +	u32 op;
>> +
>> +	/* Get the object being invoked. */
>> +	unsigned int object_id = msg->cxt;
>> +	struct qcomtee_object *object;
>> +
>> +	/* QTEE cannot invoke a NULL object or objects it hosts. */
>> +	if (qcomtee_object_type(object_id) == QCOMTEE_OBJECT_TYPE_NULL ||
>> +	    qcomtee_object_type(object_id) == QCOMTEE_OBJECT_TYPE_TEE) {
>> +		errno = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	object = qcomtee_local_object_get(oic, object_id);
>> +	if (object == NULL_QCOMTEE_OBJECT) {
>> +		errno = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	oic->object = object;
>> +
>> +	/* Filter bits used by transport. */
>> +	op = msg->op & QCOMTEE_MSG_OBJECT_OP_MASK;
>> +
>> +	switch (op) {
>> +	case QCOMTEE_MSG_OBJECT_OP_RELEASE:
>> +		qcomtee_object_id_put(oic, object_id);
>> +		qcomtee_object_put(object);
>> +		errno = 0;
>> +
>> +		break;
>> +	case QCOMTEE_MSG_OBJECT_OP_RETAIN:
>> +		qcomtee_object_get(object);
>> +		errno = 0;
>> +
>> +		break;
>> +	default:
>> +		errno = qcomtee_prepare_args(oic);
>> +		if (errno) {
>> +			/* Release any object that arrived as input. */
>> +			qcomtee_arg_for_each_input_buffer(i, oic->u)
>> +				qcomtee_object_put(oic->u[i].o);
>> +
>> +			break;
>> +		}
>> +
>> +		errno = object->ops->dispatch(oic, object, op, oic->u);
>> +		if (!errno) {
>> +			/* On success, notify at the appropriate time. */
>> +			oic->flags |= QCOMTEE_OIC_FLAG_NOTIFY;
>> +		}
>> +	}
>> +
>> +out:
>> +
>> +	oic->errno = errno;
>> +}
>> +
>> +static int
>> +qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +				 int *result, u64 *res_type)
>> +{
>> +	phys_addr_t out_msg_paddr;
>> +	phys_addr_t in_msg_paddr;
>> +	int ret;
>> +	u64 res;
>> +
>> +	tee_shm_get_pa(oic->out_shm, 0, &out_msg_paddr);
>> +	tee_shm_get_pa(oic->in_shm, 0, &in_msg_paddr);
>> +	if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY)) {
>> +		/* Direct QTEE object invocation. */
>> +		ret = qcom_scm_qtee_invoke_smc(in_msg_paddr, oic->in_msg.size,
>> +					       out_msg_paddr, oic->out_msg.size,
>> +					       &res, res_type);
>> +	} else {
>> +		/* Submit callback response. */
>> +		ret = qcom_scm_qtee_callback_response(out_msg_paddr,
>> +						      oic->out_msg.size,
>> +						      &res, res_type);
>> +	}
> 
> The quotes can be dropped here.
> 

Ack.

>> +
>> +	if (ret)
>> +		pr_err("QTEE returned with %d.\n", ret);
>> +	else
>> +		*result = (int)res;
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_qtee_objects_put() - Put the callback objects in the argument array.
>> + * @u: array of arguments.
>> + *
>> + * When qcomtee_object_do_invoke_internal() is successfully invoked,
>> + * QTEE takes ownership of the callback objects. If the invocation fails,
>> + * qcomtee_object_do_invoke_internal() calls qcomtee_qtee_objects_put()
>> + * to mimic the release of callback objects by QTEE.
>> + */
>> +static void qcomtee_qtee_objects_put(struct qcomtee_arg *u)
>> +{
>> +	int i;
>> +
>> +	qcomtee_arg_for_each_input_object(i, u) {
>> +		if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
>> +			qcomtee_object_put(u[i].o);
>> +	}
>> +}
>> +
>> +/**
>> + * qcomtee_object_do_invoke_internal() - Submit an invocation for an object.
>> + * @oic: context to use for the current invocation.
>> + * @object: object being invoked.
>> + * @op: requested operation on the object.
>> + * @u: array of arguments for the current invocation.
>> + * @result: result returned from QTEE.
>> + *
>> + * The caller is responsible for keeping track of the refcount for each
>> + * object, including @object. On return, the caller loses ownership of all
>> + * input objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * Return: On success, returns 0. On error, returns -EAGAIN if invocation
>> + * failed and the user may retry the invocation, -ENODEV on fatal failure.
>> + */
>> +int qcomtee_object_do_invoke_internal(struct qcomtee_object_invoke_ctx *oic,
>> +				      struct qcomtee_object *object, u32 op,
>> +				      struct qcomtee_arg *u, int *result)
>> +{
>> +	struct qcomtee_msg_callback *cb_msg;
>> +	struct qcomtee_object *qto;
>> +	int i, ret, errno;
>> +	u64 res_type;
>> +
>> +	/* Allocate inbound and outbound buffers. */
>> +	if (qcomtee_msg_buffers_alloc(oic, u)) {
>> +		qcomtee_qtee_objects_put(u);
>> +
>> +		return -EAGAIN;
> 
> Shouldn't the error code here rather be -ENOMEM? Or rather it's better
> to return error code returned by qcomtee_msg_buffers_alloc()?
> 

Updated.

>> +	}
>> +
>> +	if (qcomtee_prepare_msg(oic, object, op, u)) {
>> +		qcomtee_qtee_objects_put(u);
>> +
>> +		ret = -EAGAIN;
> 
> Ditto here.
> 
>> +		goto out;
>> +	}
>> +
>> +	/* Use input message buffer in 'oic'. */
>> +	cb_msg = oic->out_msg.addr;
>> +
>> +	while (1) {
>> +		if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
>> +			errno = oic->errno;
>> +			if (!errno)
>> +				errno = qcomtee_update_msg(oic);
>> +			qcomtee_msg_set_result(cb_msg, errno);
>> +		}
>> +
>> +		/* Invoke the remote object. */
>> +		ret = qcomtee_object_invoke_ctx_invoke(oic, result, &res_type);
>> +
>> +		if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
>> +			qto = oic->object;
>> +			if (qto) {
>> +				if (oic->flags & QCOMTEE_OIC_FLAG_NOTIFY) {
>> +					/* Don't care about the exact errno. */
>> +					if (qto->ops->notify)
>> +						qto->ops->notify(oic, qto,
>> +								 errno || ret);
>> +				}
>> +
>> +				/* Get is in qcomtee_cb_object_invoke(). */
> 
> As I can see in this patch, the object get/put invocations are used
> mostly asynchronously. Can we make their usage synchronous for better
> resoning and readability?
> 

I made some changes to make the patchset more consistent, and added a few comments.
However, it's generally difficult to group all the get/put operations together,
since the consumer (caller of put) and the producer (caller of get) are in
different worlds and these operations occur in separate functions.


>> +				qcomtee_object_put(qto);
>> +			}
>> +
>> +			oic->object = NULL_QCOMTEE_OBJECT;
>> +			oic->flags &= ~(QCOMTEE_OIC_FLAG_BUSY |
>> +					QCOMTEE_OIC_FLAG_NOTIFY);
>> +		}
>> +
>> +		if (ret) {
>> +			if (!(oic->flags & QCOMTEE_OIC_FLAG_SHARED)) {
>> +				qcomtee_qtee_objects_put(u);
>> +
>> +				ret = -EAGAIN;
>> +			} else {
>> +				/*
>> +				 * On error, there is no clean way to exit.
>> +				 * For some reason, we cannot communicate with
>> +				 * QTEE, so we cannot notify QTEE about the
>> +				 * failure and do further cleanup.
>> +				 */
>> +				ret = -ENODEV;
>> +			}
>> +
>> +			goto out;
>> +
>> +		} else {
>> +			/*
>> +			 * QTEE obtained ownership of QCOMTEE_OBJECT_TYPE_CB
>> +			 * input objects in 'u'. On further failure, QTEE is
>> +			 * responsible for releasing them.
>> +			 */
>> +			oic->flags |= QCOMTEE_OIC_FLAG_SHARED;
>> +		}
>> +
>> +		/* Is it a callback request? */
>> +		if (res_type != QCOMTEE_RESULT_INBOUND_REQ_NEEDED) {
>> +			if (!*result) {
>> +				ret = qcomtee_update_args(u, oic);
>> +				if (ret) {
>> +					/* Put output objects. Retry. */
> 
> Is there any particular reason for a retry here?
> 

It is a bad comment, it is not a retry. I fixed it.

>> +					qcomtee_arg_for_each_output_object(i, u)
>> +						qcomtee_object_put(u[i].o);
>> +
>> +					ret = -EAGAIN;
>> +				}
>> +			}
>> +
>> +			break;
>> +
>> +		} else {
>> +			oic->flags |= QCOMTEE_OIC_FLAG_BUSY;
>> +
>> +			qcomtee_fetch_async_reqs(oic);
>> +			qcomtee_cb_object_invoke(oic, cb_msg);
>> +		}
>> +	}
>> +
>> +	qcomtee_fetch_async_reqs(oic);
>> +out:
>> +	qcomtee_msg_buffers_free(oic);
>> +
>> +	return ret;
>> +}
>> +
>> +int qcomtee_object_do_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +			     struct qcomtee_object *object, u32 op,
>> +			     struct qcomtee_arg *u, int *result)
>> +{
>> +	/* User can not set bits used by transport. */
>> +	if (op & ~QCOMTEE_MSG_OBJECT_OP_MASK)
>> +		return -EINVAL;
>> +
>> +	/* User can only invoke QTEE hosted objects. */
>> +	if (typeof_qcomtee_object(object) != QCOMTEE_OBJECT_TYPE_TEE &&
>> +	    typeof_qcomtee_object(object) != QCOMTEE_OBJECT_TYPE_ROOT)
>> +		return -EINVAL;
>> +
>> +	/* User cannot directly issue these operations to QTEE. */
>> +	if (op == QCOMTEE_MSG_OBJECT_OP_RELEASE ||
>> +	    op == QCOMTEE_MSG_OBJECT_OP_RETAIN)
>> +		return -EINVAL;
>> +
>> +	return qcomtee_object_do_invoke_internal(oic, object, op, u, result);
>> +}
>> +
>> +/**
>> + * qcomtee_object_get_client_env() - Get a privileged client env. object.
>> + * @oic: context to use for the current invocation.
>> + *
>> + * The caller should call qcomtee_object_put() on the returned object
>> + * to release it.
>> + *
>> + * Return: On error, returns %NULL_QCOMTEE_OBJECT.
>> + *         On success, returns the object.
>> + */
>> +struct qcomtee_object *
>> +qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_arg u[3] = { 0 };
>> +	int ret, result;
>> +
>> +	u[0].o = NULL_QCOMTEE_OBJECT;
>> +	u[0].type = QCOMTEE_ARG_TYPE_IO;
>> +	u[1].type = QCOMTEE_ARG_TYPE_OO;
>> +	ret = qcomtee_object_do_invoke(oic, ROOT_QCOMTEE_OBJECT,
>> +				       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS, u,
>> +				       &result);
>> +	if (ret || result)
>> +		return NULL_QCOMTEE_OBJECT;
>> +
>> +	return u[1].o;
>> +}
>> +
>> +struct qcomtee_object *
>> +qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> +			   struct qcomtee_object *client_env, u32 uid)
>> +{
>> +	struct qcomtee_arg u[3] = { 0 };
>> +	int ret, result;
>> +
>> +	u[0].b.addr = &uid;
>> +	u[0].b.size = sizeof(uid);
>> +	u[0].type = QCOMTEE_ARG_TYPE_IB;
>> +	u[1].type = QCOMTEE_ARG_TYPE_OO;
>> +	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
>> +				       u, &result);
>> +
>> +	if (ret || result)
>> +		return NULL_QCOMTEE_OBJECT;
>> +
>> +	return u[1].o;
>> +}
>> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
>> new file mode 100644
>> index 000000000000..a69d7c091637
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/qcomtee.h
>> @@ -0,0 +1,224 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef QCOMTEE_H
>> +#define QCOMTEE_H
>> +
>> +#include <linux/kobject.h>
>> +#include <linux/tee_core.h>
>> +
>> +#include "qcomtee_msg.h"
>> +#include "qcomtee_object.h"
>> +
>> +/* Flags relating to object reference. */
>> +#define QCOMTEE_OBJREF_FLAG_TEE		BIT(0)
>> +#define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>> +
>> +/**
>> + * struct qcomtee - Main service struct.
>> + * @teedev: client device.
>> + * @pool: shared memory pool.
>> + * @ctx: driver private context.
>> + * @oic: context to use for the current driver invocation.
>> + * @wq: workqueue for QTEE async operations.
>> + * @xa_local_objects: array of objects exported to QTEE.
>> + * @xa_last_id: next ID to allocate.
>> + */
>> +struct qcomtee {
>> +	struct tee_device *teedev;
>> +	struct tee_shm_pool *pool;
>> +	struct tee_context *ctx;
>> +	struct qcomtee_object_invoke_ctx oic;
>> +	struct workqueue_struct *wq;
>> +	struct xarray xa_local_objects;
>> +	u32 xa_last_id;
>> +};
>> +
>> +void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
>> +struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
>> +					 u32 idx);
>> +
>> +struct tee_shm_pool *qcomtee_shm_pool_alloc(void);
>> +void qcomtee_msg_buffers_free(struct qcomtee_object_invoke_ctx *oic);
>> +int qcomtee_msg_buffers_alloc(struct qcomtee_object_invoke_ctx *oic,
>> +			      struct qcomtee_arg *u);
>> +
>> +/**
>> + * qcomtee_object_do_invoke_internal() - Submit an invocation for an object.
>> + * @oic: context to use for the current invocation.
>> + * @object: object being invoked.
>> + * @op: requested operation on the object.
>> + * @u: array of arguments for the current invocation.
>> + * @result: result returned from QTEE.
>> + *
>> + * The caller is responsible for keeping track of the refcount for each
>> + * object, including @object. On return, the caller loses ownership of all
>> + * input objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * Return: On success, returns 0. On error, returns -EAGAIN if invocation
>> + * failed and the user may retry the invocation, -ENODEV on fatal failure.
>> + */
>> +int qcomtee_object_do_invoke_internal(struct qcomtee_object_invoke_ctx *oic,
>> +				      struct qcomtee_object *object, u32 op,
>> +				      struct qcomtee_arg *u, int *result);
>> +
>> +/**
>> + * struct qcomtee_context_data - Clients' or supplicants' context.
>> + * @qtee_objects_idr: QTEE objects in this context.
>> + * @qtee_lock: mutex for @qtee_objects_idr.
>> + * @reqs_idr: requests in this context that hold ID.
>> + * @reqs_list: FIFO for requests in PROCESSING or QUEUED state.
>> + * @reqs_lock: mutex for @reqs_idr, @reqs_list and request states.
>> + * @req_c: completion used when the supplicant is waiting for requests.
>> + * @released: state of this context.
>> + */
>> +struct qcomtee_context_data {
>> +	struct idr qtee_objects_idr;
>> +	/* Synchronize access to @qtee_objects_idr. */
>> +	struct mutex qtee_lock;
>> +
>> +	struct idr reqs_idr;
>> +	struct list_head reqs_list;
>> +	/* Synchronize access to @reqs_idr, @reqs_list and updating requests states. */
>> +	struct mutex reqs_lock;
>> +
>> +	struct completion req_c;
>> +
>> +	bool released;
>> +};
>> +
>> +/**
>> + * qcomtee_context_add_qtee_object() - Add a QTEE object to the context.
>> + * @param: TEE parameter representing @object.
>> + * @object: QTEE object.
>> + * @ctx: context to add the object.
>> + *
>> + * It assumes @object is %QCOMTEE_OBJECT_TYPE_TEE and the caller has already
>> + * issued qcomtee_object_get() for @object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_context_add_qtee_object(struct tee_param *param,
>> +				    struct qcomtee_object *object,
>> +				    struct tee_context *ctx);
>> +
>> +/* Retrieve the QTEE object added with qcomtee_context_add_qtee_object(). */
>> +int qcomtee_context_find_qtee_object(struct qcomtee_object **object,
>> +				     struct tee_param *param,
>> +				     struct tee_context *ctx);
>> +
>> +/**
>> + * qcomtee_context_del_qtee_object() - Delete a QTEE object from the context.
>> + * @param: TEE parameter representing @object.
>> + * @ctx: context for deleting the object.
>> + *
>> + * The @param has been initialized by qcomtee_context_add_qtee_object().
>> + */
>> +void qcomtee_context_del_qtee_object(struct tee_param *param,
>> +				     struct tee_context *ctx);
>> +
>> +/**
>> + * qcomtee_objref_to_arg() - Convert OBJREF parameter to QTEE argument.
>> + * @arg: QTEE argument.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @param is an OBJREF.
>> + * It does not set @arg.type; the caller should initialize it to a correct
>> + * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
>> + * the caller should manage to put it afterward.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
>> +			  struct tee_context *ctx);
>> +
>> +/**
>> + * qcomtee_objref_from_arg() - Convert QTEE argument to OBJREF param.
>> + * @param: TEE parameter.
>> + * @arg: QTEE argument.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @arg is of %QCOMTEE_ARG_TYPE_IO or %QCOMTEE_ARG_TYPE_OO.
>> + * It does not set @param.attr; the caller should initialize it to a
>> + * correct type.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>> +			    struct tee_context *ctx);
>> +
>> +/* OBJECTS: */
>> +
>> +/* (1) User Object API. */
>> +
>> +/* Is it a user object? */
>> +int is_qcomtee_user_object(struct qcomtee_object *object);
>> +
>> +/* Set the user object's 'notify on release' flag. */
>> +void qcomtee_user_object_set_notify(struct qcomtee_object *object, bool notify);
>> +
>> +/* This is called when there are no more users for the ctxdata. */
>> +void qcomtee_requests_destroy(struct qcomtee_context_data *ctxdata);
>> +
>> +/**
>> + * qcomtee_user_param_to_object() - OBJREF parameter to &struct qcomtee_object.
>> + * @object: object returned.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_USER flags.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_param_to_object(struct qcomtee_object **object,
>> +				 struct tee_param *param,
>> +				 struct tee_context *ctx);
>> +
>> +/* Reverse what qcomtee_user_param_to_object() does. */
>> +int qcomtee_user_param_from_object(struct tee_param *param,
>> +				   struct qcomtee_object *object,
>> +				   struct tee_context *ctx);
>> +
>> +struct qcomtee_user_object_request_data {
>> +	int id; /* ID assigned to the request. */
>> +	u64 object_id; /* Object ID being invoked by QTEE. */
>> +	u32 op; /* Requested operation on object. */
>> +	int np; /* Number of parameters in the request.*/
> 
> Can we rather have a kernel doc style comment for this struct?
> 

Done.

>> +};
>> +
>> +/**
>> + * qcomtee_user_object_select() - Select a request for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: parameters for @op.
>> + * @num_params: number of elements in the parameter array.
>> + * @uaddr: user buffer for output UBUF parameters.
>> + * @size: size of user buffer @uaddr.
>> + * @data: information for the selected request.
>> + *
>> + * @params is filled along with @data for the selected request.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_select(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       void __user *uaddr, size_t size,
>> +			       struct qcomtee_user_object_request_data *data);
>> +
>> +/**
>> + * qcomtee_user_object_submit() - Submit a response for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: returned parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @req_id: request ID for the response.
>> + * @errno: result of user object invocation.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_submit(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       int req_id, int errno);
>> +
>> +#endif /* QCOMTEE_H */
>> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
>> new file mode 100644
>> index 000000000000..ec41940c2794
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
>> @@ -0,0 +1,251 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef QCOMTEE_MSG_H
>> +#define QCOMTEE_MSG_H
>> +
>> +/**
>> + * DOC: ''Qualcomm TEE'' (QTEE) Transport Message
>> + *
>> + * There are two buffers shared with QTEE: inbound and outbound buffers.
>> + * The inbound buffer is used for direct object invocation, and the outbound
>> + * buffer is used to make a request from QTEE to the kernel; i.e., a callback
>> + * request.
>> + *
>> + * The unused tail of the outbound buffer is also used for sending and
>> + * receiving asynchronous messages. An asynchronous message is independent of
>> + * the current object invocation (i.e., contents of the inbound buffer) or
>> + * callback request (i.e., the head of the outbound buffer); see
>> + * qcomtee_get_async_buffer(). It is used by endpoints (QTEE or kernel) as an
>> + * optimization to reduce the number of context switches between the secure and
>> + * non-secure worlds.
>> + *
>> + * For instance, QTEE never sends an explicit callback request to release an
>> + * object in the kernel. Instead, it sends asynchronous release messages in the
>> + * outbound buffer when QTEE returns from the previous direct object invocation,
>> + * or appends asynchronous release messages after the current callback request.
>> + *
>> + * QTEE supports two types of arguments in a message: buffer and object
>> + * arguments. Depending on the direction of data flow, they could be input
>> + * buffer (IO) to QTEE, output buffer (OB) from QTEE, input object (IO) to QTEE,
>> + * or output object (OO) from QTEE. Object arguments hold object IDs. Buffer
>> + * arguments hold (offset, size) pairs into the inbound or outbound buffers.
>> + *
>> + * QTEE holds an object table for objects it hosts and exposes to the kernel.
>> + * An object ID is an index to the object table in QTEE.
>> + *
>> + * For the direct object invocation message format in the inbound buffer, see
>> + * &struct qcomtee_msg_object_invoke. For the callback request message format
>> + * in the outbound buffer, see &struct qcomtee_msg_callback. For the message
>> + * format for asynchronous messages in the outbound buffer, see
>> + * &struct qcomtee_async_msg_hdr.
>> + */
>> +
>> +/**
>> + * define QCOMTEE_MSG_OBJECT_NS_BIT - Non-secure bit
>> + *
>> + * Object ID is a globally unique 32-bit number. IDs referencing objects
>> + * in the kernel should have %QCOMTEE_MSG_OBJECT_NS_BIT set.
>> + */
>> +#define QCOMTEE_MSG_OBJECT_NS_BIT BIT(31)
>> +
>> +/* Static object IDs recognized by QTEE. */
>> +#define QCOMTEE_MSG_OBJECT_NULL (0U)
>> +#define QCOMTEE_MSG_OBJECT_ROOT (1U)
>> +
>> +/* Definitions from QTEE as part of the transport protocol. */
>> +
>> +/* qcomtee_msg_arg is an argument as recognized by QTEE. */
>> +union qcomtee_msg_arg {
>> +	struct {
>> +		u32 offset;
>> +		u32 size;
>> +	} b;
>> +	u32 o;
>> +};
>> +
>> +/* BI and BO payloads in QTEE messages should be at 64-bit boundaries. */
>> +#define qcomtee_msg_offset_align(o) ALIGN((o), sizeof(u64))
>> +
>> +/* Operations for objects are 32-bit. Transport uses the upper 16 bits. */
>> +#define QCOMTEE_MSG_OBJECT_OP_MASK GENMASK(15, 0)
>> +
>> +/* Reserved Operation IDs sent to QTEE: */
>> +/* QCOMTEE_MSG_OBJECT_OP_RELEASE - Reduces the refcount and releases the object.
>> + * QCOMTEE_MSG_OBJECT_OP_RETAIN  - Increases the refcount.
>> + *
>> + * These operation IDs are valid for all objects.
>> + */
>> +
>> +#define QCOMTEE_MSG_OBJECT_OP_RELEASE (QCOMTEE_MSG_OBJECT_OP_MASK - 0)
>> +#define QCOMTEE_MSG_OBJECT_OP_RETAIN  (QCOMTEE_MSG_OBJECT_OP_MASK - 1)
>> +
>> +/* Subset of operations supported by QTEE root object. */
>> +
>> +#define QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS	5
>> +#define QCOMTEE_ROOT_OP_NOTIFY_DOMAIN_CHANGE	4
>> +#define QCOMTEE_ROOT_OP_ADCI_ACCEPT		8
>> +#define QCOMTEE_ROOT_OP_ADCI_SHUTDOWN		9
>> +
>> +/* Subset of operations supported by client_env object. */
>> +
>> +#define QCOMTEE_CLIENT_ENV_OPEN			0
>> +
>> +/* List of available QTEE service UIDs and subset of operations. */
>> +
>> +#define QCOMTEE_FEATURE_VER_UID			2033
>> +#define QCOMTEE_FEATURE_VER_OP_GET		0
>> +/* Get QTEE version number. */
>> +#define QCOMTEE_FEATURE_VER_OP_GET_QTEE_ID	10
>> +#define QTEE_VERSION_GET_MAJOR(x) (((x) >> 22) & 0xffU)
>> +#define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
>> +#define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>> +
>> +/* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>> +
>> +/* The message contains a callback request. */
>> +#define QCOMTEE_RESULT_INBOUND_REQ_NEEDED	3
>> +
>> +/**
>> + * struct qcomtee_msg_object_invoke - Direct object invocation message.
>> + * @ctx: object ID hosted in QTEE.
>> + * @op: operation for the object.
>> + * @counts: number of different types of arguments in @args.
>> + * @args: array of arguments.
>> + *
>> + * @counts consists of 4 * 4-bit fields. Bits 0 - 3 represent the number of
>> + * input buffers, bits 4 - 7 represent the number of output buffers,
>> + * bits 8 - 11 represent the number of input objects, and bits 12 - 15
>> + * represent the number of output objects. The remaining bits should be zero.
>> + *
>> + * The maximum number of arguments of each type is defined by
>> + * %QCOMTEE_ARGS_PER_TYPE.
>> + */
>> +struct qcomtee_msg_object_invoke {
>> +	u32 cxt;
>> +	u32 op;
>> +	u32 counts;
>> +	union qcomtee_msg_arg args[];
>> +};
>> +
>> +/**
>> + * struct qcomtee_msg_callback - Callback request message.
>> + * @result: result of operation @op on the object referenced by @cxt.
>> + * @cxt: object ID hosted in the kernel.
>> + * @op: operation for the object.
>> + * @counts: number of different types of arguments in @args.
>> + * @args: array of arguments.
>> + *
>> + * For details of @counts, see &qcomtee_msg_object_invoke.counts.
>> + */
>> +struct qcomtee_msg_callback {
>> +	u32 result;
>> +	u32 cxt;
>> +	u32 op;
>> +	u32 counts;
>> +	union qcomtee_msg_arg args[];
>> +};
>> +
>> +/* Offset in the message for the beginning of the buffer argument's contents. */
>> +#define qcomtee_msg_buffer_args(t, n) \
>> +	qcomtee_msg_offset_align(struct_size_t(t, args, n))
>> +/* Pointer to the beginning of a buffer argument's content at an offset. */
>> +#define qcomtee_msg_offset_to_ptr(m, off) ((void *)&((char *)(m))[(off)])
>> +
>> +/* Some helpers to manage msg.counts. */
>> +
>> +#define QCOMTEE_MSG_NUM_IB(x) ((x) & 0xfU)
>> +#define QCOMTEE_MSG_NUM_OB(x) (((x) >> 4) & 0xfU)
>> +#define QCOMTEE_MSG_NUM_IO(x) (((x) >> 8) & 0xfU)
>> +#define QCOMTEE_MSG_NUM_OO(x) (((x) >> 12) & 0xfU)
>> +
>> +#define QCOMTEE_MSG_IDX_IB(x) (0U)
>> +#define QCOMTEE_MSG_IDX_OB(x) (QCOMTEE_MSG_IDX_IB(x) + QCOMTEE_MSG_NUM_IB(x))
>> +#define QCOMTEE_MSG_IDX_IO(x) (QCOMTEE_MSG_IDX_OB(x) + QCOMTEE_MSG_NUM_OB(x))
>> +#define QCOMTEE_MSG_IDX_OO(x) (QCOMTEE_MSG_IDX_IO(x) + QCOMTEE_MSG_NUM_IO(x))
>> +
>> +#define qcomtee_msg_for_each(i, c, type)    \
>> +	for (i = QCOMTEE_MSG_IDX_##type(c); \
>> +	     i < (QCOMTEE_MSG_IDX_##type(c) + QCOMTEE_MSG_NUM_##type(c)); i++)
>> +
>> +#define qcomtee_msg_for_each_input_buffer(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, IB)
>> +#define qcomtee_msg_for_each_output_buffer(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, OB)
>> +#define qcomtee_msg_for_each_input_object(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, IO)
>> +#define qcomtee_msg_for_each_output_object(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, OO)
>> +
>> +/* Sum of arguments in a message. */
>> +#define qcomtee_msg_args(m) \
>> +	(QCOMTEE_MSG_IDX_OO((m)->counts) + QCOMTEE_MSG_NUM_OO((m)->counts))
>> +
>> +static inline void qcomtee_msg_init(struct qcomtee_msg_object_invoke *msg,
>> +				    u32 cxt, u32 op, int in_buffer,
>> +				    int out_buffer, int in_object,
>> +				    int out_object)
>> +{
>> +	msg->counts |= (in_buffer & 0xfU);
>> +	msg->counts |= ((out_buffer - in_buffer) & 0xfU) << 4;
>> +	msg->counts |= ((in_object - out_buffer) & 0xfU) << 8;
>> +	msg->counts |= ((out_object - in_object) & 0xfU) << 12;
>> +	msg->cxt = cxt;
>> +	msg->op = op;
>> +}
>> +
>> +/* Generic error codes. */
>> +#define QCOMTEE_MSG_OK			0    /* non-specific success code. */
>> +#define QCOMTEE_MSG_ERROR		1    /* non-specific error. */
>> +#define QCOMTEE_MSG_ERROR_INVALID	2    /* unsupported/unrecognized request. */
>> +#define QCOMTEE_MSG_ERROR_SIZE_IN	3    /* supplied buffer/string too large. */
>> +#define QCOMTEE_MSG_ERROR_SIZE_OUT	4    /* supplied output buffer too small. */
>> +#define QCOMTEE_MSG_ERROR_USERBASE	10   /* start of user-defined error range. */
>> +
>> +/* Transport layer error codes. */
>> +#define QCOMTEE_MSG_ERROR_DEFUNCT	-90  /* object no longer exists. */
>> +#define QCOMTEE_MSG_ERROR_ABORT		-91  /* calling thread must exit. */
>> +#define QCOMTEE_MSG_ERROR_BADOBJ	-92  /* invalid object context. */
>> +#define QCOMTEE_MSG_ERROR_NOSLOTS	-93  /* caller's object table full. */
>> +#define QCOMTEE_MSG_ERROR_MAXARGS	-94  /* too many args. */
>> +#define QCOMTEE_MSG_ERROR_MAXDATA	-95  /* buffers too large. */
>> +#define QCOMTEE_MSG_ERROR_UNAVAIL	-96  /* the request could not be processed. */
>> +#define QCOMTEE_MSG_ERROR_KMEM		-97  /* kernel out of memory. */
>> +#define QCOMTEE_MSG_ERROR_REMOTE	-98  /* local method sent to remote object. */
>> +#define QCOMTEE_MSG_ERROR_BUSY		-99  /* Object is busy. */
>> +#define QCOMTEE_MSG_ERROR_TIMEOUT	-103 /* Call Back Object invocation timed out. */
>> +
>> +static inline void qcomtee_msg_set_result(struct qcomtee_msg_callback *cb_msg,
>> +					  int err)
>> +{
>> +	if (!err) {
>> +		cb_msg->result = QCOMTEE_MSG_OK;
>> +	} else if (err < 0) {
>> +		/* If err < 0, then it is a transport error. */
>> +		switch (err) {
>> +		case -ENOMEM:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_KMEM;
>> +			break;
>> +		case -ENODEV:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_DEFUNCT;
>> +			break;
>> +		case -ENOSPC:
>> +		case -EBUSY:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_BUSY;
>> +			break;
>> +		case -EBADF:
>> +		case -EINVAL:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_UNAVAIL;
>> +			break;
>> +		default:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR;
>> +		}
>> +	} else {
>> +		/* If err > 0, then it is user defined error, pass it as is. */
>> +		cb_msg->result = err;
>> +	}
>> +}
>> +
>> +#endif /* QCOMTEE_MSG_H */
>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>> new file mode 100644
>> index 000000000000..d7f3812f6f01
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>> @@ -0,0 +1,309 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef QCOM_TEE_H
>> +#define QCOM_TEE_H
>> +
>> +#include <linux/completion.h>
>> +#include <linux/kref.h>
>> +#include <linux/slab.h>
>> +#include <linux/workqueue.h>
>> +
>> +struct qcomtee_object;
>> +
>> +/**
>> + * DOC: Overview
>> + *
>> + * qcomtee_object provides object refcounting, ID allocation for objects hosted
>> + * in the kernel, and necessary message marshaling for Qualcomm TEE (QTEE).
>> + *
>> + * To invoke an object in QTEE, the user calls qcomtee_object_do_invoke()
>> + * while passing an instance of &struct qcomtee_object and the requested
>> + * operation + arguments.
>> + *
>> + * After boot, QTEE provides a static object %ROOT_QCOMTEE_OBJECT (type of
>> + * %QCOMTEE_OBJECT_TYPE_ROOT). The root object is invoked to pass the user's
>> + * credentials and obtain other instances of &struct qcomtee_object (type of
>> + * %QCOMTEE_OBJECT_TYPE_TEE) that represent services and TAs in QTEE;
>> + * see &enum qcomtee_object_type.
>> + *
>> + * The objects received from QTEE are refcounted. So the owner of these objects
>> + * can issue qcomtee_object_get() to increase the refcount and pass objects
>> + * to other clients, or issue qcomtee_object_put() to decrease the refcount
>> + * and release the resources in QTEE.
>> + *
>> + * The kernel can host services accessible to QTEE. A driver should embed
>> + * an instance of &struct qcomtee_object in the struct it wants to export to
>> + * QTEE (this is called a callback object). It issues qcomtee_object_user_init()
>> + * to set the dispatch() operation for the callback object and set its type
>> + * to %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * core.c holds an object table for callback objects. An object ID is assigned
>> + * to each callback object, which is an index to the object table. QTEE uses
>> + * these IDs to reference or invoke callback objects.
>> + *
>> + * If QTEE invokes a callback object in the kernel, the dispatch() operation is
>> + * called in the context of the thread that originally called
>> + * qcomtee_object_do_invoke().
>> + */
>> +
>> +/**
>> + * enum qcomtee_object_type - Object types.
>> + * @QCOMTEE_OBJECT_TYPE_TEE: object hosted on QTEE.
>> + * @QCOMTEE_OBJECT_TYPE_CB: object hosted on kernel.
>> + * @QCOMTEE_OBJECT_TYPE_ROOT: 'primordial' object.
>> + * @QCOMTEE_OBJECT_TYPE_NULL: NULL object.
>> + *
>> + * The primordial object is used for bootstrapping the IPC connection between
>> + * the kernel and QTEE. It is invoked by the kernel when it wants to get a
>> + * 'client env'.
>> + */
>> +enum qcomtee_object_type {
>> +	QCOMTEE_OBJECT_TYPE_TEE,
>> +	QCOMTEE_OBJECT_TYPE_CB,
>> +	QCOMTEE_OBJECT_TYPE_ROOT,
>> +	QCOMTEE_OBJECT_TYPE_NULL,
>> +};
>> +
>> +/**
>> + * enum qcomtee_arg_type - Type of QTEE argument.
>> + * @QCOMTEE_ARG_TYPE_INV: invalid type.
>> + * @QCOMTEE_ARG_TYPE_OB: output buffer (OB).
>> + * @QCOMTEE_ARG_TYPE_OO: output object (OO).
>> + * @QCOMTEE_ARG_TYPE_IB: input buffer (IB).
>> + * @QCOMTEE_ARG_TYPE_IO: input object (IO).
>> + *
>> + * Use the invalid type to specify the end of the argument array.
>> + */
>> +enum qcomtee_arg_type {
>> +	QCOMTEE_ARG_TYPE_INV = 0,
>> +	QCOMTEE_ARG_TYPE_OB,
>> +	QCOMTEE_ARG_TYPE_OO,
>> +	QCOMTEE_ARG_TYPE_IB,
>> +	QCOMTEE_ARG_TYPE_IO,
>> +	QCOMTEE_ARG_TYPE_NR,
>> +};
>> +
>> +/**
>> + * define QCOMTEE_ARGS_PER_TYPE - Maximum arguments of a specific type.
>> + *
>> + * The QTEE transport protocol limits the maximum number of arguments of
>> + * a specific type (i.e., IB, OB, IO, and OO).
>> + */
>> +#define QCOMTEE_ARGS_PER_TYPE 16
>> +
>> +/* Maximum arguments that can fit in a QTEE message, ignoring the type. */
>> +#define QCOMTEE_ARGS_MAX (QCOMTEE_ARGS_PER_TYPE * (QCOMTEE_ARG_TYPE_NR - 1))
>> +
>> +struct qcomtee_buffer {
>> +	union {
>> +		void *addr;
>> +		void __user *uaddr;
>> +	};
>> +	size_t size;
>> +};
>> +
>> +/**
>> + * struct qcomtee_arg - Argument for QTEE object invocation.
>> + * @type: type of argument as &enum qcomtee_arg_type.
>> + * @flags: extra flags.
>> + * @b: address and size if the type of argument is a buffer.
>> + * @o: object instance if the type of argument is an object.
>> + *
>> + * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
>> + * states that &qcomtee_arg.b contains a userspace address in uaddr.
>> + */
>> +struct qcomtee_arg {
>> +	enum qcomtee_arg_type type;
>> +/* 'b.uaddr' holds a __user address. */
>> +#define QCOMTEE_ARG_FLAGS_UADDR BIT(0)
>> +	unsigned int flags;
>> +	union {
>> +		struct qcomtee_buffer b;
>> +		struct qcomtee_object *o;
>> +	};
>> +};
>> +
>> +static inline int qcomtee_args_len(struct qcomtee_arg *args)
>> +{
>> +	int i = 0;
>> +
>> +	while (args[i].type != QCOMTEE_ARG_TYPE_INV)
>> +		i++;
>> +	return i;
>> +}
>> +
>> +/* Context is busy (callback is in progress). */
>> +#define QCOMTEE_OIC_FLAG_BUSY BIT(1)
>> +/* Context needs to notify the current object. */
>> +#define QCOMTEE_OIC_FLAG_NOTIFY BIT(2)
>> +/* Context has shared state with QTEE. */
>> +#define QCOMTEE_OIC_FLAG_SHARED BIT(3)
>> +
>> +struct qcomtee_object_invoke_ctx {
>> +	/* TEE context for this invocation. */
>> +	struct tee_context *ctx;
>> +	unsigned long flags;
>> +	int errno;
>> +
>> +	/* Current object invoked in this callback context. */
>> +	struct qcomtee_object *object;
>> +
>> +	/* Dispatcher argument array (+1 for ending QCOMTEE_ARG_TYPE_INV). */
>> +	struct qcomtee_arg u[QCOMTEE_ARGS_MAX + 1];
>> +
>> +	/* Inbound and Outbound buffers shared with QTEE. */
>> +	struct qcomtee_buffer in_msg; /* Inbound buffer.  */
>> +	struct qcomtee_buffer out_msg; /* Outbound buffer. */
>> +	struct tee_shm *in_shm; /* TEE shm allocated for inbound buffer. */
>> +	struct tee_shm *out_shm; /* TEE shm allocated for outbound buffer. */
>> +
>> +	/* Extra data attached to this context. */
>> +	void *data;
> 
> Kernel doc style comment for this struct?
> 

Done.

>> +};
>> +
>> +static inline struct qcomtee_object_invoke_ctx *
>> +qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
>> +{
>> +	struct qcomtee_object_invoke_ctx *oic;
>> +
>> +	oic = kzalloc(sizeof(*oic), GFP_KERNEL);
>> +	if (oic)
>> +		oic->ctx = ctx;
>> +	return oic;
>> +}
>> +
>> +/**
>> + * qcomtee_object_do_invoke() - Submit an invocation for an object.
>> + * @oic: context to use for the current invocation.
>> + * @object: object being invoked.
>> + * @op: requested operation on the object.
>> + * @u: array of arguments for the current invocation.
>> + * @result: result returned from QTEE.
>> + *
>> + * The caller is responsible for keeping track of the refcount for each object,
>> + * including @object. On return, the caller loses ownership of all input
>> + * objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * @object can be of %QCOMTEE_OBJECT_TYPE_ROOT or %QCOMTEE_OBJECT_TYPE_TEE.
>> + *
>> + * Return: On success, returns 0. On error, returns -EAGAIN if invocation
>> + * failed and the user may retry the invocation, -ENODEV on fatal failure.
>> + */
>> +int qcomtee_object_do_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +			     struct qcomtee_object *object, u32 op,
>> +			     struct qcomtee_arg *u, int *result);
>> +
>> +/**
>> + * struct qcomtee_object_operations - Callback object operations.
>> + * @release: release the object if QTEE is not using it.
>> + * @dispatch: dispatch the operation requested by QTEE.
>> + * @notify: report the status of any pending response submitted by @dispatch.
>> + */
>> +struct qcomtee_object_operations {
>> +	void (*release)(struct qcomtee_object *object);
>> +	int (*dispatch)(struct qcomtee_object_invoke_ctx *oic,
>> +			struct qcomtee_object *object, u32 op,
>> +			struct qcomtee_arg *args);
>> +	void (*notify)(struct qcomtee_object_invoke_ctx *oic,
>> +		       struct qcomtee_object *object, int err);
>> +};
>> +
>> +/**
>> + * struct qcomtee_object - QTEE or kernel object.
>> + * @name: object name.
>> + * @refcount: reference counter.
>> + * @object_type: object type as &enum qcomtee_object_type.
>> + * @info: extra information for the object.
>> + * @ops: callback operations for objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + * @work: work for async operations on the object.
>> + *
>> + * @work is used for releasing objects of %QCOMTEE_OBJECT_TYPE_TEE type.
>> + */
>> +struct qcomtee_object {
>> +	const char *name;
>> +	struct kref refcount;
>> +
>> +	enum qcomtee_object_type object_type;
>> +	struct object_info {
>> +		unsigned long qtee_id;
>> +		/* TEE context for QTEE object async requests. */
>> +		struct tee_context *qcomtee_async_ctx;
>> +	} info;
>> +
>> +	struct qcomtee_object_operations *ops;
>> +	struct work_struct work;
>> +};
>> +
>> +/* Static instances of qcomtee_object objects. */
>> +#define NULL_QCOMTEE_OBJECT ((struct qcomtee_object *)(0))
>> +extern struct qcomtee_object qcomtee_object_root;
>> +#define ROOT_QCOMTEE_OBJECT (&qcomtee_object_root)
>> +
>> +static inline enum qcomtee_object_type
>> +typeof_qcomtee_object(struct qcomtee_object *object)
>> +{
>> +	if (object == NULL_QCOMTEE_OBJECT)
>> +		return QCOMTEE_OBJECT_TYPE_NULL;
>> +	return object->object_type;
>> +}
>> +
>> +static inline const char *qcomtee_object_name(struct qcomtee_object *object)
>> +{
>> +	if (object == NULL_QCOMTEE_OBJECT)
>> +		return "null";
>> +
>> +	if (!object->name)
>> +		return "no-name";
>> +	return object->name;
>> +}
>> +
>> +/**
>> + * qcomtee_object_user_init() - Initialize an object for the user.
>> + * @object: object to initialize.
>> + * @ot: type of object as &enum qcomtee_object_type.
>> + * @ops: instance of callbacks.
>> + * @fmt: name assigned to the object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_object_user_init(struct qcomtee_object *object,
>> +			     enum qcomtee_object_type ot,
>> +			     struct qcomtee_object_operations *ops,
>> +			     const char *fmt, ...);
>> +
>> +/* Object release is RCU protected. */
>> +int qcomtee_object_get(struct qcomtee_object *object);
>> +void qcomtee_object_put(struct qcomtee_object *object);
>> +
>> +#define qcomtee_arg_for_each(i, args) \
>> +	for (i = 0; args[i].type != QCOMTEE_ARG_TYPE_INV; i++)
>> +
>> +/* Next argument of type @type after index @i. */
>> +int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
>> +			  enum qcomtee_arg_type type);
>> +
>> +/* Iterate over argument of given type. */
>> +#define qcomtee_arg_for_each_type(i, args, at)       \
>> +	for (i = qcomtee_next_arg_type(args, 0, at); \
>> +	     args[i].type != QCOMTEE_ARG_TYPE_INV;   \
>> +	     i = qcomtee_next_arg_type(args, i + 1, at))
>> +
>> +#define qcomtee_arg_for_each_input_buffer(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_IB)
>> +#define qcomtee_arg_for_each_output_buffer(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_OB)
>> +#define qcomtee_arg_for_each_input_object(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_IO)
>> +#define qcomtee_arg_for_each_output_object(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_OO)
>> +
>> +struct qcomtee_object *
>> +qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
>> +
>> +struct qcomtee_object *
>> +qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> +			   struct qcomtee_object *client_env, u32 uid);
>> +
>> +#endif /* QCOM_TEE_H */
>> diff --git a/drivers/tee/qcomtee/shm.c b/drivers/tee/qcomtee/shm.c
>> new file mode 100644
>> index 000000000000..ab1182bb84ee
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/shm.c
>> @@ -0,0 +1,153 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/firmware/qcom/qcom_tzmem.h>
>> +#include <linux/mm.h>
>> +
>> +#include "qcomtee.h"
>> +
>> +/**
>> + * define MAX_OUTBOUND_BUFFER_SIZE - Maximum size of outbound buffers.
>> + *
>> + * The size of outbound buffer depends on QTEE callback requests.
>> + */
>> +#define MAX_OUTBOUND_BUFFER_SIZE SZ_4K
>> +
>> +/**
>> + * define MAX_INBOUND_BUFFER_SIZE - Maximum size of the inbound buffer.
>> + *
>> + * The size of the inbound buffer depends on the user's requests,
>> + * specifically the number of IB and OB arguments. If an invocation
>> + * requires a size larger than %MAX_INBOUND_BUFFER_SIZE, the user should
>> + * consider using another form of shared memory with QTEE.
>> + */
>> +#define MAX_INBOUND_BUFFER_SIZE SZ_4M
>> +
>> +/**
>> + * qcomtee_msg_buffers_alloc() - Allocate inbound and outbound buffers.
>> + * @oic: context to use for the current invocation.
>> + * @u: array of arguments for the current invocation.
>> + *
>> + * It calculates the size of inbound and outbound buffers based on the
>> + * arguments in @u. It allocates the buffers from the teedev pool.
>> + *
>> + * Return: On success, returns 0. On error, returns < 0.
>> + */
>> +int qcomtee_msg_buffers_alloc(struct qcomtee_object_invoke_ctx *oic,
>> +			      struct qcomtee_arg *u)
>> +{
>> +	struct tee_context *ctx = oic->ctx;
>> +	struct tee_shm *shm;
>> +	size_t size;
>> +	int i;
>> +
>> +	/* Start offset in a message for buffer arguments. */
>> +	size = qcomtee_msg_buffer_args(struct qcomtee_msg_object_invoke,
>> +				       qcomtee_args_len(u));
>> +	if (size > MAX_INBOUND_BUFFER_SIZE)
>> +		return -EINVAL;
>> +
>> +	/* Add size of IB arguments. */
>> +	qcomtee_arg_for_each_input_buffer(i, u) {
>> +		size = size_add(size, qcomtee_msg_offset_align(u[i].b.size));
>> +		if (size > MAX_INBOUND_BUFFER_SIZE)
>> +			return -EINVAL;
>> +	}
>> +
>> +	/* Add size of OB arguments. */
>> +	qcomtee_arg_for_each_output_buffer(i, u) {
>> +		size = size_add(size, qcomtee_msg_offset_align(u[i].b.size));
>> +		if (size > MAX_INBOUND_BUFFER_SIZE)
>> +			return -EINVAL;
>> +	}
>> +
>> +	shm = tee_shm_alloc_priv_buf(ctx, size);
>> +	if (IS_ERR(shm))
>> +		return PTR_ERR(shm);
>> +
>> +	/* Allocate inbound buffer. */
>> +	oic->in_shm = shm;
>> +	shm = tee_shm_alloc_priv_buf(ctx, MAX_OUTBOUND_BUFFER_SIZE);
>> +	if (IS_ERR(shm)) {
>> +		tee_shm_free(oic->in_shm);
>> +
>> +		return PTR_ERR(shm);
>> +	}
>> +	/* Allocate outbound buffer. */
>> +	oic->out_shm = shm;
>> +
>> +	oic->in_msg.addr = tee_shm_get_va(oic->in_shm, 0);
>> +	oic->in_msg.size = tee_shm_get_size(oic->in_shm);
>> +	oic->out_msg.addr = tee_shm_get_va(oic->out_shm, 0);
>> +	oic->out_msg.size = tee_shm_get_size(oic->out_shm);
>> +	/* QTEE assume unused buffers are zeroed. */
>> +	memzero_explicit(oic->in_msg.addr, oic->in_msg.size);
>> +	memzero_explicit(oic->out_msg.addr, oic->out_msg.size);
>> +
>> +	return 0;
>> +}
>> +
>> +void qcomtee_msg_buffers_free(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	tee_shm_free(oic->in_shm);
>> +	tee_shm_free(oic->out_shm);
>> +}
>> +
>> +/* Dynamic shared memory pool based on tee_dyn_shm_alloc_helper(). */
>> +
>> +static int qcomtee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
>> +				struct page **pages, size_t num_pages,
>> +				unsigned long start)
>> +{
>> +	return qcom_tzmem_shm_bridge_create(shm->paddr, shm->size,
>> +					    &shm->sec_world_id);
>> +}
>> +
>> +static int qcomtee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
>> +{
>> +	qcom_tzmem_shm_bridge_delete(shm->sec_world_id);
>> +
>> +	return 0;
>> +}
>> +
>> +static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
>> +			 size_t size, size_t align)
>> +{
>> +	if (!(shm->flags & TEE_SHM_PRIV))
>> +		return -ENOMEM;
>> +
>> +	return tee_dyn_shm_alloc_helper(shm, size, align, qcomtee_shm_register);
>> +}
>> +
>> +static void pool_op_free(struct tee_shm_pool *pool, struct tee_shm *shm)
>> +{
>> +	tee_dyn_shm_free_helper(shm, qcomtee_shm_unregister);
>> +}
>> +
>> +static void pool_op_destroy_pool(struct tee_shm_pool *pool)
>> +{
>> +	kfree(pool);
>> +}
>> +
>> +static const struct tee_shm_pool_ops pool_ops = {
>> +	.alloc = pool_op_alloc,
>> +	.free = pool_op_free,
>> +	.destroy_pool = pool_op_destroy_pool,
>> +};
>> +
>> +struct tee_shm_pool *qcomtee_shm_pool_alloc(void)
>> +{
>> +	struct tee_shm_pool *pool;
>> +
>> +	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
>> +	if (!pool)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	pool->ops = &pool_ops;
>> +
>> +	return pool;
>> +}
>> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
>> new file mode 100644
>> index 000000000000..c617f585b696
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/user_obj.c
>> @@ -0,0 +1,694 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/slab.h>
>> +
>> +#include "qcomtee.h"
>> +
>> +/**
>> + * DOC: User Objects aka Supplicants
>> + *
>> + * Any userspace process with access to the TEE device file can behave as a
>> + * supplicant by creating a user object. Any TEE parameter of type OBJREF with
>> + * %QCOMTEE_OBJREF_FLAG_USER flag set is considered a user object.
>> + *
>> + * A supplicant uses qcomtee_user_object_select() (i.e. TEE_IOC_SUPPL_RECV) to
>> + * receive a QTEE user object request and qcomtee_user_object_submit()
>> + * (i.e. TEE_IOC_SUPPL_SEND) to submit a response. QTEE expects to receive the
>> + * response, including OB and OO in a specific order in the message; parameters
>> + * submitted with qcomtee_user_object_submit() should maintain this order.
>> + */
>> +
>> +/**
>> + * struct qcomtee_user_object - User object.
>> + * @object: &struct qcomtee_object representing this user object.
>> + * @ctx: context for which the user object is defined.
>> + * @object_id: object ID in @ctx.
>> + * @notify: notify on release.
>> + *
>> + * Any object managed in userspace is represented by this struct.
>> + * If @notify is set, a notification message is sent back to userspace
>> + * upon release.
>> + */
>> +struct qcomtee_user_object {
>> +	struct qcomtee_object object;
>> +	struct tee_context *ctx;
>> +	u64 object_id;
>> +	bool notify;
>> +};
>> +
>> +#define to_qcomtee_user_object(o) \
>> +	container_of((o), struct qcomtee_user_object, object)
>> +
>> +static struct qcomtee_object_operations qcomtee_user_object_ops;
>> +
>> +/* Is it a user object? */
>> +int is_qcomtee_user_object(struct qcomtee_object *object)
>> +{
>> +	return object != NULL_QCOMTEE_OBJECT &&
>> +	       typeof_qcomtee_object(object) == QCOMTEE_OBJECT_TYPE_CB &&
>> +	       object->ops == &qcomtee_user_object_ops;
>> +}
>> +
>> +/* Set the user object's 'notify on release' flag. */
>> +void qcomtee_user_object_set_notify(struct qcomtee_object *object, bool notify)
>> +{
>> +	if (is_qcomtee_user_object(object))
>> +		to_qcomtee_user_object(object)->notify = notify;
>> +}
>> +
>> +/* Supplicant Requests: */
>> +
>> +/**
>> + * enum qcomtee_req_state - Current state of request.
>> + * @QCOMTEE_REQ_QUEUED: Request is waiting for supplicant.
>> + * @QCOMTEE_REQ_PROCESSING: Request has been picked by the supplicant.
>> + * @QCOMTEE_REQ_PROCESSED: Response has been submitted for the request.
>> + */
>> +enum qcomtee_req_state {
>> +	QCOMTEE_REQ_QUEUED = 1,
>> +	QCOMTEE_REQ_PROCESSING,
>> +	QCOMTEE_REQ_PROCESSED,
>> +};
>> +
>> +/* User requests sent to supplicants. */
>> +struct qcomtee_ureq {
>> +	enum qcomtee_req_state state;
>> +
>> +	/* User Request: */
>> +	int req_id;
>> +	u64 object_id;
>> +	u32 op;
>> +	struct qcomtee_arg *args;
>> +	int errno;
>> +
>> +	struct list_head node;
>> +	struct completion c; /* Completion for whoever wait. */
>> +};
>> +
>> +/*
>> + * Placeholder for a PROCESSING request in qcomtee_context.reqs_idr.
>> + *
>> + * If the thread that calls qcomtee_object_invoke() dies and the supplicant
>> + * is processing the request, we replace the entry in qcomtee_context.reqs_idr
>> + * with empty_ureq. This ensures that (1) the req_id remains busy and is not
>> + * reused, and (2) the supplicant fails to submit the response and performs
>> + * the necessary rollback.
>> + */
>> +static struct qcomtee_ureq empty_ureq = { .state = QCOMTEE_REQ_PROCESSING };
>> +
>> +/* Enqueue a user request for a context and assign a request ID. */
>> +static int ureq_enqueue(struct qcomtee_context_data *ctxdata,
>> +			struct qcomtee_ureq *ureq)
>> +{
>> +	int ret;
>> +
>> +	guard(mutex)(&ctxdata->reqs_lock);
>> +	/* Supplicant is dying. */
>> +	if (ctxdata->released)
>> +		return -ENODEV;
>> +
>> +	/* Allocate an ID and queue the request. */
>> +	ret = idr_alloc(&ctxdata->reqs_idr, ureq, 0, 0, GFP_KERNEL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ureq->req_id = ret;
>> +	ureq->state = QCOMTEE_REQ_QUEUED;
>> +	list_add_tail(&ureq->node, &ctxdata->reqs_list);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * ureq_dequeue() - Dequeue a user request from a context.
>> + * @ctxdata: context data for a context to dequeue the request.
>> + * @req_id: ID of the request to be dequeued.
>> + *
>> + * It dequeues a user request and releases its request ID.
>> + *
>> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
>> + * Return: Returns the user request associated with this ID; otherwise, NULL.
>> + */
>> +static struct qcomtee_ureq *ureq_dequeue(struct qcomtee_context_data *ctxdata,
>> +					 int req_id)
>> +{
>> +	struct qcomtee_ureq *ureq;
>> +
>> +	ureq = idr_remove(&ctxdata->reqs_idr, req_id);
>> +	if (ureq == &empty_ureq || !ureq)
>> +		return NULL;
>> +
>> +	list_del(&ureq->node);
>> +
>> +	return ureq;
>> +}
>> +
>> +/**
>> + * ureq_select() - Select the next request in a context.
>> + * @ctxdata: context data for a context to pop a request.
>> + * @ubuf_size: size of the available buffer for UBUF parameters.
>> + * @num_params: number of entries for the TEE parameter array.
>> + *
>> + * It checks if @num_params is large enough to fit the next request arguments.
>> + * It checks if @ubuf_size is large enough to fit IB buffer arguments.
>> + *
>> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
>> + * Return: On success, returns a request;
>> + *         on failure, returns NULL and ERR_PTR.
>> + */
>> +static struct qcomtee_ureq *ureq_select(struct qcomtee_context_data *ctxdata,
>> +					size_t ubuf_size, int num_params)
>> +{
>> +	struct qcomtee_ureq *req, *ureq = NULL;
>> +	struct qcomtee_arg *u;
>> +	int i;
>> +
>> +	/* Find the a queued request. */
>> +	list_for_each_entry(req, &ctxdata->reqs_list, node) {
>> +		if (req->state == QCOMTEE_REQ_QUEUED) {
>> +			ureq = req;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!ureq)
>> +		return NULL;
>> +
>> +	u = ureq->args;
>> +	/* (1) Is there enough TEE parameters? */
>> +	if (num_params < qcomtee_args_len(u))
>> +		return ERR_PTR(-EINVAL);
>> +	/* (2) Is there enough space to pass input buffers? */
>> +	qcomtee_arg_for_each_input_buffer(i, u) {
>> +		ubuf_size = size_sub(ubuf_size, u[i].b.size);
>> +		if (ubuf_size == SIZE_MAX)
>> +			return ERR_PTR(-EINVAL);
>> +
>> +		ubuf_size = round_down(ubuf_size, 8);
>> +	}
>> +
>> +	return ureq;
>> +}
>> +
>> +/* This is called when the user closes the device. */
>> +void qcomtee_requests_destroy(struct qcomtee_context_data *ctxdata)
>> +{
>> +	struct qcomtee_ureq *req, *ureq;
>> +
>> +	guard(mutex)(&ctxdata->reqs_lock);
>> +	/* So ureq_enqueue() refuses new requests from QTEE. */
>> +	ctxdata->released = true;
>> +	/* ureqs in reqs_list are in QUEUED or PROCESSING (!= empty_ureq) state. */
>> +	list_for_each_entry_safe(ureq, req, &ctxdata->reqs_list, node) {
>> +		ureq_dequeue(ctxdata, ureq->req_id);
>> +
>> +		if (ureq->op != QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>> +			ureq->state = QCOMTEE_REQ_PROCESSED;
>> +			ureq->errno = -ENODEV;
>> +
>> +			complete(&ureq->c);
>> +		} else {
>> +			kfree(ureq);
>> +		}
>> +	}
>> +}
>> +
>> +/* User Object API. */
>> +
>> +/* User object dispatcher. */
>> +static int qcomtee_user_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
>> +					struct qcomtee_object *object, u32 op,
>> +					struct qcomtee_arg *args)
>> +{
>> +	struct qcomtee_user_object *uo = to_qcomtee_user_object(object);
>> +	struct qcomtee_context_data *ctxdata = uo->ctx->data;
>> +	struct qcomtee_ureq *ureq __free(kfree) = NULL;
>> +	int errno;
>> +
>> +	ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
>> +	if (!ureq)
>> +		return -ENOMEM;
>> +
>> +	init_completion(&ureq->c);
>> +	ureq->object_id = uo->object_id;
>> +	ureq->op = op;
>> +	ureq->args = args;
>> +
>> +	/* Queue the request. */
>> +	if (ureq_enqueue(ctxdata, ureq))
>> +		return -ENODEV;
>> +	/* Wakeup supplicant to process it. */
>> +	complete(&ctxdata->req_c);
>> +
>> +	/*
>> +	 * Wait for the supplicant to process the request. We wait as KILLABLE
>> +	 * in case the supplicant and invoke thread are both running from the
>> +	 * same process, the supplicant crashes, or the shutdown sequence
>> +	 * starts with supplicant dies first; otherwise, it stuck indefinitely.
>> +	 *
>> +	 * If the supplicant processes long-running requests, also use
>> +	 * TASK_FREEZABLE to allow the device to safely suspend if needed.
>> +	 */
>> +	if (!wait_for_completion_state(&ureq->c,
>> +				       TASK_KILLABLE | TASK_FREEZABLE)) {
>> +		errno = ureq->errno;
>> +		if (!errno)
>> +			oic->data = no_free_ptr(ureq);
>> +	} else {
>> +		enum qcomtee_req_state prev_state;
>> +
>> +		errno = -ENODEV;
>> +
>> +		scoped_guard(mutex, &ctxdata->reqs_lock) {
>> +			prev_state = ureq->state;
>> +			/* Replace with empty_ureq to keep req_id reserved. */
>> +			if (prev_state == QCOMTEE_REQ_PROCESSING) {
>> +				list_del(&ureq->node);
>> +				idr_replace(&ctxdata->reqs_idr,
>> +					    &empty_ureq, ureq->req_id);
>> +
>> +			/* Remove as supplicant has never seen this request. */
>> +			} else if (prev_state == QCOMTEE_REQ_QUEUED) {
>> +				ureq_dequeue(ctxdata, ureq->req_id);
>> +			}
>> +		}
>> +
>> +		/* Supplicant did some work, we should not discard it. */
>> +		if (prev_state == QCOMTEE_REQ_PROCESSED) {
>> +			errno = ureq->errno;
>> +			if (!errno)
>> +				oic->data = no_free_ptr(ureq);
>> +		}
>> +	}
>> +
>> +	return errno;
>> +}
>> +
>> +/* This is called after submitting the dispatcher response. */
>> +static void qcomtee_user_object_notify(struct qcomtee_object_invoke_ctx *oic,
>> +				       struct qcomtee_object *unused_object,
>> +				       int err)
>> +{
>> +	struct qcomtee_ureq *ureq = oic->data;
>> +	struct qcomtee_arg *u = ureq->args;
>> +	int i;
>> +
>> +	/*
>> +	 * If err, there was a transport issue, and QTEE did not receive the
>> +	 * response for the dispatcher. Release the callback object created for
>> +	 * QTEE, in addition to the copies of objects kept for the drivers.
>> +	 */
>> +	qcomtee_arg_for_each_output_object(i, u) {
>> +		if (err &&
>> +		    (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB))
>> +			qcomtee_object_put(u[i].o);
>> +		qcomtee_object_put(u[i].o);
> 
> Why double qcomtee_object_put()?
> 
>> +	}
>> +
>> +	kfree(ureq);
>> +}
>> +
>> +static void qcomtee_user_object_release(struct qcomtee_object *object)
>> +{
>> +	struct qcomtee_user_object *uo = to_qcomtee_user_object(object);
>> +	struct qcomtee_context_data *ctxdata = uo->ctx->data;
>> +	struct qcomtee_ureq *ureq;
>> +
>> +	/* RELEASE does not require any argument. */
>> +	static struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };
>> +
>> +	if (!uo->notify)
>> +		goto out_no_notify;
>> +
>> +	ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
>> +	if (!ureq)
>> +		goto out_no_notify;
>> +
>> +	/* QUEUE a release request: */
>> +	ureq->object_id = uo->object_id;
>> +	ureq->op = QCOMTEE_MSG_OBJECT_OP_RELEASE;
>> +	ureq->args = args;
>> +	if (ureq_enqueue(ctxdata, ureq)) {
>> +		kfree(ureq);
>> +		/* Ignore the notification if it cannot be queued. */
>> +		goto out_no_notify;
>> +	}
>> +
>> +	complete(&ctxdata->req_c);
>> +
>> +out_no_notify:
>> +	teedev_ctx_put(uo->ctx);
>> +	kfree(uo);
>> +}
>> +
>> +static struct qcomtee_object_operations qcomtee_user_object_ops = {
>> +	.release = qcomtee_user_object_release,
>> +	.notify = qcomtee_user_object_notify,
>> +	.dispatch = qcomtee_user_object_dispatch,
>> +};
>> +
>> +/**
>> + * qcomtee_user_param_to_object() - OBJREF parameter to &struct qcomtee_object.
>> + * @object: object returned.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_USER flags.
>> + * It calls qcomtee_object_get() to keep a copy of @object for the driver
>> + * as well as a copy for QTEE.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_param_to_object(struct qcomtee_object **object,
>> +				 struct tee_param *param,
>> +				 struct tee_context *ctx)
>> +{
>> +	struct qcomtee_user_object *user_object __free(kfree) = NULL;
>> +	int err;
>> +
>> +	user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
>> +	if (!user_object)
>> +		return -ENOMEM;
>> +
>> +	user_object->ctx = ctx;
>> +	user_object->object_id = param->u.objref.id;
>> +	/* By default, always notify userspace upon release. */
>> +	user_object->notify = true;
>> +	err = qcomtee_object_user_init(&user_object->object,
>> +				       QCOMTEE_OBJECT_TYPE_CB,
>> +				       &qcomtee_user_object_ops, "uo-%lu",
>> +				       param->u.objref.id);
>> +	if (err)
>> +		return err;
>> +	/* Matching teedev_ctx_put() is in qcomtee_user_object_release(). */
>> +	teedev_ctx_get(ctx);
>> +
>> +	*object = &no_free_ptr(user_object)->object;
>> +	qcomtee_object_get(*object);
>> +
>> +	return 0;
>> +}
>> +
>> +/* Reverse what qcomtee_user_param_to_object() does. */
>> +int qcomtee_user_param_from_object(struct tee_param *param,
>> +				   struct qcomtee_object *object,
>> +				   struct tee_context *ctx)
>> +{
>> +	struct qcomtee_user_object *uo;
>> +
>> +	uo = to_qcomtee_user_object(object);
>> +	/* Ensure the object is in the same context as the caller. */
>> +	if (uo->ctx != ctx)
>> +		return -EINVAL;
>> +
>> +	param->u.objref.id = uo->object_id;
>> +	param->u.objref.flags = QCOMTEE_OBJREF_FLAG_USER;
>> +
>> +	/* User objects are valid in userspace; do not keep a copy. */
>> +	qcomtee_object_put(object);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_cb_params_from_args() - Convert QTEE arguments to TEE parameters.
>> + * @params: TEE parameters.
>> + * @u: QTEE arguments.
>> + * @num_params: number of elements in the parameter array.
>> + * @ubuf_addr: user buffer for arguments of type %QCOMTEE_ARG_TYPE_IB.
>> + * @ubuf_size: size of the user buffer.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It expects @params to have enough entries for @u. Entries in @params are of
>> + * %TEE_IOCTL_PARAM_ATTR_TYPE_NONE.
>> + *
>> + * Return: On success, returns the number of input parameters;
>> + *         on failure, returns < 0.
>> + */
>> +static int qcomtee_cb_params_from_args(struct tee_param *params,
>> +				       struct qcomtee_arg *u, int num_params,
>> +				       void __user *ubuf_addr, size_t ubuf_size,
>> +				       struct tee_context *ctx)
>> +{
>> +	int i, np;
>> +	void __user *uaddr;
>> +
>> +	qcomtee_arg_for_each(i, u) {
>> +		switch (u[i].type) {
>> +		case QCOMTEE_ARG_TYPE_IB:
>> +			params[i].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
>> +
>> +			/* Underflow already checked in ureq_select(). */
>> +			ubuf_size = round_down(ubuf_size - u[i].b.size, 8);
>> +			uaddr = (void *__user)(ubuf_addr + ubuf_size);
>> +
>> +			params[i].u.ubuf.uaddr = uaddr;
>> +			params[i].u.ubuf.size = u[i].b.size;
>> +			if (copy_to_user(params[i].u.ubuf.uaddr, u[i].b.addr,
>> +					 u[i].b.size))
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OB:
>> +			params[i].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT;
>> +			/* Let the user knows the maximum size we expect. */
>> +			params[i].u.ubuf.size = u[i].b.size;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_IO:
>> +			params[i].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT;
>> +			if (qcomtee_objref_from_arg(&params[i], &u[i], ctx))
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OO:
>> +			params[i].attr =
>> +				TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT;
>> +
>> +			break;
>> +		default: /* Never get here! */
>> +			goto out_failed;
>> +		}
>> +	}
>> +
>> +	return i;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_from_arg(). */
>> +	for (np = i; np >= 0; np--) {
>> +		if (params[np].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT)
>> +			qcomtee_context_del_qtee_object(&params[np], ctx);
>> +	}
>> +
>> +	/* Release any IO objects not processed. */
>> +	for (; u[i].type; i++) {
> 
> Lets have a bound check here too.
> 

We loop over u[] to initialize the param array, so num_params is guaranteed
to be greater than or equal to sizeof(u) by ureq_select(). Therefore, the
bound check isn’t useful here.

Regards,
Amir

>> +		if (u[i].type == QCOMTEE_ARG_TYPE_IO)
>> +			qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * qcomtee_cb_params_to_args() - Convert TEE parameters to QTEE arguments.
>> + * @u: QTEE arguments.
>> + * @params: TEE parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_cb_params_to_args(struct qcomtee_arg *u,
>> +				     struct tee_param *params, int num_params,
>> +				     struct tee_context *ctx)
>> +{
>> +	int i;
>> +
>> +	qcomtee_arg_for_each(i, u) {
>> +		switch (u[i].type) {
>> +		case QCOMTEE_ARG_TYPE_IB:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OB:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT)
>> +				goto out_failed;
>> +
>> +			/* Client can not send more data than requested. */
>> +			if (params[i].u.ubuf.size > u[i].b.size)
>> +				goto out_failed;
>> +
>> +			if (copy_from_user(u[i].b.addr, params[i].u.ubuf.uaddr,
>> +					   params[i].u.ubuf.size))
>> +				goto out_failed;
>> +
>> +			u[i].b.size = params[i].u.ubuf.size;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_IO:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT)
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OO:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
>> +				goto out_failed;
>> +
>> +			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
>> +				goto out_failed;
>> +
>> +			break;
>> +		default: /* Never get here! */
>> +			goto out_failed;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_to_arg(). */
>> +	for (i--; i >= 0; i--) {
>> +		if (u[i].type != QCOMTEE_ARG_TYPE_OO)
>> +			continue;
>> +
>> +		qcomtee_user_object_set_notify(u[i].o, false);
>> +		if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
>> +			qcomtee_object_put(u[i].o);
>> +
>> +		qcomtee_object_put(u[i].o);
> 
> Ditto here.
> 
> -Sumit
> 
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * qcomtee_user_object_select() - Select a request for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: parameters for @op.
>> + * @num_params: number of elements in the parameter array.
>> + * @uaddr: user buffer for output UBUF parameters.
>> + * @size: size of user buffer @uaddr.
>> + * @data: information for the selected request.
>> + *
>> + * @params is filled along with @data for the selected request.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_select(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       void __user *uaddr, size_t size,
>> +			       struct qcomtee_user_object_request_data *data)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_ureq *ureq;
>> +	int ret;
>> +
>> +	/*
>> +	 * Hold the reqs_lock not only for ureq_select() and updating the ureq
>> +	 * state to PROCESSING but for the entire duration of ureq access.
>> +	 * This prevents qcomtee_user_object_dispatch() from freeing
>> +	 * ureq while it is still in use, if client dies.
>> +	 */
>> +
>> +	while (1) {
>> +		scoped_guard(mutex, &ctxdata->reqs_lock) {
>> +			ureq = ureq_select(ctxdata, size, num_params);
>> +			if (!ureq)
>> +				goto wait_for_request;
>> +
>> +			if (IS_ERR(ureq))
>> +				return PTR_ERR(ureq);
>> +
>> +			/* Processing the request 'QUEUED -> PROCESSING'. */
>> +			ureq->state = QCOMTEE_REQ_PROCESSING;
>> +			/* ''Prepare user request:'' */
>> +			data->id = ureq->req_id;
>> +			data->object_id = ureq->object_id;
>> +			data->op = ureq->op;
>> +			ret = qcomtee_cb_params_from_args(params, ureq->args,
>> +							  num_params, uaddr,
>> +							  size, ctx);
>> +			if (ret >= 0)
>> +				goto done_request;
>> +
>> +			/* Something is wrong with the request: */
>> +			ureq_dequeue(ctxdata, data->id);
>> +			/* Send error to QTEE. */
>> +			ureq->state = QCOMTEE_REQ_PROCESSED;
>> +			ureq->errno = ret;
>> +
>> +			complete(&ureq->c);
>> +		}
>> +
>> +		continue;
>> +wait_for_request:
>> +		/* Wait for a new QUEUED request. */
>> +		if (wait_for_completion_interruptible(&ctxdata->req_c))
>> +			return -ERESTARTSYS;
>> +	}
>> +
>> +done_request:
>> +	/* No one is waiting for the response. */
>> +	if (data->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>> +		scoped_guard(mutex, &ctxdata->reqs_lock)
>> +			ureq_dequeue(ctxdata, data->id);
>> +		kfree(ureq);
>> +	}
>> +
>> +	data->np = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_user_object_submit() - Submit a response for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: returned parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @req_id: request ID for the response.
>> + * @errno: result of user object invocation.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_submit(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       int req_id, int errno)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_ureq *ureq;
>> +
>> +	/* See comments for reqs_lock in qcomtee_user_object_select(). */
>> +	guard(mutex)(&ctxdata->reqs_lock);
>> +
>> +	ureq = ureq_dequeue(ctxdata, req_id);
>> +	if (!ureq)
>> +		return -EINVAL;
>> +
>> +	ureq->state = QCOMTEE_REQ_PROCESSED;
>> +
>> +	if (!errno)
>> +		ureq->errno = qcomtee_cb_params_to_args(ureq->args, params,
>> +							num_params, ctx);
>> +	else
>> +		ureq->errno = errno;
>> +	/* Return errno if qcomtee_cb_params_to_args() failed; otherwise 0. */
>> +	if (!errno && ureq->errno)
>> +		errno = ureq->errno;
>> +	else
>> +		errno = 0;
>> +
>> +	/* Send result to QTEE. */
>> +	complete(&ureq->c);
>> +
>> +	return errno;
>> +}
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index 71a365afb89b..725051324515 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -59,6 +59,7 @@
>>  #define TEE_IMPL_ID_OPTEE	1
>>  #define TEE_IMPL_ID_AMDTEE	2
>>  #define TEE_IMPL_ID_TSTEE	3
>> +#define TEE_IMPL_ID_QTEE	4
>>  
>>  /*
>>   * OP-TEE specific capabilities
>>
>> -- 
>> 2.34.1
>>

