Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F86B01910
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 12:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7037710E26F;
	Fri, 11 Jul 2025 10:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgVA7m81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DD610E26F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 10:01:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XBS8021908
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 10:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=NgVA7m81R1L9A0Ki
 QNp4kFDi3N8DvO3qx9RAcYjs1jtC9/B+avlbDc1rtVhy9F3stierm1OKhJXjyvGW
 YdJRQ9sJZI2dq1voO32H+V90S5DBNkGEzMB+xaAjR/XUQqiqXKUbmfFIb4pfvmVg
 addsweOBBLqrhC+UeeNjdbg6BndSLotgYWOKAXr9XGGsXN938CxJNVJZZLif9/67
 bTDai8X5rgEivv0G/Ddbk30UzPRe6GPhQK07mI7NvCLN/vavWRbSaFIQIrbwsqW6
 eGBhsOpspzm7+h66u4RlX5bUzXbU/874gi2Q1I2OiV3jDc5IUlMIMm7Q1MkP6jwn
 rNhUlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b195s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 10:00:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d3ea727700so31169985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752228058; x=1752832858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
 b=UE5zAYhW80uLGXpIPfXcpmGjnJ/an8nmLBTpPqDwwIQsu4v6TCS8wo738yQlhYy328
 NdGgJi6dhYFSw+7I2JyEuWj2s+6B3Z5oI/cEa5RH1noY8jPB8d6G8RmXpImMH7hd5Ifw
 S4W5NqiMIKFiKTJhp9QQeNUmhmvb/eLy8T/fM5cebeQuLKA/+Yc8iPfLc1yoYMftQFYn
 5U7P9Sx6YBVz+OySru/eTzmG84metz9fF8zOiImzRPSCV+xXlT40iXI/T7L04iYGch+J
 mt0s5GELWuQliLvOzhvi3J1l4Dn0hYqBroUZYN4VTZZgal2QKjsTTF4CSUdpHiKFFi+D
 YzSg==
X-Gm-Message-State: AOJu0YwxJ6pa4cIXutyWeE+vzMhXbcyLgbgciT+bofiGnNwXGIB7OTYi
 kUb5QyoDnpMBd96F11jS8zZFUDMQ689Xv/hqQ3tMKDPozoUIlF1MsXNejWHVqrLpNFqne9QU9pF
 5lUBe7hW0e/TA1HbtT5z62TcPjqy3uALOI9u6oN9KtoD8RcyiYCHovERGUs5E6RPa2YxQRQ4=
X-Gm-Gg: ASbGnctRPFFVuCl9ki3LKAETXduYBF3sTLj/bxuJdbAVnYz0lB7FQgtwqqW9cW/FYii
 hmOih/cYlXEq3ZOuXYrtb+tMC4SJdDDzAkvRptxBZnsdIeZXV/XhH3yFBnCT6uDHfLu4zVfiApV
 eg5g8dbrAbB8CwB6P+ZG/fLjObr2lH56nFL6Vn/veI32oNZIcM/yQUTbtP6TMq2/76G39M78NkG
 HnLDQW3wT/9wvz1opVkvkZ7pyxFLnblku7lNYTYaSzuMMmehgi9g8u49GQDOZjdLs4gM2L/gJtg
 ikKYjIaLzg3Zqtf40cE5rh9le4gXMfr+3TCan+kXoCLQzL8z59OCFe/EkqZ3ehldRZ2Xccw+AsP
 UnOhPkVHPCyb81LOedfUQ
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id
 af79cd13be357-7ddec077b97mr142428785a.12.1752228058080; 
 Fri, 11 Jul 2025 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLY0/uyOhHuHX1X9pWT4ZRBIdqoYlueRYMn0zZIdfXxI0Ouch9sgLT86MrHZruF7j7b5jRXQ==
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id
 af79cd13be357-7ddec077b97mr142425885a.12.1752228057424; 
 Fri, 11 Jul 2025 03:00:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82645c3sm274825766b.99.2025.07.11.03.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 03:00:43 -0700 (PDT)
Message-ID: <ee4fb01e-4fc4-4082-be96-3be22e1769e3@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6870e0db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX9NTsV2jUf+fr
 opOJMgFdLhJbPviL4wrjzAPFrGTV3uXl3bZxRnODkgYaf2TErMGqRIXKQEVVjegUxKAzmQBJdjO
 EL9LMFtXhKzVUvBiFyVUXXtJpPT8Q0FMg/7VSK25JTYASIN8OEZjUMg6irIT7pvFU7BnR0wEhhn
 xDx5IJtc8mA21kPZjHlgB8a1XdpB+obJ/ccvPSfxe7NJd0z6D9R8UAu9aihtKNwtEIZaM9Kysjj
 Krmdh29R45g2btzRrjHivOeaFZOvKUBuymTo4NHH4dFG7/5Kv9nJRo2f9i4O55o1TbFvkzHS79i
 SY9xObzOmkUCfHkVHjn7zHpEZOIFIzvfb/DCsZFacFZeyox/n+kdoRPoMBBIZ2ZHxSCjWWmPP/G
 gRfZyxxNNBIveMskKWO2eIviLBNkGdrHXTvB5a42ijKs8KiEKnZWExXdhh0pkNutjkSUALeW
X-Proofpoint-GUID: 0hEipdsNmjJ2DObp3MVFC9NQBzhOlukY
X-Proofpoint-ORIG-GUID: 0hEipdsNmjJ2DObp3MVFC9NQBzhOlukY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=794 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070
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

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
