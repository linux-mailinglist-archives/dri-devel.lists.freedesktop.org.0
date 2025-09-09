Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856FAB4AB61
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63BC10E23E;
	Tue,  9 Sep 2025 11:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xl2FMTZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDFF10E23E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:16:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRj7023874
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 11:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vyy6UuL4wRzAkGNDFXbY0fdg
 2ceTtxqY7qR0Dof66IU=; b=Xl2FMTZjfPIoZoUT3ZV/L/GYQV5HRjk1ixzGkyUw
 ht/7vZwdNMLyCBbZ/9d6Ab3y8qlh8+GCYdFItSiipkxwJvSA81nuy+4eRDEuVwRy
 iVV8Tcp360raq7haaloVG5zzFn2FbaOHcOEiVmIjn1S1hnvYCr3+2HTiZpEaBVlr
 DddqT4nl6otzuLXOf7U0wV8p3B9oQv0WVBz+BmYrB1nk58rE7u4sbh3fs8WH/XyZ
 sUbZ5GBbLZv++YAEgvPaz3hOSSV7iBRzI2vqXt46KUcIGGsM76/3qVa94iO3XLJM
 M62IjwR92msjwIEac9CRgdU0730+RhGmFwKg76DPMj6+aQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by901yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 11:16:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7224cb09e84so119897526d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 04:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757416570; x=1758021370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyy6UuL4wRzAkGNDFXbY0fdg2ceTtxqY7qR0Dof66IU=;
 b=c1T1m3/VWmgMDYhslWPqVYtPydVyiB0CaN1MD03B/cFFvNuFZXETS7M4gWGkZ/eaVG
 9CPZsRw5DPJydo/6lLmJEjG/yPwoIduTKp/3aQUuxOJz/oMQlLujCFHlnHTcoeFOnO4l
 2BY3jTxLsxvVXI9XQdW+3eu/4V64zRl4ZYpfEwrKeuCwBavObQ/TJTBi6vqGK7tPnLJy
 +W1f5B5VBwN+5ugzlSULqU4LouhUaOmMXg2R1SqZL5baDppi93ZCF3bW1gn4qN3JDrHe
 JpHfgGj/uTo+UGnb/1Tjif3+VxvDSr++7h5x3hnDjiyVkAvpaG23GYuc0J3e7rGNJDnv
 nwXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk4m6zbDcCu8CxRHgWaVZUh+8wQL+GsYF/q0jDpDT978y5SkXTEnpqCh/9o4OAbVA7Q/H9+MERdmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqoDOYcbe2UFnPcNhinkzpBBToHuHRipgdtBCznx6twU5gp07B
 QthuD54S3VViVj4cHPLA40rDzWJ4kcOlrZtw36zAkma/a1VteH1p+85dYWxMKH8wtEBCU7Uav6E
 JmeV7Q7NKQp8CX+QnQ6R+gWnmjctRpSTyGBOUyZT4YNLwWWtZdGLMozSyApa6PxZ4qULw9lQ=
X-Gm-Gg: ASbGncuQo6sKis0YjOOx6A4peIbg2SSiJJ5EOMuYgS3FOmw0eAovqk5c5W4AF9bTrUS
 kaOd8RpnY1uucf2tYcOWTNp/ptsixvYxyL1UCzmV8G/a4K8qJfy4j67jA78G8iYWXE3RUD+RhP1
 rJqEyaQ5toFLAIpSAGFOqd5vOjX8Bgat/+04OzO6+3V/q4Rf2HPTLgpo5GT1U9BbwQ1zxjFmafp
 c/TbQ+1fULBk6ZCboqpdBkt/73DoivTkqsyQLlSPY8jAjljMSFeNtO5X/o8zC75Wavzpga2cGVh
 XqSPXe37uG0xnobKkfipM5YEhNG1X2gTWTpL0ZJLsfkw+gL+3lxMFL74KZq9u5Pm4KtOAQCIqub
 SgXoL4Ww3LOOkYrzIfY5RPqvuJqJJ8iiqoVy+gZ8fKtE7lt398fKE
X-Received: by 2002:a05:6214:489:b0:72a:87e6:f8d9 with SMTP id
 6a1803df08f44-72bbef339e8mr151682506d6.8.1757416569498; 
 Tue, 09 Sep 2025 04:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY1tTjvV8h2NSrNoZ1Pf5XTkOvg9H6zYxJVAlIs8vECDwJ1Ls71vAHDYTRO2mKRmYsJzgvZQ==
X-Received: by 2002:a05:6214:489:b0:72a:87e6:f8d9 with SMTP id
 6a1803df08f44-72bbef339e8mr151682146d6.8.1757416569008; 
 Tue, 09 Sep 2025 04:16:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795d482sm442455e87.75.2025.09.09.04.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 04:16:08 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:16:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
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
Message-ID: <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
 <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c00c7a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=Ywig2pavXv6aIl8GUcoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wgBdY049ZaJcZWvpW4AGMkb9doqgyb-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX1+ngGVMWC9d3
 ytW1uEy3lHy1BkfvzD+UKF9rQZtZABOQdGcLel6MugRHkDPRd/z40Xo2OtMDs8iNoadkT8wSYKf
 OeB2GI9TN4km9hblAV7mBgzSu+Y703ext+Mrs3KsdjRRtzQvSS4Sa/dKz86QxkdwoJaZNF54db7
 wT6DHMlluoURfISb2xtxTKjsjlfu4x+dolXrDCR5rjoWlu9l929sw7xjPNmTNwopehjDRj+G5Bj
 S8s9y6XHmpIqM9XNTrk8bX6IV6kOxnjLNo5Jk0GndwGKjT1QnYhu68mlPNBYLR6Cr2Te5QAbwjB
 EmrFcTAF8EIMjFCeStOx1sU5Ccp/EIpkDIBZCxhlIen9cm4GngpQ+ckib9RTA0GRbxfjwTRkZmt
 83745aKP
X-Proofpoint-ORIG-GUID: wgBdY049ZaJcZWvpW4AGMkb9doqgyb-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Tue, Sep 09, 2025 at 09:14:49AM +0200, Neil Armstrong wrote:
> On 08/09/2025 23:14, Dmitry Baryshkov wrote:
> > On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
> > > The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> > > of a combo glue to route either lanes to the 4 shared physical lanes.
> > > 
> > > The routing of the lanes can be:
> > > - 2 DP + 2 USB3
> > > - 4 DP
> > > - 2 USB3
> > > 
> > > The layout of the lanes was designed to be mapped and swapped
> > > related to the USB-C Power Delivery negociation, so it supports
> > > a finite set of mappings inherited by the USB-C Altmode layouts.
> > > 
> > > Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
> > > connector, DP->HDMI bridge, USB3 A Connector, etc... without
> > > an USB-C connector and no PD events.
> > > 
> > > Document the data-lanes on numbered port@0 out endpoints,
> > > allowing us to document the lanes mapping to DisplayPort
> > > and/or USB3 connectors/peripherals.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
> > >   1 file changed, 58 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > @@ -81,10 +81,67 @@ properties:
> > >     ports:
> > >       $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > >       properties:
> > >         port@0:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > >           description: Output endpoint of the PHY
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            unevaluatedProperties: false
> > > +
> > > +          endpoint@0:
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            description: Display Port Output lanes of the PHY when used with static mapping
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +                minItems: 2
> > 
> > Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?
> 
> So the PHY already supports 1-lane, but the QMP Combo only supports
> mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
> int both in & out endpoint and still should work fine.
> 
> Do you think this should be done now ?

Do we support it in the PHY hardware?

> 
> Neil
> 
> > 
> > > +                maxItems: 4
> > > +                oneOf:
> > > +                  - items: # DisplayPort 2 lanes, normal orientation
> > > +                      - const: 0
> > > +                      - const: 1
> > > +                  - items: # DisplayPort 2 lanes, flipped orientation
> > > +                      - const: 3
> > > +                      - const: 2
> > > +                  - items: # DisplayPort 4 lanes, normal orientation
> > > +                      - const: 0
> > > +                      - const: 1
> > > +                      - const: 2
> > > +                      - const: 3
> > > +                  - items: # DisplayPort 4 lanes, flipped orientation
> > > +                      - const: 3
> > > +                      - const: 2
> > > +                      - const: 1
> > > +                      - const: 0
> > > +            required:
> > > +              - data-lanes
> > > +
> > > +          endpoint@1:
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            description: USB Output lanes of the PHY when used with static mapping
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +                minItems: 2
> > > +                oneOf:
> > > +                  - items: # USB3, normal orientation
> > > +                      - const: 1
> > > +                      - const: 0
> > > +                  - items: # USB3, flipped orientation
> > > +                      - const: 2
> > > +                      - const: 3
> > > +
> > > +            required:
> > > +              - data-lanes
> > >         port@1:
> > >           $ref: /schemas/graph.yaml#/properties/port
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
