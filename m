Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH44NqY3e2kYCgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:34:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516BAECA6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA8710E31D;
	Thu, 29 Jan 2026 10:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsdHiQUF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATixildx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0656C10E31D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:34:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60TAUW2v2033385
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KO0htA/d0y/mirbvcIIa1OvhBQKN8BLF6fxwYd3a6es=; b=WsdHiQUFxYouqU2U
 oJjAvlJG69g8TxV9l3RHbNM/0ysIu5+Zhlb/Q29pp5fFMRF9T56mL8SZ2zTCgu3B
 M4RQSPQTbHHgpm0/5qSzyklV7AvGHv7EpTbgvpTNdqUFIzigLGlJscZ4JVzYHDI/
 +n6hLR2u94G7U9sEBDDibbYE9c9z5xuyS1UabLf4WaRZoul0Kydj57YqGJ/MBueW
 VEgBJ8sQAgLM68nnu1xZ2CrmKeWwBtu3mt3M0WYmFFc+HojAylH/KVZLJ1jIpLbm
 EM6VAkoSSFD0nNuImO/ZRmGou3QVkduPTD2DoVrBo7DwYJ0fblzKcy0hjAj2wSSa
 uOKGeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7k9a7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:34:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29f1f79d6afso9539365ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 02:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769682849; x=1770287649;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KO0htA/d0y/mirbvcIIa1OvhBQKN8BLF6fxwYd3a6es=;
 b=ATixildxizoruMzXT86LVo1JoNUBaK4+kHVB/yYzeJptkyzCqJ7sDRSstu9H/plv8U
 ZmZWmbIyhvh8MhCI8tqa7tsZHNdNAG8YqGM/9CLMlo3pgakMzVFtiDy/apxLx5Ar0yyI
 M95RGr2ljePT980uxF54Kc0+kOoWdfF61GM3J2bRrfJ/DPTYHObZTTtcDdgR1+raWXgz
 K4sF4lPMlxyChaQg+rfxrU0h2C74KmFkxd8ny26zxgOPWd/BGfVejGlOVKA5jv2COkD7
 /IMe7s7bgwyIesic8ENGO8yoSpgMa6zHWNBhBykLPt3f7wYj0yPTUaeO49lipWgbdILa
 vxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769682849; x=1770287649;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KO0htA/d0y/mirbvcIIa1OvhBQKN8BLF6fxwYd3a6es=;
 b=IUMf7ZS+iMV8aF41Bv6DIibt5+yFglCKPPlWio5/WlFlIp58xJ543cMaWVVvVGWFv6
 CAx2k+3U9JBOZVKGF4uwTKzpbE1mDEQzwBbLAwI4RXUOysTe50REkwp6hRA+N1xqGxmr
 nJUhAAircXk+ZWK5hiV9ii3hrj2I4NDxijzAjhXPt/ydd5XTc+39Imw/tZ/QN9MBvAAp
 yWmBiKrP4vRzOimM+cIFgCBj6zCPGc65iCF+lCtzNNdMDpkAnG8v9Lfi/PRjkeHmePqY
 uRXuRN4BNuPujN/V/b2t6f/UXXnAmkileJLqotmwG0PaxwWmbfqKRpO/pbYLy7HL6SkZ
 8t3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvcXOi/0MjEqC6ysgk7HTGj5cZ/BHVotbU4CVrd0lIThcGICuWfh18nThuSK1f2py0NjKHnG/Lehk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR7ve6Gl65u02zgQOPphd1KGUr1vYxnUkEvzPFF3aiKqW/g/1d
 KAqSrxK9Wf5mVqLD0X5OT/ZoukJS2g/qSCxGjcsfokraLmZHlUICBaLCUCQYwJH00J63c73avcn
 XJ5Ob9Tq8WC44dr+J8BhZYDuAjTqGUVPRq2Vsnv2RambLDqaqnM5N7cLNIKjJT3DBwwqPBhR5Nx
 DP16I=
X-Gm-Gg: AZuq6aJ7YzBDs1eO7DLKOF8shbh2r4wox2ritlfre4eu5NKP3vpc8muXuQJ9P+QMm3A
 TWq/WjySo6oiatfh18wUBMoLqGKXGWheO+1UhE32I7tJnDNaJo4O7uHPBhn2TnvN7qkxo/8Eb2i
 C2yP7R4KQ3huFoOVymK83U9lMYddm0QYtMzwKPyLbSJtKmx5BD1ZHPCEMxeUnV79lB1V8ySd7bg
 k7IdqlHMl1vrGG5sU2CXnj0RARoq9U8crOLcDFOSW65l7OyZL2wd5D0LPDn6iH6F7/a5xMrEmo/
 iUixmQG2YFpvQvuBK4824y9jbS8LNnOwFN6luprvwAWxDyB28B2uTBssOkl69Hry4On0s/Ve8zl
 N4IVtSOJF2tprjNcIRtfYsg2xL0rMcpaSQ19Phw==
X-Received: by 2002:a17:903:90f:b0:2a7:80ac:85b2 with SMTP id
 d9443c01a7336-2a870d6420bmr79468075ad.16.1769682848548; 
 Thu, 29 Jan 2026 02:34:08 -0800 (PST)
X-Received: by 2002:a17:903:90f:b0:2a7:80ac:85b2 with SMTP id
 d9443c01a7336-2a870d6420bmr79467935ad.16.1769682847956; 
 Thu, 29 Jan 2026 02:34:07 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3d2bsm48016715ad.53.2026.01.29.02.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 02:34:07 -0800 (PST)
Message-ID: <932b5879-8e35-4ead-b0b5-fdb5945dde8a@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:04:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 konrad.dybcio@oss.qualcomm.com
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-5-ekansh.gupta@oss.qualcomm.com>
 <z6oyuqmts55um67wrthxcm3fc5n2r25d66r2kcgfiqsxwntlit@xaad7ek2hq4j>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <z6oyuqmts55um67wrthxcm3fc5n2r25d66r2kcgfiqsxwntlit@xaad7ek2hq4j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j7BLBfi8vihzTmr0B4z9q4toQpVnVaIW
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697b37a1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5DFYxTXXmBTTg87Ck3YA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: j7BLBfi8vihzTmr0B4z9q4toQpVnVaIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2OSBTYWx0ZWRfXxYZCFeKFpPtX
 eYG2V3Om8RTw31kHwg7HCNAMpkl7nPV/nDfkqiGRnV5fgB7mqWkhIqQhdpZ8uPSW78HZuQ/QnLP
 Fg6bIHDb/NWi/tCU0nLdYjPR7wZXzbFJCUpfbNlWlk9J1/Q8DLwzMa+7CNATwHAdm5T8E00c99w
 F7tk15HuykDlbzxYUWZmP1FrNPuKBtY5Ujy+A3AILV70F0hPhWpB4wsXNn5o9MLzB4o/JtuM9WF
 2R0KiobfTAnzTomIHb+fhXeKvOydHAqw4L62aT1Bhx8GIqClhS+OBq6JSLwMQqO7xkODXpQIYRq
 cvYA+KCQeTRYNKZmAD5jefWOqj6aMl2pp3Vq0FL1fdBAQAgD2Oux2IfoFUYKMlUpfFKA3nof4Sh
 Sgx/ekTOJCkouQ9NNdKRp+cCyPlBKFPMay7EsWT3qykhZjPlGLXFZUk9B+VtJmbGziGZ1dQI30f
 8880vk2mEKqyNbR4aKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290069
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4516BAECA6
X-Rspamd-Action: no action



On 1/6/2026 8:29 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 11:58:31AM +0530, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. This adds latency to overall fastrpc
>> call as CPU wakeup and scheduling latencies are included. Add polling
>> mode support with which fastRPC driver will poll continuously on a
>> memory after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
>> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
>> request with FASTRPC_POLL_MODE request id.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c      | 139 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |   9 +++
>>  2 files changed, 141 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 222ff15e04bd..d95d31d27b82 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <uapi/misc/fastrpc.h>
>>  #include <linux/of_reserved_mem.h>
>> +#include <linux/compiler.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/bitfield.h>
>>  
>>  #define ADSP_DOMAIN_ID (0)
>> @@ -38,6 +40,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>>  #define FASTRPC_CTXID_MASK GENMASK(15, 8)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>> @@ -106,6 +109,12 @@
>>  
>>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>  
>> +/* Poll response number from remote processor for call completion */
>> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
>> +
>> +/* Polling mode timeout limit */
>> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
>> +
>>  struct fastrpc_phy_page {
>>  	u64 addr;		/* physical address */
>>  	u64 size;		/* size of contiguous region */
>> @@ -236,8 +245,14 @@ struct fastrpc_invoke_ctx {
>>  	u32 sc;
>>  	u64 *fdlist;
>>  	u32 *crc;
>> +	/* Poll memory that DSP updates */
>> +	u32 *poll;
>>  	u64 ctxid;
>>  	u64 msg_sz;
>> +	/* work done status flag */
>> +	bool is_work_done;
>> +	/* process updates poll memory instead of glink response */
>> +	bool is_polled;
>>  	struct kref refcount;
>>  	struct list_head node; /* list of ctxs */
>>  	struct completion work;
>> @@ -301,6 +316,8 @@ struct fastrpc_user {
>>  	int client_id;
>>  	int pd;
>>  	bool is_secure_dev;
>> +	/* Flags poll mode state */
>> +	bool poll_mode;
>>  	/* Lock for lists */
>>  	spinlock_t lock;
>>  	/* lock for allocations */
>> @@ -894,7 +911,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>>  		sizeof(struct fastrpc_invoke_buf) +
>>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
>> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
>> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
>> +		sizeof(u32);
>>  
>>  	return size;
>>  }
>> @@ -990,6 +1008,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>> +	ctx->poll = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST + FASTRPC_MAX_CRCLIST);
> This doesn't seem to match the calculation few lines ago. fdlist is a
> pointer. On 64-bit systems ctx->poll will point to (uintptr_t)ctx->fdlist +
> sizeof(u64) * FASTRPC_MAX_FDLIST + (sizeof u64) * FASTRPC_MAX_CRCLIST,
> while in fastrpc_get_meta_size it was ... + sizeof(u32) *
> FASTRPC_MAX_CRCLIST.
>
> Am I missing something?
I should be:

(uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST + (sizeof u32) * FASTRPC_MAX_CRCLIST

based on the fastrpc_get_meta_size calculation, I'll correct this calculation.

>
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1158,6 +1177,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>  
>>  }
>>  
>> +static inline u32 fastrpc_poll_op(void *p)
>> +{
>> +	struct fastrpc_invoke_ctx *ctx = p;
>> +
>> +	dma_rmb();
>> +	return READ_ONCE(*ctx->poll);
>> +}
>> +
>> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	/*
>> +	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
>> +	 * or until another path marks the work done.
>> +	 */
>> +	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
>> +				       (val == FASTRPC_POLL_RESPONSE) ||
>> +				       ctx->is_work_done, 1,
>> +				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
>> +
>> +	if (!ret && val == FASTRPC_POLL_RESPONSE) {
>> +		ctx->is_work_done = true;
>> +		ctx->retval = 0;
>> +	}
>> +
>> +	if (ret == -ETIMEDOUT)
>> +		ret = -EIO;
>> +
>> +	return ret;
>> +}
>> +
>> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
>> +					    u32 kernel)
>> +{
>> +	int err = 0;
>> +
>> +	if (kernel) {
>> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> +			err = -ETIMEDOUT;
>> +	} else {
>> +		err = wait_for_completion_interruptible(&ctx->work);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
>> +				       u32 kernel)
>> +{
>> +	int err;
>> +
>> +	do {
>> +		if (ctx->is_polled) {
>> +			err = poll_for_remote_response(ctx);
>> +			/* If polling timed out, move to normal response mode */
>> +			if (err)
>> +				ctx->is_polled = false;
>> +		} else {
>> +			err = fastrpc_wait_for_response(ctx, kernel);
>> +			if (err)
>> +				return err;
>> +		}
>> +	} while (!ctx->is_work_done);
>> +
>> +	return err;
>> +}
>> +
>>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  				   u32 handle, u32 sc,
>>  				   struct fastrpc_invoke_args *args)
>> @@ -1193,16 +1281,25 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>>  	if (err)
>>  		goto bail;
>>  
>> -	if (kernel) {
>> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>> -			err = -ETIMEDOUT;
>> -	} else {
>> -		err = wait_for_completion_interruptible(&ctx->work);
>> -	}
>> +	/*
>> +	 * Set message context as polled if the call is for a user PD
>> +	 * dynamic module and user has enabled poll mode.
>> +	 */
>> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD &&
>> +	    fl->poll_mode)
>> +		ctx->is_polled = true;
>> +
>> +	err = fastrpc_wait_for_completion(ctx, kernel);
>>  
>>  	if (err)
>>  		goto bail;
>>  
>> +	if (!ctx->is_work_done) {
>> +		err = -ETIMEDOUT;
>> +		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
>> +			handle, sc);
>> +		goto bail;
>> +	}
>>  	/* make sure that all memory writes by DSP are seen by CPU */
>>  	dma_rmb();
>>  	/* populate all the output buffers with results */
>> @@ -1780,6 +1877,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	return 0;
>>  }
>>  
>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_ioctl_set_option opt = {0};
>> +	int i;
>> +
>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
>> +		if (opt.reserved[i] != 0)
>> +			return -EINVAL;
>> +	}
>> +
>> +	if (opt.req != FASTRPC_POLL_MODE)
>> +		return -EINVAL;
>> +
>> +	if (opt.value)
>> +		fl->poll_mode = true;
>> +	else
>> +		fl->poll_mode = false;
> Is poll_mode supported on MSM8916?
No, but it will fallback to rpmsg_callback in case polling is enabled from kernel but
not enabled from DSP.
>
>> +
>> +	return 0;
>> +}
>> +
>>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_ioctl_capability cap = {0};
>> @@ -2134,6 +2255,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>  	case FASTRPC_IOCTL_MEM_UNMAP:
>>  		err = fastrpc_req_mem_unmap(fl, argp);
>>  		break;
>> +	case FASTRPC_IOCTL_SET_OPTION:
>> +		err = fastrpc_set_option(fl, argp);
>> +		break;
>>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>>  		err = fastrpc_get_dsp_info(fl, argp);
>>  		break;
>> @@ -2465,6 +2589,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  
>>  	ctx->retval = rsp->retval;
>>  	complete(&ctx->work);
>> +	ctx->is_work_done = true;
>>  
>>  	/*
>>  	 * The DMA buffer associated with the context cannot be freed in
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index c6e2925f47e6..3207c42fb318 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -16,6 +16,7 @@
>>  #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>>  #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>> +#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
>>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>>  
>>  /**
>> @@ -66,6 +67,8 @@ enum fastrpc_proc_attr {
>>  
>>  /* Fastrpc attribute for memory protection of buffers */
>>  #define FASTRPC_ATTR_SECUREMAP	(1)
>> +/* Set option request ID to enable poll mode */
>> +#define FASTRPC_POLL_MODE	(1)
> Is it related to FASTRPC_ATTR_SECUREMAP? Why is it a part of the same
> visual block?
I'll create a separation here.
>
>>  
>>  struct fastrpc_invoke_args {
>>  	__u64 ptr;
>> @@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
>>  	__s32 reserved[5];
>>  };
>>  
>> +struct fastrpc_ioctl_set_option {
>> +	__u32 req;	/* request id */
>> +	__u32 value;	/* value */
>> +	__s32 reserved[6];
> What are you reserving it for?
In case there are any more options that we want to control from here.
As it's more of a generic set_option request.
>
>> +};
>> +
>>  struct fastrpc_ioctl_capability {
>>  	__u32 unused; /* deprecated, ignored by the kernel */
>>  	__u32 attribute_id;
>> -- 
>> 2.34.1
>>

