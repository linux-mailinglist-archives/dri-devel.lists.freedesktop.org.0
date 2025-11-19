Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6AC6D6B6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 09:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E956910E5B1;
	Wed, 19 Nov 2025 08:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fho3dgkV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7qyarm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1E210E5AF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:29:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ56qxW2926649
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0uPAa1LplkQ6fmy5xU4HwzNs
 WrCcR/ljmztCTjBdq+I=; b=Fho3dgkVLXpBIXnH5Mi9T8pq6sJH76cyg1DwPxHV
 Szlqvr36LcCwAqp4+JgRAQ4QjpsJTEWPFXR2pMb0Pl1wT/ZCb3E8xmsP4hsCs5rd
 sKNtsGWH16q5QU35VSggAI8F748CJo4X/dRXYuuFuMP/0lYRp4LrryfEP0naQqPa
 8w3wjD6naFaniy4AOX6glwv9uj6IonXvmo68uLaCO5RyCbfRaMRT5osFsmWjBzaS
 98yJHPZwpjKKhWrN3f8wM0Ewjm2J8qVfMPpKlEM/DkMO0HG3naM4vl+9X3dn4ral
 JGV97ZDaU2wUan2uIJitLQLNEi2GA35b8JfLkrzGZJTuHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq293fug-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:29:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2de6600c0so1108982085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 00:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763540966; x=1764145766;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0uPAa1LplkQ6fmy5xU4HwzNsWrCcR/ljmztCTjBdq+I=;
 b=W7qyarm+LTbydt5jXmby4UuUUUu9CziZ6t0V9P8/W9A3vY5PkTeire5r4m4ndbrWFW
 19dFM01qChbOlTr8lsoC/C8XeMPYgtJmVAlYz+KVJEyO0wC509r59RCxaSlpgX3+OWuC
 XuFPh+h6N7/angqxIsehK3SGc89UOIYtW7py+fg7BuY1bkFJwTdVmOmCyx52/XnE0DsP
 y5InYeRosRcZ0H02YCv2A2HX+Wp4fTgG3JyHzXIGoukCBAHrt/jueGa9r49puRx41jqS
 HxQndRI4fRrar4ABk9PMLdFPT4R+YnCIn1dHqha2ZLK3ZnGRTm5upRNCbA8Om5dIYgum
 Fh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763540966; x=1764145766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uPAa1LplkQ6fmy5xU4HwzNsWrCcR/ljmztCTjBdq+I=;
 b=kBGmhaUNWJycLm8REzfmJORgh6vZrwByr3Zjn1kW2fG81Ob4cb+M5P4lH5cohx/umN
 MlBHw+N6OEMsW2QX0o8hVVURVqsECZFV2Z8E+G2RgJPcPJqb1SCk9AaRCuJ6Q4RxcUxz
 WNEo/y5LPxwOSr4/W0bx51y4C9dpxOh4uOjO4/K2P1E8FChiKdTVx14AUNLtDYmLH2Jq
 dyJIZVLLNyYjyV24T2dxiBwZizTg1BlvdT04uCdqLjFgkGAsRO608gtP8iDqQzBef33z
 OgUKZdXjcyeJ2Toi9O6q9y00/xaIPoBn5CDTH1TsV80XYruUEqfZ6RDXG2Mck8Nlp9Is
 Evog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUTab+FR2NSIyMmjbHkDj/rITN+Q5KR3iNK7RL4oEfgnT9n/SnsdEs6PQw2jSwoOGg0TjKcQ6N+F8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1EagoAXtYAV9e2x1mFS7QOaoOT0oj1zc6pK0BVEbrdrxchKDo
 8RI43+ov9j6fFtV7JqCobdIDWi96BhUQciGjDtjSyucQ+36cmZocbbUTsipqxlk3mPMLcCV1pcS
 GABkqBvZDe7ehAwrLLszAWeRFcylC5wsDdO5pgkoymLMkqRU+di5KdvG7ULNWJvt3pIFEXx8=
X-Gm-Gg: ASbGncuowdwPSAQh/4GSzs7kD+Ei6qjdmU0yVGB1Pvg8jReYRXi1G9ZE055/WDYhqyN
 J/pG1RSk+kkskOmp5xkYgaKYI+s3ValJnlTMgWMH08v6MLichXNhBr2hRo6YIFE+GssaKaMOfzk
 koyz0mGUorTUew28lGGx2jd5q6InAf8gy/ft+DsBfIHNMDXR6aDFypExYfwxRpQnE05synlU4TE
 jhf9Leuh329I4b9IejDg43nFwxr2QoqnaH0YTbYykqUMRu2Fr37ZKBzYo85mCb3D34jmCZADpLi
 MBj2L1mGfidBnRan/OAYcM/WDJ/kisSQVUfnlmUFzrr8WExrCAN8J//YKHLcayfvv0dcRrmIkV7
 5xCt2vSfuWL5ctSt7L/t7uhkcWFQLIODKEsvX4IKtMsRtvYVX3/2LlfjP7dFfC1zWIsWjJ4z45Q
 9GUgwWbv6x0KEbjUnXjUG9cD4=
X-Received: by 2002:a05:620a:708e:b0:848:81e5:446e with SMTP id
 af79cd13be357-8b31706b832mr251420485a.72.1763540965825; 
 Wed, 19 Nov 2025 00:29:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX7bb3YLcEnKcj7s8aro23Gs9SwEBH84XSzawuScGanfgM2EQIXHAEiG0N5/C/xVPGIXcWsQ==
X-Received: by 2002:a05:620a:708e:b0:848:81e5:446e with SMTP id
 af79cd13be357-8b31706b832mr251418885a.72.1763540965383; 
 Wed, 19 Nov 2025 00:29:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9ce080b1sm39478861fa.8.2025.11.19.00.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 00:29:24 -0800 (PST)
Date: Wed, 19 Nov 2025 10:29:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
Message-ID: <jjzyh65ym74si2u7ig5gtckffma522ebjbeqyr4ym2sddox6iu@l7uion5z2rvf>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-3-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113064111.2426325-3-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691d7fe6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-Grc-IbbygOVKxJZXrcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aCMQK0QKAd6wr0pNofeeEUPyIW6bjwHU
X-Proofpoint-GUID: aCMQK0QKAd6wr0pNofeeEUPyIW6bjwHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2NSBTYWx0ZWRfX2QoD1smKfEFH
 TXOnulN8XI1tZi9L6o3+9rct3mcRRbcg+Qi/C0swV5z/S5z1x62zXozu2F4uzEKoJgSsE7xrHjT
 WrZJB0e2CVjwQ8U6Zkkk30icukSe82kFJYKUYw6l9cdf1PNdESn+YZsowLDi9DtQhIW0aY97tBH
 EHZ7Cyv5wSzPss99UPCv2d8rwmgH0YScJcELIe82OFGg1J1V+rfSxAbmzIu8hcOeVpQ6S886wAs
 9ifwTtSQXyNvWXhlY/N9u0GBLGgUqVacMasZE+eM9ahM7Rm2EgEmzUqidnA/OOUN24w6uFKAP7N
 yHbAPolXdf6HlPZ1MAdQafTow5eQ/gqCtcp3eltSA5x9g01WXAUz4Gx02cuwgECokPxV3b/tvXg
 Ri1vpCvcwszqpnjZ1gsVgEBESAqm3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190065
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

On Thu, Nov 13, 2025 at 12:11:10PM +0530, Ekansh Gupta wrote:
> Current FastRPC message context uses a 12-bit mask where the upper
> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
> represent PD type. This design works for normal FastRPC calls but
> doesn't work as expected for polling mode.

Doesn't work why / how?

> To enable polling mode
> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
> context where the upper 8 bits are context ID, the lower 4 bits are
> PD type and the 5th bit from the end denotes async mode(not yet

What's in the middle between bits 5 and 8?

> upstreamed). If this bit is set, DSP disables polling. With the
> current design, odd context IDs set this bit, causing DSP to skip
> poll memory updates. Update the context mask to ensure a hole
> which won't get populated, ensuring polling mode works as expected.
> This is not a bug and the change is added to support polling mode.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 679cd8997a00..ccba3b6dfdfa 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -37,7 +37,8 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> -#define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CTXID_MASK (0xFF00)
> +#define FASTRPC_CTXID_POS (8)

Use FIELD_PREP instead.

>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
>  		fastrpc_buf_free(ctx->buf);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> FASTRPC_CTXID_POS);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kfree(ctx->maps);
> @@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		goto err_idr;
>  	}
> -	ctx->ctxid = ret << 4;
> +	ctx->ctxid = ret << FASTRPC_CTXID_POS;
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kref_init(&ctx->refcount);
> @@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (len < sizeof(*rsp))
>  		return -EINVAL;
>  
> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> FASTRPC_CTXID_POS);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
