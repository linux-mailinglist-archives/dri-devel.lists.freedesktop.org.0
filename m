Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051F9BA5578
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 00:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D316210E31B;
	Fri, 26 Sep 2025 22:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa4ImZYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CED110E31B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:35:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX031031571
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SoeY4l6ebsrYr5pagnV48aNI
 rgnvCjkETPIfrORiaFw=; b=oa4ImZYnM2V3WAMBIsyzs7kAnuckDrb/EzjN8BlA
 CodXqF6dZFTwu74QKBC4wl0XM0onTUVfpBpcmHpfiODxqL12Hjh56fs5QlqY+u9j
 /3K2UIQKxdmAd4SrLs6VpaB+iAJ9Zp6baHDpFL1oXt/5GfxIAgne46tyz5RKaSXa
 CFaA3AWi6O3OUtSL6Q3K4wlCZBwLQC0VwnEsdUCfFy8NE48Ma7K0NimyL/TYQQG0
 3U6zVHpvRD92zoVlV5B532RFk8DbbqpjOwZoHKig2EWoLnscWqarSEE7BAankOPD
 OC3mMibYKu5Bu6IFP5pN6vQXV+a+O4e3oO1LNU/zN8BgOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tcav1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:35:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5ee6cd9a3so59490641cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758926158; x=1759530958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SoeY4l6ebsrYr5pagnV48aNIrgnvCjkETPIfrORiaFw=;
 b=u2VHW/41yC7RcCSAohwvkEQKu4KRjrzMQ+pjhIJgkNSDGUVKsTLiayy+UHkZiE52Y3
 utW2Dfm2FVmrOoiWdhF+0WMMMHRmGm1WQG+QcjwhTw9JPI8jbcfyTyUrmTwEOBv9pkqZ
 1qF+MvgdB6B5DJNeMjfn36BKImlWwCcXVavagSyR+2KiuA0R8jDMZsx6Fonx7RpMCJHZ
 +ah4wHb5b6x2SQJ6eaQxVdFGN9uWLisHQDd8zE5tYmmCQgdXlTrW9ZHRKw9UFTNBxmPK
 Lsc0nxC1dRANeCCSXjyCFGtrgDDzbghTN9DeUBo7OQNOfEmOhFSo/PbBrl/ojRQ+wCoF
 bz3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtbGA6PygSJwix+hyk5Gc0cXogXmRF2RHUHq/fipmKA6o5/TuDSjVH5N5mAKQ3cDoTWbI5vb1h3Iw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9yPEjYP9n+O0RftjZwHaQLodmQH9DL19276xEhiuWgFx4AGnj
 51U5OlASROFzgcKOdZJYZg52SlL632ImN7b9t9JuExlQxCztlaG5rmQM9sZDP2ihAT2nfJQMmcf
 V0XBCK9cmyHdVxxNwwzlHKB/fKBHwqNztMiengWxZPi2AKEWVwqbsKrba3JFiphBuF4hWJ60=
X-Gm-Gg: ASbGncvFfKTj+rrUGm+AJwayMKfPuqJHBhAN//feoVoY882nf/CEqrXAcgJ8UTEbfaZ
 4e4MW/ovVO0dEGoio+FCmvwEnN/qfZmMMcHR/eZxogR8FCP9MRMCnub83hZp+rdVKg2dFXMT3cu
 qoxwNb202u3uhKUeTWqojO5EcoRa5k+EQpxM/bf1YtjbcnEFFLfKUqLpWEeFAsa5wWrg1tS0oKi
 nvhquK5WWuO52Xv6lybFpm5bVBMHtyBGa6UCKJsu97tKum6SpYn5XLdc9CtDy6lGBWfWCOipg5Y
 EPAl6znlGG70G+t0qDFhsAkerwhnp06cK0d2wKyIaapQz/kfxlKK4Y2hpjiKik9cf9E9fr/LscV
 msm++h8FiHS7xL4InLZPb60txU0MOvC27IamijNXT9RAAd8l7v5Vu
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id
 d75a77b69052e-4da47a1a220mr115923091cf.3.1758926157777; 
 Fri, 26 Sep 2025 15:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/mVxWB3lmLAFeQC9Fvkdijqlfs9w38uYfGjjdvBN7+TJwGSvqr+pkIUIo3hPrxbde64DYZg==
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id
 d75a77b69052e-4da47a1a220mr115922721cf.3.1758926157253; 
 Fri, 26 Sep 2025 15:35:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430a7dsm2147362e87.22.2025.09.26.15.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 15:35:55 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:35:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <vdd33houteml2inilry6vkqdpdm7vykcqb5vf66sdhq5knlfhr@mzlrb5babocx>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kgpt9f1limFPyFHrI_WzpB7dZsI_P-jJ
X-Proofpoint-GUID: kgpt9f1limFPyFHrI_WzpB7dZsI_P-jJ
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d7154e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UZ83mHg5h350vH40qggA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9wf1GjlQzgx0
 2Yne4MD2uG3uw3kVLbR4tXB5A0a1OgzG8mbTz2ADkN3fkbYcZ+nJh0lnxbbLZO+TJopmF+kQBrV
 qKu+sh2QeyquzkYdw63ATSsYbedkJRGCYKRWrmIIKesHmSjPhxKstz/nL67PlfIL6j6/sJ9iJNm
 2jkCCBHebCUyc4xtR9msDIGs7Zgn0Lj1HQ1pJJ18dcFmU5KEoRPSlxspFjNIg3t3wssGQazgUEd
 7xHwHruWGBX5LfUoPycWhWBdBUHlIVjzI+VvwlOmtc7xx/PhXNDW2YR2PGAXfrvN6L6xKF3UIst
 G18O4HuxLfOO2JQJ+3tz1eYpK0k8KRB+IBNPLN07TjdjhiMVbKNJiTHJLzchocee8pHdRiRzX8O
 fTLQdIHj7yL7C4DuzKFKMtGSpnWpIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 05:30:34PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
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
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v7 -> v8:
>    - Removed duplicate sentence in commit description
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
