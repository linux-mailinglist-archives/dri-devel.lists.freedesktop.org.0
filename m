Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF22A98B15
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF5110E6A4;
	Wed, 23 Apr 2025 13:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRFmbBeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10BF10E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:31:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAv0It013853
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dZWmP9gM06dWmEKtYYm5mxy3
 nQnWFD6fy7umPVrKHi0=; b=aRFmbBeByAGZvNocZKi/oi6Wq9yS71NB7meeiNC5
 6VkTz4uk1rAlDwQDYkckfe+r/03dNhtgy7dh+2+Iin9RD7qbRHx4v3mwbz8Ow97h
 ejZTDBqmtXWtDK+WEkkHf15QK+jfNOnAAQXhFkEjaaxpfGWCEyay7Mt/FAf72jw0
 F3IeOZ8obV2qKlRVtyVqR5wLUIBRsGu+Q26lSN1UbKtQkAYB9rBL2DwdnrGHAgnc
 hTIHQdArOuO3M5xjZ5odE/21yDszB7JUx3h2mWIQSALFgyWOlqgUKlB804XHgytT
 avZVqKi6iPhVByNXlcHdavlosu/o2JgNgovILUgMNI6MHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a81q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:31:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso185875285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745415081; x=1746019881;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZWmP9gM06dWmEKtYYm5mxy3nQnWFD6fy7umPVrKHi0=;
 b=ad44tq9Dr3w1aRWLrpNEzsMroxR9aMKZVOOrNnFAlBuVjs+Nghj2DQ7IMw7BM9182x
 IO+A6y/eUzL2K4NFJk6ozkWD3RYaxa5p+wpnCt6U+RXmGP+CwoVNdxH1cJsFugVCuh9g
 U4CNEMDhDmJlVrFhhvbs7BbarwxdaRF+NQzmNAY3s1H+v+2ZF56cjmROHFT/RfE7Cobl
 nwSqW7o8yGzsWGq0fjxWD8RRaBS4mWe1eqrxF5X1IQ8BTrZfaAkUuOI6YQbEfpBIiaNI
 p0yrr5NzMrrrImD7QjmmbWCHGu7jdrKWlLs1L+Ryu/VkHzJIDUQ2gmK7qlBX0wIOo9qu
 LgAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRwGOR+t6TB9bLRstDWoiFP3DGJUgpExF1Y8Qi9LX8AX0n/DSGEcxHLuVfMwITaWq+y9ld13kOovg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWWBL3Yi8T/XKWnb5svFJ0DuuQGsdx1MrDaHgctvdVG9RQdkPT
 MYI0lPvzo9KTAUDVgWTavV2HGRtq3CsgwGlyscYULaGG2r6NDgIiFFr73PI89lPvaTW7Y1RU8GO
 pTq/pkwuQwajRmsFfImnqHN5dtR0T73V3KLbn3GlRf7Lukk4F+4tNxHbkH/TE8IocHjU=
X-Gm-Gg: ASbGncv3jXUvqyqg7pIOwp3O0a3WzJRc+iF9Tu6fUDtO73THOo5Ck5YJx/mpSGWkc+J
 MwhpsbcNyXJ5EExF0Vp+TczN12BKqhiZib3DmuP6AShxDaYXm2KSzsuJWyAIk/GUivjlR2Vp+bU
 j5wNUdqM/havDuiPNVt8S8/CqRlPAKQdN0XeZqxSCa7jC45I+6SzeCByRpzQVcWdFFRZEB5MmxC
 RInOAEO63EcLa75eOwfpH6G9+E5XnDY3zX1SNfHiPz215Bf9w8A6wT1tLS1qtwUv2V5IoauPmR2
 nFFQd+N1QJOUBfcUH9l86LdMBhRF7ZjcgDr/MTgrPbsASlgpyJ+Mw8eJGdnuqS09JffQVoXSXq4
 =
X-Received: by 2002:a05:620a:24c5:b0:7c3:dd2d:c0e2 with SMTP id
 af79cd13be357-7c94d83dee5mr484771985a.13.1745415080694; 
 Wed, 23 Apr 2025 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpfJbI+AgBKtKkvkNrS86sfl4ggqkejOcLK4vPJLKCGSN66njI9kIk5rDo+YJT0RY1DWgIxg==
X-Received: by 2002:a05:620a:24c5:b0:7c3:dd2d:c0e2 with SMTP id
 af79cd13be357-7c94d83dee5mr484758485a.13.1745415079978; 
 Wed, 23 Apr 2025 06:31:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5f61afsm1578477e87.246.2025.04.23.06.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:31:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:31:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 David Wronek <david@mainlining.org>,
 Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 29/33] firmware: qcom: tzmem: disable sm7150 platform
Message-ID: <3skwipkunn6dw4xtzyx4vdiqiwtu2qgezbel3vcu5k4cxk65yi@csi6xun5nlyj>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-13-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-13-danila@jiaxyga.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX0bFdYvHop+m4
 a7as5B2iFRRbQFfwPBo+xIe0Ggcllm0KNU6Y/aeALtJiKHfUow14znSDG3p8ue346kgTMObSb1u
 02rGpG8WEbgmaBc6RxaWf/FgKP6JTegEE15f0/BFGzZffl3C05s8/D4N03X3/35zd7pXQA34yB5
 pohW2K8PLTad5iBm3bZwkymS2b51NxSRjAGroB7ix/xpW1uhI73Q3IvVbzq4IxNZsZUy+SuUOgj
 MwnW8XacZCKM6JSArLHE8Axfhyz9K7NIRt8ZAPmUiS+mNsDfy/wTsNGPwLLZlWk29DJtbL9NOEM
 7MEEALVsoA6hX7lHIREbE2UxfhplzpiW47p6W094lUEnMxyFPM5X/3OnDpXI9evWtxpJ82csjie
 3Pohqrgkz/Nge/6lVQ0hgfrYJz/jsx24maz3e+R9DEs9w8ioP2zoBQdsvenCYPZZpVI8pk31
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808ebaa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=7ibcVnAUAAAA:8 a=EUspDBNiAAAA:8 a=UlxMoeSB6LsTFmt9i7YA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-ORIG-GUID: o5Ep1NaesRGXZzy1HUeFlI1hHbxvp5Ly
X-Proofpoint-GUID: o5Ep1NaesRGXZzy1HUeFlI1hHbxvp5Ly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=939 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095
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

On Wed, Apr 23, 2025 at 12:31:33AM +0300, Danila Tikhonov wrote:
> The SHM bridge makes the SM7150 devices reset while probing the RMTFS
> (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on corresponding
> platforms using SoC-level compat string.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
