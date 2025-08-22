Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F0B31689
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B33D10EAD0;
	Fri, 22 Aug 2025 11:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYAOCsr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD84510EACF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:43:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UPSB028658
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tgTz7yxNUzClQiIcX4b6JBav
 BqVRBHXbupABDNM7vtU=; b=fYAOCsr5tbBL4NRTCiHeGXfBgGz55sQtMnm3YUhI
 6VNwk6Kg7J2PhtaNDLAKfDvNwfI06oq5aT0PUYIofROHRgGHr01aYp36g7QcqbjU
 rl3dor+cC1jJeVy7SlHnLWUXgb9h7LAv8lDQ+x9ZTNeJoejspD+IkcD/83VitQt6
 IY+TRTP+pyIpCi65/RgFS7YtzAuW8Erd5Z238eoNEQmpeo4dmYWNTDMqrr1JO7+x
 BpWRszdtr0wvAOpEjTrkZr7RU3u7qDRwmDtQ1mgXcMFrkI2maLc7xaLgAfHxczuI
 bXP/qrFETcSlezpbXK/orQisJmavKYIktjC+7POCI7U25Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cs20n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:43:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70ba7aa13c3so78614686d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 04:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862980; x=1756467780;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgTz7yxNUzClQiIcX4b6JBavBqVRBHXbupABDNM7vtU=;
 b=iJDgKN9zGBraSbnYoqELoI7cl3SLssQGUVlQe95HOdUQh0jLw9cHSW4ONe7uR7IkPY
 akfbKxQCiB54AYTWp3XrAiNizmnBlcX8dhc3Ih+9oqYdMK/P8MjegQc2YWiq7a0ISFmz
 B8oekDV2bulLiE+HMw6U5XaGD1gH2RQ2XYhZzcPDzpozNgXehEHoSyP8QA9StKgc/u7o
 oq5LjE/aMcKvj+obwPUdDoQtciTKKs4AxOxAGnfz9oE3/JLvGNmwkK//spWs+951OYPB
 JA7lEBeH0IN0UkhAnKHdM9GICW5Y9IwJo8V+qF9FnCjBr2gNXwYNjFDcDTl79GFEZSfy
 +Z7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9gNPO/zkU0fQJwsjEwP+ophDfRzufW/ew6TLKzCkECle1VGdDjvZ2eavCwL9Rr8oD6kDg14VxFj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN9Ick4LXtcrJdiqVGWD4r17FuEKUwYHGnCdBO1GXBywlAoRfu
 +m8qV5sNjBh5Z60xfKjmXvC9ij2l8xoy0IY2rCDnIbGdAjWcHGJ6QyqP3uE9b74lrBu1aRiyI3R
 rhLkGyG21I1QJxPFKVACRcW20wvNlAMxKu/s49DdKfuhKmTnTDNO4dxnTpTC6S5l+2cQYifg=
X-Gm-Gg: ASbGncvFPcZSpdziq8OJep96VuzDE7uDByvFOmJEBhxHbyCF4SZTfmrR/LhNNZ3q7pt
 S5TFeEFMo3yVgt8MM+P048SX+eDp1RaDxURc6wC81IMEuPY3WV3RdilOwe3D54cD2a4oXU1W9na
 84/xXRVPkIXLQPpn7m6nVVVmJXhtvhARG6tGTNCu6VaWzqdIl++1LxEKz9KyEAPuN0nC54Okg/T
 3Fhfs0Q0RQHDolXsFSTR5ASYx4Uha26BPrCGZ9VK6bnG/aHFn3MHAU0qK9nGyWtH4rf6uzwTZ1M
 U8adfkmszvXCVLjZsy50iSg6urD5Ny0JJFs7id97B0HbejTB07M7Qvlsuu7O/Uqoeh5L4DY5NHF
 kzOQos4LtSQtPx+PpTDFJuRJsejJ/ipYV8F20ynNYJkqPYHWj8kxe
X-Received: by 2002:a05:6214:c8e:b0:70d:479a:ca6e with SMTP id
 6a1803df08f44-70d970cdea2mr33545956d6.8.1755862979985; 
 Fri, 22 Aug 2025 04:42:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdRz6hdH7m4nOBMkuiSMbEeU+mfLZWmnffBKcn1rd+5I9DQW3QC15nh5Lpj4VpWDwLhDkI8A==
X-Received: by 2002:a05:6214:c8e:b0:70d:479a:ca6e with SMTP id
 6a1803df08f44-70d970cdea2mr33545456d6.8.1755862979349; 
 Fri, 22 Aug 2025 04:42:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a44b538sm36210471fa.26.2025.08.22.04.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 04:42:58 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
Message-ID: <g6fwzj7njcxomwoze5phbyt5xx24s4aeaxq7x64qe5esanabix@okocxeysh7xa>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-6-97d26bb2144e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-6-97d26bb2144e@oss.qualcomm.com>
X-Proofpoint-GUID: yuOgaRdcozrt_bJBliQaSkiJHT1mgarx
X-Proofpoint-ORIG-GUID: yuOgaRdcozrt_bJBliQaSkiJHT1mgarx
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a857c5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lIFQIvOu6nGuaiKUdkgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX90bNCQVzd/kM
 LoXofF0E0tbLX2grGKGRfmmn630pKRhreofyAQ5dX36JUZgcTB5cazZgJRQXDUAK/A+o28ZKQ5a
 vrLlYiYkUiOjD3NV1nflOS1iGIk/KUArzDmdTSAaxtu6U11a9q1cGu+klkX/EnJtrsXMBzoKLjY
 rn8eaQoBDCE5FL5eM+23ypzyRPxq/p8eztFDirN1b3v2tzIHS0cfbeLvozokX161oc+3kchXsxF
 Eme0FdNB1QpOg1xtBx1xIAGeYolnddOnhEvmbDSyXo6BTgka9szYuLtzYAJVaKAnGL3FYIPhzRT
 VJbNF1GDcyHVDx0MeWUhP+piSKDlxiS9n5Lq9gJ/6GKKYcvuuvNZ1LGSeOvBRwTDsjvy4s/STrz
 36W+IQM4bADDheQ/AJ/kkxBUa8qhBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Fri, Aug 22, 2025 at 12:25:31AM +0530, Akhil P Oommen wrote:
> Enable GPU on both qcs9100-ride platforms and provide the path
> for zap shader.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
