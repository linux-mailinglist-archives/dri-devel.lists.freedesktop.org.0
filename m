Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE4C6D887
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 09:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EDF890BE;
	Wed, 19 Nov 2025 08:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxGuLlcQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2I8dHpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAC6890BE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:56:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ1OI1s2756393
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DTqOh/Qva983pAVRw29UEm5X
 bNriMqu2kQ2XaR5snak=; b=fxGuLlcQlYLUbo4fqqYTm+MBjWwz33wRIPDGTjoL
 IxPAtJ4WqMDfnbukd44VlTTCAvOaELtMh6Rase5NPzdTuzuPR4EReBWYLIx6BuBc
 K+pwctAR3Qte1TYw2sguoA45sPrFNs+yaZypWh2D+aIQTlhHXd27Wn4hSjKAqrHQ
 39RsVJ61MAB9LLEWxJrWlcpMgcP3++cdW2TLK0Mumy1yJ2YwtdKcs4XE2PTsGmkP
 LkYdKJPilLQvpGSOc2qcQSL8wGqDK6QNvGTuP58uBT+e8loF3UMWC0w1uMPuhTw/
 3Acc0WM1y3Mcv/VEKWsfTBG430T5gnr1I671GefG2J/snA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj3wgh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:56:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b234bae2a7so1916804085a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 00:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763542584; x=1764147384;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DTqOh/Qva983pAVRw29UEm5XbNriMqu2kQ2XaR5snak=;
 b=T2I8dHpbdv+93ylWGbNNZ59LWrDd2I2plkgf/6JReQpzRS+2dTZZrqBer1IoRgD1Pd
 o8AqK9rUi22/fDThlr6MJq2y79vqT0UcRb7oZ2COr6EDtXjCTLZnXVsGA4sTDWv4pWeV
 f4IXw58LbYjpmLH4wD1B3CG3to5gqkdc6VCNZ1LPFbMfJfnMhF+w+l29hSUheAeI7J9F
 fMAy3DePAsHDEbU0RvJlVR1+DP5/SnwDVwH7TFRAx6jgCYPcQvv2erlXBDgoGYpwra74
 /XUw+udSbKmxlaA7Euitcez/OpXWNbfMisp0mMiH2pVHZ1wklnBJTsO7QxTzs+S+5ol2
 KjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763542584; x=1764147384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTqOh/Qva983pAVRw29UEm5XbNriMqu2kQ2XaR5snak=;
 b=OQSvgXqvMDCLB5ZgRrJ6HjRRtVwBGwY+wnr49r5yRIMeyBnU39GxV31p0m9T9tm+ef
 8snuxFjIBORUKrvFT15DhrntC8H7PXnVs3/8wMXjI5ONLyu/+fVr9U1UrU9vNaLSabNH
 uGVXMFBkfM2KOp16f6IW1TgRQpFQZ33cSwD7NUdVPL3uVKR539NsO2MiplVRXz9skBGU
 EfW/9AmMuNrZ/rL3BbSd2uP+V3DNrIO2TeI9oSy5xZZh62etjNfm5njhWqiz8Vnj1YhT
 ZoAmzG4btqYIJaX05gvHHjtYpoOzpQLlfWAKfLY3c61coMojXzHR1NggmvPYja2E/UpH
 9MNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWefh5tlO5K4HyS0EteAjRWxFQneXlqzVvKlur/JXFL3ca/CcOqKSQ56jUl8y0cW/ckB+3f57iBNPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRBqaddERrbeT/aImxYpDntwt32JcjuU+vHhSaKFd3F+5RiaiU
 XP63KcKL6dkWyVjtrJoPJqEH8Y6mnLBfqaPlsIMiCcxOWBKmvm6qnjzmyifSLrsstLwVAMpHiKm
 hAixp64HDSo9+6u8ERHNt6TOHwmz+z8WaOL/MKF7C2nQA1KrQ/HWekF5KogDTwkUBmDenNRc=
X-Gm-Gg: ASbGncsTHWgnZDs0n96VgUJGm0k2pw5wLB+qgru05ekFpl2oD2VqeczkocaA0ksLoRn
 LoZWt6frA3IE4j3srdPczPXXuu1tP1IMgqaERmidkvL052J4/ucpBebxUVh0QMchOIBABKQbycb
 JrjMLY6ywvCs6IOMc8i+JWEsA1xAXoOAP3GEJxTW8sccwbsnv5ay7I1q/hnm+vEUxN4rNRM/XFL
 W2z4k7VRpdJxOm2XvUOiWlGX7iUELJFYbONbeke505xHY2aGRFir11IrdVqeTF2a4AFJo8fnmLA
 4CNFmSyn8acbjW/PAw4ccKkoNTaKpba0IbvLNLyOcteeFIJFMiA0IC6eI1Spt4LIsUAaZIKZKYF
 cXbOe6Ur8HDb7+ixsjLUXJqqFqEyRbZGbmgI2OLGhI6XjzM3s0lcGcsotF4zO5GdQi67HERnnyl
 kWyqKjaWlcAmgblouHbGd6BSM=
X-Received: by 2002:a05:620a:1a05:b0:8b1:498b:77fc with SMTP id
 af79cd13be357-8b317007e86mr271896085a.33.1763542584083; 
 Wed, 19 Nov 2025 00:56:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxhJzRDFSz8l2i1022fmebuORbWaeiHJ7zt2AjmKcudJVFlCjlWR2fE+TVsUMs7RB3i0jWHA==
X-Received: by 2002:a05:620a:1a05:b0:8b1:498b:77fc with SMTP id
 af79cd13be357-8b317007e86mr271892185a.33.1763542583417; 
 Wed, 19 Nov 2025 00:56:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5959d9c52e0sm526972e87.11.2025.11.19.00.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 00:56:22 -0800 (PST)
Date: Wed, 19 Nov 2025 10:56:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <a4tz73rrghpsqpcwrdr4w63rki66ron35t4gi5thwkdbuefuhe@ocktiwt4u6qq>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-4-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113064111.2426325-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: SqNk97ig9yOpom04N0fB5DkVZyesX2iu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2OSBTYWx0ZWRfX8NEaK6nH1yij
 j2TwhoWvl/s42jjwSWPxBC/XJRDnewb1IEZfKe95zY+YIav4wbBiqfQG0NuP7wuQJkeoGB5S7Hv
 RLhTRC6weDRTlkGAVzQ9W/RA/YVJKh88gteJdADYN1LAaHJdjvv+MMD+FIjh1CUulAVi+wQgsDW
 bRH7G8BPzQ10xruRtvRwgX1WIbCodN7+KYNAIh6Nz5WyuNK+ZeWanH8xRTpT9by1aVPY88WJNbM
 0Ssm4Rno2WPZxMDe5kkLZ700O9vz4ZyCebu6afve6mXFRk6YkDviw3PxjXClUBUkW+awCId6V+O
 8WR3NoV76iLErKvH4J/1KF+BQdxVp+im9o/KDQuP400SXpuqFM1jRmiHlhf2dbvyWiKaPvTO8Rr
 UlLtZ7IzpkeG7qrgr78tVNa7al/EmA==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691d8638 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=E6ODJj0EQkZxiq7Ia20A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SqNk97ig9yOpom04N0fB5DkVZyesX2iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190069
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

On Thu, Nov 13, 2025 at 12:11:11PM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
> mode can be enabled by user by making a remote_handle64_control request.

Which request?? I thought it's enabled by making an IOCTL.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 138 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |   9 +++
>  2 files changed, 140 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ccba3b6dfdfa..60de9dcb9815 100644
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
>  #define FASTRPC_CTXID_MASK (0xFF00)
>  #define FASTRPC_CTXID_POS (8)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
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

How does this work with caches? Does it require dma-coherent fastrpc
devices?

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
> @@ -1780,6 +1877,29 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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

Empty line.

> +	if (opt.req != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.enable)
> +		fl->poll_mode = true;
> +	else
> +		fl->poll_mode = false;
> +
> +	return 0;
> +}
> +
>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_ioctl_capability cap = {0};
> @@ -2134,6 +2254,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  	case FASTRPC_IOCTL_MEM_UNMAP:
>  		err = fastrpc_req_mem_unmap(fl, argp);
>  		break;
> +	case FASTRPC_IOCTL_SET_OPTION:
> +		err = fastrpc_set_option(fl, argp);
> +		break;
>  	case FASTRPC_IOCTL_GET_DSP_INFO:
>  		err = fastrpc_get_dsp_info(fl, argp);
>  		break;
> @@ -2465,6 +2588,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  
>  	ctx->retval = rsp->retval;
>  	complete(&ctx->work);
> +	ctx->is_work_done = true;
>  
>  	/*
>  	 * The DMA buffer associated with the context cannot be freed in
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index c6e2925f47e6..6c1375ba0042 100644
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
>  
>  struct fastrpc_invoke_args {
>  	__u64 ptr;
> @@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
>  	__s32 reserved[5];
>  };
>  
> +struct fastrpc_ioctl_set_option {
> +	__u32 req;		/* request id */
> +	__u32 enable;	/* enable flag */

s/enable/value/ ?

> +	__s32 reserved[6];

I think you got feedback from Greg regarding handling of reserved fields
few months ago. Please drop them.

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
