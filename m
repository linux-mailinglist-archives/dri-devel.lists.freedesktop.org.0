Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6D7CF68A2
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 03:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F3E10E064;
	Tue,  6 Jan 2026 02:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwblO1A0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ix4mcw7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AC410E064
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 02:59:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6060naZZ2291868
 for <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 02:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6wQM1q7i8j3cMNDcv8+eaFpi
 lrF4P/GzhO2hy2hNxZo=; b=dwblO1A0DzZ6VuyQC0zAtybUf8PgmeFym0YTytQD
 OO3yGiQJqz87hn1oDbzwZcktZeAIfi4IkiLaBCg2sqtG4KDrLGVRrGwp+RwU25uQ
 rG/rZnvKiHCAude2LgU0iblceglu4LAmBDri/6lPjp0ZlG1y9Vq4OMOOwwVPZlW5
 SSnATu9sJxJywSE8ntMtAnibaz40Prdt7Cpxf1Z3MgW7aPp3x9aAOO0NII1IH+AA
 SybuHsU2T0pwWDpLI97sCOlX61GNT39j9OAeYKpOfFG95Y5CyJGroZhuud6yBAWZ
 vL+uh2RakkWEJimOIzSV1H41PBy3ktxPdv/YGZh+7ScUzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nkakx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 02:59:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee16731ceaso12284371cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 18:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767668385; x=1768273185;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6wQM1q7i8j3cMNDcv8+eaFpilrF4P/GzhO2hy2hNxZo=;
 b=Ix4mcw7BhtPcbrds8/XydGGSm2YrPgdO9thoA3MOVJp6D7laQzuNMbYN1+6UAba1w4
 YKFkJuS6kSKnVvAX4YeuxWqdw5gJHGs9TiMClkPc5CWQh7J26TvRK+huxHaju0ystUm1
 1q/ogb+iypQTlDGtL8EbhwWoDzc2dAwFBZqV44XbVNx4oegtEV/mNSV+2doD7tE8IA60
 JxAvMOe5qpI2uijx0d4M6fsvGcwGL9XZrGzTGflUmkdu891SrO3/Le08VA4q8+l2YfxG
 J+aUEdZLPvQA3+OfMjGds0d4x1fqQ1SRcIdQ1brvCRl+pg3wYGGNVB7rov9jSyl0RRrx
 wmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767668385; x=1768273185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wQM1q7i8j3cMNDcv8+eaFpilrF4P/GzhO2hy2hNxZo=;
 b=r14jnajQScw9TGsI8s697AhTzNS2eyvPgUt1xc/85TNzGI8YXrSXEqEdL41CyM7s89
 jl01SW0m2wN9bdx/RyLNNNRm2OxbVmSCx/qeXFSDqqGuNDgSasGhmpSwVtFA32yXTD19
 2yCEBTGlc1C9imWHNXl/wVkOhc5kwyV+ZrfBzKAXabjY1XPVGhwhSDoIuGQ+JRo0OcQ6
 Ir9ma7fBuEJxpQNU2174yG0J1CEw6nwnLhWgh60FObUL15rJ5IYmE7+X5jWFIeyGnniH
 6ztYtoR9mOVVh5f7JTiqbuO5OC77cq1N4SsHDjuxjCS1oYbS9dvTV/SOVTvBnkaZbZb2
 4yCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXilsfLN6Jv36PpKsc5+s5gZZtZh4v9lBY1DnjsixeLxVrz6LrnnZ0ZalAeSvMyXMphVUSaHVI1g3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl1inVkqo8tMMqlp10ct9IojxIxJUPNRUJ06zrsTHp8ZxA3EwD
 Vh/BYG3t0FygQyfNeuOJn1y1mPdIRX4P2h3VwPv07IMx2n4X2HYk/UC5sxldz+pDeUiOMU8TqaB
 TVX+1l3712vyU3JvhvpWCnLZJkwXb7IFoVUWTJILsXikAESYyQS2btfEfz9YJswWzE3q905w=
X-Gm-Gg: AY/fxX6bNTGYVsFQ5wnVMuk8Npx24QaazqzWTQGIzE8yaD7+0IDIJa0t72Xr7KIo0cg
 RnUvAqfgpkh00GWidnhJmz4tvS1fFlb4FxTk4ulVj7gex1JJ8Vpa8EQcsIJN8nEGh4LCGobg275
 1SWqi+VT6UaTZvieaxfRAjv7kZddMzrUBuxBharZ4aoH6P3g8U5/RYnh1kYAXl+r/NY4jqnxPsH
 oA8qN8ntA9rmq4G75CbxQFozv5XneQ3mdlOsYkRZs71nkcWP9/tnzTSW13bkms33NC7zCHdYijF
 iRndGmGmMQobr23Dn7dwqYvvVydQ1q8UHT22S5VaZX8hDcUA8cAuag9yFVorUM7HkWXNlmB1Yot
 d+h5BJZw+2nULieXrz9fBTraXvOH28gBW9Gnkhd4E7CvIt8ClSoLrwI4i1UjPEgxwEahqLaW68k
 SxtApvF+NmXEFEwf+AaFjVqjA=
X-Received: by 2002:a05:622a:1805:b0:4f1:e8ee:a56d with SMTP id
 d75a77b69052e-4ffa77c0193mr21383331cf.38.1767668385371; 
 Mon, 05 Jan 2026 18:59:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRp94E5R7paew929d4nHSzzUNnTf9SmWDvD/s9/IvhXdHvg9ZYOelBsosOawoMIgsie6lkew==
X-Received: by 2002:a05:622a:1805:b0:4f1:e8ee:a56d with SMTP id
 d75a77b69052e-4ffa77c0193mr21383221cf.38.1767668384808; 
 Mon, 05 Jan 2026 18:59:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb3beae7sm2203491fa.12.2026.01.05.18.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 18:59:41 -0800 (PST)
Date: Tue, 6 Jan 2026 04:59:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <z6oyuqmts55um67wrthxcm3fc5n2r25d66r2kcgfiqsxwntlit@xaad7ek2hq4j>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-5-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230062831.1195116-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: s1LRUlhNprlRmF1Lsp2AktJ1YNx6iw-B
X-Proofpoint-ORIG-GUID: s1LRUlhNprlRmF1Lsp2AktJ1YNx6iw-B
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695c7aa2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=E6ODJj0EQkZxiq7Ia20A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNCBTYWx0ZWRfX6S97GUAQb21b
 OuwbNp/B7VfrDKtNexvvUoxdK9IoPmzUwlHWg62+eJCEGE/xZZcunCTmpqK5hpWaIT3CVo/zWKS
 wdAUBdzCEG+CpeMRZBi2Euuq1GWlNPJJZaqaa5ipfi4lqQNA1uk3H9g4MVg/MimUmafpNjoctH+
 UmA6aN4jpYNHtsDjSj3deRK5s41BHJaa/2MShvL64+eeo6+TWfGWpBiV4zM9BUPeBSkOSZKVMdo
 CJqim5h8ZNB/P05cw/558MYUA5f20LX/xOzTYs4hOSkzk/0SDQEt+hnanrbU++ZQXi3AggQA2dp
 yN7TGihFiQ0F40INW9JrMLjU9rnsx5SFB7/3gUOP9NsbcyRa7oh08SyZhnMT4vlQS6L3ROOqQ1Q
 GvA1H3D3kS11TERoqOi+c40s7rc7hlqtPCLxSs2Xyt0ZmDfeAAR+Fs5lCBDbp52V0kVrM+KKQ7H
 wASUzhqklvmZj/d6zRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060024
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

On Tue, Dec 30, 2025 at 11:58:31AM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 139 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |   9 +++
>  2 files changed, 141 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 222ff15e04bd..d95d31d27b82 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,8 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/compiler.h>
> +#include <linux/iopoll.h>
>  #include <linux/bitfield.h>
>  
>  #define ADSP_DOMAIN_ID (0)
> @@ -38,6 +40,7 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>  #define FASTRPC_CTXID_MASK GENMASK(15, 8)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
> @@ -106,6 +109,12 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Poll response number from remote processor for call completion */
> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
> +
> +/* Polling mode timeout limit */
> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -236,8 +245,14 @@ struct fastrpc_invoke_ctx {
>  	u32 sc;
>  	u64 *fdlist;
>  	u32 *crc;
> +	/* Poll memory that DSP updates */
> +	u32 *poll;
>  	u64 ctxid;
>  	u64 msg_sz;
> +	/* work done status flag */
> +	bool is_work_done;
> +	/* process updates poll memory instead of glink response */
> +	bool is_polled;
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> @@ -301,6 +316,8 @@ struct fastrpc_user {
>  	int client_id;
>  	int pd;
>  	bool is_secure_dev;
> +	/* Flags poll mode state */
> +	bool poll_mode;
>  	/* Lock for lists */
>  	spinlock_t lock;
>  	/* lock for allocations */
> @@ -894,7 +911,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>  		sizeof(struct fastrpc_invoke_buf) +
>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
> +		sizeof(u32);
>  
>  	return size;
>  }
> @@ -990,6 +1008,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
> +	ctx->poll = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST + FASTRPC_MAX_CRCLIST);

This doesn't seem to match the calculation few lines ago. fdlist is a
pointer. On 64-bit systems ctx->poll will point to (uintptr_t)ctx->fdlist +
sizeof(u64) * FASTRPC_MAX_FDLIST + (sizeof u64) * FASTRPC_MAX_CRCLIST,
while in fastrpc_get_meta_size it was ... + sizeof(u32) *
FASTRPC_MAX_CRCLIST.

Am I missing something?

>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1158,6 +1177,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  }
>  
> +static inline u32 fastrpc_poll_op(void *p)
> +{
> +	struct fastrpc_invoke_ctx *ctx = p;
> +
> +	dma_rmb();
> +	return READ_ONCE(*ctx->poll);
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
> +		if (ctx->is_polled) {
> +			err = poll_for_remote_response(ctx);
> +			/* If polling timed out, move to normal response mode */
> +			if (err)
> +				ctx->is_polled = false;
> +		} else {
> +			err = fastrpc_wait_for_response(ctx, kernel);
> +			if (err)
> +				return err;
> +		}
> +	} while (!ctx->is_work_done);
> +
> +	return err;
> +}
> +
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
>  				   struct fastrpc_invoke_args *args)
> @@ -1193,16 +1281,25 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (err)
>  		goto bail;
>  
> -	if (kernel) {
> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> -			err = -ETIMEDOUT;
> -	} else {
> -		err = wait_for_completion_interruptible(&ctx->work);
> -	}
> +	/*
> +	 * Set message context as polled if the call is for a user PD
> +	 * dynamic module and user has enabled poll mode.
> +	 */
> +	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD &&
> +	    fl->poll_mode)
> +		ctx->is_polled = true;
> +
> +	err = fastrpc_wait_for_completion(ctx, kernel);
>  
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
> @@ -1780,6 +1877,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	return 0;
>  }
>  
> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ioctl_set_option opt = {0};
> +	int i;
> +
> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> +		return -EFAULT;
> +
> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> +		if (opt.reserved[i] != 0)
> +			return -EINVAL;
> +	}
> +
> +	if (opt.req != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.value)
> +		fl->poll_mode = true;
> +	else
> +		fl->poll_mode = false;

Is poll_mode supported on MSM8916?

> +
> +	return 0;
> +}
> +
>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_ioctl_capability cap = {0};
> @@ -2134,6 +2255,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  	case FASTRPC_IOCTL_MEM_UNMAP:
>  		err = fastrpc_req_mem_unmap(fl, argp);
>  		break;
> +	case FASTRPC_IOCTL_SET_OPTION:
> +		err = fastrpc_set_option(fl, argp);
> +		break;
>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>  		err = fastrpc_get_dsp_info(fl, argp);
>  		break;
> @@ -2465,6 +2589,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  
>  	ctx->retval = rsp->retval;
>  	complete(&ctx->work);
> +	ctx->is_work_done = true;
>  
>  	/*
>  	 * The DMA buffer associated with the context cannot be freed in
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index c6e2925f47e6..3207c42fb318 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -16,6 +16,7 @@
>  #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>  #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
> +#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>  
>  /**
> @@ -66,6 +67,8 @@ enum fastrpc_proc_attr {
>  
>  /* Fastrpc attribute for memory protection of buffers */
>  #define FASTRPC_ATTR_SECUREMAP	(1)
> +/* Set option request ID to enable poll mode */
> +#define FASTRPC_POLL_MODE	(1)

Is it related to FASTRPC_ATTR_SECUREMAP? Why is it a part of the same
visual block?

>  
>  struct fastrpc_invoke_args {
>  	__u64 ptr;
> @@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
>  	__s32 reserved[5];
>  };
>  
> +struct fastrpc_ioctl_set_option {
> +	__u32 req;	/* request id */
> +	__u32 value;	/* value */
> +	__s32 reserved[6];

What are you reserving it for?

> +};
> +
>  struct fastrpc_ioctl_capability {
>  	__u32 unused; /* deprecated, ignored by the kernel */
>  	__u32 attribute_id;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
