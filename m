Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7BABBAE4
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B40E10E05D;
	Mon, 19 May 2025 10:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRStUiC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B9010E028
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:17:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6P3Kj007437
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/PcwuAaLrQXGvgujDx9FZz79
 4RRPKdZjInGYaT91vdA=; b=YRStUiC/+PEBnK+aUKPSInChgZ1rH5jhvs6s9CZ1
 2JvdHbyqJZssz3G9ptixLY8vOHhCYNX+gFQ7E1+sDtRBIkV7smNQaz+os/G5bzVH
 OhyttG4+xuEqzLLL0l6zDaJRKcKIWww7jU2uVybCDat6YwN0pZHhW6FBEDs73wTB
 wzSNa/7e1q7W8PLFqcputgovJWostoIT2YJPpW9lc1DORqxyHUO2O7G8N3sz0QeV
 sV57EtDk/Ffa4Z99C6/Ek6t/GF4NPLD53dbBqcUjyma/e0oTbeEnWrlBYOHe8xut
 cyKYt3UPYTXXuMN7nnQb0EtMkWpwGoL42jjsN61iFMUCRQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgqw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:17:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8c0a83f9cso48967286d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747649870; x=1748254670;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/PcwuAaLrQXGvgujDx9FZz794RRPKdZjInGYaT91vdA=;
 b=u/PRMschg0Vb/UwRlvC9nAzBRXliV3ripNjyLi8eknEmaHL6gAJKv8pFCu5dzLUrEG
 YJcXQrBwB+T20YfjASKDjqFNJXWCrvHlNvTo2kqyQjYvLX+FFccROBFcouaQ5C/rjKZ0
 tKGci0fMCs2mQSz61ovxkIbyYI9VafYPwUaDYqrR5ADxprRQ7tOqFOf6686pw5J7g+MP
 MEpFtXG9V43QuBsslQYzOexr7a6q3AnCCPLMnxWI/gx3HKaldx4Mv9nbLKvxFfskCb8h
 THTf+6zUVZYNXOwnjHjhtfK29xJE/7y22FN7mJP2EONSwz9PPvwQ0iplOWjAyNHt+17D
 UUhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZhDaH+F6wE9+9aaHInGqwdv7KI97CuZEoXFLc2E3j2e9Ft3WU54sHD1W4DekIPk5jjqx4T7hReDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT6FB3vq576Ed+7j80jNxR+g2gzGU5MrJErRKKZnZxZNqc7qNl
 2ghddCx3iFtT/9l9oXDRNitkecIzFMcXa5/bwlMjtxaRLoCimi9pmAv4K2QqnVmzv/xJOzi+pCR
 grxs69XX/BFVa4RQKF1n2yJEyFaA29eeED7IhBV0+QoAzy9o74VjwAxHzVBdEHoux87OFFUE=
X-Gm-Gg: ASbGncsvahQriYHFMVbybYyc3Oa8uJ548NkE4lGpnrCYGiWeo11pERqZDw+RXYN9sOS
 oEE0UiUogi1+N5J22Sxu1+k+dLGty/V7DYfWBhXXn8OgfGrKD+scZPnEn8aLgNiguz6O/loRa8H
 1G6QUe+fsBCkGnGfLI51apzqGWirhAUOX+FV9TV07pUAwE3JIfvT7Pb4KWXb5GQuqMGiD1VOwYw
 wWluIJ822l/quVjzyDkJZO6vzozCgaar/+qiFWMoBY0vx4H2UVFmQqrpF/E73hw6XWGtizYj62u
 3jYcBXb9GSuWQO49FBKSNQqX+BpdNuZZ96kAbLcu3wkkRSW5lph4IXtzMMOFsqi7FycfmsIuTEc
 =
X-Received: by 2002:ad4:4ee9:0:b0:6f4:ca4f:43f8 with SMTP id
 6a1803df08f44-6f8b2cc876cmr171598466d6.6.1747649870073; 
 Mon, 19 May 2025 03:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR4mBGKiUglDXqp/Q3z5m/L1YYyGqwaRe9+bf0h0QCUbDpcyPM2GI45j2fQ+VZaF4AFNwjFg==
X-Received: by 2002:ad4:4ee9:0:b0:6f4:ca4f:43f8 with SMTP id
 6a1803df08f44-6f8b2cc876cmr171598206d6.6.1747649869690; 
 Mon, 19 May 2025 03:17:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70181b4sm1794804e87.116.2025.05.19.03.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:17:48 -0700 (PDT)
Date: Mon, 19 May 2025 13:17:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: ZdO5azL5KIVCOFhil05IgV9ldcFszuvh
X-Proofpoint-ORIG-GUID: ZdO5azL5KIVCOFhil05IgV9ldcFszuvh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfXyawPd+zaYRSK
 NUXqOukGzLzJwGZu+GstFunuUcwpsNazbQxi+u0BVixHUVpUuTNLeR16Zx8S601D/sS2x77IS66
 WmtqUif3HKCadTCSA+Qx4/gFg3LwXWkZN3GjXDmdzNVwpoLkvY1mNW3jjidA63CipjitvqRKCjp
 Ze/Jf98Y6yx5Rkzs+GBS1uq5U8aDSRXSyUczARGe5+9BAPoj6qtH9vHS1iUL7CHj9dsJlrdkz6r
 HYkttAF1G/YrDE8OiRUqHWwL6BP5B7dlYbD43yIrBCY8+piqxutdRS48Ia7OYu2ToyWvj4p+JuO
 USUa95quDGsJ7dEtgTzakp+MvWPvPpg6gq76J2MKbhGOmixS2JnFGOrSylh8s6OWQ9bQec4vlDt
 w3OMQXuRhUH/qvrcBGAkpPEy+khgVfhMYmCxgGawQuhEtHQv+gnf341L9byOlT0NFsvV5u5J
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b0550 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ii1ax498U2AZhM0x0wcA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190097
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

On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. Set the number

What is 'properly'? Which issues?

> of pages to one to ensure that the initially allocated memory is
> correctly added to the Audio PD memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4e38b5e5e6c..b629e24f00bc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> +	inbuf.client_id = fl->client_id;
> +	inbuf.namelen = init.namelen;
> +	inbuf.pageslen = 0;
>  	if (!fl->cctx->audio_init_mem) {
>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>  						&buf);
> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>  			fl->cctx->audio_init_mem = true;
> +			inbuf.pageslen = 1;
>  		}
>  	}
>  
> -	inbuf.client_id = fl->client_id;
> -	inbuf.namelen = init.namelen;
> -	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
>  
>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
