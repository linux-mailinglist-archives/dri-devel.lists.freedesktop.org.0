Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3470B3F390
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8AC10E577;
	Tue,  2 Sep 2025 04:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9SeDsfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB1210E577
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:12:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Ro0w029965
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 04:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4hytzX8xBTH7gMfyLEWCSqte
 MJOdC0UJlFb3/TsaAvk=; b=Z9SeDsfd7UR2aP6UdZhf4hrBgbBGC1EzAHPEkhDA
 D/pTRAWMyO/YqiQDK7WNra9wKwIevfeaO8OJ6sSVsOK5kVc0JU/XMBv+4iD0jD04
 eyiU70lUY6ligxbRzieTemKS287oDglSpqF3GzqOr4UpQZS1PScCF1dhtSvHFRSZ
 H0JT52dXo3SHy0ZZh9gixIBAUGDz5oKKGH73zEU7KRIWaOnF9rzbY8HGuGzsHLdD
 02XagceP1tFhJAEwZGZijtOtJyVYvS7IZwzsYz4S41stgJkPXs+AqbNe2+Rgl04H
 s6/6LGFP9jFO17iKFRb7tBwAKk1rufKIpdqhoEXJZoDWZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy28d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:12:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b311414656so107495861cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 21:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756786345; x=1757391145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hytzX8xBTH7gMfyLEWCSqteMJOdC0UJlFb3/TsaAvk=;
 b=GH07fEN0qAIuFVGnZNOCK5s/fJhoi/gbYzC4XDpCtrTwUWAt2ePUFKGtq4D+vSUE4P
 n6MQnvGrNmbdkx9O8LUl+o7QvBHkeb6BDxavYWZRnkA5awGZq9CCNLy3cJAMjctR/4wy
 yqOuMzDtj3bNQSdCEzhZkIhyrzk5WtYmhstW92hfqe18rJ5c+CF5ZSOiCuEGFkZm0J4G
 H+j+Uy7m826RPpar9iDQ6Zw+gAmoIO8nCrllB4GntYfM4Th5g735ERFBXHNUq328ldF9
 aCs9QM94nPq9AsrEHYbbHCcyaj7vrZkKkDszSOMwnitCI0Gi2h+qzRhLMS6N+B1iBNKM
 CTaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhHyiGJD5jD3fNKihVR6JhXkXU/TuYQ654EMgyS8Y3stk/yYKKreFwgeR0TdH5c6iQr4jzfd/Fa8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwngWWMs3na09jnQyqZ5zI2L0IKEFjOqDE0SVKmoEDIi8+TB9jL
 IFb2whNFAMLnxyoP2CIRY1d8BqxfvXqhzM6VSWIGE+yEypleB/9pk7EMevj49nxJrZBqH+NbPq/
 BFkCzpjZ1y4TRTznmGJHEo1zN7g3rLuSPc70Y0tEakn/gVEL89AM4m+TYBm/jDYFP+YbkmKk=
X-Gm-Gg: ASbGncukYG+959ipRIhyLNOLaZXe9KeR3paTUgQRpwBDdWlXr9e1mF7vrmkaWozEak3
 f/k2hnVA/3NI//41d4vwws081U3Q3ete/7DYsz5n2+S1IFXNVZF1iYGqc8A/vd/ijkYzzyF14uy
 el5M3ESd6OLwdYSCnKUadah+ekgowj5Ky2BHmeYLS7+gM+MFiMZqYKj7r/bsD+RITZChFcM3P0R
 DPENsOzUqsz9JaSfTH7f9s4rnDp/DNNafKmVxtgSlREWqt+fDXQoszCVi/WRXUFa1YM9uQTQ2sq
 wBpg25KaZJ/u6ZMv76hrKNdBfXxAz3bgjwWqqnDfqKKb63CCUjIwDb5QYfCgH333O5QdAQ5FPHq
 KlduIBsGdmzIaDN3L9gsCOLcmvZfYXlAZBpjhTFDHG0eWVvzHdKKd
X-Received: by 2002:a05:622a:1452:b0:4b1:dd3:e39e with SMTP id
 d75a77b69052e-4b31dd23338mr114026681cf.61.1756786345090; 
 Mon, 01 Sep 2025 21:12:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ5ZmDCtlOCTJ5CNy/dDBkom0CRsWFzCNRi65zEfcrO5jaS3sB1mwTAnfyqabE66OpLSYXiQ==
X-Received: by 2002:a05:622a:1452:b0:4b1:dd3:e39e with SMTP id
 d75a77b69052e-4b31dd23338mr114026441cf.61.1756786344501; 
 Mon, 01 Sep 2025 21:12:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56082793359sm352715e87.88.2025.09.01.21.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:12:23 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:12:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
Message-ID: <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b66eaa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ruUdINtktsOv1bkmipUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QW7Q6b5_dgpH6eJE0j-OzA284EwvuPYV
X-Proofpoint-ORIG-GUID: QW7Q6b5_dgpH6eJE0j-OzA284EwvuPYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXwtRnMeAtlArO
 SsHMCWegYb7hquQ0PRUckVR15C6mKG1IiOY9T2x9H6/vOxSuUm5s3PSjwAbFj7VgYEYyhhvWq5r
 dZvQcZXACOJAoDo2q0Ly0Ee3QEiCZXZJMCZTtboT36GzWyk8i142+eSt6zz3lJay8A/C1izVobb
 bZQK1clXmnAdj38FBHgwYf5WHNkg75I1RmNC9M/f57jPnr5OcZcCsBhVRq4N5J+Y9CBvT+vahgu
 +TsqlfVl/w7lLX0TWbHU4fercWdVHpEe9qSV1h9PvZQxrt52RKRXBb5x/zEGQG2HEBnKksTl60d
 T1pIFss7LqF9RWye9KFEdGIAt4hla6wTBzAZa0cmLVp32bbXrDO0kvfcYqDM8JS+2G7urRZ2Xyf
 jXB2zGT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Mon, Sep 01, 2025 at 11:03:35AM +0530, Ekansh Gupta wrote:
> Current fastrpc message context uses a 12-bit mask where the upper
> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
> represent PD type. This design works for normal fastrpc calls but

FastRPC (here and in several other places).

> doesn't work as expected for polling mode. To enable polling mode
> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
> context where the upper 8 bits are context ID, the lower 4 bits are
> PD type and the 5th bit from the end denotes async mode(not yet
> upstreamed). If this bit is set, DSP disables polling. With the
> current design, odd context IDs set this bit, causing DSP to skip
> poll memory updates.

This looks like a description of a bugfix. In such a case, move it to
the start of the series, add necessary tatgs and change commit message
accordingly.

> Update the context mask to ensure a hole
> which won't get populated, ensuring polling mode works as expected.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 0991ac487192..57e118de6e4a 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -37,7 +37,7 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> -#define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CTXID_MASK (0xFF00)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
>  		fastrpc_buf_free(ctx->buf);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);

#define magic value

>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kfree(ctx->maps);
> @@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		goto err_idr;
>  	}
> -	ctx->ctxid = ret << 4;
> +	ctx->ctxid = ret << 8;
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kref_init(&ctx->refcount);
> @@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (len < sizeof(*rsp))
>  		return -EINVAL;
>  
> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
