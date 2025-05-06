Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44FDAAC2B7
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 13:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A0410E667;
	Tue,  6 May 2025 11:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTvKmk9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6D10E660
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 11:32:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AdVLw015747
 for <dri-devel@lists.freedesktop.org>; Tue, 6 May 2025 11:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fwl7sL+33/f+eH9L4tdGLHOE
 I3/YzHIvUjaSA4mATTQ=; b=KTvKmk9K+OE0l3LiE+I2xJI5LLXAXDQORpHxQXel
 CDhBIsjrUo7truGbI7eoVJ9L5pKyt/BsNcA5ye6UKiUe5vfdT0ybVmrjQE/9rYrg
 7+PMrAJ5Ar/zsZGyNAmkkDiU9eJnuuPleQ+PTMcRvI+F8VWBkDLdkGp879GxVJzg
 Bf0/ChKVzesdbW+zHFjKL8Kx2cT3JVfCRpre2aGhDNN1U0BZZYBBCIlJcBBChpx3
 D4MQ5dN6D5UJViMSwg2PMa44dBNc9UoDQRyJydVJ8ouLc4IuO5QvkiJzWIC7z3Tl
 c1cWLYeW019GLMkF7fugxOLzFAy/bnn9ROWNO9Xb9L6lyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguug4jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 11:32:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so1204630285a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 04:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746531152; x=1747135952;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fwl7sL+33/f+eH9L4tdGLHOEI3/YzHIvUjaSA4mATTQ=;
 b=fnSgcL8ghPN9XiB3kIyUOHjUO6o/XsvsVgbRSlXmIH4OxOAWANO8s/N6rQ1/9VDXah
 dqLxNybJlLav5A9CjmE/mNiOYcltS4qYGkaL7yIUG3qyQgIqMIfT2rxzORjyqDnKY5iz
 XZJlONWXFH747ZMnSKA5nA+4DhUyxsWGW+H6/osfB7t/CSrcdiVXIObp6k7+15kQW7+/
 129pCYkxjgGIvfk/9rRZEaH066LVCbIKdWvCt/WCzjLbkqzWpQQl4G6SXTaPaVq3ia5D
 V5PU3uSoccDt1MAIwfxrfolhUBMtCTFyqtqfg2L5UeBLxJADBPbWKRUv/9ETXNbzzgy7
 KGDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8qs2q9R56bo+cPDwT4L5eiEaqoqs4JZXPPCLXKp2muh+c11ZbUrYspMO2+Vb0L7mPr3vm0hOZyf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAi05++uB7LLA+rSiG1OHpER8MGir2OHME71Q02XxgFo6nrZdG
 sNVTYqol9w9Y8FqVIyZtABBq9MPhM0UWS4N0xqglFutglC/pExKTI51Z+rDdPzoS1Dj1EBnJFob
 VuAt8P1tW3z3QPFdAbVv77ReuJinI6bpCdJIg7RzWRMhFEUR7u95QB69pa9Tec4Fjyzk=
X-Gm-Gg: ASbGncv1gqjZLUL35wk/i8h42nKxFu1KCyMvDxYm3+j7wD9SSwP1bD/+RT9QhVRpkOK
 eYG5FoZvXJ9VLvfS0ksJLkUWa+7n75E4Pl04oTKvA/zi4U3r4od91qq52lw50VNi4Ih/CZidmHM
 hxrD1ZzlDH5m5OHLVTMHJUtJ4lpSeQO+iUhpWhhvYIj5ryQAqt8LQuTdCoRJIKlpIjb5lALMXSG
 ML35zY4w9FYxtq5EkmGFBHoPBvgeBZrFsDuWyo9LlLkGuI9/cLdIQ/drATg9hp+LQveqVqrSRVo
 nKA+RxZ2U4E1cYw9zmgp0Au3kqsZX9AmWgJXDCjLEPpbyUWk/zo8K81/U2a8lsI6u95T5lLUaNU
 =
X-Received: by 2002:a05:620a:170a:b0:7c5:4d2e:4d2d with SMTP id
 af79cd13be357-7cae3b0ca45mr1565853985a.50.1746531152638; 
 Tue, 06 May 2025 04:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh5sYkZSzYvTbugryEFcZleW6v/iZDEThUuz+Ah7LtSsuWl3cmvTZ0zKAiaQcydSJfq0ywvQ==
X-Received: by 2002:a05:620a:170a:b0:7c5:4d2e:4d2d with SMTP id
 af79cd13be357-7cae3b0ca45mr1565849285a.50.1746531152291; 
 Tue, 06 May 2025 04:32:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c0897sm2039490e87.83.2025.05.06.04.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 04:32:31 -0700 (PDT)
Date: Tue, 6 May 2025 14:32:29 +0300
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
Subject: Re: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <ze5y6llgo2qx4nvilaqcmkam5ywqa76d6uetn34iblz4nefpeu@ozbgzwbyd54u>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-2-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506111844.1726-2-quic_jseerapu@quicinc.com>
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=6819f351 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QOsQMPsNCkuRs1RMv08A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0sB8eX8K_d6qtHuYuzdh6gMD-O39sxhb
X-Proofpoint-GUID: 0sB8eX8K_d6qtHuYuzdh6gMD-O39sxhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExMCBTYWx0ZWRfX+sFS0h1mHtT/
 DbC22a1IUhSVnyQ3qB5YTbU6m4C3t+CgS0KfxkVnjWP8QRCXquD4FG6XE49SEu+nuik8e+4Mu7l
 DjoUuWTT7Y6P2vbTLfZqIVNLKkYSFeS8U6dbueUFHP4CU728mN5XcqsNZ8Cpg+HS+2V/l+ISdfz
 0qSH0Yy3ga1xWe65W3GvH4/dFFHIAZmyvMyxEEO9QA2KTWv9W33kFdN77B0YW588dTrdtU8wZSL
 Whiq5KDsVpuY6Q8Y030hIWHSJBOc72kNRvO7Y68Ht7FKJr0wD9dEVOfMhZ+gm8qqQalRRDcrz/s
 nWGpI4ntZqfGXRLPneV1ks+qoqY+wPnyexAUB05RMDiXKsUl3xsJqVDaNwUh3d23w8lxZYtQ88B
 ONggjMTo5oCLciiZ0Udq29kpNGvt6utuLzv1fvD3AXuJaCi95Z990+kT5sBD6E6TCi/IVYpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060110
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

On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 messages internally and so interrupts are not expected for
> the first 7 message completions, only the last message triggers
> an interrupt, indicating the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
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
>  drivers/dma/qcom/gpi.c           | 3 +++
>  include/linux/dma/qcom-gpi-dma.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index b1f0001cc99c..7e511f54166a 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>  	}
>  
>  	for (i = 0; i < tre_idx; i++)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..ebac0d3edff2 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -65,6 +65,7 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @dma_flags: Flags indicating DMA capabilities
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	unsigned int dma_flags;

Why do you need extra field instead of using
dma_async_tx_descriptor.flags?

>  };
>  
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
