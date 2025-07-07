Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA3FAFAE89
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 10:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CAE10E279;
	Mon,  7 Jul 2025 08:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4QqyX4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D0D10E2FA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 08:24:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566NRIjj020871
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Jul 2025 08:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=; b=i4QqyX4ZhQI6uWob
 /5qiPClMeuKoOkZlPichiL69OnNlj8hk6lULpnkN1J1VZo1mjErOEnbqc2wFahFt
 iNUSOt/kxErcAiLvl4mgN5oKSfJX90zPTo9Zip6pBuQw3WIkMPVFl//ZiksqlZNB
 /uT/Cs77uHam+gIKPG1kHUJNsG8knQoteP1R1iI6tCQYzqgxMICwn1jjvdt0BSb6
 OTUuuu7l4/uW1/SZz1zIFAIRDs/XY+HERQgR/F2aySgwXUdIChbHCwiXtP9msLUM
 3jDEWjhEIrf6hA8nXLQO7IuMBeUe2plDJRrw7nuSyrAKUtBWjBgLAqi0nv/9NvOU
 8MtIjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkba29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 08:24:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d097083cc3so39066085a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 01:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751876669; x=1752481469;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=;
 b=QoEEomop7yuq3KPA7zCh/slxQtsP2rEm/2fc/B0LDQY8FTYMnmiCIFMH7U5N72eVdC
 P1aTlFJJ2eu7jIpVlMfHGrmkpYePskob99m+69A2m0Xyr1xtDXuJXG0NeOg4+p5fonad
 OzvcEhHzRHOnYBUE5Qff7Q+hamTeiHJV6HD790zQmveu9cu26RCe94keidADB/ujlrcK
 NciK8lpZOvax+eYQzvpy6qDIogJp85N3idlcbTye3rxEqs1D5NOWqyjmH5eXQ1BZr+ej
 BWSirJQI7+2yzY6xFex5r1tjibSKu6RIIfyBO94rgjzUFlW3U/wn072EicugrpLvyX2q
 6tBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrGZrDepzlh/otC3pdLvxwtx3ILCIJX2NEPNicoEOVI6UDqhlzvGTT3Iy3TQLU7UHWKwOXSxk42mM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxugpLjsatjfwdq3lZv+yOqqYwXt2nO3AGZrqsyK4cVaJ6ESTYa
 CZusBfkCXOyIJhQne4tR5Eigxuj0bGNZA7SZ/OJDnywQFc6vnJo1xD50RRPOGnbt3uH8zuxCI/p
 Vj4inQ5NjXkcqqbUq8BYQ6Cu7wmfxjzBKcp6B9z5x+ZbVD6g17vQ8snZkSpdRB76j6TbqxFs=
X-Gm-Gg: ASbGncut029IviPEJh2SBRmgEwiELp/VTXqDPdsXoo0Gb9+07ID1CdfXfmrzIFeKvqq
 GM+e3AtQRDmT56VA3hCQV6kanUaLe+aMpy845ZC+leo/JPULYearUGQMyom9b8ua5Ofxrbi8os6
 0iLuz/Pb1Eh65gTHh+SJnw4k0/glVwSRqHBmuRgVCmpkTZmeJ9AworuaCDitN8k+x8g7CG5LJ/B
 SCX7ipEgItde0BNYowV2tnHkMBax7GeyQdhZAt1SSklxSIl3m4uE7mf1/T4yEzemAgiNbzPNErX
 qJDyZOlba8H50fYBjYjeEAkii3lqMRUDp0juev7K+2XjJ/Udu8KhTcpZ+j/QX03dV2QcbAE0gf+
 k19M=
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id
 d75a77b69052e-4a9a2d2634cmr41323241cf.6.1751876669218; 
 Mon, 07 Jul 2025 01:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAhUSYigL5oM1altpor3qk4P5f5OHAvNg9UYt6fOM60gyonRu+BrBPx55Xo/pckv1Ovocl8w==
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id
 d75a77b69052e-4a9a2d2634cmr41323171cf.6.1751876668843; 
 Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e8c31sm668150966b.18.2025.07.07.01.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Message-ID: <17aa8f1f-f293-4ba8-a947-08d9b3618f5b@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8180x: modernize MDSS device
 definition
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Aj39vq01HF-5xbAmiEbFpOUvwTdflI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfX0qmEzOmXvr0h
 CruqV7lpWz71FXCSnj4vYQQHAy6EPx88R8gq9iZ9/SuCsE0tckuEsxvyfIj5kOfS5KToIXdKMrE
 an3KdfMXEMlHRxM5U/kqyxPYehqA598Dra/thglB/VVYU6DHRTnat5MzekGAWr8oS5lSKvJ0xSA
 79Xmpkpcc75CHHkM6ZJTq5VwZFLTfAIx2O2Cbd3vXlDeRfzZXGlUK+TPrWpTdZEYWIV1xKuJUQo
 hCAzU7qUUAUMAfSdigIVVThq+OH0PYubEfq3RidQ4ecQmE4TpIzrituL6EVTEYffbK+SsJ+KPda
 d47lrbCsgYkoqpbsNQH9ngYQF5atd0lW1MECdJWmRg4yKr79EDO1OkdNkkBP5Ms70y2r/direnX
 vvBHrhBgNE+NYrEGa0cGTMqoxnSb/bALhhP8DTttIy43Xflu5AIHNYcIPgK4Tdb0TOOu2FyM
X-Proofpoint-GUID: 6Aj39vq01HF-5xbAmiEbFpOUvwTdflI8
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686b843e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UvoLlU4ym182rRgf1HoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=983 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070047
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

On 7/4/25 6:31 PM, Dmitry Baryshkov wrote:
> Follow the lead of other platforms and update DT description of the MDSS
> device:
> 
> - Use generic node names (dislpay-subsystem, display-controller, phy)
>   instead of the platform-specific ones (mdss, mdp, dsi-phy)
> - Add platform-specific compatible string to DSI controllers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
