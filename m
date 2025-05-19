Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD8DABBBB9
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FC110E028;
	Mon, 19 May 2025 10:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZM0tL4dc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED10710E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:59:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9CEe7027074
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=ZM0tL4dceR9ZCazG
 sqyUNVptegjhUqnFXtVaK7AwTemiMq+jJw+hd/XdGG0puVGEWs1zMuzPD3ev6BEx
 rNhnRh2j2Fo2r2aLqlVHHU3jsC2WNTDQeJUh9m2RKioDejVLpC7UKoZHKtA9N7SS
 KLRt1qH30eHLUloaKE+FbvolX6Wd508DVmPkjqWveb+Cxf5ocZGat0B4lM8imiav
 1mJ+L9tdn7qbaZcnvsyaR9dMOFSH+y5dpjTpJh6fofFzyLdyvCEw428UfabjSBUU
 KQ+gwoSwxDMQCNjP12/IJP2f7KpF7QLYuFMEBJAzfsj6VnJ2TBRYffQZVdRBvjYw
 xfkTQw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7c2yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:59:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8d0bdd023so56757526d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652340; x=1748257140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
 b=t4T6iVZ74ngc3s0pI2GzWboKb8wrikwFSPrfVuf4krg5AQW8h7IrOivO1gYvwigyqt
 HJE1nHt78lpLEMByIYJbgWI5KgAou4rK7bts0whHXq40f/OdmL5fVJig3Y2mSUuPXSH/
 VVRpSbjpwAR59cOLsQGtheSUKh1whhyTU/boxmCKjHikFN2YxI/RgaIxuBVZnhQo9bW0
 CNJ+FgfYfET0DjhwckdVoQbXIzeJPjwdFb5ccq33nB+oQJekQfbwChR58UzBR2+TY0nW
 yd8bCZWGs+jC7zUM4HmDZWxLG4wvvyKk7kWDT/rZGvshfkgCkAE0rXB6dSfIBzQi/GAT
 US1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZI/O8kZtQNmzTwAtmaPoVG4bQVrm8JvuLuu5D2rAE3PHc66IiBhrPAW2jpVR/LHjIUi0EQnyqYcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+tG/fD0DX28TBf5I27qe5bYFa7+ws84KSre9J3PKNyZPVM6uN
 GIwyLNPZe9GXgt1GQqFllVo+wCcd/QDRd6D0UDUONalmXziQg/KQTQjb0XCjRGe5Hhu2BOFYhfn
 U3Egwzaww4MWuGwWGLuNNT0sBOlMCBuY1iRCqnxAr82R4i8FUjFFXJmQfJMMRL2OXmf/Pl+Q=
X-Gm-Gg: ASbGncskqg8LfoYGuIFgJO3QqsRPa9zQI9hzmka/gkFKjZJyJLCB24cUjizRmNBW8Hu
 H2yuKQP/YqAd+z19XQGbz8nuC54egUW1W00si8C00S9BZTuUaZCQTzfnjRl2ckwtePPidzk1Veq
 849SQv+wioeBkiXLtWlqED8aOhnxX76KlZGBuXoK7EbtLQVMvYloY+dIfjrxNtFYKydDVPcTHUY
 3pAWTHIKlnQKSJZdvoqrodVQxwBGU6vW9Ko28PUwtQPyL4KXI7LFr9PnRi1YYglZcSrWF73J7x1
 VIjCEADym+On3atWA6746TjjnvqzyDL8DNntSzepgCgZo2fjQ8CAdDYmIj6oT/jFKVHQA72Ucdo
 9viLpMy7fsPe6UIyXpJvZl+br
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id
 6a1803df08f44-6f8b2b4c46fmr199871576d6.0.1747652340178; 
 Mon, 19 May 2025 03:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk/hpb7Fq8p+Ry8/zX3FWlj3myX25sykGI8jSsQ75/MuBj4A+SB9ODTHYvgX68XGn+AB8INA==
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id
 6a1803df08f44-6f8b2b4c46fmr199871226d6.0.1747652339748; 
 Mon, 19 May 2025 03:58:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v5 00/11] Add DSI display support for SA8775P target
Date: Mon, 19 May 2025 13:58:41 +0300
Message-Id: <174637445757.1385605.6744814496349716759.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b0ef5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9nk8M2OhS4cL37NuS429AHgSmqK51XIg
X-Proofpoint-GUID: 9nk8M2OhS4cL37NuS429AHgSmqK51XIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX9wHZLtpUXOuq
 obT8OIziSKb5pbDEPi+pzAv3AzISquF5ODHyWnpzLBbHD6WTvDENUklXSoJEhw+etHaGq/aw7EJ
 2ksw+gXrzz6TB4gdj6CaiWMEKcoDS1Wpi5eYZ2XPYdlo1W7nPPnZ+ge4BD8CJpWzy+wQsX80Olg
 clckqhkZ+8hdptSkNJlVf0vKbe/YvOgTrseCBQHL78pzWyxwAdCFdUryPbKzvCYe3HASKBHq2ZC
 S0do0qtQW6UlXPaqZGd7Qqn4IT57KUgOMxyxQu7mpEwR7KP/kNUFu41s/OkSN3Qigw4NSsRu1Vw
 CJ/NIHCpdbawZ3lTXj2FGgDXMChJhR9hlTEOHMX7ZGGQx+CrSB39K/MwgIeL7gdSHv3fs+I9X7U
 jFc9IKkLCgAygUqchsZPZqgeES4W1JcXo31kKRG0+LzRVtl2XlWo60wXLv+W5I2Lbe7Szr+c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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


On Thu, 24 Apr 2025 11:54:20 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[01/11] dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/850e13b65e3c
[02/11] dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a0195b94cbc
[03/11] dt-bindings: display: msm: document DSI controller and phy on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6f2524f4d5e
[04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3979192fac5
[05/11] drm/msm/dsi: add DSI support for SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/249a965c3759

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
