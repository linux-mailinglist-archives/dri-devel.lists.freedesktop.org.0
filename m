Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6FABDDE95
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E151F10E777;
	Wed, 15 Oct 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/duVX+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5CD10E776
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:07:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFNq002717
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Plo72r9vuYhq4837E+ASzQQ2
 vnfrofTlUlT0CX2gzYU=; b=h/duVX+7IQp+5tGiv//K47kPEZI6Sd+OSPcI2CLa
 9bT52LvhylH+y/nrtLRNw7kR+bEr6GrNI1yRfEMNWOWQZXnA3vmeD7VABIBDPqYa
 yAsgZHcWcyUZkRdToQDtaEQW/gfMqxJfPpUX+HnicxRctVxLf4o8mCUUHQDYtsnC
 SkG9P7Q+Bia6h3m6pMddEZi5kiGo9QCmQ/tst0oFwKu3On+k82nGHtk8UpK52xQf
 ABYdzboo2MR6C47R2YOlKhmbCEc70AnSCebok9N5RzwyMT5tnO8I3Fix2NjSmJud
 fNJG9JCUGmU4MiSkEQ7kuUS8j0bh6xExyi2H1bJYfqqRLg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd942he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:07:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8741223accfso371112906d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 03:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760522867; x=1761127667;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Plo72r9vuYhq4837E+ASzQQ2vnfrofTlUlT0CX2gzYU=;
 b=ByOVgVptJkfU+AbrCdtM5kdMZuPuA7a2HVxsnEVt+FdJ8QSlfUIAn0ZniFReb3268S
 XL0/Z7BTF3ylxHte8xOXmQXDhEtorkZ3DRXD6A6cyUa0bJq5HUxHSME8h1+0/RwR6Yw0
 MK1vrtRZs8NLM+dgUOqVvJeom9GYqGSjRVbbXBXl0qudLXMddvL5xBIWvJ70OqQfGBnH
 P77XYI42VkvJrCLbZkCllK4pzf6G6+4Q4/A2LzZHC+p9WTbtMEnPJ5jQsjuj9A7qrgHG
 VI4NROb4RB3H2q4cdmhuwFt7rAUOgXJ/940g7Xn4VTAS5qwwcfcDyMv06r+oGRB6JlNP
 RdPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkdlwNGeRWWJBI8+pXE/aoszvPov0J3npVv9lHT1ugGfHYEFJQGzpiY6VlRkrPUzA358eHXoJlFGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvsElSxFu6+DXiZ4FOuIqis9eGVOnyp/J7c+iRDQGvGqWiAVHG
 BwmaNNsz+1Vf0EuSWzrxYDATtiMRkwfjGB1QkdhspbMprzkJRgQMpdzwL82yNQw/wMxZwJ/RsFL
 /AUM+orAN/2U8lm/kFIAj1na5bgfy6wsTpsgAr+JAM8QsLA3qLZtCuus6C5xYuo/+g2PpTS4=
X-Gm-Gg: ASbGnct/c43TvacS/AZkHwN0dVj/B8yg+3pVy/vY4Z0+1Lp/kVCRg2ELmTcF4SxMlYF
 NRgDgXahElRf9W99tUJrQ0qldISJ+HKtkMUA4W7dBxCKiCqlQHW5DN/kzfzu9zWY4ZxC0xDxRkM
 fk9vzz6VaftwITRj2XAdKYQKgyiOgcAd+EIYGoZzia5WrS+l7EygygvJTag8/ihK3OwkhOsV5CK
 sSo8BFqch61zmEjS54YnNbXhzx7w9kUF236z8Q089ssnRVkSoJ+bBDHCvT+F/Dfh75yHAwzGBkm
 9VZSpVVPBKGObU5xxMrfY0QJkGJPTUUif827CQimlUe6pS/0C6wq5g1dAqgxSsqd99hrw4ioi0A
 CsXiWqJSX8qDvmB1cUg2IOrEi1UQaZ8oNWQ/14CGm5nxTR7kmd8E6
X-Received: by 2002:a05:622a:5592:b0:4df:6583:a5c3 with SMTP id
 d75a77b69052e-4e6eacfad65mr397959671cf.31.1760522866702; 
 Wed, 15 Oct 2025 03:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG720qHgaxVVn/tMDskc+Fb5CVEdJRkO+FFfXZC4YdLvxqG8hCwJFnA1hXqIvZ1BHwzYpNiuw==
X-Received: by 2002:a05:622a:5592:b0:4df:6583:a5c3 with SMTP id
 d75a77b69052e-4e6eacfad65mr397959141cf.31.1760522866163; 
 Wed, 15 Oct 2025 03:07:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590885784e7sm6098047e87.111.2025.10.15.03.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 03:07:45 -0700 (PDT)
Date: Wed, 15 Oct 2025 13:07:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v2 1/3] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <svekpvatqpymzxprc5n2tlndqlwze3tj6kr3bzszjnoay7oulk@zslcxpsyuzdo>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -XqWtznhGS70fy068DAhC3_aPb8WmqdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+tSZrjKav0mx
 iuZ+FrT0APnZfC5EvOKl6axNRSr7k5M61UYlX9SbNJYlfdXuhmEp7fxuRUsUBPV8xIRrJAzjpeQ
 gCGHtKNj0w50+B7UmewkKiN25P0g9qI8AH54v9fYA1VIQP5UTYITiwmBnZ0z4tm3QeR0gcIfy+F
 02BMsgEu93BtwfohE7HOg6icvmuh+NLkj8JkcMDxHjRZI+xG1owg6Cb6ifgE3lwr29FTXnH7ngq
 Jcy57eBUZmVJ1OrghlnYxFovTYfmtDBeJJ5ua9W3KSDszIT8Ks6/D6vI/fPSZI2nBprm+pslWGP
 ueBADKCmtqSjGb+/d3xFLpkpWPUgMq9/KiLFX3FGO4xVhpeAhAT+tyieUGFt77Yj691bgVZ817B
 UGI/+RNySzH9qMaYrXSZYoRyJmIYhg==
X-Proofpoint-GUID: -XqWtznhGS70fy068DAhC3_aPb8WmqdI
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef7274 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ieKUWAqLYShgQCTD6ZgA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Wed, Oct 15, 2025 at 10:27:00AM +0530, Kumari Pallavi wrote:
> Update all references of buf->phys and map->phys to buf->dma_addr and
> map->dma_addr to accurately represent that these fields store DMA
> addresses, not physical addresses. This change improves code clarity
> and aligns with kernel conventions for dma_addr_t usage.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 68 +++++++++++++++++++++---------------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 621bce7e101c..975be54a2491 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>  	struct dma_buf *dmabuf;
>  	struct device *dev;
>  	void *virt;
> -	u64 phys;
> +	u64 dma_addr;

If it is dma_addr, why isn't it dma_addr_t?


>  	u64 size;
>  	/* Lock for dma buf attachments */
>  	struct mutex lock;
> @@ -217,7 +217,7 @@ struct fastrpc_map {
>  	struct dma_buf *buf;
>  	struct sg_table *table;
>  	struct dma_buf_attachment *attach;
> -	u64 phys;
> +	u64 dma_addr;

And this one.

>  	u64 size;
>  	void *va;
>  	u64 len;
> @@ -406,12 +406,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  
>  	buf->fl = fl;
>  	buf->virt = NULL;
> -	buf->phys = 0;
> +	buf->dma_addr = 0;
>  	buf->size = size;
>  	buf->dev = dev;
>  	buf->raddr = 0;
>  
> -	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
> +	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->dma_addr,
>  				       GFP_KERNEL);

If it was dma_addr_t, you wouldn't have had to typecast here.

>  	if (!buf->virt) {
>  		mutex_destroy(&buf->lock);
> @@ -437,7 +437,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->phys += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>  
>  	return 0;
>  }
> @@ -682,7 +682,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);

FASTRPC_PHYS trunates addr to 32 bits. Is it expected? Is it a DMA
address on the  Linux or on the DSP side?

>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);

-- 
With best wishes
Dmitry
