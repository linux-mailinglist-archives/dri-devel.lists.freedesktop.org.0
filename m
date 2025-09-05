Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9F6B4597F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F7A10E2ED;
	Fri,  5 Sep 2025 13:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFNVac5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A5210EBAC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 13:48:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857CGd2008120
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 13:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ap62K/FP1kV8FYl5nLQxsQVk
 YwLvqHfb1niQXjNYis4=; b=kFNVac5WmL+evduZmBgoD0T6kEYqwEtpzOOB7XMG
 VJsTM6cV1fa3qYXkk0UZPHxqmCUD9juJRz+N41KBPZ+hKV9Qgbxf9ksCfik8IiAm
 t69f/7Lke8FAo421AH3JiPsf5zeqJey7T5lv/5ng4VXQ5oEeuTdQHRD4nCuddDlX
 9k1omGXx2g37FaCj9ROgEiv5YpHmVr/jPp4TOilcmiFKCof/DCGwflTIkZ0fR5Yl
 KPiueD4XuMqLDqQJ1SARVhbH6eMZoVOXZZAbWBCm+iUlzLkqvkMtLBb2BcNc9F8r
 CCtfvW32rDKE6b6vOXduBr1iGwlIDc3sgTpLTiLAbDNU7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmju8uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 13:48:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b31ba1392fso60181861cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 06:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757080089; x=1757684889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ap62K/FP1kV8FYl5nLQxsQVkYwLvqHfb1niQXjNYis4=;
 b=jQ6uyoLAwfHo/MMxCI/pQQ6grWup+77GmFazE//fTm1hgzKR/NyowZAd17st40uR+8
 3PPtRUc54+bssAib6mXShySzQoWgr0nfVvTNy3DtV9msykhnFhkS1El9EJ2teLnkLOo7
 gsPIQzkRsZA7fJzUJgMmfJ6rPzqSYflWF0OfJ63ORQuwvQGUEUKegBSbAeYlmgEmK5qA
 eMxCHdqqhtj9qgCxDTrBWtuPMI6yFWAT6H9NFpLTYwxRdkoJhTEYll0rAW6u4QqPHjz/
 Zt+yWv76nDhGaGNPoY6gkMJ6OtjajGlt1Lw60ZFSw6VwXAU39VdLQ5Kf8rNu5xL1CSe8
 pCVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5E4Q1TxiwpGRhYF4PxBehR9OorlA22h3uwO1Q2MCXiGR/TT4Vd5yMYCtyixI1mpIoSG3sL5kFdeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF+L4FpCuu7jGRMNOoGG6i5hNrU4s5WAR9P7IUJKMU4AXUNKhm
 1zK49jgs/N6y9hA5Y2ASV/K8ETGcubCLIf7IvYralWRYGw9prRVuvowTuUK3qvJOjNAMbOWADEf
 uAMx6fQRsgI0eXCz5Rd0uP2M1EEHYnMbVA0MbxnVDIHaPEJthfE8hUlTdj0s+7bBd78+J5Fw=
X-Gm-Gg: ASbGnct/V/p2BFCqsP8wll2Bmjnz5fi26cGq3oc71p+6b+dq1q8dJSml3Bt2Hxeet1L
 4LBI9dX/QTEQNy+vqBpTUelvQTPbdkIpXe2cSBEn3qXf877JHEgTjR7lbXYWv/RpoJMdA5BNXoV
 jbmjBI6+hqJvSO8OsJtzqvnKqjh3sCxU8jDq5pYl1lccoQVG2v3eblKFxsppzPHzBtG5wN8EMc3
 8cjRoKncYM2g9adjYv7mrxRojBptKD9gyDCP9446seVJvoZVKtPQAHniuknMHiBbX/cjRTlck1S
 l+4+/9hXuhRfzNsT3rh3Ztz1akfkZg2j36JdzdIEEKJB/He9Gc3oh00KOJD0yONGTCbKRGsmlB6
 fqPKn6MjoQAwvN8JJekMN8GLK/Ht+0Ab0Rrp7D4g/vcF+J4jknZsD
X-Received: by 2002:a05:622a:38f:b0:4b4:971c:2fe4 with SMTP id
 d75a77b69052e-4b4971c3190mr98469291cf.62.1757080088814; 
 Fri, 05 Sep 2025 06:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU1g8bwxyXF88f0bGvMVljHRg7TlISluEwFFoi/D70N/z1VXTCr/7Gek7kIvhhpDJ2WIEJ0Q==
X-Received: by 2002:a05:622a:38f:b0:4b4:971c:2fe4 with SMTP id
 d75a77b69052e-4b4971c3190mr98468881cf.62.1757080088273; 
 Fri, 05 Sep 2025 06:48:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608abb7c74sm1792273e87.54.2025.09.05.06.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 06:48:07 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68baea19 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jiGyGyMmBADT3WBvkIIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7wRcIXOcquhg-NuU0ZDXtW1fiMXLmG4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXzhdNyPkeOF//
 qJLFu8xzCxEf+9uQvwieVYfjj/XWcPFx83kqx0KDPhzxIPJDfEQWpK0GRjvL1LWs4skKFk8Mb6i
 DRs8AXbO7xlmK+R9EjMuzlj74YZgm9mwq3mJ5r5NjBZGPrQBhpSut0ozf7Jv5Nmf7gYTj8SxF86
 jsoCMSMPt4v1WOJGeu061NjBbpOLCSCZafTsOhFGDZ6cRpRkZrLGSvCrhY91IMrJUU6roxcW3Kr
 rxCvDhK0BnI78iODAWXxq6zN8hsCk2OHMRpSzbAjX5IkyvVwN5iyi87hRKi1RQKJPBRyv4yTIQ1
 +9bYm2u3beGMLER3jMEU35rEDCzsucx+etr99oae7FCesgoHZX5pYnO8eAD2v5KGAMxDUeRAs3G
 UCcXp3uK
X-Proofpoint-ORIG-GUID: 7wRcIXOcquhg-NuU0ZDXtW1fiMXLmG4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
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

On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
> 
> 
> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> > > Add compatible string for the DisplayPort controller found on the
> > > Qualcomm QCS8300 SoC.
> > > 
> > > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > > that supports 4 MST streams.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >     compatible:
> > >       oneOf:
> > >         - enum:
> > > +          - qcom,qcs8300-dp
> > 
> > Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
> > new one?
> > 
> I think we can not use fallback to sa8775p, since we don't have DP1
> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
> really used). So in the hardware, i think it is different with SA8775P and
> we need a new one.>>             - qcom,sa8775p-dp

The DP controller is the same as the one present on SA8775P.

> > >             - qcom,sc7180-dp
> > >             - qcom,sc7280-dp

-- 
With best wishes
Dmitry
