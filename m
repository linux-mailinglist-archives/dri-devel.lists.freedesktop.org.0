Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFDC7BE3F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 23:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0B710E90F;
	Fri, 21 Nov 2025 22:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m46Y2Qbr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBEiKWXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9545E10E90F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:43:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALKxJJ62756656
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v76zapgO5bIdRvR0frt2ZimH
 yBAaD+3/mGyYC/gIUcI=; b=m46Y2QbrJ9S6ciuMSC263Wgh5jLjOE4jsDsp4kr1
 DGhaykTSTwQh8QtppqlEHhZOkJveQl5Wom5eZuQOwfiO27ZHwIeWFfEe+uVeSyPa
 6RfKciiJNdMs8YzCo9VE2Ig3AIvgKX6cEaQpzcbukJwXynfyZo9U060LHRu67toL
 +yeFH2BBIagkLln4WSjf564C8nBwJ2WcUyUQ9rZYyiDOsMIiveDPyTNee8MRJSxo
 ppJuzPMNw2vn5Svb00Klo7xcDOPF4sJBuTmNjNauG4Ywx5MQUYbZHJkqYcFch+8m
 iNzVOUMcwP4X+WOqQbhgcQzwKF3j2374hEMKxJfzaOHgdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy634pv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:43:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b22ab98226so1017486585a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763765027; x=1764369827;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v76zapgO5bIdRvR0frt2ZimHyBAaD+3/mGyYC/gIUcI=;
 b=BBEiKWXaoO/ntr31HZn8ROAanXXj95wi86YFHVnTGNfSTUlO/7GcWwH3U/P6GxPVmT
 ElFBTCAZQbPiFfyCy2WuigmUQTsCfIwaJhLrnit0XlgkDMydZ7DM27ynZ+w66M1oNPQ3
 qFoH5m3vw1YNnfyFBwTU/ExAZ74Cw7lbX9D1opdOLtLxfmGFmc/nLA7L3qgjVHMXXxTr
 Y4kco7wiDISUQxM3pXJQgLkACH9p4/p0z1NIC1rmGcZtImpvaMQnJV0hY6a8wfdKFBxN
 XPzCsZndTsbMTeQNhtJ8rcy7OScey/6CYQovSUTUf1KQ7m68jV6W3k8HbLOhYK+1tjM6
 9emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763765027; x=1764369827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v76zapgO5bIdRvR0frt2ZimHyBAaD+3/mGyYC/gIUcI=;
 b=blhMwNFlSy38KZwBNHgmFjCd5fL/ID2EZE56PsZyvY9ta16l/v6TtK5So7v5AAk2vh
 0HAGRPesCv3QVX8zvoQQdIESXt2UhgYk07gg00FZ7PubTt+Efb9N2ch11sRDDgRwuh9o
 ss8j1NxIA2nvMuAg/Duv9zvsM5oAT8Qg8mC0hl5Ge/uMnBIOVZqsU/EE66knw2FO7DsS
 SklDrwPIWnmb1sy/vjGUTjEM+KQZhCn4ptSXA30+W0y3ydxumu0/Ml7F/9PUphz066O8
 04QyIrZY9vZJlPAY7izwSQPRbnjIi//ZpaSjuUJR0s/1kJrtEzHcuK2c+wNZqqRIAMGk
 6ajw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsz/UGoyyw0HV55dFSkJYc6dh5hjtvxX4p+ZbcC/wSMiZOYqtV3OECMDNeIRryQAQGZGWlno3y96U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm4gFJDZiF67knyxiMwud/AymxtSizLDILhIGBY4FQVKn34LJu
 iMz99qcsUbegu1EwctkOTX0/yc0j8S4MEyW6tqvHD43tWCDzyC1KFVujWkFfPW9AYIq/njcvEwX
 XxzgjARum3kubHP1E/x0yXz62gl025d4pWL7eYxA3WZ7LvIrPd0S+G9ZArITrpFSiNquJkZQ=
X-Gm-Gg: ASbGnctm0I8ZadDw1VXXwR281SI4RRn3y9UZfJ4hfWqPRF8MOCzK94lpDxO/36lJq0a
 wGFT8n0uBjALNDQqqs2kg/dF2/kv9STbbZe7Rkx30CIcsoIHYeovWs3PQPaxQcF46WSaoIEXaKq
 PjM59JgWmR616u3vluk7toJMURJFCDLELINxSTIGL5L6dDb2ngkLZYJHhM4Ng+ywmGgeolVwPRA
 hioofBR2MyNn6zEaozwzSp03OMC/FvN/FU7MyFoZQKm9rq5ng3tP0I7LcLO1mQBMZMpmdGSVgRI
 xyh9OCbeTSBWQXEJ/mVRj30RJb+PKs2FwXun6IzARp+Lg+LYvLhG8naZ8uE2qeNilGWWiT5gemm
 rGGAnpOb/Yxew/4DFfKMZGw8rTU4lCP2ZxFnCW4PCVH6djAMx0ma4n1ohtI+jOgIk2ddYwSeRVN
 mpFnoRy1ml0uKcXzh4SzI6Wnw=
X-Received: by 2002:a05:620a:28d3:b0:8b2:e986:2704 with SMTP id
 af79cd13be357-8b33d1e2c9amr478728285a.6.1763765026982; 
 Fri, 21 Nov 2025 14:43:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhShxarZPKNko07L672VvYM6E4Q/cCtGTF/pngqK7T7sU7mSFoE06aEOm6E+dFR58dPWuV/w==
X-Received: by 2002:a05:620a:28d3:b0:8b2:e986:2704 with SMTP id
 af79cd13be357-8b33d1e2c9amr478724085a.6.1763765026466; 
 Fri, 21 Nov 2025 14:43:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbc5964sm1929746e87.70.2025.11.21.14.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 14:43:44 -0800 (PST)
Date: Sat, 22 Nov 2025 00:43:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <ryaybhj2in3p5bdkbkm4alvxj2dumb6eah4wpru3xeffuabh3n@m5k6ivvmvkus>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=6920eb23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -W09uYF5lS1FZY-Z7GdnlmgDe1Gd81U-
X-Proofpoint-GUID: -W09uYF5lS1FZY-Z7GdnlmgDe1Gd81U-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NCBTYWx0ZWRfX7BhnmREWXWmh
 OLa8S7Lx99QzTwYLq/RYfuAXFICWg9gDcPxacoCmUI1lapyMHYuvIXWfkk4tNOD2+uc0TjcudO/
 iPN8i9uSTDVrK/8BNkigqZETzVHo+0LPIhGaJJ3OpVKFXGbm3hRS6jeBbgOvBdoGRo8mqTs+Mn5
 Bj+UCWa7t1piub0TRipPXdsP1nWLptpbS3abdLcNi/56wThv8MqbyfRtjjhxctEES1iTYZlZrQW
 AIGK8/Pk24WNR7BHUvOycuYFBzIJiyw+yNmLd2qwgD6hgWodBACUOTwSLVKqonshJSfP0P2lVRN
 vvXvkF5us2mUT20QOLaVP/uALAhg20GcPnNXS2XvX4p1LYMtW9j6cn+dQQTlrokM43NKc+sxFDD
 NkKQLolIa+9GdUsUTCymGJmDWf5U5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210174
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

On Sat, Nov 22, 2025 at 03:22:19AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 116 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
