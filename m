Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA90B9D219
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F6610E822;
	Thu, 25 Sep 2025 02:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TE1fcczo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE310E822
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:25:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1gY9a019919
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ne7SM+pphoowCwgkbbaH/xsD
 0yWzyJX64HZAf3hO7xY=; b=TE1fcczoV3caO6ftilr66G17EJBDr5k6sK3DtOgG
 muczbVLL8o9MqBuqEx6XuUKXl6i2RlvXDfFyGgmobzydYvj6PCm32L00MRngBEL+
 E8cQaiLNJFEPp0nzhMscBw8ksEnXtlsPoOlinhxM0lpVwNkNmPp48noWnAn0FtvZ
 FLMAYWC2nDPzruCrU0BFWpb/P0BUwgDiL2y6qoe9Lt8ihuUCTJS7fOS9GPn0azFm
 vcE1EV5M6j068f2ZhQ6THjF0bxIkvuwjKwmXzdLFsOkToB8HoR6Mogsq33uj1BSe
 +S/4P4FtbwTxliksm8ZJuIsSVyHqToeGtuKUC3BmzTgVJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyn70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:25:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d413127749so10397001cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758767106; x=1759371906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ne7SM+pphoowCwgkbbaH/xsD0yWzyJX64HZAf3hO7xY=;
 b=gdQUUjn6ETDoFs+MascRotUpHmdpsHTc9CWuyFDxOhm16aYwmTWQcYBvPzJBsHcaIJ
 Dc0sU2PZn4sxuL41ABQgWmdbv7qf5Ba66A/2J8vTVpZlq8++GYO2LeIaSnkTRB+K/6by
 7iAyuZ/MM0qPtNyq6rnBC7cHYUuAJ6k/y6U2uQzegpIuVNoLscXvUHJFTRELBGHkR01M
 1/QejeAd+HCL/+O8qQ4ygU8gEcnVRvX2L8Sioiz5e/Ahy4qBgB89vLd7PEi2Ovw66VO0
 Jj1chzg9jCc1z64aSv7r8paCd8Vp6k3bqtrjVj5nA9fMYPBd5qUPl82VKHetB6Crb8Mz
 wsEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpc/zNqGxXbz2KXXP0HqX+p90RllWKlTwWGrTPjWJsglwhJwQZ3xlo2rZIbW51BbTyiatFGHUmqhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVSI2eLJXYgNjFuq8jBLNaF4bnqNoDARWwMFTaCAvU287gepej
 G+chmcSiULwbKmzpKc9TfS44Dodt0EMcsNA0uJeH9AKvJWZsqdHYn3fAwpDpTPAPONkAqEBVgRR
 cnCb0V16lNJ/RZGzhdQyTsxUKwJQcJCMmV3t5K0TcDSaPjGV7t1AH/+GuWOEfZ8OzuQ89I2I=
X-Gm-Gg: ASbGnctD+ztYEHCSm6uQI7Su7HcARv0MQKbjW6O8FI3rM9LDcMKqaTVlB8QrFUWaqXX
 pt/lJ0ycu1rmKBFx0wjtmZhz9bY1m0vbwdmAxvHfg2LrLbiYsO7gYu60MiidA14EtcUojv0y5l+
 CqtFOJKVwP8f/NHCh5D5X3+DG7jGU3E7viI0/If0mnmEdhUa0rccZDgghWLPLI5l5BoeDIS6gwl
 /U7aoLrLv02U03mMT2Lp3lwIrcncx77E/b4c+AfiL/AHlfwW6VRAmNWz66FAnkz4tz4Wcb0m0NV
 K5AdUqhrjlnfRX9lZlCLmMnhKEKDixLH5SEPDfGYHOx/7ivfG+Jn+1mqDgvSEC+sL11rPNRUUiH
 sCEijLIxv/13kGDLBZx112im+8hD7q+ifWCaf5Z8indKCwLLg7PNR
X-Received: by 2002:a05:622a:5e16:b0:4b7:a6e7:655 with SMTP id
 d75a77b69052e-4da4b428c73mr24389621cf.52.1758767106139; 
 Wed, 24 Sep 2025 19:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiXmI6eYBp1Yn318ynTQ8f5kNCV/BK4r+AQsF0qU33ngmoZSWiC6EUh0gnchKFzSHJ9LVbPQ==
X-Received: by 2002:a05:622a:5e16:b0:4b7:a6e7:655 with SMTP id
 d75a77b69052e-4da4b428c73mr24389441cf.52.1758767105630; 
 Wed, 24 Sep 2025 19:25:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7713a3dsm2034781fa.42.2025.09.24.19.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 19:25:03 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:25:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
Message-ID: <42ge3imptxp46pltqhktrptm6paivhmhooyehc7zigfdlk2qea@zi5ulbgtvy5h>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ugyQu3dRVAbbJT8MLclhDyE7Hxf7wNbH
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4a809 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RUSZMVMlDKJ86LYI_2cA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ugyQu3dRVAbbJT8MLclhDyE7Hxf7wNbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX4fZ+8CfvrmE6
 2Ilhk7ieBOc2ZdfQsNijVd8a/mWSrd83ZAMdp8D2wLZEhwhUvzLbD9RTC86k4Yk8rR0TdY6vtao
 v9dC1f5SYT0vLD91AfUnEasFOPuqwzPiubYeJ0HnvqSlq4H1uVhxX52plHf+tome6Bm3+iBTV1o
 dhaw+SIlb/j3jqebikjCvghJEoAyu2/CUG646vcH9c4M+omsFE+kwFvQQEte9iRcaHeBMWwl7Y+
 EM0oxKuqgfW0s2NxF2E4Y++C0FC/oNpmoxmzVPfycD5IzeGQGjY/uf+E98KTzI8KArIhXBU1DUT
 Zg84965SNoNLVXpBiYLuVliSZtCPDU9Cayc3hJPQ0opbjcVAwmCab5q7ztV0vVfm94otYs9YD9S
 A4yzkO52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020
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

On Wed, Sep 24, 2025 at 04:46:36PM -0700, Jingyi Wang wrote:
> From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> 
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, add an iova-format flag which determines the SID position
> within the physical address. Set SID position to bit 56 when iova_format
> is enabled; otherwise, default to legacy 32-bit placement.
> Initialize the flag to 0 and update to 1 based on SoC-specific compatible
> string from the root node.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 68 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 8e1d97873423..db396241b8ce 100644
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
> @@ -105,6 +104,26 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/*
> + * By default, the sid will be prepended adjacent to smmu pa before sending
> + * to DSP. But if the compatible Soc found at root node specifies the new
> + * addressing format to handle pa's of longer widths, then the sid will be
> + * prepended at the position specified in this macro.
> + */
> +#define SID_POS_IN_IOVA 56
> +
> +/* Default width of pa bus from dsp */
> +#define DSP_DEFAULT_BUS_WIDTH 32
> +
> +/* Extract smmu pa from consolidated iova */
> +#define IOVA_TO_PHYS(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> +
> +/*
> + * Prepare the consolidated iova to send to dsp by prepending the sid
> + * to smmu pa at the appropriate position
> + */
> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) (phys += sid << sid_pos)
> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -255,6 +274,7 @@ struct fastrpc_session_ctx {
>  	int sid;
>  	bool used;
>  	bool valid;
> +	u32 sid_pos;
>  };
>  
>  struct fastrpc_channel_ctx {
> @@ -278,6 +298,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	u32 iova_format;
>  };
>  
>  struct fastrpc_device {
> @@ -391,8 +412,11 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
> +	uint32_t sid_pos = (buf->fl->sctx ? buf->fl->sctx->sid_pos :
> +					    DSP_DEFAULT_BUS_WIDTH);
> +
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->phys));
> +			  IOVA_TO_PHYS(buf->phys, sid_pos));
>  	kfree(buf);
>  }
>  
> @@ -442,7 +466,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->phys += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->phys, fl->sctx->sid_pos);
>  
>  	return 0;
>  }
> @@ -687,7 +711,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
> +			      IOVA_TO_PHYS(buffer->phys, buffer->fl->sctx->sid_pos),
> +			      buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -736,7 +761,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->phys), size);
> +				 IOVA_TO_PHYS(buf->phys, buf->fl->sctx->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -793,7 +818,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  		map->phys = sg_phys(map->table->sgl);
>  	} else {
>  		map->phys = sg_dma_address(map->table->sgl);
> -		map->phys += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, map->phys,
> +				 fl->sctx->sid_pos);
>  	}
>  	map->size = len;
>  	map->va = sg_virt(map->table->sgl);
> @@ -2153,11 +2179,14 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
> -	dev_set_drvdata(dev, sess);
> +	/* Configure where sid will be prepended to pa */
> +	sess->sid_pos =
> +		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);

You are using iova_format as a flag. Rename it to something more
sensible and turn it into a boolean flag.

>  
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> +	dev_set_drvdata(dev, sess);
>  	if (sessions > 0) {
>  		struct fastrpc_session_ctx *dup_sess;
>  
> @@ -2256,6 +2285,19 @@ static int fastrpc_get_domain_id(const char *domain)
>  	return -EINVAL;
>  }
>  
> +struct fastrpc_soc_data {
> +	u32 dsp_iova_format;
> +};
> +
> +static const struct fastrpc_soc_data kaanapali_soc_data = {
> +	.dsp_iova_format = 1,
> +};
> +
> +static const struct of_device_id qcom_soc_match_table[] = {
> +	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
> +	{},
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2264,6 +2306,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	struct device_node *root;
> +	const struct of_device_id *match;
> +	const struct fastrpc_soc_data *soc_data = NULL;
> +	u32 iova_format = 0;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return -ENODEV;
> +
> +	match = of_match_node(qcom_soc_match_table, root);
> +	of_node_put(root);
> +	if (!match || !match->data) {
> +		dev_dbg(rdev, "no compatible SoC found at root node\n");
> +	} else {
> +		soc_data = match->data;
> +		iova_format = soc_data->dsp_iova_format;
> +	}
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
>  	if (err) {
> @@ -2343,7 +2402,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		err = -EINVAL;
>  		goto err_free_data;
>  	}
> -
> +	/* determine where sid needs to be prepended to pa based on iova_format */
> +	data->iova_format = iova_format;
>  	kref_init(&data->refcount);
>  
>  	dev_set_drvdata(&rpdev->dev, data);
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
