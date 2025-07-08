Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFD8AFBF29
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 02:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C885910E0D0;
	Tue,  8 Jul 2025 00:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHH0sG8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8449010E0D0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 00:18:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567DAXfr016337
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Jul 2025 00:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oaTOEkIO8yrsO0UKiWwZlqMg1M5J5KL8pwQLxI4CLgg=; b=nHH0sG8E+AXC4w4U
 T4O+a6q0EEjbnZQYFWebBAmLf1LFy5Z5grmBAUj38+fCP789t8D5bX+71ZNR6c6O
 GLAMa7KnfJMTt7SB1HVCtKMcZkAM8evugiLo9SgqYP5JUPcyDLNcn+Egu7JLPVcr
 c9hJKiCNhXIgebs3eEnBzEf/l8lpJyfuykGn8tx8AJt85i7j5zQ3DmYD5xJXoTGS
 16ndMIsTGrgYwojG+OE8FyCp6Kil7m92n/qQ36Av0+ueocIKULV+rC6qWTCg0svQ
 SNez+wSpq1uksn32XBms6yrpuna1MZ3yV5Roa5dKd8RGFg+NtwH1Jfwj+zKsisf8
 UBPw1Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0q2p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 00:18:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235c897d378so33669725ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 17:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751933898; x=1752538698;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oaTOEkIO8yrsO0UKiWwZlqMg1M5J5KL8pwQLxI4CLgg=;
 b=M6OscaUs4laYXXWQWOxjWFDfGce/tb4prKHIIadXNlTkocleEOrtqgELIyslbzfZA3
 sSGU9Q/6pG3g63Bar4/3yvKTseJ2NXze81XChlEBY3tSEkp2a3c6uIPoIuRSzAarEOL4
 j6meA35jrWp4qwA5S41GjXIz/zH/R9d0ijXiFDk7OhTFVSi/0Vd7lcNDIGO011i6iT+G
 hwMjMlLzrv6P3ppycvc7Xwr3mwbbHuqGvtLHcl2hjsQ3j3vaFbg3JR31MxCotoRgzlTj
 UgrrZ5pW7PGRi/9O9kMEKosZcrXvuX1Q40zD07zAWhMliirXooOdkgeq9DpbQmDdQeKr
 jO3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbH+QEWh2bWyIQQrav0CDvdVzkMisMQb/d688ZkOldz96Yle6YeHgVT1qYUEAglNMDvI1FRs3ScHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTNCoDEQONFX7gJIFGcJhweSQ8Lpt+SY1v9ej1s6NgPsUlup0o
 n+KgeTciJuuP7yHL0QuwLTyXo5GK6nCi+UmeeCBZLRhvxEEp1d2eGM6a0FvEP1wGvard+678yV6
 dAzRdURseft0vCQZhndFG5yMoaQvOJr1HUNbET4HpZXMd5KbUJegKMGhQv52R9ETVfxgIeQ==
X-Gm-Gg: ASbGncuvLnp4E1LWOzbFjoExC0yK+bl01a/QcKj+3oEsUQ9F/hh4qYYgfzxxy46BAce
 xemNoDR/7KSNGSghvLA9Cogl2cm7pDNy8dVp7CdYHcuk4LiTm5hW0hap18B5iz9dJAjS9hCFQe+
 mhmDB/FUZg2l5svc86V9XwDhYVBP1IT6dGRLbliBp1vPPfWPxK9cBW0Ahf9lf3mqjFUPDt0KZfb
 BSSQa2BN+vWTWn+GlNjnmjYnvvLzc/Dn8MGWE1YgUaJlcY/xWVLa1+ezRHTuTpJJ9kJCwFcG3NC
 Ax6AOV5Rd3v+DFtgJlUqRt9hClRvTldYkArt89n2chAgEM/4ZNn+Ng/3gptjcmFV2mzuRl4ZjoK
 ebfEYyCAJzw9qUbxtGXZ3
X-Received: by 2002:a17:903:244c:b0:234:d679:72e3 with SMTP id
 d9443c01a7336-23dd1d80da1mr8271185ad.42.1751933897827; 
 Mon, 07 Jul 2025 17:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMM+Gbo9/WjlZPVlIIUZQ4YQst2yhj+gXkh09Rr5WiqbDyV2/LPR3+ycOzSMRJJQfm2+cqXA==
X-Received: by 2002:a17:903:244c:b0:234:d679:72e3 with SMTP id
 d9443c01a7336-23dd1d80da1mr8270825ad.42.1751933897349; 
 Mon, 07 Jul 2025 17:18:17 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8457e4d2sm103006315ad.148.2025.07.07.17.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 17:18:13 -0700 (PDT)
Message-ID: <07cd8098-2d2e-4f90-96c0-64f8547e291f@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 10:18:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-8-024e3221b0b9@oss.qualcomm.com>
 <2455f20c-130c-4f27-9cf4-6411e485b845@quicinc.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <2455f20c-130c-4f27-9cf4-6411e485b845@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686c63ca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pz6wV3uveH3Zlr5Ofa0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAwMSBTYWx0ZWRfXzB8hNWpttNfx
 BrtUcX9NpNTy4uSHplL5kqSPGfPrjz/cs3kWHU3IzQDNbefem3oMjNWbOirk5YflDm7IMHAcQTa
 wWjgzmPg3CSCUXzsnCjfmf2v07jwIi4y3qj/zWKHjN2hk6y6YE/fC3f3RE2zc/IZBeUBts5K5a5
 aFHqcvfNac1HgY+gVc20xvnt/0lpaUy4saJAeS1sLIruCQnzlq21gAdOd93p5+9yxZLmDYNuG1k
 un3N9/EdQgpDy77mx5lvDifpLBpryke7BM3jAru/uPcqyvvG3NQk3drry2WJXjuASw9mVqH8sOe
 FJ2de2pb1aPLueO0ArgxwWr+MhmLo/XnvZqPnYi7d9Hz5vSZGPIMiFO1XnqLKgHwYmw7d053xG4
 oWMN1BK6yRcbD4fzBypExe2Uy1Z+ljt9sFsNBO5fdsZ5ogAKM1cMR+QbcZOQ7QgCcjRHWTs3
X-Proofpoint-GUID: JNWsV1BEO_Ex6DJJurFG6ZoXXB9U-JOl
X-Proofpoint-ORIG-GUID: JNWsV1BEO_Ex6DJJurFG6ZoXXB9U-JOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_06,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080001
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

Hi Kuldeep,

On 7/1/2025 9:47 PM, Kuldeep Singh wrote:
> 
> On 5/27/2025 12:26 PM, Amirreza Zarrabi wrote:
>> Anyone with access to contiguous physical memory should be able to
>> share memory with QTEE using shm_bridge.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
>>  include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
>>  2 files changed, 60 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
>> index 4fe333fd2f07..e9e4f06924ae 100644
>> --- a/drivers/firmware/qcom/qcom_tzmem.c
>> +++ b/drivers/firmware/qcom/qcom_tzmem.c
>> @@ -108,25 +108,61 @@ static int qcom_tzmem_init(void)
>>  	return 0;
>>  }
>>  
>> -static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
>> +/**
>> + * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
>> + * @paddr: Physical address of the memory to share.
>> + * @size: Size of the memory to share.
>> + * @handle: Handle to the SHM bridge.
>> + *
>> + * On platforms that support SHM bridge, this function creates a SHM bridge
>> + * for the given memory region with QTEE. The handle returned by this function
>> + * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
>>  {
>>  	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
>> -	int ret;
>>  
>>  	if (!qcom_tzmem_using_shm_bridge)
>>  		return 0;
>>  
>> -	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
>> -	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
>> -	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
>> +	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
>> +	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
>> +	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
>> +	if (qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
>> +				       size_and_flags, QCOM_SCM_VMID_HLOS,
>> +				       handle))
> 
> Can we add a debug log here to ease debugging in future?
> Something like this can also work.
> 
> pr_err("Shm bridge creation failed, ret: %d, NS PA|Perm: 0x%llx,
> size|flags: 0x%llx\n", ret, pfn_and_ns_perm_flags, size_and_flags);
> 

Sure.

Regards,
Amir

>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);
> 

