Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B3B39AC2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 12:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B73810E973;
	Thu, 28 Aug 2025 10:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ap71NfQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A8310E973
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 10:59:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S64xft031161
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 10:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=09leXTKVtloMTscnxlYkAl4E
 C4Rzi1g0wwL1WchT0Sk=; b=ap71NfQ5K5jUDAfi+bXDcK/qtsgDg/YT/SZQC3gA
 /KmdePO0gMNFf0DYCXDBlZ01Q4r3/BNnxqwvJVYQ+29iMRJxb/z/3gD+tHMF403f
 kUb6+RzXWlObGjItyKH0d5umGHD2g8dTHyWC290dsrpIBCd5JUlXIETQpIgy7ZmO
 1ZRlal1ZwMyQQfvteSoPx0Z3MiU/nNh5MtDR88tZlco9Z+VxSxgAvST3rlUNTDtP
 rqRVR59XSbo78R7HHHiV4FYczqvkJSjT9BD4UFdvuQWkDhHWrAVFNLZcMW/Kp/QP
 8JBjIcKbqL4ylLT+L2qZu8DNsfM+D6eJdurDhpTYcrkyhA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615qvbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 10:59:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70de0bdb600so16573656d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 03:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756378787; x=1756983587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09leXTKVtloMTscnxlYkAl4EC4Rzi1g0wwL1WchT0Sk=;
 b=R22JpmNxswF3lLq4iNlYUuLaH+vgofFKDu1MsZEI7x+EPArKvzhtg0LHO9Ca1JPpPs
 CW1gEct4hccU++JKU9YMhIJvZMN0JRr+VIGwM5mfivhAAvf5bN/nStl55ZqQFmjc9XQg
 FmXG44JKB8ZMqFWe4TEikH7BlNXdEgPi24Dv2aH/EaVY+j9QKmhBzhzzthnwElbwQ/mC
 lTf1N/7GeSKjFn7I8CheQCbtc5ejpoPz27JlKKAwM2kpU7CoYkVVn+gpaGeF2HWFJZsb
 ZQ/lMMDkr4ZQTB7ZBVkGpwUDrcC/gIDylCHgTF+95rOvmWTfSASxANkUvB1EaDGRLEX7
 OyTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVvBYAYIN7Vj8SNkNLng//VHPCUwLw8+MdZbh0PVDLyuCaFbKLvHqxsETozPPU4ovo6kU40UI9fhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydwYjDJlL6byfMo1E5toPoLy77fGhaDQgLFi8AMfuwps3hyWSy
 5CtOKqu5IWk+3SdYznmm/0q2xMtkkrb0v9RGsBdMCy9MFqxTRaxSBnq+Hck+MEhhqvOo2wdy/BZ
 lyDBW/ixM5h39x2QpfXQY2ZHenkYSl+cJM+tEG8bqpxS9V9KhAxCe2MLW7Ye+aRcJg4f5cHM=
X-Gm-Gg: ASbGncul58J0iEMvPX7IyaWhAfZcclmM3GggBqwbLpEPvUKQ04Dxab2yQ5hR0E3LpPP
 ZdAg3LgIovQuxeaU58sJpDGUonZqOy4fTTcVfmpFyxPzCGe0Kb0XksaCPXw0vvnoWW0H3oUrodc
 twkBUyIb/M0d4ASV8apuMpsAxKk/YV+hbk6ESKGPHSjM4X/D81bMiO8cvttoArnjgFcNyo1SslD
 ZiBHXH+GPkinNa4slFTQrb/A5ovQbwVPZ2PyIsb/HiNbwhOL6B5ZUhYooiq2CWNEpotgdNh2DBc
 /yfbs6Xe++fH120gmJDVmZie0A6/MUZYr0OoA+yxKqpSyFe38M4MCmHlNCdCN7bl0l6VxHoFEGH
 OvskoupdKulJvULTpoB7PdiPGjSqZZKZmwXpw6q31TxIo/0+JbNuI
X-Received: by 2002:a05:6214:765:b0:70d:dd5b:34bc with SMTP id
 6a1803df08f44-70ddd5b378bmr79864016d6.37.1756378787469; 
 Thu, 28 Aug 2025 03:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExFIterP9dImItBjYAqD1Xx4x9yddy09PGUubw4yf9+Su69Wqk2KWb9HrBNMXk2uDDsgEepg==
X-Received: by 2002:a05:6214:765:b0:70d:dd5b:34bc with SMTP id
 6a1803df08f44-70ddd5b378bmr79863606d6.37.1756378786978; 
 Thu, 28 Aug 2025 03:59:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5aa917sm30826041fa.41.2025.08.28.03.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 03:59:45 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <vp4shoc6nok6byyrkq34772ag5axnfcugbr6jbdxglazvneurx@u7j36gjp5vna>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
 <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>
 <20250828-kind-crocodile-of-progress-6cbbb0@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-kind-crocodile-of-progress-6cbbb0@kuoka>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX+L129fNn2Mhx
 sRQz/xn2ltG7KtcCtkHtkzAuEXBeH7KaTdaneHFLjIaVZWG5AKLhPVuQDJcM538zS9UhOC1YeKy
 nXfrpthWvMUx8W85pSX6alkpqo+XAtbrMQ22jU2wLsL9Xd7nfJCkpWQvLRR/Qckzm6/ZMRTZVQH
 ItmNa/771/YYBi8RiLRXJk3s+ddTqjmTrCw/QSnGKEU8bWvwoOKBnLowYpKdx71G0kTzHq/6bzV
 XDQG+KBZfdSOqq/s0NTyn8ek2C6+1LnyIucLXX19+AoDMM//ctGle+m9jQqCZHTNI18hK7Irpg8
 RX6sir/ylkP4soJj/6sU3niRrTxphOV4sHWdO2IYg+FfbYESFBdWeme3X/eC04gzCOVvliyfBV6
 z6FSOIND
X-Proofpoint-GUID: T6EFT9fHeIuTLvq1racZ8xOuXy3vupY4
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b036a4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Rb9tGRSG334u1UeLp2EA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: T6EFT9fHeIuTLvq1racZ8xOuXy3vupY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

On Thu, Aug 28, 2025 at 09:36:24AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 25, 2025 at 11:34:21AM +0800, Yongxing Mou wrote:
> > Add compatible string for the DisplayPort controller found on the
> > Qualcomm QCS8300 SoC.
> > 
> > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > that supports 4 MST streams.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml        | 26 +++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..4da22a211442b7abe2dc18e769d8fd14d224eb40 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - qcom,qcs8300-dp
> >            - qcom,sa8775p-dp
> >            - qcom,sc7180-dp
> >            - qcom,sc7280-dp
> > @@ -179,6 +180,7 @@ allOf:
> >            compatible:
> >              contains:
> >                enum:
> > +                - qcom,qcs8300-dp
> >                  - qcom,sa8775p-dp
> >                  - qcom,x1e80100-dp
> >        then:
> > @@ -241,11 +243,25 @@ allOf:
> >                minItems: 5
> >                maxItems: 6
> >          else:
> > -          # Default to 2 streams MST
> > -          properties:
> > -            clocks:
> > -              minItems: 6
> > -              maxItems: 6
> > +          if:
> 
> Please do not nest if:then:if:then. It gets unreadable very fast.
> 
> I don't even understand why you need this. The code does not exist in
> the next, either. That does not help.

I picked up the MST bindings patchset, so the code should be in linux-next
soon. It already contains nested if-then-else which defines the number
of MST streams available on the platform (R-B'ed by RobH). If you think
that we should remove the nested if's I'd repost the bindings series
first.

-- 
With best wishes
Dmitry
