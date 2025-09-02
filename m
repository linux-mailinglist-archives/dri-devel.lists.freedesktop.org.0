Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A67B3FA16
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958F810E31A;
	Tue,  2 Sep 2025 09:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ0VWmAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29A310E31A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:21:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RtIa010115
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 09:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=c7HfgZitoM7gN1hKYZrNPb5e
 K6Mggu3Yh+vY076Vgao=; b=BJ0VWmAHrIfcOhZsOFvRaHnIYrlN+1THXYb2gXcz
 zVmvmRco1vMvCFwMUkKb4P1aeOYdO0obeif0C18kkQp3+N7wsINNVdosAFYu7uQR
 MaD7NvscDW2masjL9NuCyfXkVf6JVzrSIH9tqd044uxelBnAeMFQaEUKffWFNwNk
 JF1nyNNLLHFi+ZgTcVHH2HiLfI/S/yo9pn4hDx1PxS47QV0aRA9kuSfb5ga8JYvx
 usJvSECzvu3mRXoJHtSNd1JseTsa3xA4dS0BYihkCLOz3xd4ZvBbvvnsh/eCW6uI
 vz7CPq5tj11FSluEQPHykSpfGuYxUmdnstaKc1qc70G85w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjf8n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:21:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70ddadde46bso89599656d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756804883; x=1757409683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7HfgZitoM7gN1hKYZrNPb5eK6Mggu3Yh+vY076Vgao=;
 b=tHQ+ORzmlwkEfu1y1bQ3LFMGSlQVrmW0C11zdqbpQGQYT3TcOc+hUGFOsNuom+XaaU
 +OBh5xX81+8BBqD73fuSh1tgVueaKXWJH+QBDGBgGczzCMtpbQu9trOhFHmhUci6EC4c
 ZlM1qoXOWrSDcEvVMOQjNEqMcmMoOGptYDoJSX6QOl2dhaWXtYMGjVouPoALCPID2SvR
 t/iJ1DiIUxo0zLF8+P8bIPspncQSQVr26A1vKAnzIUZf/ExEPKJHwFW37w6JfgiuJRGi
 3uD8GlbwIe6InDYyu1rOuQrqXNarz05HmLO8fZeNNzirttoyewNcWftu+7h66ticucWm
 UZ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0ub+mpaD0Iq4MGowU1Iq78YBkerrhB+alDC7Q7dstn+neWd00fEqNt65HFhzkc4SGzm59fwPN29k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRq1qaDkT/jftK3xbR7XgjuUlWHBKuaJgz33+VtKCneXXVTheo
 DPBT8CP2iTg1ZWhNuyCqirxEY200jZgNUc4cT8RAkSm/mb7jTg9eUjpPF0BfeTGxZcMX0T6jSvF
 CPq7GRj13NVM7dcA6z0x7Un1MxHay9rFLXE1ciiwizFPj4HfZdRW8Tg/qQO/Ij9pZ6dqPlJ8=
X-Gm-Gg: ASbGncsRnuMIYsS1nrLbaTY/N4jhKVuRxw/sTN4yNK77USMjQhWAiZIDgOzY/oO0m78
 8oQsUAf2AajSuJ9S5vMwvVLWy9qXN+1qWsk0+5lk8J7+Tb1bm7tTbk6x5abKxiTDChnL4uxchIC
 wVY89MKZEDOJLVjVNn0My492E+hh2Yv0YKg0HuhlWadSfdWmOMhpPVUVUukLBviHqsWqgsyanzb
 noydFDMjznjDTM2cW6rxCDYCT0rBgqD/BC3XLY/AyaXMhZQb5KEcNqPkr38CMc0Fr+LJheA4lKR
 Mjj5EpbnIGEDmKHOoOnuzXhjvEsi3+3VZPgc1dBtqjCjY+R5pp6TEp0AE2iTQxZAIJcgik1BVck
 OgdTkJ50eyNRTQSCtJHcmsNXYlRLRTbTyM1bv87DAz8Z5hN6OFtTy
X-Received: by 2002:a05:622a:8c9:b0:4b3:e77:90ab with SMTP id
 d75a77b69052e-4b31dd5f362mr139211611cf.73.1756804882511; 
 Tue, 02 Sep 2025 02:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQOjKCyF0PTGniEGS7XzhWjEDR5pXTxvrIUjdarmCqjdrVAR3t8O340qmLNTCT1OLhA5b5Mg==
X-Received: by 2002:a05:622a:8c9:b0:4b3:e77:90ab with SMTP id
 d75a77b69052e-4b31dd5f362mr139211311cf.73.1756804881966; 
 Tue, 02 Sep 2025 02:21:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56084b0dd56sm207707e87.85.2025.09.02.02.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:21:21 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:21:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <hqbazo62hdfwgxoevzkchfddvjpr2ttp7wltpkoooou5anongs@5ncpjec3egjh>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-4-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901053336.3939595-4-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6b713 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=oqQymis2muytsmd_M6sA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cXSD7mwDXDBLbeyL0a4AgRiL4hnbkBJh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXyap8/BERQygV
 kLlr1fqSQHFcVqtLDWrXFI+7bhxCalnRt6fi7xPo/0Y0wZLhiayE8WnUPjBu7SvZPdffkGH6uXm
 xj5wS1Whr3LnhzvR2U+ualv5QVAPVZpncebW/hyPP33rwXlmsUnCyqAM8TIhTdrjxk9Q/C+Mb95
 gdc+LvVSJJS4AwljdoNMmorh2dfjlioVQRiSmRV0P5bHp2ssItwvQg1qhmXdHPQQ4c+cTU7iM9D
 nd7EwkbzDF+z0gqCYrqrL5zGYh//yUrUxmDkAYZtKvx9yjzuvU/8eGJvGfAg6yAVyWlqfjn99pq
 00uEd/1S7Jbm5CJ207wd+W+Qr5Gjaxr6YqxvCqAKljhZW/GFdwmNczrgpyNqvsYKKCzZZi83fko
 JXyCAh5x
X-Proofpoint-ORIG-GUID: cXSD7mwDXDBLbeyL0a4AgRiL4hnbkBJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Mon, Sep 01, 2025 at 11:03:36AM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included.  Adding a

s/Adding/Add/, see Documentation/process/submitting-patches.rst

> polling mode support with which fastRPC driver will poll continuously
> on a memory after sending a message to remote subsystem which will
> eliminate CPU wakeup and scheduling latencies and reduce fastRPC
> overhead.

Describe your design decisions: when it is enabled, why, etc.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 121 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 114 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 57e118de6e4a..939a3e3d29e2 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,8 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/compiler.h>
> +#include <linux/iopoll.h>
>  
>  #define ADSP_DOMAIN_ID (0)
>  #define MDSP_DOMAIN_ID (1)
> @@ -37,6 +39,7 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> +#define FASTRPC_MAX_STATIC_HANDLE (20)

What is this?

>  #define FASTRPC_CTXID_MASK (0xFF00)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
> @@ -105,6 +108,20 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Poll response number from remote processor for call completion */
> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
> +
> +/* Polling mode timeout limit */
> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
> +
> +/* Response types supported for RPC calls */
> +enum fastrpc_response_flags {
> +	/* normal job completion glink response */
> +	NORMAL_RESPONSE = 0,
> +	/* process updates poll memory instead of glink response */
> +	POLL_MODE = 1,
> +};

bool is_polled;

OR

unsigned long is_polled : 1;

> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -235,8 +252,14 @@ struct fastrpc_invoke_ctx {
>  	u32 sc;
>  	u64 *fdlist;
>  	u32 *crc;
> +	/* Poll memory that DSP updates */
> +	u32 *poll;
>  	u64 ctxid;
>  	u64 msg_sz;
> +	/* work done status flag */
> +	bool is_work_done;
> +	/* response flags from remote processor */
> +	enum fastrpc_response_flags rsp_flags;
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> @@ -891,7 +914,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>  		sizeof(struct fastrpc_invoke_buf) +
>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
> +		sizeof(u32);
>  
>  	return size;
>  }
> @@ -987,6 +1011,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
> +	ctx->crc = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST);

Why?

> +	ctx->poll = (u32 *)(ctx->crc + FASTRPC_MAX_CRCLIST);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1155,6 +1181,83 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  }
>  
> +static inline u32 fastrpc_poll_op(void *p)
> +{
> +	struct fastrpc_invoke_ctx *ctx = p;
> +
> +	dma_rmb();
> +	return READ_ONCE(*ctx->poll);

Is this enough? Is the write by the DSP side going to invalidate the
cache for this memory location? Think about older platforms which
usually don't have dma-coherent property in the DSP / FastRPC nodes.

> +}
> +
> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/*
> +	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
> +	 * or until another path marks the work done.
> +	 */
> +	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
> +				       (val == FASTRPC_POLL_RESPONSE) ||
> +				       ctx->is_work_done, 1,
> +				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
> +
> +	if (!ret && val == FASTRPC_POLL_RESPONSE) {
> +		ctx->is_work_done = true;
> +		ctx->retval = 0;
> +	}
> +
> +	if (ret == -ETIMEDOUT)
> +		ret = -EIO;
> +
> +	return ret;
> +}
> +
> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
> +					    u32 kernel)
> +{
> +	int err = 0;
> +
> +	if (kernel) {
> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> +			err = -ETIMEDOUT;
> +	} else {
> +		err = wait_for_completion_interruptible(&ctx->work);
> +	}
> +
> +	return err;
> +}
> +
> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
> +				       u32 kernel)
> +{
> +	int err;
> +
> +	do {
> +		switch (ctx->rsp_flags) {
> +		case NORMAL_RESPONSE:
> +			err = fastrpc_wait_for_response(ctx, kernel);
> +			if (err || ctx->is_work_done)
> +				return err;
> +			break;
> +		case POLL_MODE:
> +			err = poll_for_remote_response(ctx);
> +			/* If polling timed out, move to normal response mode */
> +			if (err)
> +				ctx->rsp_flags = NORMAL_RESPONSE;
> +			break;
> +		default:

What kind of response type can it be? Have you had checked for the flag
being set, you wouldn't have a false possibility of having another
response type.

> +			err = -EBADR;
> +			dev_dbg(ctx->fl->sctx->dev,
> +				"unsupported response type:0x%x\n", ctx->rsp_flags);
> +			break;
> +		}
> +	} while (!ctx->is_work_done);
> +
> +	return err;
> +}
> +
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
>  				   struct fastrpc_invoke_args *args)
> @@ -1190,16 +1293,19 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (err)
>  		goto bail;
>  
> -	if (kernel) {
> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> -			err = -ETIMEDOUT;
> -	} else {
> -		err = wait_for_completion_interruptible(&ctx->work);
> -	}
> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD)
> +		ctx->rsp_flags = POLL_MODE;

This definitely needs to be explained.

>  
> +	err = fastrpc_wait_for_completion(ctx, kernel);
>  	if (err)
>  		goto bail;
>  
> +	if (!ctx->is_work_done) {
> +		err = -ETIMEDOUT;
> +		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
> +			handle, sc);
> +		goto bail;
> +	}
>  	/* make sure that all memory writes by DSP are seen by CPU */
>  	dma_rmb();
>  	/* populate all the output buffers with results */
> @@ -2462,6 +2568,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  
>  	ctx->retval = rsp->retval;
>  	complete(&ctx->work);
> +	ctx->is_work_done = true;
>  
>  	/*
>  	 * The DMA buffer associated with the context cannot be freed in
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
