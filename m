Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A63B488C0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66710E4A7;
	Mon,  8 Sep 2025 09:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZV7q01N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0389D10E4A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:41:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xWFn007791
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 09:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rLkopAvHXNphSnNL8Z6qcCho
 LeEnmUgrVO2Bksqi2ZI=; b=UZV7q01NFl3HrCaOGPeNLl9/sd0YyL2tsbFBCDG/
 OvV/R7T+mpU8C+krsVbxsCpK1s+sAbIOcAwVHiuaNfLVLMpawirpaaqDPAEoo3mH
 qRlV34rW0uREu6xbb5UXUpOp7Y8itOg8qYDp4HJjKf8Va0VEXqOvp01/YPQwMYMw
 ztiqJBY3AK0hYXjhrhgBwLHAkIZIE+PSa/te1Hoi2swzq+H27ZJc1Tyz9se+a23T
 0MJrY+mCEs444APJcr1FfTxKOfbhvtKtYn6+8ytOVpFzSYgqaNXB8Bz3rob2VcZ7
 1mQgJxqxP/gTq+xQ8pV+6Vwx0FP15FVU2w/lUOwvDdY7qw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8c3y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:41:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b6090aeaacso29912931cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 02:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757324473; x=1757929273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLkopAvHXNphSnNL8Z6qcChoLeEnmUgrVO2Bksqi2ZI=;
 b=gmNdJ8iC6axfjJiaD4Soke5LQF4mRo/VT/PCbsX6UHABPlzYcGf/hfIJUnqI5Pvxdc
 VBX1aX4ZAUW9EdnUnHYHAzSbFl0nfgMr8W83bJO++Vnpn4ihsWUJP/XTYnO6yzrZXt3G
 At7mqdLwrSgVjmpKLQQccTliRQfXaljayDzAkh/Se7MGxU+P1dIzNtZcM7rpi1q/l04/
 xMNblBlr2zqR8JcXB3EqXGGqTE5hGMFq6dwI70vjAfzQ46+D2p2Uu2jHSOFCkj5VC7fO
 PwTZzTSDzN/KoIp0kGDau1m5jaAgLJCR+SmqG+CvQ5MGhWOpJneH8cv3Gsze/att40XV
 t/yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvj+ePC1viNJKRhKtXFQlcwPfPGXFQaJelfA+nzw1tJ4USUJpo19LqnOHJ2A6wICS7jk2skSfPQuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCBPf3Brdf+I18QL0lUATHS99CyOF++RwYh6ZOjdhQmQZZfXGp
 4l57JVf2Q/bvHgy7FtRYva4X+ZrsUpzWDiZ/BfDFjvymygzn0aa2QvWGaZno9JR0mPr+kvsOOfH
 +ROJKr9FWFL//hFCa6tR0rmY7RSx45TQ8U3O0ZHBbaCZtU/EU1EEvQtkSQJY59elfcsFxIyg=
X-Gm-Gg: ASbGncuFNzWxJ/Olvwiy9a2LYuHApBaDn27VsvA/CFhM0VmYxwaMRSBhtosKZoWkBIm
 T8ljPyM54LT9u+y6yzI2C102/v1hvbF+Ol/7owZ5ixDKu/rovhBOWM19z/RxKlhIXl7ixfjpIVZ
 2/w90X9bz8rwL6P1ChwNO7PfwHWefQybCm+DgEzt+0t/YiXsK92S8sqvlZJ/b9vWTbVqU0iaO4I
 5bB8JPy2aYEnRO7pqG018O6fKIIcZUKgLsdFmdnljwI96BOnBEn+0cm6SCHqdOrIoKFfd9/6qUv
 +ZfKKkX3FY5uFlsAPlMyjNLJ+XrUfgk74aJU35jGPopCtc+rtQzEngl3yvwUaK6ntSjL5IKWvLs
 PCgPPOvzQ9fimr0Ao5hHZ4BfV7TJTUkFUPCKLOhY0l3OczwOh51sv
X-Received: by 2002:a05:622a:408f:b0:4b2:eeed:6a17 with SMTP id
 d75a77b69052e-4b5f844db32mr72591011cf.46.1757324472869; 
 Mon, 08 Sep 2025 02:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED6yA4XaMS5YnDRmXOE5SImaTO28AEqye57aEqOauBtVGl5BLAOdUCTQLQCqvscMVaIInAYw==
X-Received: by 2002:a05:622a:408f:b0:4b2:eeed:6a17 with SMTP id
 d75a77b69052e-4b5f844db32mr72590761cf.46.1757324472225; 
 Mon, 08 Sep 2025 02:41:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50328fcsm32853551fa.40.2025.09.08.02.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 02:41:10 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:41:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
Message-ID: <rszs7ttr6eibkzwfykrtokua37lxpeph6lq5t5c2rwemahghcr@zicxvouknr2n>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
 <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
 <7250915d-4611-4f81-a46d-b85e76185aae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7250915d-4611-4f81-a46d-b85e76185aae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX28wUQVpQC8iQ
 OakE1VhYmU95+wMKhm/VRjVau/2NhQju5egCfPiuYe596p+mMjRfH3GP0huKlTfTYIXQhMf4Vur
 ZrgTlCL7x4FbjeuPp9PNOHlQR9l1eJtaxsw/f9xzYmNF2rGeEhNMxUsYq5+p3gZayJLqixrQZO4
 ujBKfzZ1ZQoXXXOQuKS9wjneKbmEmf8uTfa4MlYEcxsvhQPiOrhIS4gGf07P12YpMTVhjHcWDxW
 tkzoLBHfMD2LZjXVDh/0g+THrSW8uCayj65ZEnXmWvNp8lpz47rVoD5T445nQYSsE04I/rJfABv
 5/KYzt7WnHrdds9c66g4563zT/q7bpjpc66yOmDbMAb5nx07NpZx6/Rq21+LW4aztjJqnGhHMFR
 E1gRDNF4
X-Proofpoint-ORIG-GUID: C0koslX4MNUaoE4P5NH54f2kiBzhuuG4
X-Proofpoint-GUID: C0koslX4MNUaoE4P5NH54f2kiBzhuuG4
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bea4b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wZnQ8fNWVwIMS66gRYUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Mon, Sep 08, 2025 at 10:42:10AM +0530, Ekansh Gupta wrote:
> 
> 
> On 9/2/2025 9:42 AM, Dmitry Baryshkov wrote:
> > On Mon, Sep 01, 2025 at 11:03:35AM +0530, Ekansh Gupta wrote:
> >> Current fastrpc message context uses a 12-bit mask where the upper
> >> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
> >> represent PD type. This design works for normal fastrpc calls but
> > FastRPC (here and in several other places).
> Ack.
> >
> >> doesn't work as expected for polling mode. To enable polling mode
> >> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
> >> context where the upper 8 bits are context ID, the lower 4 bits are
> >> PD type and the 5th bit from the end denotes async mode(not yet
> >> upstreamed). If this bit is set, DSP disables polling. With the
> >> current design, odd context IDs set this bit, causing DSP to skip
> >> poll memory updates.
> > This looks like a description of a bugfix. In such a case, move it to
> > the start of the series, add necessary tatgs and change commit message
> > accordingly.
> I'm not sure if it could be called a bug fix as there is no problem with existing mask.
> The problem is seen only when polling mode is added.

This sounds like a perfect part of the commit message.

> >
> >> Update the context mask to ensure a hole
> >> which won't get populated, ensuring polling mode works as expected.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 0991ac487192..57e118de6e4a 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -37,7 +37,7 @@
> >>  #define FASTRPC_CTX_MAX (256)
> >>  #define FASTRPC_INIT_HANDLE	1
> >>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >> -#define FASTRPC_CTXID_MASK (0xFF0)
> >> +#define FASTRPC_CTXID_MASK (0xFF00)
> >>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>  #define INIT_FILE_NAMELEN_MAX (128)
> >>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> >> @@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
> >>  		fastrpc_buf_free(ctx->buf);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> >> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);
> > #define magic value
> Ack.
> >
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kfree(ctx->maps);
> >> @@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  		spin_unlock_irqrestore(&cctx->lock, flags);
> >>  		goto err_idr;
> >>  	}
> >> -	ctx->ctxid = ret << 4;
> >> +	ctx->ctxid = ret << 8;
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kref_init(&ctx->refcount);
> >> @@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> >>  	if (len < sizeof(*rsp))
> >>  		return -EINVAL;
> >>  
> >> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> >> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
