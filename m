Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE2B419D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 11:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381C710E076;
	Wed,  3 Sep 2025 09:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqWMLX4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191A710E65F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 09:25:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832265E010160
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 09:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qiSfzdg4mC017dQavh2saF3D
 nvq/ylNZxxXLO3pOk3Y=; b=jqWMLX4t8mAWThwfHqlfOQL+5UkXlSPfUK0Ti7YJ
 tJunk2I2Xg/w5+Yt0BgvCAwhKQjj06lSKt3AbovqMDZO1m5oLvhz92QXlUo3H7ij
 0+kNYH/Kb6FMq5eC7zb2vwuzi8hmt4pcDYZJYZmE7dXBncAIzmeKDfEM0IG8TB8A
 E8zm9Cu5t7QBGI3nkXenmXc7jXQrCobgopq7Zha5M18tJBtQLbzgtBBEzIs/koyo
 4QHBicW8kV0eXtsvi9pNlrJ9AK8c73cW63kA9GfqVExDCgmegkq8BTQmHnuC2jtv
 ZqYQovft3xMcTrVZpK+CPabjifkiu/Z8fmsZn8XyB7WxOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ek5a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:25:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70de0bdb600so103675436d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 02:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891541; x=1757496341;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiSfzdg4mC017dQavh2saF3Dnvq/ylNZxxXLO3pOk3Y=;
 b=XM15iv8u3WGFeNGyRTbaSb3EyCH2b+9Pq8tYSIlTpyCLzjhKXavGdefU58Z0Qn8/FZ
 jRXII8akvl6Nzmy6fxvzMm6Su7WBNLger6kVHLEov1tNM9bucU6/zMmnrOWwenSaBYzm
 ulY9quJjgZ8mPMUiQq9XEcOFSXLaWAvjf+5f9r3nAtAQcOc+/0C2aP/M4CxAZSSwm8eW
 UAgh4iusvtS7eovFrEWxicOS96kuYQJejGHQNC/eIyGmT3uDy+sBuIKmLTP463CUQvzt
 4+P497q3jGhbayp83XhZoRl72gd/RKvueQfMssUqmE+t5SuP9ZpMDSMVYEsYn8IiL7N4
 kG6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWKSZOG4q/CcyR1Bt7l8Zq9+B4wL0izpA0eed3u2auV+PHOPGxgdWH69hpueJS9YItvG/7WetiaDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGZhLjMqwdjYCTnuWNnqQDdeaDA433QUvrMPOw9smHigfnfwtZ
 IL/xFRrtjJ3IQ7+OVy7wrbTSwCmjKxnVy2Gi2/56U3qKar4KofeSEdBaH/8KKuDe+sK+B/JARVr
 p4k9y/JwKMlMKNQX3JL3FfclN6fM3f99zxucxqC9AkLEsuqdllsetBMHO/Mo29JhP1EHVW+M=
X-Gm-Gg: ASbGnct5l2HG1XuVeDi2kk9LRBxk2NdGxcohjN6603v1j3+1KYD55B7D+GX7/zwv6jh
 dSxk+SX7UQC0cR3BbHzONb2HWM/GwEVIrguutV6a7Kt3vWftxxzY0EhXZ8YlSFfseEDSh7PvsIc
 nzamgZj+uKq4lz2Zd0ttKRtp47wH+PrR4L8NWQcPKm7kvECTwJ9o5gnlqyQpX9blhb1yHry4wXG
 DRBqAIrQmCo34n41Mq4HPMDWnwe77uC0qs5WtX+mO/vnj0xrNlKNcgxpEr5BxwF9yEhKmzJzyb9
 rsOaOFKil3sZTUGy9GXdbFAG6aotcPR7V5kKvq7kn+q+u0xuDNTODhm+awcx2U0C/osLcqX33wz
 27D9bXorRzHqFtonGu5Zb12cgMHc+xF81sxV5F8auzPZuy9kH07aC
X-Received: by 2002:a05:6214:29cd:b0:71c:53c0:564f with SMTP id
 6a1803df08f44-71c53c05df2mr85543036d6.6.1756891541016; 
 Wed, 03 Sep 2025 02:25:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEffBRG/vxF0pIEnmq/bDAD2fvhoCl8Yhqv0aQxeuHDILYhYTHgkBcj5YQbmS8/TtFPfMC5A==
X-Received: by 2002:a05:6214:29cd:b0:71c:53c0:564f with SMTP id
 6a1803df08f44-71c53c05df2mr85542856d6.6.1756891540533; 
 Wed, 03 Sep 2025 02:25:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c7esm390417e87.65.2025.09.03.02.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:25:39 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:25:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v7 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <xy2jgnearfsoln7tmjbb7l6zuwm7sq74wohsxj77eeval5wig5@kisng4ufgbuo>
References: <20250903073059.2151837-1-quic_jseerapu@quicinc.com>
 <20250903073059.2151837-2-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903073059.2151837-2-quic_jseerapu@quicinc.com>
X-Proofpoint-GUID: zaevmJnywTRUUffs57cDSIrUuD6c1kDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX7Q6GoAcWHSCT
 sEFhyivzSr8rDMjTdAok2vuDKVUkMTXm2cyl1peWK8iWeNDtJdpMn/6cjbkFQZichi1PyaPcUeP
 dymjDV1d4/rbfm2tyLJChgKhi99Bwga7zXQB63OL9U2WgC13hM4F33kUp1DgSuDpAnEtTSYIPLg
 l61MG2jZOPu18ZWNy+HvNes67dipff0P6bbVWnlef98gVH1RedPs/ExoDGcKxDCzzNR+W8CNMkK
 FI9sV6NvPe6iNW0CxuHA598LtT+DNxCgIUoxhmFSNazqFIS5L0qH0XYeN8TvmkysljEAXu4RROm
 KtvMiFQ6YgNSshEs1YzVlKDZmrpGgfiUgcmn/1TYC+26Z/UxfDfI/JClw4GURp9nVJOjQWsTdO3
 HHba0vWe
X-Proofpoint-ORIG-GUID: zaevmJnywTRUUffs57cDSIrUuD6c1kDZ
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b80996 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=JXAtfvraFxK_IdIfcZsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On Wed, Sep 03, 2025 at 01:00:58PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> This BEI mechanism enhances overall transfer efficiency.

Duplicate phrase.

> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v6 -> v7:
>    - The design has been modified to configure BEI for interrupt
>      generation either:
>      After the last I2C message, if sufficient TREs are available, or
>      After a specific I2C message, when no further TREs are available.
>    - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function
>      and so avoided using external variables for DMA_PREP_INTERRUPT status.
> 
> v5 ->v6:
>   - For updating the block event interrupt bit, instead of relying on
>     bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
> 
> v4 -> v5:
>   - BEI flag naming changed from flags to bei_flag.
>   - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
>     file, and Block event interrupt support is checked with bei_flag.
> 
> v3 -> v4:
>   - API's added for Block event interrupt with multi descriptor support for
>     I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>   - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>     I2C driver.
> 
> v2-> v3:
>    - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>    - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>    - Added documentation for newly added changes in "qcom-gpi-dma.h" file
>    - Updated commit description.
> 
> v1 -> v2:
>    - Changed dma_addr type from array of pointers to array.
>    - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>      updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
> 
>  drivers/dma/qcom/gpi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 8e87738086b2..66bfea1f156d 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1619,7 +1619,8 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
>  }
>  
>  static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
> -			      struct scatterlist *sgl, enum dma_transfer_direction direction)
> +			      struct scatterlist *sgl, enum dma_transfer_direction direction,
> +			      unsigned long flags)
>  {
>  	struct gpi_i2c_config *i2c = chan->config;
>  	struct device *dev = chan->gpii->gpi_dev->dev;
> @@ -1684,6 +1685,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (!(flags & DMA_PREP_INTERRUPT))
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>  	}
>  
>  	for (i = 0; i < tre_idx; i++)
> @@ -1827,6 +1831,9 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  		return NULL;
>  	}
>  
> +	if (!(flags & DMA_PREP_INTERRUPT) && (nr - nr_tre < 2))
> +		return NULL;

Comment in the source file.

> +
>  	gpi_desc = kzalloc(sizeof(*gpi_desc), GFP_NOWAIT);
>  	if (!gpi_desc)
>  		return NULL;
> @@ -1835,7 +1842,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  	if (gchan->protocol == QCOM_GPI_SPI) {
>  		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
>  	} else if (gchan->protocol == QCOM_GPI_I2C) {
> -		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction);
> +		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
>  	} else {
>  		dev_err(dev, "invalid peripheral: %d\n", gchan->protocol);
>  		kfree(gpi_desc);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
