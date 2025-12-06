Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F338BCA9EBE
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 03:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E797010EB27;
	Sat,  6 Dec 2025 02:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0gRS5Iq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bhxs0Pay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCDC10EB27
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 02:30:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B62CFGc2702922
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 02:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=e/d8kbaoJ3LT3xXOy/67lazS
 UfWaZHogOBoRsULFs8s=; b=U0gRS5IqU9anCNVHl1AGrAnaK3DKXMgiILzynFwl
 8EVfs4ZlkrfkjR/w+4D1mxReQJa1WZ4QH3L2JYcmfPJI5R5dZ9O/HOcMsQxTHHlq
 4nQNvKqJWKJPeZRRANtQoVO+5D1NlhF1VK6koWrNUA7Oq/lQ2J2RrkC78OKD+Yf5
 gxFVjpZo0MUIk8dc/bYe48WDJZNuIS9e4y43tHPfQmzxKj92C8UifRXeQDRsrKs1
 +mlrVI9OtvHccOYgJdRTbLNnsuN4Bf8xZyCavw6rwRr35yMyNw8noSosfJ8dkuSZ
 MTe/IvRm5Flb+s1U9/Mxhg/WXGB34guf7TVLSENPLVPnuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga00uv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 02:30:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b6a9c80038so21000285a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 18:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764988218; x=1765593018;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e/d8kbaoJ3LT3xXOy/67lazSUfWaZHogOBoRsULFs8s=;
 b=Bhxs0PayoWe5tTL18mj9TIn474JewoB5v5WHIfWF3iSt+SC2yaLIcMmebJetiK7VkZ
 RT7NHyFGr8CEWN5suyTXkK/zDItDE8nJlBYAs9Itf0XWMi89ABPuXwQtMBO1UgKfUQ0v
 GMR/ye71fuH8taD5gcoHlUos+kNkt0zuu6+WvOSVndZX3Ws/SkJo+JL/HVmLErD91xH1
 mtP0UiabxkUFhhoPzZLqywz8chGolr/XHzQr1+SA0DERjlc7fWc4uYHj6TYDdMLqpD2M
 Bb/dPoDLlCUV1/ALCzdCh31V4IiU4M2+bO574b0A+WGvvoIu0qv4TsoCPQMI0vWtzlH1
 0Www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764988218; x=1765593018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/d8kbaoJ3LT3xXOy/67lazSUfWaZHogOBoRsULFs8s=;
 b=NzH7iIoW8Yn/JQFJ4Ck0GJbq/kb7XxTryqNYAucAsx4faxs2EBRwt3FmWDmvWwMPDg
 X2vLB92atLgTGW2i1uCuND6DhKkQhcgbH6bEk/JMX9acJdl7pL0gRHEPhRuVWlhiNc2D
 riTvLaNl5TbmAAMBC3EWs9diMrZXCm8vg9QC7XR0feAI1IkeG71R9c49H0bRRgmS3xAU
 VAeJywm5yKnGuhPujMG9xrowwUUSB0E89lYW8lQBbhG6MahQqvQTt/MlXUMRGc50Vbsv
 chBH8mKgqWTGViTWxC/gFG06DPz/xrk8pVB1SgzH1LN/LyB9tTGLHLCClV31ISXdYAwb
 ovoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkgK0UtqyIbxQuCkTI6ZsBPWagnoxIH6JrbQezsXppw1EXeYATeITu/rufD9F9uOZntvvoZKzf1+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx07yE7xFTUctBP9c8gy5pqp7effF7kxK91AxoEMAAJmo4E+dHe
 4ZBxJNZb8xseGHSN/0kyOQ26OLkkrFg/cD55HMiPbrLB9MhzTp6hmJm/XqpKQ3B6eXUVczRQ1xs
 gaLpZSy4bWuLq53/5WwhgBFMKECIdg/41AIvIQNs+ZSLZi7o5iEC4GjRyMPVhAn5IUjORmh4x4X
 mtrkU=
X-Gm-Gg: ASbGncvNKCMPeKVJo6briVZGRDdBfPShop6X/PHipiw9rISD0oEhBM3Ah0iQS9z/i79
 9jLjqoiZLXpOCpamwr92Q/R2kmmGNGA2zajaNIVQppkgTQrLpOoupQjCO/u708syy50yqaPJSs9
 OgeggfErYVs540k54KJnv/LQnunIg1XxGc2J72q8lNq6fU58R2k1GDkD9xAieZDFYg52cLcc2TM
 3HtnW9XS+0U2yVxfK5rBqRTomtR/ApeJU9J3r8yR659+PJgWNbErtXWev0HjWPKIbrxiJPhdvnt
 YoJQX8iyeH/MX2oYm8o1A/GTn5lTz55vnz9uMT2U6DRqWvtAJSMlN5ispG8qVMHryuNxJlYYPCr
 6YqitwmHvumaBUk+Lh0yDWZDbVVRIhViOVPLUIJtfGU/bDFccnfYH7nO0GKc4z4VYmjKhDX8ZKl
 a3S09WBSUMfTl95mlT9kjqRok=
X-Received: by 2002:a05:620a:4620:b0:8b2:ea3f:2fa5 with SMTP id
 af79cd13be357-8b6a23e0558mr191000485a.69.1764988217521; 
 Fri, 05 Dec 2025 18:30:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbFasjoPYgeV0zAyrFao6Ix4m/Qiro6WgeULAnmE2a4FYE4mruIM3gzGDMgLoYDTwXaP7xJA==
X-Received: by 2002:a05:620a:4620:b0:8b2:ea3f:2fa5 with SMTP id
 af79cd13be357-8b6a23e0558mr190996385a.69.1764988216880; 
 Fri, 05 Dec 2025 18:30:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e7067cbadsm18852901fa.50.2025.12.05.18.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 18:30:16 -0800 (PST)
Date: Sat, 6 Dec 2025 04:30:14 +0200
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
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=6933953a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NQApBsomutaRK4veD-8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 18lqk6dN9-PI8YqSp1r30etkTK81DJal
X-Proofpoint-ORIG-GUID: 18lqk6dN9-PI8YqSp1r30etkTK81DJal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNyBTYWx0ZWRfX4Dwr8UAxKl26
 irghcBj3JTs678iRvzpYCr0i+WfImzkwuZTjDfk8/7G4i3J7gDh8r8SoguXNrEsmJ5+AgmsTuvN
 boVq88sOJKjk5Gi0JFn4X+qayr+fJJnJXjI0vdbQ5g8sjRmlaFrj0NvxaRH+W4xdI5j5LRFAWSR
 aPMCy7beQ5Wg8K4VAOLeBrgRinNPAhK2PDt0uEFI2R00bt/AVV9yhVa6UcexYyc/OAEOwNcuOAo
 d+QMgPocm2KXqEy+FQDJ9CMLq3XwbNNIMH1/xceTHgq4yGggoXvOerCLbxzG6DlXDH48RW1kT8A
 lDyi5Sy92d1b3vMZ6sUIZ9DVbDzDOnNqeHTpKlNURVGMNzr/MjsYoED+1hOzmfjaT+MHz+Jsioh
 /pgIq1NUmzgm5m5NFJxf5cCzx0aYvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060017
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

On Tue, Dec 02, 2025 at 11:36:27AM +0530, Kumari Pallavi wrote:
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
>  drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index eb9501fe79bc..6a67daafeaa1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -33,7 +33,6 @@
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
>  #define FASTRPC_MAX_CRCLIST	64
> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> @@ -105,6 +104,17 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Extract smmu pa from consolidated iova */

Nit: SMMU, PA, IOVA

> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))

GENMASK?

> +/*
> + * Prepare the consolidated iova to send to dsp by prepending the sid

Nit: DSP, SID, PA

> + * to smmu pa at the appropriate position
> + */
> +static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
> +{
> +	return sid << sid_pos;
> +}
> +
>  struct fastrpc_phy_page {
>  	dma_addr_t addr;	/* dma address */
>  	u64 size;		/* size of contiguous region */
> @@ -257,6 +267,10 @@ struct fastrpc_session_ctx {
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
> @@ -278,6 +292,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	const struct fastrpc_soc_data *soc_data;
>  };
>  
>  struct fastrpc_device {
> @@ -390,7 +405,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->dma_addr));
> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>  	kfree(buf);
>  }
>  
> @@ -440,7 +455,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,

Drop type conversion

> +				 fl->cctx->soc_data->sid_pos);
>  
>  	return 0;
>  }
> @@ -685,7 +701,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
> +					      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -734,7 +751,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->dma_addr), size);
> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
> +						 buf->fl->cctx->soc_data->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -789,7 +807,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
>  		map->dma_addr = sg_dma_address(map->table->sgl);
> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> +		map->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,

Drop type conversion. Hmm. Looking at it, would it be better:

map->dma_addr = fastrpc_compute_dma_addr(fl->sctx, sg_dma_address(map->table->sgl))

> +				 fl->cctx->soc_data->sid_pos);
>  	}
>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)
> @@ -2290,6 +2309,14 @@ static int fastrpc_get_domain_id(const char *domain)
>  	return -EINVAL;
>  }
>  
> +static const struct fastrpc_soc_data kaanapali_soc_data = {
> +	.sid_pos = 56,
> +};
> +
> +static const struct fastrpc_soc_data default_soc_data = {
> +	.sid_pos = 32,
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2298,6 +2325,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	const struct fastrpc_soc_data *soc_data;
> +
> +	soc_data = device_get_match_data(rdev);
> +	if (!soc_data)
> +		soc_data = &default_soc_data;

Define it for all the entries, drop if-check.

>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
>  	if (err) {
> @@ -2350,6 +2382,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
> +	data->soc_data = soc_data;
>  
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
> @@ -2487,7 +2520,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  }
>  
>  static const struct of_device_id fastrpc_rpmsg_of_match[] = {
> -	{ .compatible = "qcom,fastrpc" },
> +	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
> +	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
