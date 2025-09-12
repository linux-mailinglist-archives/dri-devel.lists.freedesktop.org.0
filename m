Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F3B54CCA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6951210EC27;
	Fri, 12 Sep 2025 12:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERMbbQEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970EA10EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:12:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDME015038
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zI8guBb3Lo60ZeYXEP0MXbu6
 oVCoqd2RpOjF36niL0E=; b=ERMbbQEIEeC7btydKuXkpC0mwnfj1F7Ywp2yIK+Y
 p0xIR881VWrMk5qiPUA4VMMUlXNe+85sKGEbX1sj5wohtBp22e7uwOdcHhxTdtyW
 SiOQ29t8n5XmP4/USzu4AdHykf/SEYvTF0y7bUmPU6mNpyyXzVBdYjRp23J2UE6D
 ywGwqEn//5Qsuc1E7NNAgVAfX9hxAAHJN91zR/QDcTm3rNroYNm55fipI1483YfN
 27wBLYz5yW8IffYX3cEhIGWswS0VkRX7VDo0Zk0pdmMNMlUtkssLUhEZdPMyEzd5
 nbxEvwCX/tOJD6UMCM+71b06AjOgcpTfuVVQkzUfIovT3A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapuujf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:12:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-768181ba081so14422736d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757679159; x=1758283959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zI8guBb3Lo60ZeYXEP0MXbu6oVCoqd2RpOjF36niL0E=;
 b=KF1b8lKaavVCAhRYotrRHqDO3Tcdtp+lvoNqm3jWevSy8YmffLxCyBGBCn196rDvhF
 Yp0zilZZB7BNEZnzz7OyNZuCUTelKcc1m9mX14sqESSiRHF/nEGOG/SCuLo8cxTFn55Q
 DgK4i/EXZF00muJUCDYg8BQ02UxZvT2hSoBgpMF5LWnK98yr5vpryvlQqYyfe0d3MUWd
 Tkre16qHskqPdD+3qWfTosNW2KLNY0rTQYvne0nRMVADbvWY/l2P8YmqXSSDNcnAAC1i
 JvYERxc8GhCrgGBBvxeABtFmzBBvSlKlzSRyd8JTbJBMG2tbm/T9wwzXzyWGKchE+zQN
 kQBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp3TsBsukyfeX+1GufdLtG3zo8pCETn4QC3n4/5p0HWDakUYJ4+vPECL87Mpqrd4gyL/tGfiuJHB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq01KrPe0XXF0ZRzmMKk5pMCcsOqjf3pRVklUYRfMV6oRyiCd0
 ysEcWjg/lazSUhWSxp/YwAAInP3xoJeeN1icGrC+JFsEyXXBgJd8K5V2eEUf8w+2dCjPzTQ93P+
 6hKcDysriKKcojm1BdMrSFXLZUA9Spe7374yH9rqNJi+jTeZ/+yYtFWHw57mltd9YWtfWHD0=
X-Gm-Gg: ASbGncvVdysU+9L8n+kMGKa+STwfxWx+Q1S8Nk5AqJb1vWToLEcu8cXndgBBm7Tkqi4
 t+qspJ4ixDKQFYTRyOvRCarr+M3gdxbvTh+Bmmaix8FiA7a4lksURACXvGgOKmPPerhjvvmm/8O
 rTszQ3TmX3fPvf2WK3poeGw1QSr/6G+kP11JuSq2UVT28eT95/Ueq6LSt7kgn1auCjEoVNB4ciN
 fQA9p6pEhMChnKiJRiT/33A4KV1L/s4WZ5R5wHDAha8jZIYpf9fXc3hQxLC+5y3c1yKVjFxQds/
 0hmB7Z0V4+23RY/zNAm+YELNfXgS2kelzuWslcsp7k3jfWzKKtAkVfZwg0vz2hK0kHBracYEeSA
 jO9iLDGi54tt8TwwnfHAlFE0RWaiX+SGMGegXgW0eWAdx0gWDOMgB
X-Received: by 2002:a05:6214:e44:b0:72a:6d80:89 with SMTP id
 6a1803df08f44-7621f5326bcmr84955626d6.14.1757679158490; 
 Fri, 12 Sep 2025 05:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETqAAx9aPZRKQ9jf+u+KmM6Kvfm0l4R77YKoWyoC00QsU84Zpj1UOrIYuydwW4MVV7TmB7Pg==
X-Received: by 2002:a05:6214:e44:b0:72a:6d80:89 with SMTP id
 6a1803df08f44-7621f5326bcmr84954736d6.14.1757679157622; 
 Fri, 12 Sep 2025 05:12:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1b2a925dsm7684111fa.46.2025.09.12.05.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:12:36 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:12:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Message-ID: <rioswugtt3v6f6qa2w5qcmnqjzuxkm372sgovdy7cj3g2jfxru@tg2bdy5hxjhr>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
 <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
 <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
 <da984d8f-85ae-44cf-8de4-208bfc9e292d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da984d8f-85ae-44cf-8de4-208bfc9e292d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c40e37 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=r0EWWIcaWpoI38bJcbMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Wq4NprNvqmzZINTvA0OQMA4fu078qOoc
X-Proofpoint-ORIG-GUID: Wq4NprNvqmzZINTvA0OQMA4fu078qOoc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXztBd0UsnI8yu
 tGXcPbKGL9i+EG42UgE0s69Cod0fSR26yVC7BnBBwWxxjjHOWpXnvQdrxvJOkSulaA6dHeQllmR
 giIq5gDuQpooIdA5RyDc1pJEDVWi8smBUZAkXve0eUTrOTAVZsMxKfWZaW7KTbNKJaVwb+tQ0bp
 1+npaY7iRcwofXa62kioZGoijD4EGpIdsdpRfA40Kl6+V4seyJ8J4scwKbek4YmsQR5uHqRpymm
 kju+7cZDrL1yKPrvCRPU1NLzwXEMVogCzsmPgmY/GC/KeTfmH4x5osieiLP9V1nZ6qz0BQ2ttPN
 hWUdzUAmIyuWdyB+GGEGf8qbYHus7PPQWfXDExqVUQQCJKnTrUdPy9rq57edL/aPNPRmjOIP6UE
 USEGqNsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Tue, Sep 09, 2025 at 01:21:19PM +0200, Konrad Dybcio wrote:
> On 9/9/25 1:16 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 09, 2025 at 09:14:49AM +0200, Neil Armstrong wrote:
> >> On 08/09/2025 23:14, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
> >>>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> >>>> of a combo glue to route either lanes to the 4 shared physical lanes.
> >>>>
> >>>> The routing of the lanes can be:
> >>>> - 2 DP + 2 USB3
> >>>> - 4 DP
> >>>> - 2 USB3
> >>>>
> >>>> The layout of the lanes was designed to be mapped and swapped
> >>>> related to the USB-C Power Delivery negociation, so it supports
> >>>> a finite set of mappings inherited by the USB-C Altmode layouts.
> >>>>
> >>>> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
> >>>> connector, DP->HDMI bridge, USB3 A Connector, etc... without
> >>>> an USB-C connector and no PD events.
> >>>>
> >>>> Document the data-lanes on numbered port@0 out endpoints,
> >>>> allowing us to document the lanes mapping to DisplayPort
> >>>> and/or USB3 connectors/peripherals.
> >>>>
> >>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> ---
> >>>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
> >>>>   1 file changed, 58 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> >>>> index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
> >>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> >>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> >>>> @@ -81,10 +81,67 @@ properties:
> >>>>     ports:
> >>>>       $ref: /schemas/graph.yaml#/properties/ports
> >>>> +
> >>>>       properties:
> >>>>         port@0:
> >>>> -        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>>           description: Output endpoint of the PHY
> >>>> +        unevaluatedProperties: false
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> >>>> +            unevaluatedProperties: false
> >>>> +
> >>>> +          endpoint@0:
> >>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> >>>> +            description: Display Port Output lanes of the PHY when used with static mapping
> >>>> +            unevaluatedProperties: false
> >>>> +
> >>>> +            properties:
> >>>> +              data-lanes:
> >>>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>> +                minItems: 2
> >>>
> >>> Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?
> >>
> >> So the PHY already supports 1-lane, but the QMP Combo only supports
> >> mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
> >> int both in & out endpoint and still should work fine.
> >>
> >> Do you think this should be done now ?
> > 
> > Do we support it in the PHY hardware?
> 
> I don't think the PHY cares if it's 1 or 2 lanes

After taking a lookg at the HPG and the driver sources, it does. So, I'd
say, please describe 1-lane mode (which most likely can be enabled only
on selected set of lanes).

-- 
With best wishes
Dmitry
