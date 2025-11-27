Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E5C8CF57
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 07:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D2010E763;
	Thu, 27 Nov 2025 06:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2+H4WyY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQ/Qy2Tw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB2F10E763
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 06:52:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQMBQJB2123187
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 06:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nl5hGWDbw+B20VdcDwgTCvBmMMckgQpybd0ircyNRZk=; b=C2+H4WyYmF478myo
 YHa/+8kcjAFkbxS1uJDxEybsWoNXG1w7JCidzBdYhshKDW+hR/ogxTQ6ulRlj5OR
 tc06vNRK1MJopU6nL6DRLgNO5PWA0RV3fSvsRiFQmMRrDgc5QyPNCDjf5GQisE/8
 0mrVRxABEFeiMD7toA2gzcyklUL0eeoWzB99QRy5xA5xrV6c6SfzEBTb0KdLNCIQ
 0sHt44d2mE7zMYNKGGpUOUsczfWZYs5r9QpBbOTPL0LRQkhzv+UhLqbu9YnEFscK
 FxBQAScWYDpkvlgC51PF5u2TyBSPyc+8Bk9nYZ/LalCc8KYULpqfQsZJhZgNNqvl
 0HjjSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b32rwb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 06:52:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2958a134514so8416755ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764226337; x=1764831137;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nl5hGWDbw+B20VdcDwgTCvBmMMckgQpybd0ircyNRZk=;
 b=aQ/Qy2TwtXFhUXOupltkd7hpBGZyxGPHjWTGq0Mx2PPy6wq529C63jONqFoROhRSsY
 gLXvVYg+jcKWCFPYjvs+yPR3Gna8JSnMQrCRw7urS9BGXXczOTGWGTpU9h/a1hMOhzCM
 Bt9gy4imuAmFNp+0LwJsLgOxSdF1JWg9o2T6iyQQw9lDSVPNkej04qu45lNSWQ8gt+48
 tEFP6e5QCSQEnfiD/IoP+crljk67ERYwLFUecKUolg/p6z9GBUqJizCm+0cbj6xCVGxE
 J0wpnbhd/aro+x/f99t8SZt7M0x5JraNYDpRfpBnA9YjdREhkh1lGT/F9IyivWOlRq5j
 /yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764226337; x=1764831137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nl5hGWDbw+B20VdcDwgTCvBmMMckgQpybd0ircyNRZk=;
 b=ZuFTA8lhECOvCpO91rtKoDs/2n3wyoX6uWCoeGZGuH++oVr740bHA3dDapTGI8tajs
 vd8oIn+jE7w7XPA5n+B2m/0EBy/gNgVGYnHBx3GaTajIQnYE0BkfwObSEJmx8ing9omm
 xH+GcnIFQmFpG2X8fyZB50RcBX4eAoQSe062Lvz7xQuY7G1rEbbIl75CCxx9dT55otlP
 WBzAzFZcVXs7JJXAfGKaeX2SUa/iR8rn+FWkYUhAW9XTWtPNC18FK8vzxj5HhpnLQIIE
 wgPcg98QkFVOIhGlgrGS2UZ6Yzs0qtvFt2ZROm4XDuznJOHvjnPg3P5llY4nUK2oMeJh
 Kaiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt+QhgALhQTWaxq2+n4Cyd7IXuNNNlUI1EvhECyPLnSuyNexn7/9IjMPMH7JrUfrdJfSftsIDnPN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWL9BB7mTMErl8jIC2i+EjKiL2mSgMFxYhLFgJ6zNJcpYVUh2F
 SfpfpDgh8L+TmbFsrs24xBLBD8GNdDzq49KHYps4ylNg+IwB9E7IRjLH50TH+9iUKrEDGVHu5ik
 PkulYgS2SyO5WKeG4ADgT9WDRyJiz3/K2hZOasNml4QeKJVyhiJD3j3lhsNT1mP/S0NHRkrQ=
X-Gm-Gg: ASbGnct/pz5pNvXukRHshMsDRtJdfjKKQtNhNBrLXVbk1fJdncXL33Z/Qyj4QA1JQsM
 4h0ZDnFpKyUTURKRc+BRJKYhfcxn3+KoqnH/AX0HEpvEdS5tfBsrKVlZQ9dL3rN6cHqHi/ckS5U
 1RPHfHb4MzM1e3JfQs4r5FDqBB/3GsP9Q1UYJ+M2Ibdg/uugCueh/jYvUxyWvEqz4h8rEL9UDg2
 yEdI7UJUujIRVbKoZLYepFyanmd5nPE5MXDj/r12aeErhhuIrjjnfU5NNySmkjJUxTrQ2iomL8L
 87Rjnq4HqPj4m1MUm6q+INyJ5wAxeFJtJZ7amMkpdTvyAgDDk3VA48Eo1cMDYW2sw0fMsjT1iXj
 Np2+3tfQqIIgF6/s1T1CKRFGjHDZ8VKy58uNmaC6a
X-Received: by 2002:a17:903:acf:b0:298:2637:8029 with SMTP id
 d9443c01a7336-29bab2e52e3mr98795115ad.55.1764226337215; 
 Wed, 26 Nov 2025 22:52:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzzHNuVpLYCgpOOf3ktsnI6mESDza7cusfY6IV2b5RSnZNS9XI6nJu9nqS/SYzjksLhohdJg==
X-Received: by 2002:a17:903:acf:b0:298:2637:8029 with SMTP id
 d9443c01a7336-29bab2e52e3mr98794795ad.55.1764226336657; 
 Wed, 26 Nov 2025 22:52:16 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb277f9sm6295465ad.46.2025.11.26.22.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 22:52:15 -0800 (PST)
Message-ID: <60ee82fc-db30-43f1-b2fa-49e6d211c6df@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:22:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-4-ekansh.gupta@oss.qualcomm.com>
 <a4tz73rrghpsqpcwrdr4w63rki66ron35t4gi5thwkdbuefuhe@ocktiwt4u6qq>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a4tz73rrghpsqpcwrdr4w63rki66ron35t4gi5thwkdbuefuhe@ocktiwt4u6qq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=6927f523 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5DFYxTXXmBTTg87Ck3YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA0OSBTYWx0ZWRfXyYh29Txq5KkC
 FAQMapAQ5/pJSf9h83PkZvEP21GbEtsRvPlkoF6GpCCHV/280LxubxQheNr5HEsZER1f0MbBL//
 HithqjWDSpK4/pJaCiNCNunIFpqZPAWS3Huz3FDbOB5qC5BqwzINfN9Zj5HH5SwJ+DusJxxYr5S
 EZc0KQezeL8JyOYKBhEyvB/YOy0nvOK1QWwT0KG8oh0D8WV6VCV+t/LzaJXbzmFydJjz8ovxQLX
 YB/UePQ+OqZ6N8V+sO37j7R4jKQgbnw5frO8IKA9J9I2DeA6ZwBwRAa5tUSqhdF36S1jfEW4IiM
 6cTv/v55vepwCq/bxvEqodWxrb+ltzr12nw0qZVaD7sn2sP9Zf+PNZFGOWWbcaexDO1ZBKAeq67
 Ag+HEqvGSvifTE8uzZsd+mJM29La5Q==
X-Proofpoint-ORIG-GUID: yjkhFbdJl8ckPjCviQ3dQpV1n5c2dN2w
X-Proofpoint-GUID: yjkhFbdJl8ckPjCviQ3dQpV1n5c2dN2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270049
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



On 11/19/2025 2:26 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 12:11:11PM +0530, Ekansh Gupta wrote:
>> For any remote call to DSP, after sending an invocation message,
>> fastRPC driver waits for glink response and during this time the
>> CPU can go into low power modes. This adds latency to overall fastrpc
>> call as CPU wakeup and scheduling latencies are included. Add polling
>> mode support with which fastRPC driver will poll continuously on a
>> memory after sending a message to remote subsystem which will eliminate
>> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
>> mode can be enabled by user by making a remote_handle64_control request.
> Which request?? I thought it's enabled by making an IOCTL.
Yes, it should be set_options IOCTL, I added user library API details. I'll modify this.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c      | 138 ++++++++++++++++++++++++++++++++++--
>>  include/uapi/misc/fastrpc.h |   9 +++
>>  2 files changed, 140 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ccba3b6dfdfa..60de9dcb9815 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <uapi/misc/fastrpc.h>
>>  #include <linux/of_reserved_mem.h>
>> +#include <linux/compiler.h>
>> +#include <linux/iopoll.h>
>>  
>>  #define ADSP_DOMAIN_ID (0)
>>  #define MDSP_DOMAIN_ID (1)
>> @@ -37,6 +39,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>>  #define FASTRPC_CTXID_MASK (0xFF00)
>>  #define FASTRPC_CTXID_POS (8)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
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
> How does this work with caches? Does it require dma-coherent fastrpc
> devices?
I'm assuming it will work the same way any normal RPC call works on platform with
no cache coherency. Is there any other change/check expected for this?
>
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
>> @@ -1780,6 +1877,29 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
> Empty line.
Ack.
>
>> +	if (opt.req != FASTRPC_POLL_MODE)
>> +		return -EINVAL;
>> +
>> +	if (opt.enable)
>> +		fl->poll_mode = true;
>> +	else
>> +		fl->poll_mode = false;
>> +
>> +	return 0;
>> +}
>> +
>>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>  {
>>  	struct fastrpc_ioctl_capability cap = {0};
>> @@ -2134,6 +2254,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>  	case FASTRPC_IOCTL_MEM_UNMAP:
>>  		err = fastrpc_req_mem_unmap(fl, argp);
>>  		break;
>> +	case FASTRPC_IOCTL_SET_OPTION:
>> +		err = fastrpc_set_option(fl, argp);
>> +		break;
>>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>>  		err = fastrpc_get_dsp_info(fl, argp);
>>  		break;
>> @@ -2465,6 +2588,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  
>>  	ctx->retval = rsp->retval;
>>  	complete(&ctx->work);
>> +	ctx->is_work_done = true;
>>  
>>  	/*
>>  	 * The DMA buffer associated with the context cannot be freed in
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index c6e2925f47e6..6c1375ba0042 100644
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
>>  
>>  struct fastrpc_invoke_args {
>>  	__u64 ptr;
>> @@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
>>  	__s32 reserved[5];
>>  };
>>  
>> +struct fastrpc_ioctl_set_option {
>> +	__u32 req;		/* request id */
>> +	__u32 enable;	/* enable flag */
> s/enable/value/ ?
Ack.
>
>> +	__s32 reserved[6];
> I think you got feedback from Greg regarding handling of reserved fields
> few months ago. Please drop them.
I remember the comment asking to add proper checks for reserved bit[1]. I have added the
necessary checks. Please correct me if you are pointing to some other discussion.

[1] https://lore.kernel.org/all/2023092840-rental-ascension-b062@gregkh/
>
>> +};
>> +
>>  struct fastrpc_ioctl_capability {
>>  	__u32 unused; /* deprecated, ignored by the kernel */
>>  	__u32 attribute_id;
>> -- 
>> 2.34.1
>>

