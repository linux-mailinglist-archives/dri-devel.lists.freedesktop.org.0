Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C3C5D0CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BAA10EA53;
	Fri, 14 Nov 2025 12:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LS4UAqRJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cdaq16rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9AF10EA53
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:16:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEBXipb2263213
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pCmbcg3LAPGi8FbIray+zmr3
 /BYuaNe5Q0F/I9OQc7Y=; b=LS4UAqRJ5fo26W+P6JfZfI2cYmthiPIjZBrr4/HQ
 tHWdTzu22AnALOPyXwPX4CvpiT7rwS/uSwyJAbxnnRxCJKJ8sJU0ZIoMcRNfFbz8
 FBwjl7T74HcpQndaHzn0AEtvmuetJvtpJOFL8t9q0kOX279D1stg3lOAcJPSl0wG
 2dlv2b72/U8SCe/s09ZWYk64KYK8I+eGf/lbIb+GfIUQx6tCBPigw7cM+cnatZnW
 8IqMcfwJnWSWI4+670hsdL5c0ABG96HD5WVpYL3x4R6tVEb8UlUoAGQamTndsZfq
 irlYqIoKuoABRGXbcb+CqcrjOH2GyDDmLkmfH4LB7X9g0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adw1j1bxs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:16:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6855557aso81561221cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763122561; x=1763727361;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pCmbcg3LAPGi8FbIray+zmr3/BYuaNe5Q0F/I9OQc7Y=;
 b=Cdaq16rxDFkfIa1+GkP/chPE1Q3B9Fg2QlKaHuvbaENRFVlsKrgksHO0FTjmx9cjDP
 fS+D62/KRcxN0OIelJj7zKpNdgISbSOuaRTHkplKj7dvs5hIfQXgQDjHse9/f8ibH7TL
 omAlgIsS8MPkfapIM0yykx5Z9rKlRNuGPBBUpu9D/1xRstdj+mhHJvnSxY+pP7k3uviU
 jpvrb4u/NeqkqPeHRRubI70TQbpvJRiH1Q9oKBoQxkBOzomOGrXzYhoc5qXUzp+pICKF
 bWjnGTDwuSqaJj3f9/WNwYk5qKT+Fze0wxWAg21fhhWvQX34ioiIEWq/h62TuY+gxaXo
 6aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763122561; x=1763727361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCmbcg3LAPGi8FbIray+zmr3/BYuaNe5Q0F/I9OQc7Y=;
 b=P2lIeMJ2Op0KU8hLXmCqfycwFzo4MgHMrtXjNXrcjigVyNzJYNrWJQ+fo3ZnyCT2Hs
 XQdd3bzlVN1NlCm6Slc/QDARSrVZO5fs0BM8yAOXw/7z6xQPk71hfKUdLMENZI3/hIe0
 dwDAiprzgzWNsvnpReuBL3f531wA8TbkZPi3zIkY+ssfGPT+eFKI0+pkbsnrJqnFG2am
 yzdA9ufv18GB32svGHTh3zYRJc8XZkiM7JRn1LQgNx5Jx97eKwawCKF5tEGByR6otjEe
 Vi+gopTAHbjpC/C9QWwB6uBLReSBx4vSnCHaRnSHz+r1wGsT7trk8mB2lGf8wwvy8obU
 YXkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxLBJqEtYTy6dy4QLjVjLjLo/RfU4RxCXndxCrxXjg1jdlg3DMgCJKEzFysXvwGT9b9ReFEThMUEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfFRPC0oPAbEiGB/ELYqzXKNQicaknTOyHUL8qYOgEo/N2B9iM
 vpe4Y8n3p1YakunhMJRDg8+lLg8zx1+dMLx8TfpAA3dtH3Qw6RhpFGKJzD4iZD8LLxVP8v8jSSY
 O15vQQTLuHMGgRpRguv59CA143VDmE0Fkp2JoVQY7IjbWUc5G8/9VL4X0f9pzSYIdm01Hqs8=
X-Gm-Gg: ASbGncuHpE8aOBup22zO4pEg3Av2ajO0BEBD9r/qRC7t8iAl36tAXBTtTG1xcEnHNic
 DsdvwgOQ4Mw4fAWfDEzv835V+MlVh2Py0Aq5DWEi0c/wZi6nStM83XZrbZQuJMY4Z1nt6q5JUIh
 XW/wwPNqU8YPXtfujFonQdU6mwP4m58qHkYHd4n8+mdCss/TCcINlHbpPpdV9eeqHozYi+Ex4N8
 rbt9FM8EQF5sJuCuqbvvxxEFG0HY2EdCdaSlqdCHolZZwFxnN7y4/7wxUhRfY2xi3pYxS0j6Lk5
 9xFjEM415amh7fH5+eKmiC6fTukW5aFzShgGlHkJ9zb1BBvq4FrGaxP7K3fmV3eroIJ+RnumNW7
 hVeDx1I4ZpWpO0J1e9bVwz1tVKUsWekmjwAXv4qTFK+5zHvYfzA90VLmshNoDEn6hg+47MnQVQG
 MwNmg9tIXyL5DI
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id
 d75a77b69052e-4ede6fa96a4mr81879101cf.4.1763122561056; 
 Fri, 14 Nov 2025 04:16:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQd4aG1xDfsAJw7sJ7+Tewd/JzAQtliNZJqV7KBIy+CuymL/YuPm4aJvSN5Pyi0H9ikNZH7g==
X-Received: by 2002:a05:622a:290:b0:4eb:a715:9aee with SMTP id
 d75a77b69052e-4ede6fa96a4mr81878471cf.4.1763122560349; 
 Fri, 14 Nov 2025 04:16:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040025dsm1032684e87.53.2025.11.14.04.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 04:15:59 -0800 (PST)
Date: Fri, 14 Nov 2025 14:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <cjuzht6hfzmog7xkwbydisl67iuttdo2jy5hndnruzeu3hp22g@dergmterq2an>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=69171d82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fBhghDEW5YtqNLni8jIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NyBTYWx0ZWRfX3tp/vH7ZeJM+
 WS3uthnY7wWWBRebs0on4R7qiAdl+mZklboCG1AVrHnBeT+/uiKUn4Tk05fa6bKVvjAl44duQ+o
 jOmulw+ygy/4eDkIlLc9U1+kMuEy36jIMpuEBVjW/FHjSqzlhBTtJmYnoEFntRKPeiwO77VjTZ1
 Q37VPSnWncmKHt8zHg4T8yNZ5A1oEwJX5uIegxL8bNe3tBn4SVhU4Qh0YjcqMZalfvT4xDhmYmY
 /h2+eKmvuPLJjc9j6t9rhyTZ+xkLRCwzURMFZ9UwwQLW9DYpezklL4/DgO5DABYFHa2M88OT3N1
 bJCZWLkC+IPWHkab3Vub1uiSP/cGAkvkKlZEd3MLbLUZ1eCmaW3Zmc3MgYjNotfS2xAOb9A/FgN
 LSGqy4RONiQF++n5pxkrYYY2n4xqKQ==
X-Proofpoint-ORIG-GUID: p-I9fuvtUFeQk6nJ_qQUToky_NiAMhoy
X-Proofpoint-GUID: p-I9fuvtUFeQk6nJ_qQUToky_NiAMhoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140097
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

On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
> Update all references of buf->phys and map->phys to buf->dma_addr and
> map->dma_addr to accurately represent that these fields store DMA
> addresses, not physical addresses. This change improves code clarity
> and aligns with kernel conventions for dma_addr_t usage.

Why do you mention dma_addr_t here?

> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..d6a7960fe716 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -106,7 +106,7 @@
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
>  struct fastrpc_phy_page {
> -	u64 addr;		/* physical address */
> +	u64 addr;		/* physical or dma address */

What is the difference here? Aren't all of them DMA addresses?

>  	u64 size;		/* size of contiguous region */
>  };
>  
> @@ -171,7 +171,7 @@ struct fastrpc_msg {
>  	u64 ctx;		/* invoke caller context */
>  	u32 handle;	/* handle to invoke */
>  	u32 sc;		/* scalars structure describing the data */
> -	u64 addr;		/* physical address */
> +	u64 addr;		/* physical or dma address */
>  	u64 size;		/* size of contiguous region */
>  };
>  
> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>  	struct dma_buf *dmabuf;
>  	struct device *dev;
>  	void *virt;
> -	u64 phys;
> +	u64 dma_addr;
>  	u64 size;
>  	/* Lock for dma buf attachments */
>  	struct mutex lock;
> @@ -217,7 +217,7 @@ struct fastrpc_map {
>  	struct dma_buf *buf;
>  	struct sg_table *table;
>  	struct dma_buf_attachment *attach;
> -	u64 phys;
> +	u64 dma_addr;
>  	u64 size;
>  	void *va;
>  	u64 len;
> @@ -320,11 +320,12 @@ static void fastrpc_free_map(struct kref *ref)
>  
>  			perm.vmid = QCOM_SCM_VMID_HLOS;
>  			perm.perm = QCOM_SCM_PERM_RWX;
> -			err = qcom_scm_assign_mem(map->phys, map->len,
> +			err = qcom_scm_assign_mem(map->dma_addr, map->len,
>  				&src_perms, &perm, 1);
>  			if (err) {
> -				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> -						map->phys, map->len, err);
> +				dev_err(map->fl->sctx->dev,
> +					"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
> +					map->dma_addr, map->len, err);
>  				return;
>  			}
>  		}
> @@ -389,7 +390,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->phys));
> +			  FASTRPC_PHYS(buf->dma_addr));
>  	kfree(buf);
>  }
>  
> @@ -408,12 +409,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
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
>  	if (!buf->virt) {
>  		mutex_destroy(&buf->lock);
> @@ -439,7 +440,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->phys += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>  
>  	return 0;
>  }
> @@ -684,7 +685,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -733,7 +734,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->phys), size);
> +				 FASTRPC_PHYS(buf->dma_addr), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -785,10 +786,10 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  	map->table = table;
>  
>  	if (attr & FASTRPC_ATTR_SECUREMAP) {
> -		map->phys = sg_phys(map->table->sgl);
> +		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
> -		map->phys = sg_dma_address(map->table->sgl);
> -		map->phys += ((u64)fl->sctx->sid << 32);
> +		map->dma_addr = sg_dma_address(map->table->sgl);
> +		map->dma_addr += ((u64)fl->sctx->sid << 32);
>  	}
>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)
> @@ -815,10 +816,11 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
>  		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
>  		map->attr = attr;
> -		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms, dst_perms, 2);
> +		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, dst_perms, 2);
>  		if (err) {
> -			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
> -					map->phys, map->len, err);
> +			dev_err(sess->dev,
> +				"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
> +				map->dma_addr, map->len, err);
>  			goto map_err;
>  		}
>  	}
> @@ -1009,7 +1011,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  			struct vm_area_struct *vma = NULL;
>  
>  			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
> -			pages[i].addr = ctx->maps[i]->phys;
> +			pages[i].addr = ctx->maps[i]->dma_addr;
>  
>  			mmap_read_lock(current->mm);
>  			vma = find_vma(current->mm, ctx->args[i].ptr);
> @@ -1036,7 +1038,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  				goto bail;
>  
>  			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
> -			pages[i].addr = ctx->buf->phys -
> +			pages[i].addr = ctx->buf->dma_addr -
>  					ctx->olaps[oix].offset +
>  					(pkt_size - rlen);
>  			pages[i].addr = pages[i].addr &	PAGE_MASK;
> @@ -1068,7 +1070,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  		list[i].num = ctx->args[i].length ? 1 : 0;
>  		list[i].pgidx = i;
>  		if (ctx->maps[i]) {
> -			pages[i].addr = ctx->maps[i]->phys;
> +			pages[i].addr = ctx->maps[i]->dma_addr;
>  			pages[i].size = ctx->maps[i]->size;
>  		}
>  		rpra[i].dma.fd = ctx->args[i].fd;
> @@ -1150,7 +1152,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  	msg->ctx = ctx->ctxid | fl->pd;
>  	msg->handle = handle;
>  	msg->sc = ctx->sc;
> -	msg->addr = ctx->buf ? ctx->buf->phys : 0;
> +	msg->addr = ctx->buf ? ctx->buf->dma_addr : 0;
>  	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
>  	fastrpc_context_get(ctx);
>  
> @@ -1306,13 +1308,14 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		if (fl->cctx->vmcount) {
>  			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
> +			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>  							(u64)fl->cctx->remote_heap->size,
>  							&src_perms,
>  							fl->cctx->vmperms, fl->cctx->vmcount);
>  			if (err) {
> -				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
> -					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> +				dev_err(fl->sctx->dev,
> +					"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
> +					fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>  				goto err_map;
>  			}
>  			scm_done = true;
> @@ -1332,7 +1335,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->phys;
> +	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>  	pages[0].size = fl->cctx->remote_heap->size;
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
> @@ -1361,12 +1364,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>  		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
> +		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>  						(u64)fl->cctx->remote_heap->size,
>  						&src_perms, &dst_perms, 1);
>  		if (err)
> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> -				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> +			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
> +				fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>  	}
>  err_map:
>  	fastrpc_buf_free(fl->cctx->remote_heap);
> @@ -1455,7 +1458,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	args[2].length = inbuf.filelen;
>  	args[2].fd = init.filefd;
>  
> -	pages[0].addr = imem->phys;
> +	pages[0].addr = imem->dma_addr;
>  	pages[0].size = imem->size;
>  
>  	args[3].ptr = (u64)(uintptr_t) pages;
> @@ -1913,7 +1916,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> -	pages.addr = buf->phys;
> +	pages.addr = buf->dma_addr;
>  	pages.size = buf->size;
>  
>  	args[1].ptr = (u64) (uintptr_t) &pages;
> @@ -1941,11 +1944,12 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
>  		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
>  			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
>  		if (err) {
> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> -					buf->phys, buf->size, err);
> +			dev_err(fl->sctx->dev,
> +				"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d",
> +				buf->dma_addr, buf->size, err);
>  			goto err_assign;
>  		}
>  	}
> @@ -2059,7 +2063,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> -	pages.addr = map->phys;
> +	pages.addr = map->dma_addr;
>  	pages.size = map->len;
>  
>  	args[1].ptr = (u64) (uintptr_t) &pages;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
