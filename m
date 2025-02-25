Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A7A44039
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F5010E145;
	Tue, 25 Feb 2025 13:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7QgPDQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B53210E145
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:11:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCethA002463
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uuwVfqXUmGXRoU+kSMckG71FjFzg8qfTg24k4ONKjKE=; b=Q7QgPDQgDt0t1CeK
 ncM6P5dXSfVXjSbuTvW5j326SSv+P5RtKcgmfvrWC7mlW+rNYU8oiZMqIhyzCQ1b
 S57rKzVVpRE9S6vUu/vufoSH9/1ar7WOjCP1r87uhhMFOAACB6vm51/Sxdxfzbgn
 S6gE6GjCeacByhW8T85L1FsMHwBadCeruDJMirLF0IseQAzcXpAdqRMnZBXpaaKT
 tSS612lp898nrWFnjLMlIpqKLWvnuJsvNgzait4f4KDVJr/6nbcAnl2rgtTENaJe
 SfcME86DQwJ3qsND+ywAmeutEH8InBpkfZ2uhkNUbRR5kmXwsPONCfhDMq6IWAYQ
 f51syg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4516nm9gdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:11:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-471ed6f95d2so7502971cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740489079; x=1741093879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuwVfqXUmGXRoU+kSMckG71FjFzg8qfTg24k4ONKjKE=;
 b=Qf6QBnpOI1XbOYBlD0Y6mUrzbLlIuBIlr/L8qKpKFxytb/LVF5v634eKNbvXDVXqbk
 COSEKpIOdmZRnz1jGkI8+nzbr/t6q14tA7PQ0mTjHUsYPN3+IS6fjwXJZbxF/D8C0i91
 5Qeo/lnecgCRVUUmvOKa4MjLv5F9gVDvfsx+Kh2rNS6J31cjj0HwIboOqiynon11GP7a
 kAjzbMRSrm4KjfWpRUdIdDr6WOKPIeQo131siUYekNrTZTOnl5h85uokeQ7mX0aITBPK
 YEJI9OefyfdGEVvEVeDbAyCmuttPnPyfK3dl++Jsom3Pc7DXeSZFOBuQwVo+Dw4Rjfci
 Dylg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjOY5vrPsHxn0CVg0xNziVY3s+gcDFvXPFKvTJpG2/px0WoTleeglnh2vZr7wDBCPnPKW/yFQ/HSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1lnlL0xRTNnYAQa+3YF3pgx+LfYyyHni8WqGAMgNflWysypf/
 kByNktOrHJVBDewzVRKjjpptodQa5xjnY4GY/U/AVLrOhJQSOy9ecW7kSklBBdmWxRgrhR23bpJ
 TyTeWdRGd8yLjBKevnNhq0jdwBtl9ySqa9VB4OMcVoon8N7IWuqpeyqokX8HVOMNBxlo=
X-Gm-Gg: ASbGncu5QD3dWLHZDGQqWAH3lZJuG6xylfkJ4despZdLHVJFtWybQGkyRrILTHcbsWk
 //H56dzTIEQzd/pFzLsN3tHelxopaDRGtV+9d7HNKPbca+tJ3RaBl21kQK0wwTMOAWW5HPfRvTG
 xtYABo0hLipZFtqaI2eX8dbsvV89BvRzyLqgIIiGOAoW3QOQ0EU2lAMhRjl/S7c7xgj1Z6vCOcI
 D1BpJ3zh9RE5MGqPaXrZ++buwt9ENYSlSw+L5vCOjPb6n0LTtV4BLJ0eYvVMpdrwRfCHflxRLpf
 ZbYhlnCg7c/sP5ky+8bjhimkeWQn4CkEXhSUCJvuQ7f5y6BBbyeY7LYBJvYk4ce3Ym0T9w==
X-Received: by 2002:ac8:5a43:0:b0:472:14b8:ee01 with SMTP id
 d75a77b69052e-472228d7e30mr71677871cf.6.1740489079611; 
 Tue, 25 Feb 2025 05:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErDUxqjVZVeKivo2X+WzYQGTk3m9wBnXFgnKFF8mPGrQ+En9HUm/GLFcoa+lNQennqXJ70qw==
X-Received: by 2002:ac8:5a43:0:b0:472:14b8:ee01 with SMTP id
 d75a77b69052e-472228d7e30mr71677541cf.6.1740489079098; 
 Tue, 25 Feb 2025 05:11:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abee36dddecsm37813166b.61.2025.02.25.05.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:11:18 -0800 (PST)
Message-ID: <3b91b340-2d01-4685-bb73-818924c4ec29@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sa8775p-ride: enable Display
 serial interface
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-9-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225121824.3869719-9-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pBEKyKvZWCbYOYhvZ7ZQtmYqO3EAcL1y
X-Proofpoint-GUID: pBEKyKvZWCbYOYhvZ7ZQtmYqO3EAcL1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250091
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

On 25.02.2025 1:18 PM, Ayushi Makhija wrote:
> Enable both DSI to DP bridge ports on SA8775P Ride plaftrom.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 66 +++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 151f66512303..02d8a9c2c909 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -128,6 +128,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";

DP0

> +		type = "full-size";
> +
> +		port {
> +			dsi0_connector_in: endpoint {
> +				remote-endpoint = <&anx7625_1_out>;
> +			};
> +		};
> +	};
> +
> +	dsi1-connector {
> +		compatible = "dp-connector";
> +		label = "DSI1";

DP1

Konrad
