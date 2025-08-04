Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73DB19AE0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 06:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DCF10E2A0;
	Mon,  4 Aug 2025 04:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7eiM1y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0D10E2A0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 04:49:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NoKjc029674
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 04:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7Yglzp+yr4eKtq6gEDEP5fa6
 YZypOJLaqkMYl6UIZkg=; b=g7eiM1y5O/gIMYLOM748dtFF6sgsQD7aG486JCJa
 uBkwY8WfteAbZIH95pEwiQQd1PtY1yEb3zBkLdNfbRmd1+OlQl813xqdyVbSVgHZ
 2Y0xPIxXj+ALbWW8I2h1xR0IhI+gSptZp/NU168tZkrvEIRs4n6oyeYK9LFwvcSe
 8fH0G+9Fj1+NycxDvQ7stY5p5IKDFe5jLYxTtji+ioQ6wOZn0ednUHoeeMrz1Z4y
 /WJZNsOXeDtK9XNFxJZVDGSoX3EaQgwzOXcFEsaeVq2G/TPYE5YAjdcOc0e9K/I2
 5pWFdV4+Rg+oP76TWRJ7ylTk1CGComuikXj8XR7hpjR/Rw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rktes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 04:49:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e69d69691fso101826985a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 21:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754282983; x=1754887783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Yglzp+yr4eKtq6gEDEP5fa6YZypOJLaqkMYl6UIZkg=;
 b=gK9fUmcaAETGKK0MzRAcWCFOR9j3u2p5sHrwsfMk+iY+Xa0bCHleFIIIePcrOBf9sD
 rTvkoZJ+fHoHti3dIJJWRgKDRGVFC/0zlPL2XyHj39IVf6VsGy/iQatIwAyVLIm5FbEO
 3ZRI/cB2LGQf+cQhkVP9T9HOmgRP9IejynBM4oiH+R/Z6WKznNqALZLwLkXxBSDXj354
 1/UgmCq5tyV3GxiW54nhvw8CgsXfPb7eHPp/ewAyc2fOHvcVirV4pyyof3RpY2YtGyJW
 ZdzteDKrzXsX59Waj39dtJH7cJaxQXQR/hza/OLV8x/Dlyl44i1pIx8Yk+xkZzpEPA1h
 TbGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV03mhUaKb2QKN8i9jI2FobXkB34NA48dDh9ZPE+cnLNbXh7JFhzYL0u/IZtiLg0Sq3s/UB3T0FnPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypxfuCGmRWobpNYY7pH2CeSshuWGBr+9a0XnWbBxdqTD6afzXS
 cdw921+1FpYj5JCr8OGCLn+9UbOLEx2CNtHKjdRbwB7f57+Y+iuoYcsIWHZQmNrlbkRmF5TLO/X
 30YGrj0fCcwNvbeKBH/nuUyLgEx3AY4AGE1mV5DT8Imp5t4FBzYPTq8K8KyjlAcS7FgxEyBE=
X-Gm-Gg: ASbGncvog4t6WXUUa5C5KOgiOcqkRPuUlGcMexi1al0v6N/oL4ZcNrH+ggHmOtgh+XB
 9cjR2fEj4iS0CI8Ai90FJWakpQRmF2iNLzKM8Wen9KwjKT8SD9iUJ8WQIHwFhx61/k39UaW/7/i
 qzkcOKIHRkhy2HdKtxtmtSjRIOY62P+nDRJLlw3b4uYaW2AJ+B7w2s+/IuUyjMVMuF/efKSebTu
 LJjZkXAAnCSgVkPNDPBfoLB5SEZrPPQhgHEo8wf6JOed51Q4Enqnol2q52ZAObPu1fA5kN2D40f
 LuaN4XjOTrEYiTDw/HG9C2I/cmf1NsBGFtjrPEpW+wfND/5YOqaxifBaAdjjV/N5nSwMZjNK/N+
 mFZepf2ldWZwIVs+ncoEPB1WYAdy7+78guzQrGO04dx8M1aiX1MZR
X-Received: by 2002:a05:620a:36c7:b0:7e6:5e9d:f8e6 with SMTP id
 af79cd13be357-7e69629dbcdmr1106345685a.22.1754282983184; 
 Sun, 03 Aug 2025 21:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzOqo7RSMXHRYDfEyQ47x4B+Pz6jpUX0s23rEdmLa1EGEICWbN/mAirTNdrgCZnMomrjhq8g==
X-Received: by 2002:a05:620a:36c7:b0:7e6:5e9d:f8e6 with SMTP id
 af79cd13be357-7e69629dbcdmr1106343785a.22.1754282982745; 
 Sun, 03 Aug 2025 21:49:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c98c15sm1529094e87.106.2025.08.03.21.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 21:49:41 -0700 (PDT)
Date: Mon, 4 Aug 2025 07:49:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <aiaonlbxwzbpuvnzijzp7btf2oxvtseq7zoylopllooeqshmux@unhoejkdyl6v>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <175390746243.1660386.11206814214268936734.robh@kernel.org>
 <cdbe1013-4f15-4638-870b-151292920ce7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdbe1013-4f15-4638-870b-151292920ce7@quicinc.com>
X-Proofpoint-ORIG-GUID: 5rD9wgKdf3oL-YJb6VQmzNrfpFxVDx14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMiBTYWx0ZWRfXwATmcPHUI2vH
 IUu+URKw9GFfR4YdQ69SHg3fcLsF4yZHJ59yd/jtSq+3sPFjBF9BAsTC7rjfD33NMJvRH/AScma
 X973157ft98aniMBdJTW0NlVXf6hKE1YGhm1L28lqaMcRJsllZeBXqv+OyngWlk0Uv2LUifjW2U
 mwDNCRhLHRuK7pIk13fOt9Z9y51udICJ0id0SON7LrWQWgByt7BcfRYY/u2NH5zIypchYPHgcGS
 J+IZuQHY+kihudGu3IlC3PQuFXo33OkZUBZa/fXQcWF8073gGLEm7TDFME/gpaSLU6cUs7mScRU
 rNpJJfbx9VbJNDc5YE0mHqMeEtWjC9YAHWgYBfCcmwZQlbXlBWAyLH1rsDNKwMLSXKMwQpskOfc
 wEnPjJIYg7MOak8YMLSGP29PkjM9F8Fd2MpGXjOZf7B9KCul4UzDFUjltusZ2ujb3P8Aw5o+
X-Proofpoint-GUID: 5rD9wgKdf3oL-YJb6VQmzNrfpFxVDx14
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=68903be8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=voM4FWlXAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=Wy_ckEHB4fXvzh_zUiEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=IC2XNlieTeVoXbcui8wp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040022
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

On Mon, Aug 04, 2025 at 12:00:39PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/7/31 4:31, Rob Herring (Arm) wrote:
> > WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> > 
> > On Wed, 30 Jul 2025 17:42:28 +0800, Yongxing Mou wrote:
> > > Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
> > >   1 file changed, 284 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible:0: 'qcom,qcs8300-edp-phy' is not one of ['qcom,sa8775p-edp-phy', 'qcom,sc7280-edp-phy', 'qcom,sc8180x-edp-phy', 'qcom,sc8280xp-dp-phy', 'qcom,sc8280xp-edp-phy', 'qcom,x1e80100-dp-phy']
> >          from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible: ['qcom,qcs8300-edp-phy', 'qcom,sa8775p-edp-phy'] is too long
> >          from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> This warning need to apply this patch..
> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
> thanks, link in the cover-letter seem wrong. and there is an unnecessary ~

It's not listed in b4 dependencies.

-- 
With best wishes
Dmitry
