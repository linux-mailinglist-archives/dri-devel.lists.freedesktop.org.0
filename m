Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC1C16B27
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8579E10E651;
	Tue, 28 Oct 2025 19:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0SdCCTU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J04HkVbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C95610E651
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:58:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlhdI2553569
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HC9tpIvHIz6+9K+gz/rNc72E
 qizD+nH+1zUVfnpz0Z0=; b=V0SdCCTU36+HZCsh/6WlYGSSvqGWix3hPXJpsYgr
 +qawP9qJ9Supln5gGBRWA4Eq7MvchO+uciBGQdlAf2u2TDo9yLEj28P9S8RJ7o5Q
 QuOCnNoZs+UxolxPzd3t1KMRAhCIomS4h7aYLzjDyTAfMRpBWZqh5N/YKofNSmAx
 rN6vcGwe+VKVRQbzwaqNHZ4zSF+G0mbNn8pJ20Ju+mVsHeKtXhvKhH44SIHXu27r
 HYs0gyWsrOAX6EDsrJRkMG2rXoVY/oEQ1vaY5O2X7dl/yA3+RmD4Xg1bJWdQ0v3n
 EIbVzb1oY1hko52mTM55HuMHBHQekZ6Zdb9zTU1ubANTTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2g0r1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:58:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eb9bcc1105so8467851cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681514; x=1762286314;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HC9tpIvHIz6+9K+gz/rNc72EqizD+nH+1zUVfnpz0Z0=;
 b=J04HkVbbFAd9CGmQG7G98JkD/dKp2J/tbydhPCsRJNwp9Ig8fqWbvVhSPj1uCfYWO1
 BciVMnRMolNFyDmaHCN/a35u2wv7cCubuu9TLsbEpAwe0dFUtCudWnrvOEaxO3iiT790
 UIjwGkO6GgLkw+omm5sI6UcWztY3Dk/X7mWUsnh5yL5QYHIeZYUYT4h4eoifBcsSvD9k
 XfEAdaptts2zaPrXtTBFYP6YMh7MKgTzb869ffmDzy0M2Xh0FdftRpCGPt+kwpRAjF34
 dQ50e9yoK0h3E5bBa4THb2My27hIgZ4ld7UHh5JrXUCvsNU2n617opN1kgGcHbSsym7u
 40/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681514; x=1762286314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HC9tpIvHIz6+9K+gz/rNc72EqizD+nH+1zUVfnpz0Z0=;
 b=J3l2CbCXNuWRKKHrYNuSeGfACLTy35vbZH4GeUXee5I9zUNwJ+XJTvC82NBjdmC4HY
 85LJGDjVuQWOnSNMqA/8VhDhPvcvYQLPGHSabuJd2jLRqaJfmGfWOaRG83u65iLTLFo6
 xKK6pE9gaqoRBi7XRRvEsWBbEl1r//BaOsZiynOp1vIILZgxTWJPBeLXFWrJYhDImP0f
 dyFb30P5j3QFrWifvpKmoLkESE+6RUNCfg+0ohUp09v9T8H+nyKvM0hXBN/hrA451QfH
 qH+kfHuLOj9ouA2ywZelmoyvD6nsdS7yNLJVIfDM7+3oV/iHWrE9AU4Q3Y7F8WY6edMD
 BU/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsOxFToQcHnGRa8uw8sEjz5TxVN6sTWfPemEbRdOPHAP8rdvoRHVkTovuXt9edRwFCik03lBdNjck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwABYurTntaSNwwLJ18zhYreD/f+1CZKCgJgI7XY+obuxPcIIYn
 7sUAYv78T46JYDeYbrhJwfv1kRtIJcUcBQ7wTcVyX+aItklJoUwPvFcdAuypOiboiq1JPQjmlvx
 abCtXbO5YR8DQJZgdin79uKVtLzSBdUi7vy5YnTm+qJGolbpyUHP3mI9k82555gdcxHFacok=
X-Gm-Gg: ASbGncslzWznFj85PinL2SyY73fKkO5t1ZGRCakrZDi5eQtrgTcaL44Wq9jLUOzzwFi
 ECHg6xnvltG+7eJNB2qGapgo+AGa4iyQgC3v0vh4/jzARGJByhORBq58dDSIvkX/5IJ7hsiapFF
 V8903kQZ4dVjEe00Feq/AttUGxtfIGVyCMMhnE8PpJqNuQ4uwTMQ7TR0xlcQjA/Hc2LFxSZ3zDp
 7U6Hb2RxA3clbkPLoZSG1+I4SkdJv0syk3bHr1R2IBfSmk8V3RBTg30Wn3l6LPIR7swdfzJSvj6
 QuDzcvTxddSAMu1WQ65lxQhIHSzpldUAuQxc5r4dM11lToKCBYXP2TKaNpJDgF8EzlZd6eijvXZ
 lGbDldQsTUKP5FCPqWPSeUH8uCqnUAuJwCg6zpNTfnHomS8xZwLMD/CJ6VC4Stk6Fg9ZeP4PCuv
 JHHLx0ZBFziZWh
X-Received: by 2002:a05:622a:346:b0:4ec:f2a1:5c9a with SMTP id
 d75a77b69052e-4ed089a8095mr48571521cf.13.1761681514559; 
 Tue, 28 Oct 2025 12:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaMmcLeIcEWm2PB1CZcpPJ3nfsaaOwDHDWrSPxIXsesjcRBn28xpDk5g3XqlOxBTccXdasMQ==
X-Received: by 2002:a05:622a:346:b0:4ec:f2a1:5c9a with SMTP id
 d75a77b69052e-4ed089a8095mr48571071cf.13.1761681513956; 
 Tue, 28 Oct 2025 12:58:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-593097eb2d4sm1632173e87.66.2025.10.28.12.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:58:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:58:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
Message-ID: <hzmwjn6xmb3kqvbvhhvycoskor4avtuuaubda5m3vmouten7z7@bvo53uektqln>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
X-Proofpoint-GUID: FRcNNNUnvviUCqRR_PwBrEZnkUzxKC1q
X-Proofpoint-ORIG-GUID: FRcNNNUnvviUCqRR_PwBrEZnkUzxKC1q
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6901206b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pr-hqIQVVoteFAb5gkcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfX9yf1722Ar5HQ
 Z8RidVVa1g0RHtaxzUZlaZItWmLnD+1Sl043SS7pcig4YmxKSJ0OT/gUQ6PDhNcc7rKo/VVe7Xu
 vd1HPwLwgEAdQbWn4FwosnI4Yua45vTQSvOHyYp1Oh+ncqmCXcSVKerxXKcgARPTsI2GKDPNqVF
 bZRKJwL/wkNKNC+IJM15F0IOlA1nOlysVVKa2jl+kHg22mOEf+z5cMkGbfwB0rWwU+ixmOLUy/e
 DvDcqOSM7h+Hrn+qkuvih6OvmTjOXPWaWHpfDBPYLM30UzuILIAtbrGrU3zEZLuLS+Maal3NnvX
 GpqyE5akDXF2ZEoc53l++a09lte/6fazc+hCJcagSaWJvkh0LYBtyV5zPrOFQM/7yYHtCttJqIr
 rTuqdK3u5bR+L+LiGHdyoVz/IN3ixw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280168
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

On Mon, Oct 27, 2025 at 01:54:43PM -0500, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin via B4 Relay wrote:
> > From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > 
> > SM6150 uses the same DisplayPort controller as SM8150, which is already
> > compatible with SM8350. Add the SM6150-specific compatible string and
> > update the binding example accordingly.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > @@ -51,6 +51,16 @@ patternProperties:
> >        compatible:
> >          const: qcom,sm6150-dpu
> >  
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,sm6150-dp
> > +          - const: qcom,sm8150-dp
> 
> Perhaps I'm missing something, but if sm6150-dp is the same controller
> as sm8150-dp, which is the same controller as sm8350-dp...doesn't that
> imply that sm6150-dp is the same as sm8350-dp and we could not mention
> the sm8150-dp here?

sm6150-dp is the same as sm8150-dp. sm8150-dp is compatible with
sm8350-dp, but it's not the same version.

> 
> Regards,
> Bjorn
> 
> > +          - const: qcom,sm8350-dp
> > +
> >    "^dsi@[0-9a-f]+$":
> >      type: object
> >      additionalProperties: true
> > 
> > -- 
> > 2.34.1
> > 
> > 

-- 
With best wishes
Dmitry
