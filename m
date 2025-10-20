Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B8BF0BBB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8665310E28B;
	Mon, 20 Oct 2025 11:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vupo0rDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7DC10E286
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:07:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KB6HfT025082
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/3XkzzDE6pgtYDQvU/LrOrAk
 KN7CmI67gQk/krP8dF4=; b=Vupo0rDtbyDoiFdRGKzMaEGFKfc1VVYpV9RhBmPS
 Gfb7yYNwj4W5B3n1gmSPHGUvUiwwTKp6gyv6bspCvIOVp1v/4M2U2XLpLMw6kOyD
 bs4+qBuWetGShrObreU4js9zBzZQVBAK3pXnen0ixgasx1NcXn9GilhkGnXfInDO
 m3vhbsDtY4LiJvltorVDNJYBX+Uk08stgGohU474ZscwgOH49IW4vhcvBnwDlDFb
 YicVkdY7Y2rr4IbTx/FI5t2zlqTKTY7axzik95mhS3CaIp/cjxgxFyC6UErImv/f
 FIvjeZAqjXH1fykxj59SFrwGE3u4jTzSeYkbWQIIfr9vxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hvm2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:07:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-88f81cf8244so2554564885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 04:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760958460; x=1761563260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3XkzzDE6pgtYDQvU/LrOrAkKN7CmI67gQk/krP8dF4=;
 b=cJqN1iqPhdkLBDlWOkO1CDsqKMXtc3I0MFZIAOglwPJD4/4djhy3ArIEQSxO8mi8Sm
 PJEWN1DNmztJIZBY+4JfaJA1he314tyxL6sgF8Pz/PWq+Sv+wxF6BjNeNQP5p/0pqWKm
 ixVvaXRfgi37ayLy8L8TrFEMnVETVxwUxviJDHlZwCLLqU7fgEQ1rbtOmG9yvBHAFAF7
 sD+TSKYQCZZ9WStxqwCLLqpwvIq9W58ISlGspPKGKx629cuNodnbH+fBKS9VuMjtrOCL
 vnJAIpihZ744SveaYahVmImkbu9hFLltqrX4f7QDPBizs7HfgofWGZqvEs4ZlEFJuCtI
 QKTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ZfvXW/ugQcapmfniFlN3oV3U0rbv5FQ7L7f6+WbchDXouiuvS1B7B+E62136mgMg5kRlcAiScAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydb7czEygTgqrLQnShPIoQMIMngIkt9oOcaZVbtuomaXKJFmVH
 Q9CA1dfcz/oNm2NyLXESVgLmUJQuGBAfRYcErDmaQowWMrMWcxd2689zS3HrUfCSH9vQRzhC2+E
 zXTige+7fpp14WlX2IYS9k1QaobY34B8Kzqz+j5/0SGy03eGDRwTzb9xrprI5W8NKhIRrBXo=
X-Gm-Gg: ASbGncskpN7J11N6bmqRP6WMtVCkbsHpeevovwfvRGHP0ekANXhjp8eW+I0tSoYte1r
 1GuZobXprl5V5ekLquAppjtdK4EDhGQYT0ZlT/4KwzuzLgSLMrsoMTqdUmrMBwMYb4W3caPU6up
 TZLlQdFiEAp22/E7V2d+E3XmC94OZlC6/wNledliwyly8qEIkTdxIRj3jn4ToY7qS1goWOP3Fwd
 RSsiOmjuJ8SrId5Vyyqhm03+Y6hOk0wNkIjOtPOk/W5aIHSzx4T9Zg9feWlm7gvGUOQnhvOovzX
 XwAtqGkAGLo/Lwyx5LxtJnQ5Aw9CiBFjZrcGuKK2laFtL7xcIh7GyLIXQa+ipRqoyKx68ew2Uir
 3K4qz/0ve00r6VrWKyB7TJpoVU5ZG0jmA1WXQjsEJyA5QBzdz6FTKFGW2whuVs0rP1ajmyFJQIf
 LqqUAnc64Ojl8=
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr149386691cf.31.1760958459651; 
 Mon, 20 Oct 2025 04:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEukabNO0W4DISkBvNcRhiWR3IUYfG3P7NB/i98qxN5u2LvB8QcV9XfUoEO0smvsXnJpaPJ+g==
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr149386231cf.31.1760958459184; 
 Mon, 20 Oct 2025 04:07:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deec3856sm2410747e87.50.2025.10.20.04.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 04:07:38 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:07:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v4 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Message-ID: <f4dihh4z2nnkjcpsrmopycm6opellvv4mkpee72xjbn26nw544@sfc4oy6c2xci>
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-1-aa2cb8470e9d@oss.qualcomm.com>
 <58446b2d-560f-4a7e-890a-78ae0bb92908@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58446b2d-560f-4a7e-890a-78ae0bb92908@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8J9mWq07dXXL
 K+8lZ0EkK0HKt9JbPWeQLlJeyx2FBHEpxIFju1Fqzp/7M/EogUAr1R3SQC7KNAZVtq775E1QkhM
 pLT+JqUiIUda0PdUVDETEbU3wZMjdLCBJoS3asA1Tuz+yTc0xlgxPQsEPM0/OF99l20C+3RVaOp
 mVZsLlucDErlcBbN/dLYa9rNuY761wp+FGOP0HRhzXSZtVbseZb7yXmygPemDHUGJMfTpws67Q7
 HPYs0IKE5T0d/0QtYTuX6/aC2XHdl0jj6R+aN9IPvRoEPrkOv6GhGeZLAl3AtM0c/7kfi4nqPtN
 t9SyFQYhXLMq0cXMrYfhfYJXI/dV3dEbKDAttE6itwelBTule7V3GZLRH1zWBe65erln8hEDUBA
 YmIeW6BUTJbmhQ/mym/UjPPkEu0oTQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f617fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=3eJD8ZQ_GueHMKJvpIsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PsjzylVhwFpTDQGS-9H_0YM6CMTCKJqk
X-Proofpoint-ORIG-GUID: PsjzylVhwFpTDQGS-9H_0YM6CMTCKJqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Sun, Oct 19, 2025 at 07:13:32PM +0200, Krzysztof Kozlowski wrote:
> On 15/10/2025 03:53, Xiangxu Yin via B4 Relay wrote:
> > From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > 
> > Describe the DisplayPort controller for Qualcomm SM6150 SoC.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml     | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > index 9ac24f99d3ada1c197c9654dc9babebccae972ed..935eca23ce6b30b81b3ad778e5fcacc817a230c3 100644
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
> 6150 is compatible with 8150 or 8350? I have doubts.

SM6150 has the same DP controller as SM8150. SM8150 is compatible with
SM8350.

> 
> > +          - const: qcom,sm8350-dp
> > +
> >    "^dsi@[0-9a-f]+$":
> >      type: object
> >      additionalProperties: true
> > @@ -132,6 +142,7 @@ examples:
> >                  port@0 {
> >                    reg = <0>;
> >                    dpu_intf0_out: endpoint {
> > +                      remote-endpoint = <&mdss_dp0_in>;
> 
> Mention reason for doing this in the commit msg.
> 
> Also, messed up indentation.
> 
> >                    };
> >                  };
> >  
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
