Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED70B3FB92
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769FD10E14F;
	Tue,  2 Sep 2025 10:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgnZ0Y/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358910E14F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 10:01:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S6PW010341
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 10:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BwC/nawaLvi9t0RWv3QL/WI5
 Jwj7NSyP50cGH4NSFis=; b=EgnZ0Y/qJrBtOT7pfzw3X0lnweFwVU3o/TrdLXjQ
 jxt9wT4FNSUh+xWLhIkCUvapyU0lLJqblPdXtKh1kS5PXOox7/uPqmn48zvwGCQv
 MhtxsM2BQhmtXCTEY2NDkhU5z9RxqjneuECPSIPT3GRPJ5h75Vc7PElEzeMfIWT5
 pVHuwyWGUwArJjPlKSXp+dDF1icHt9zXVIe2PIpHJSw9Jyt00cgOqBw/SEssFp05
 3LrdfNfKGrEZ7ZZpyl6luQDadY3wEJ7x6jQMaeIqF3y4HJoZKFqnu2XPgNEmgzhr
 ZWyfKSoc9coqt1uEaOKvFTkpFfTMXfqOV7cKNeiNcGKyBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfcst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:01:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2f7851326so129570951cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 03:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756807298; x=1757412098;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwC/nawaLvi9t0RWv3QL/WI5Jwj7NSyP50cGH4NSFis=;
 b=AJbhJrR1PNMXoU0l9TXYPoFxlLun6JaNknNaJA1EF7eKQQkHrcNTCTMI1LxyZ3+2vC
 8hfNTrS/VxZ6pUpkGNoUqP9Xnn2jTJSgyIlsWXvj1eOUs2LswYIgjT50d/kfwnELkeJI
 yevVgWv/D5gTKG02XHAJYWeb0g1uVrsZplpdzHRtB1CDeVWAsWMIzhDJuPo/4VYGhaQw
 zj2ZYLEfZ7xCtPsWGhPlu7oIufnUg6minjqt9DvWX0xCVH8MJZkWgEZN6gAvfZ+S/OyI
 iFKInrpIqAqcsTC2pSYatH56DhPhoCvsbW8cgFVgKAGSpoGXMuJ0PNddPyUC6h3RuQnm
 MpXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHASkO3lT5Q2+UDHAlQoxfKh10o7OFNMvBlwfbcVdtchxgQCybeoHHu+O4D0oK4/k8tidV4NQagOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzioulMwjAKvq2ygt9Q18GusUXoNhO3IzJeAUEVGXnqHBdjsWvC
 VoFDdbXaIQsojmT4CzkP+bfbUKZTaeKP5SYytcZ9wzBQaV4SpHexI3vONhi5GJPL0wmYTti+WFB
 xKPG7iZ8AguP5WxE3Xfpm/yiBXvRblOEUuBRyk9F7Cx2pWmMj/g1mZ/9LvnK12BHkvSjruUs=
X-Gm-Gg: ASbGncs5txvaoHjt+jH1XpiXNvTYHzkcR3TSjmizG1HGPxST4muOI7aK/U6RAC4wg0j
 lxFDje9kp21I8Vb0p9dJqsAmWdaBEWI3wm40nccDpbqp1VKpNC5c+t91cwgfTeGyBEjCVF8qmZp
 f01E777A8ZZ6TyxawKStpbWZhXibbO+F0H0N7IfZdKFXCZVn7wBoO+m8P8vNPTXon8Fs7Mdhgs0
 hml9rGjFCxhehJV4iBtYZ7SR2keIAg8PxOBfDPKLVC0i8ctoLmX8S3s7vksqpGiUQ8GhtP8tShd
 0xXyGTaGRl1rxh/rrPwI6ZVb/m8VpBRhXGcZ/B+XBzP4dXboeMdwYv4+m4vVakLj9kaXH/Y8V73
 HNeXN6Wg8HqjzezCk0pcIpcTGwu1xU31cTJEdRUbGMZkUz6ZbwI6Y
X-Received: by 2002:a05:622a:cf:b0:4b3:479d:85de with SMTP id
 d75a77b69052e-4b3479d8a44mr19164031cf.70.1756807297730; 
 Tue, 02 Sep 2025 03:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIzhdTdKaG+HoZjO6SOOOHS8+U94QR+yYF63Rf6q/hpnZhrkWYy2UVMLS/EJe5SAHyG+zmqg==
X-Received: by 2002:a05:622a:cf:b0:4b3:479d:85de with SMTP id
 d75a77b69052e-4b3479d8a44mr19161411cf.70.1756807295614; 
 Tue, 02 Sep 2025 03:01:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56082790204sm565117e87.77.2025.09.02.03.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 03:01:34 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:01:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
Message-ID: <ysj4ndb4twcvmlxb3marh2vktxxsup5l6ioljdgzlod46uimh2@pkgta6r3ydqx>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
 <20250901-arboreal-gay-wolf-bcaaec@kuoka>
 <qy6c2gundpbz5ixqpt2hefzfb56wcrzcaclqwg2opof4zc7lep@dpc3nv6usurk>
 <24999a53-ea5a-4823-a84f-2ca0ca184bb4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24999a53-ea5a-4823-a84f-2ca0ca184bb4@linaro.org>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6c082 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZVPz9Q7mt2jYMwHyQ58A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: GchwWa2TS3iYi3H8r2VqQMmK4MpR5NpI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX0gEOsx0/Dh9I
 i1IuFLq8Q1r7CVSLCYwzuNwhP5IU3WhHwmVPoYJER8fXTJkJ9vj6izMbBXpaKhsxKTPNTQYoC3u
 8cVBPumcbAfYWzB2Jr71MX7rJ1mUKn08Xys5KuVolnj0u2qNmdWafTqrrPgOYgEqf3K6fPGjLBZ
 RXHv5Vjrgv96IfZxXHhna0ASpEGKKZL4BI709kz1EKPpV3hAJnJsqxu3BfB0vRpIxMqYC0a1r75
 Yh/4a114OdDB1Cz3c4UFLIqZEUpAKmm3ryko421oA4PaJ/LMzb3T+hb7/FdC87aSoqEr6iZVh7E
 oE3o+FN+YT9+rDJuDrff3+lwTJyud8ZA8I/znmuOe7dUi7SNa2uoJlELh9dLUht/7x3Ut94KWBD
 Q20K5mAX
X-Proofpoint-ORIG-GUID: GchwWa2TS3iYi3H8r2VqQMmK4MpR5NpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Tue, Sep 02, 2025 at 08:04:54AM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 06:03, Dmitry Baryshkov wrote:
> > On Mon, Sep 01, 2025 at 05:45:49AM +0200, Krzysztof Kozlowski wrote:
> >> On Fri, Aug 29, 2025 at 01:48:15AM +0300, Dmitry Baryshkov wrote:
> >>> The SM6350 doesn't have MST support, as such it is not compatible with
> >>> the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
> >>> (which belongs to the same generation and also doesn't have MST
> >>> support).
> >>>
> >>> Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
> >>>  1 file changed, 13 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> @@ -31,13 +31,25 @@ properties:
> >>>            - qcom,sm8650-dp
> >>>        - items:
> >>>            - enum:
> >>> -              - qcom,sar2130p-dp
> >>>                - qcom,sm6350-dp
> >>> +          - const: qcom,sc7180-dp
> >>> +
> >>> +      # deprecated entry for compatibility with old DT
> >>> +      - items:
> >>> +          - enum:
> >>> +              - qcom,sm6350-dp
> >>> +          - const: qcom,sm8350-dp
> >>> +        deprecated: true
> >>
> >> If it is only about bindings then there is little benefit in keeping
> >> this, just drop this case.  However you cannot drop it from DTS, so this
> >> is a bit pointless.
> > 
> > Our plan is:
> > - land updated DT bindings, describing MST clocks on MST-enabled
> >   platforms,
> > - land updated DTS, adding MST clocks where applicable,
> 
> This part breaks all out-of-tree users of DTS.

User of which one? SM6350 or all DTS?

It extends the ABI, so no, it shouldn't. We add regions and clocks,
existing users can use the previously defined feature set.

Anyway, is it about adding more explicit note to the cover letter and/or
commit message or would you have any other proposal on how to handle the
issue?

> 
> > - land driver changes, keeping legacy support for non-MST DTs on
> >   MST-enabled SoCs
> > 
> >>
> >> Lack of MST support is not informative enough to claim it is not
> >> compatible with 8350. For example if it was working fine via fallback,
> >> then that statement is simply not correct.
> >>
> >> And it HAD to work fine, because there is nothing binding to
> >> qcom,sm6350-dp.
> > 
> > It is working fine since currently we don't have MST support on the
> > driver side (nor do we describe MST clocks in DT). It's true that the
> > driver will have to handle non-MST DT for SM8350. However I definitely
> > don't want to describe both cases in the bindings. SM6350 is not going
> > to be compatible with the MST-enabled SM8350 schema.
> 
> The question is rather: is SM6350 going to be compatible (working) with
> MST-enabled drivers.

If somebody implements e.g. U-Boot DP MST support after we land DP MST
bindings, I would not guarantee that. SM8350 will already have second
stream clock.

-- 
With best wishes
Dmitry
