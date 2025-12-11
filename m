Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611CCB60D1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 14:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4A810E78E;
	Thu, 11 Dec 2025 13:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpZ2A0Im";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYdQo+ID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0704410E78E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:38:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBAXq6O1597496
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=btLod8KCgkBXOYqTjWmzuMKs
 QAf2aBCvMBzErO4K4TE=; b=LpZ2A0Im30d/BwRmSbP6H5Jptei5ci3P4+4h0kFX
 kDgFjAPbFdBNc2Zh+N2rVLOFibTo7YJpaLzh44nLlFUdiBwTvrLRn0JFMQPmZyzc
 4eNO0vOJJfyqV/RItGDYt932buh9WhGXeE5s8u7YEbSarzBM1IMlEFJd4e0k+5Jo
 47ppOGbQ51EOAtNSQEYuxzKnLJLQ5dlxq4sJqehwnHJC/OkO6w+qLjSrhyKL9HnR
 blMBGZ0o9X9bruZHhlJ1z05upd3S5/jdDRJR5lGsZL1aersQI7iREEnGys8Ipofz
 QI+mgvuND7cewc3RDL4w6jGx04UWQ82tpRjL8REz0o+qsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpbtm7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:38:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so2356801cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765460286; x=1766065086;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=btLod8KCgkBXOYqTjWmzuMKsQAf2aBCvMBzErO4K4TE=;
 b=HYdQo+IDXwh0MBTkC1F/st/qT51CYgMg31LYjOeknawbNs6W7sRZX5u8b4iWZS6waA
 uQjWNHI76vhrIz3yAKUAsp0YzQHyDXNDrEhfRK9YJC9DK4izK0EXJmTFFW+2GtpruAnz
 tsKSlAgcEpWEPouDhSz15Cljnaumj8x3sVC3tj9idRKzFHZB0ydKJRwwUHzA9pl4Cj+s
 ohPKM9Zzm9HrBzxjOU2dqBFWN8ioUDMoc3TvKyLObE2wd4+x47nBJnpuZpZu2qVokYc0
 qli8Xx4Ui/pPtcjGo3z88KRf/qKTAorTLeGJdvq+qkJwYNwKDMAl+cfladjZTahAxwfG
 RWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765460286; x=1766065086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=btLod8KCgkBXOYqTjWmzuMKsQAf2aBCvMBzErO4K4TE=;
 b=nsMLHzM1JLFdyXkhV5PkC2kYhd3MpS7P2NABVWwru8WuSRqVz8ocTxZXMfe/123ZYv
 lsXNcY1Nlcv4ZTFil3N2wQANutaGbNbQRvWc6yCDWVfIy2UPHQyjhw0o++E9cAPbPyZ7
 HDfz9JwDvu/LLLaxwtavWAt9CRkTKPyXTZunsqNpKAOO/lC3j0Ln5AlCBNVyDt5bgLx5
 S3E/2lTov4Cc722wau0FDhNJLWzSxmVOZjJvEyYVWl+Yyv9/AJM9o1RD5vU7Qvi/cVys
 a9+hVuvKmuAsPGiqTPEvbJRVFA9nGEJIv5owOFC3GqW+UM6eTMNzEefCYIsdOeyN9Wau
 Bc+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvRRJ6GJ5BFtiv9yw67QdIPOXyc425GXAfTiH2v0UbEvddZgC15i222v9aVqkdicwXWE1Gz4gQs1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqVCyuv6zmYNCsap/DONeGYEPsuFPEjPwMrkRRaD75yFyqi4dH
 VTusumgJJnDiXgNmRO1Df+zgoDLctVrcXr4OQTiTcEc9N7J6CDAsFnbuaC7DSzxSfAgRxzcmOni
 ZhTXh6jBIIBv3BLYDW7VeQjh/ElZXrH3HqYKJBwN3M5OpWNi3n91lHTTf1MMWZOOpLo/Lz3o=
X-Gm-Gg: AY/fxX40iuwTAsbUuonKDLEXsrJ6tVoXGtW5tvLecAH4bfMZtDb5vFdhJfOW+H4QrzP
 FNe2O/pddf2PAz1E0ddGxG5g2NDSo6mkFsmr5XBwI2g1XiWN01A3Avjk6tJLJ9A/WuajN5rKFBT
 EApQ33VM+9QmRs0IemLBDA+5C9i/nWgWPueCUnmToqh24efEkmB+zh197EWt85o6juORe6C5C/d
 Ujl9Lf+rPCCmNXt/VB11wx+iaFnDCfgBUeBKmTgKCaWIGp4CQUPuwy3wvEI0zW4su8Ygswswq6z
 EzJdKVDxWMJ/mqxarAzkJTU91/dOkT9+4cAwMljW7/U7rhX9TtpJE9t2+WRpoos/5Hmw6lI4lO2
 B62WVJN+gV5qQhpe8KHqaIxGVrqn0iN3q5pqKauI1naJUgcKBZpKTsN5P0oxRToXDXSA5feN3sQ
 AbD9IjYZSeAKd91MnZ7Qp2cBY=
X-Received: by 2002:a05:622a:1b0e:b0:4ed:b06b:d67d with SMTP id
 d75a77b69052e-4f1b1b1043bmr71990231cf.45.1765460286358; 
 Thu, 11 Dec 2025 05:38:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGLMRbYCtIrZPo/kO5PieMuTFgJ9ZqVY/bcxiT2+sHAFaHudjyECVU1VHo5NCBj34tieLBKg==
X-Received: by 2002:a05:622a:1b0e:b0:4ed:b06b:d67d with SMTP id
 d75a77b69052e-4f1b1b1043bmr71989591cf.45.1765460285835; 
 Thu, 11 Dec 2025 05:38:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f379dfsm870083e87.9.2025.12.11.05.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 05:38:05 -0800 (PST)
Date: Thu, 11 Dec 2025 15:38:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v6 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <iweswdjn6owhotezqdrdk5q7c4npazw5mb4zgurpfc3kb4d27b@fdywmzmvbn6d>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-4-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211100933.1285093-4-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNiBTYWx0ZWRfX9zXY7heY5WD/
 b58EVgAwHYk8HA2LInhxA9FkLUXcYyHsR293ff2qijeUVMWKnrBNYdaRGtIlrbdh+EiuU0hu0gi
 xuKQoah4GVmbtXifK1im3QWARP/xQ9GCC8Icr/Rr08g76N8SzhTY01Gilww86xlA6zAvSy+fJqX
 +x97moeQTvi5iysm8sGo4txkKexYlznrxke426n5JogeMfc15zecp/R2rJO5jTazPOmL/FfPIUz
 weeiARJm7z0wY3lkdUowLlMjtLtu6VryiKpcDp/w3dYdsJn5k/aeu7owPNb6XqbwO4Ty/xLT9ZS
 R1qeFEb/rBgJG4vWMygfxLdZ2dTNKTwFdvTfXiAeb/jaQzx+qSvfgeyiWqqFzIZxSZNqH4BmRYo
 I/hFCN409O3MaHVenW0a4rGGBVfdHw==
X-Proofpoint-ORIG-GUID: frGiwVSu9mkIvF5bbkF1A00R7os6iwph
X-Proofpoint-GUID: frGiwVSu9mkIvF5bbkF1A00R7os6iwph
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693ac93f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7AOTrF8chGgiLGUaiC0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110106
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

On Thu, Dec 11, 2025 at 03:39:32PM +0530, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 via OF matching on the fastrpc
> node; otherwise, default to legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 61 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 53 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index eb9501fe79bc..af92876f1cc1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/bits.h>
>  
>  #define ADSP_DOMAIN_ID (0)
>  #define MDSP_DOMAIN_ID (1)
> @@ -33,7 +34,6 @@
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
>  #define FASTRPC_MAX_CRCLIST	64
> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> @@ -105,6 +105,23 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Extract SMMU PA from consolidated IOVA */
> +static inline dma_addr_t fastrpc_ipa_to_dma_addr(dma_addr_t iova, u32 sid_pos)
> +{
> +	if (!sid_pos)
> +		return 0;
> +	return iova & GENMASK_ULL(sid_pos - 1, 0);
> +}
> +
> +/*
> + * Prepare the consolidated iova to send to DSP by prepending the SID
> + * to smmu PA at the appropriate position
> + */
> +static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
> +{
> +	return sid << sid_pos;
> +}
> +
>  struct fastrpc_phy_page {
>  	dma_addr_t addr;	/* dma address */
>  	u64 size;		/* size of contiguous region */
> @@ -257,6 +274,10 @@ struct fastrpc_session_ctx {
>  	bool valid;
>  };
>  
> +struct fastrpc_soc_data {
> +	u32 sid_pos;
> +};
> +
>  struct fastrpc_channel_ctx {
>  	int domain_id;
>  	int sesscount;
> @@ -278,6 +299,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	const struct fastrpc_soc_data *soc_data;
>  };
>  
>  struct fastrpc_device {
> @@ -390,7 +412,8 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->dma_addr));
> +			  fastrpc_ipa_to_dma_addr(buf->dma_addr,
> +						  buf->fl->cctx->soc_data->sid_pos));

fastrpc_ipa_to_dma_addr(fl->ccxtx, buf->dma_addr)

>  	kfree(buf);
>  }
>  
> @@ -440,7 +463,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += fastrpc_compute_sid_offset(fl->sctx->sid,
> +							    fl->cctx->soc_data->sid_pos);

fastrpc_sid_offset(fl->cctx, fl->sctx)

>  
>  	return 0;
>  }
> @@ -685,7 +709,9 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> +			      fastrpc_ipa_to_dma_addr(buffer->dma_addr,
> +						      buffer->fl->cctx->soc_data->sid_pos),
> +			      buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -734,7 +760,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->dma_addr), size);
> +				 fastrpc_ipa_to_dma_addr(buf->dma_addr,
> +							 buf->fl->cctx->soc_data->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -747,6 +774,12 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>  	.release = fastrpc_release,
>  };
>  
> +static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t sg_dma_addr)
> +{
> +	return sg_dma_addr + fastrpc_compute_sid_offset(fl->sctx->sid,
> +							fl->cctx->soc_data->sid_pos);
> +}
> +
>  static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  			      u64 len, u32 attr, struct fastrpc_map **ppmap)
>  {
> @@ -788,8 +821,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  	if (attr & FASTRPC_ATTR_SECUREMAP) {
>  		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
> -		map->dma_addr = sg_dma_address(map->table->sgl);
> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> +		map->dma_addr = fastrpc_compute_dma_addr(fl, sg_dma_address(map->table->sgl));
>  	}

Now you can drop curve brackets around.

>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)

-- 
With best wishes
Dmitry
