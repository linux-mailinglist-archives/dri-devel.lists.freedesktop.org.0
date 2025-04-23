Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEB2A98CD9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6BA10E037;
	Wed, 23 Apr 2025 14:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kP9i0Uk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D3310E6CA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAIRH0016863
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HN13lzHJhjhAHQ7DzaU3+eE3
 OP7KRXOmcYjBHTkaM6o=; b=kP9i0Uk/AiiAAopNcloHUilfAZz8tMkN1knh3Y/Q
 fZ5/GBH+8ruzKSyCyB6L5XaIIzCd26zcL/Y43QrzcF5pUaR3wTuCVdwQEC5Vocfk
 BPV5l26tUD7xwuJuu8PeJ2YE2if6mIVUBzBpJw/S1SI7SrBMZPMs/rcv+OoNCWnQ
 KI2u50KE9E2FrjAhEBmQHfRAuq59U5aRTjO5C6IPfGNkNypecf5+SZCVl3zXQWP4
 wGYaMsLyMbhnTcOGnevgryvXO1zgJR47MOBRNZ3HRQBgrNgk3MUQY/GbRvrQBLIF
 c8tkqCHNUBmwJt3RdDTfBElz6VvXNy623auGQgEsX7fv0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh02dcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2872e57so1043401485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745418215; x=1746023015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HN13lzHJhjhAHQ7DzaU3+eE3OP7KRXOmcYjBHTkaM6o=;
 b=ZyzHlkBjNoWORGYoYBzRASI1Xwg8JCoQ6nsvI2e0LxSOeCIx/IJvjMALwqKo8eg2YO
 9MvtzizVqxpkyVBH2SHWlQpTc2EZ3Vdzz9Qho/on+6IdX3Wmeq/+LEKrwgzQT0uZBwhV
 PD+FuFvtbhSgNL6F9bxDDoFoke5WNvLw2VoMwiZdQXz5VdtoMrLt0zgbXsQcyBCnO53/
 IdvIcLAWssY7gCpb1HW93SWVbt3Q3G/l6SYaJAliMKUc0y5BmLXs2KKoJW8/p4mgQryL
 DvdTQ1CZmIwDbXaju9CM4klnOPeZQGjLc79YnkZbDOlHhcXmRyFMnBgbRcmziXciCgYI
 Etew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG2fUglC+zcVn1o1JBZFoPWiowSGw2xWTCups4rWGKoD3KPYTkhRAT8EBaVXwb7PCF7JYJAa4z1PM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+aWonvsD0bxSvJTNl4xAPufxmiovrvauM4qtuhRnt2DE1W2Db
 hOUbinzKvvtvHQ3rB/Ao0JRGmyX2XdV20n5rVhZkXIizeioE1M5ENL6EinWPAKFT7sK3QbxmtQF
 wqn2G/3Pkjl2FE5crS+0NJgojk4RT+7ZED5LrRxmjxUdDIkNEMXQxLOExTJ0FsjJ0jHY=
X-Gm-Gg: ASbGnctALRE97/QInURSx4q1T4VzAp0tGT9AvJfFhOBAq8k44r02j95XaLaSfqEQpDx
 LKtQqhnKqYFmSdx9bSscPy0KyNQRwT6GjWPH9vp/uKh31oLHHqzzjJicd++x1aVWjveYrTFNjR5
 f6z6+rZ/6ycrM/7l9tJ9u6wEazb8C+oSxb4+N6dwXuqg/4lx7ba4ZZ0pwL6059Zuhm47bPwxd/P
 etc6TndNWe9o+k9wNhwcE2ukfEGEzo42pcdfBR9gcyyjz/GF8N4G70E7OQiFFF5ywJ3d4LJKOMA
 e1fgjwp85+5T0dvzXTRP3ECXTeS9N4Uxqn/sgD1Kq7hDqHQxgTBvRE4ndcz2cg8JQ/x4zC8Ev9U
 =
X-Received: by 2002:a05:620a:3184:b0:7c5:65ab:5002 with SMTP id
 af79cd13be357-7c92805e97bmr3832035885a.49.1745418215621; 
 Wed, 23 Apr 2025 07:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYCQwVaTtgeAr0Y2QsW4Y61GBBb5WaCrUzzlKbngnnQyJ88rtPHEhSHsXxrd8l2Zzdb7e3JQ==
X-Received: by 2002:a05:620a:3184:b0:7c5:65ab:5002 with SMTP id
 af79cd13be357-7c92805e97bmr3832028585a.49.1745418214974; 
 Wed, 23 Apr 2025 07:23:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-310908639b5sm19424941fa.112.2025.04.23.07.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 07:23:34 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:23:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
Message-ID: <2m5fq7whbvaq4sbbxittxhbksw6erfotlwalrfevujq4mrt3kk@ctbgwinz2o72>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
 <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
 <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMCBTYWx0ZWRfX//3xOhazEWIe
 ZuBzpfHOpfXS/3WrEZWFXm9P0PG8TP5aLXrcGuAYsOBLneG2B0R2TRYhM207Q4yGCArWvKiUiJk
 JY6nbbiDEFV/SsC7ECCc4TkmaYX1HU3M1060u1GqQ90oaZvn93wVmmHiFxhDpRls4qPHp+bjY3S
 /E/4YjQDvisRk8G91EkzmvjT6Zt9jp1cDPUP9dW67iC+6BPJG4RCMptiGs0aBEBUCNNgKhcA1oH
 PGj/dP0nLyYyssKugziQKF2AwR2xwaiWL9Q2bxq4DxLOv7O7XLS9ucMGU23WfHvrgFB2rLL33tO
 bQPwTJPHNKl31ToprZoC9cWPk3Sa2/hsvKMu+yw2UiynRS/wcNwnHsQ/FB1SzU7O6G/MlyJqy8G
 PmP4ySORAWRjR5yfrqni8H6HmsG7/A+CwP2SUKkWzUuKGqiCLgT6VFDQ5vokoVAzUPt/gdUn
X-Proofpoint-GUID: Q2iDlewFEU4Z2oOQmJebYptRMCy1o6Ap
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808f7e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=yirWvuRTZ6qJcAQw2TYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q2iDlewFEU4Z2oOQmJebYptRMCy1o6Ap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230100
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

On Tue, Apr 22, 2025 at 07:46:57PM -0700, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:43 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 07:31:41PM -0800, Abhinav Kumar wrote:
> > > On some chipsets the display port controller can support more
> > > than one pixel stream (multi-stream transport). To support MST
> > > on such chipsets, add the binding for stream 1 pixel clock for
> > > display port controller. Since this mode is not supported on all
> > > chipsets, add exception rules and min/max items to clearly mark
> > > which chipsets support only SST mode (single stream) and which ones
> > > support MST.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
> > >   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
> > >   2 files changed, 38 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 9fe2bf0484d8..650d19e58277 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -50,30 +50,38 @@ properties:
> > >       maxItems: 1
> > >     clocks:
> > > +    minItems: 5
> > >       items:
> > >         - description: AHB clock to enable register access
> > >         - description: Display Port AUX clock
> > >         - description: Display Port Link clock
> > >         - description: Link interface clock between DP and PHY
> > >         - description: Display Port stream 0 Pixel clock
> > > +      - description: Display Port stream 1 Pixel clock
> > >     clock-names:
> > > +    minItems: 5
> > >       items:
> > >         - const: core_iface
> > >         - const: core_aux
> > >         - const: ctrl_link
> > >         - const: ctrl_link_iface
> > >         - const: stream_pixel
> > > +      - const: stream_1_pixel
> > >     assigned-clocks:
> > > +    minItems: 2
> > >       items:
> > >         - description: link clock source
> > >         - description: stream 0 pixel clock source
> > > +      - description: stream 1 pixel clock source
> > >     assigned-clock-parents:
> > > +    minItems: 2
> > >       items:
> > >         - description: Link clock PLL output provided by PHY block
> > >         - description: Stream 0 pixel clock PLL output provided by PHY block
> > > +      - description: Stream 1 pixel clock PLL output provided by PHY block
> > >     phys:
> > >       maxItems: 1
> > > @@ -175,6 +183,30 @@ allOf:
> > >         required:
> > >           - "#sound-dai-cells"
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - qcom,sa8775p-dp
> > 
> > Why do you need an extra platform conditional?
> > 
> 
> I expect this list to grow and also there can be chipsets which support 4
> streams as well, so an extra platform conditional was needed.

Ack

> 
> > > +
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          maxItems: 6
> > > +        clock-names:
> > > +          items:
> > > +            - const: core_iface
> > > +            - const: core_aux
> > > +            - const: ctrl_link
> > > +            - const: ctrl_link_iface
> > > +            - const: stream_pixel
> > > +            - const: stream_1_pixel

You don't need to ducplicate the list. Just specify min/maxItems.

> > > +        assigned-clocks:
> > > +          maxItems: 3
> > > +        assigned-clock-parents:
> > > +          maxItems: 3
> > > +
> > >   additionalProperties: false
> > >   examples:
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > index 58f8a01f29c7..7f10e6ad8f63 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > @@ -177,16 +177,19 @@ examples:
> > >                        <&dispcc_dptx0_aux_clk>,
> > >                        <&dispcc_dptx0_link_clk>,
> > >                        <&dispcc_dptx0_link_intf_clk>,
> > > -                     <&dispcc_dptx0_pixel0_clk>;
> > > +                     <&dispcc_dptx0_pixel0_clk>,
> > > +                     <&dispcc_dptx0_pixel1_clk>;
> > >               clock-names = "core_iface",
> > >                             "core_aux",
> > >                             "ctrl_link",
> > >                             "ctrl_link_iface",
> > > -                          "stream_pixel";
> > > +                          "stream_pixel",
> > > +                          "stream_1_pixel";
> > >               assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> > > +                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
> > >                                 <&dispcc_mdss_dptx0_pixel0_clk_src>;
> > > -            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
> > > +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>, <&mdss0_edp_phy 1>;
> > >               phys = <&mdss0_edp_phy>;
> > >               phy-names = "dp";
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
