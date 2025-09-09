Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0868B4FE6C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4877410E76B;
	Tue,  9 Sep 2025 13:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3RVKHfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974EA10E769
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:59:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LUek020161
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 13:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+e+m2eXxsaETI5+DzIMa5RUB
 HZ/+khiBv1BzAFhU+3c=; b=e3RVKHfIvyKU1oDik0Wo+ZvycmTxqZqJHGYPKKBY
 v1JnjNrQVxXdzu7H8EJwamY+kGanlkNCRKdEik3p5xmIEa9//LUW2xvByoJbPLdp
 rnVsrUMj4utvHOJUivDreQNssmyZ+itk0sIvg5WDL2+kwQYoC6uzhJcTF3AFuaVb
 0E0t09mHBPZdH4weIT0+3iYnyJDO+rzv/Qmu0F4b/GE0ezdGX8/WzERGlUKNqRNB
 5g9zeb/TimgZb0Q4KM2cParKdLhq4L7cj0UK0k5lmENxLF+m/cOVBSHWnG6K+9qn
 b8kxuZzuRLUzlOUB6yfD5qWB2cSYNJlOLe+DVvwzE9wjBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc24eed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 13:59:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso122435726d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757426340; x=1758031140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+e+m2eXxsaETI5+DzIMa5RUBHZ/+khiBv1BzAFhU+3c=;
 b=Y5UzC0y/9iEb9kgpp6zNKcv5gNbLhNRHURRlQo/yDvQNM4ikUnJRh+XAGkAMIrRxwG
 FqE05I1HTqnMLDPNcj77EI81HtKwkNgUVk9JTkrYlrXrAKN+M3gagkEVF94xCmPAZBvl
 hafEQGQ/bWSvpBYuuWejSTQa3rd3Zkn4d8BoGiwyC/ksOzuL7UGvzWrOIKSXmVF2a4V/
 lj4ZPd6JmQteqQGWp+FoAXBnkLrqhwarVr8JQvXp9fkw/T0D9jVtoHdt336XIoVfL0we
 myO/k8VUlaMCzrkA/EonDk1JxtCGZa5HRNbt133+GE94I3m8S1Lw5FvmzSXYMksJ7qV+
 6J5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM69oKtnuOu8u1FyjGPlBqBDDBU6HSJQ0hkPTymmgcrV98BedFsHzJqtZipZWuJF/HI5sNYb4Tyxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLzRkvaQv8drEWMt+/CkN8qTVZqbL3BgZ17yqiOcN4qSsiZOuQ
 47xlaz784Ra43tZShK77SZ4TrOrlk8dxaWz0D30ypiFDsw6dNf/0OqvL6AFKZpR7dKVjkG7JuSX
 4+LXBtvxsTd65RGnoPdFifPr7pb4b5wy/hpMEF34sbtGhaZz/uSQABPwkCMQFG9xu1ZLkchU=
X-Gm-Gg: ASbGncvIV8OHKYvK8TWj/J3RDuXUnWTXyyLcY3+IpUOaoW8Nm2Dw14SQKJOblQ8k16v
 HK9A7eFRq1sgVvVdz1bxoQYsD/6+u4RW8UqtEOz/PyGKZGond78LwkHbQTeS6bkcripe0sxDSZM
 fkJsxGynFz/rSvActapMakJ2RMaocCe4LfxvGzGj/EkWRCOoz/k0yruAe0Ng5uPnuefnKZVdwl+
 dY2Oc30tPmnebXbFTAlKW1+5c6wg2FRXcMexkcj3l92sw2XwXG+wSyLd88tQJCfaeYOBJzS5Z76
 /lpOhUITlCBnfeWG89ea6xTRRqP1+WNirqUvGv/BovRvMlnInioTW12RjERJaax6MwBHPgWKmSl
 5z2rAGjx2Arxa6ecaQj8l8a/D6V7F5tCDXhmOZPwAA2kph+MiaIb/
X-Received: by 2002:a05:6214:e6e:b0:72b:f322:6817 with SMTP id
 6a1803df08f44-7391f30353dmr118890626d6.10.1757426339780; 
 Tue, 09 Sep 2025 06:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx+dFgHWJPMSKPSEn7vDY6bmN0vj3HU50MJCOT7V8BOnFjo1dHoOhzTqahq+CmW1jyx6u1HA==
X-Received: by 2002:a05:6214:e6e:b0:72b:f322:6817 with SMTP id
 6a1803df08f44-7391f30353dmr118890216d6.10.1757426339166; 
 Tue, 09 Sep 2025 06:58:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680c424fb2sm548560e87.11.2025.09.09.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 06:58:58 -0700 (PDT)
Date: Tue, 9 Sep 2025 16:58:56 +0300
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
Message-ID: <dpidjyofawtrmci5lu72gdnwxxws57sw55cxxedkhsq2dryohm@cdxjwnros57y>
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
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c032a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=r0EWWIcaWpoI38bJcbMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8F23-57OqXIQ7IgUZHRXRnjiubCgfBpr
X-Proofpoint-GUID: 8F23-57OqXIQ7IgUZHRXRnjiubCgfBpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX+Gd9pJXZ0LJi
 qkRG0M7XtfE7TDxNxfztle44Ne6O8wvHIxylspfWAAoIwxIQsqpvqFWSrM9wWCUsEUPVi7D9Jrt
 tOsQNPs+S+vDcRv+BJ9XEfQcIH35Sl2zkiCYgRYT0cltSeAYuzdYxStFtZN9z22hHKKEEElq2WP
 SNdrWUxp2HF/gS7rtxuA8ftae7doMi6alLvobAZt0+ZXhWKMcbo1jB7HqPTclMFF538QfB0mXlv
 TwffUIsDpJqYFpXc19ViuxhIxUuV8Y2R4bTuWr/psRlOth82qVvebWAYNo9lGnt/+0sYapcQ2+7
 1X/mK+fr2n+KaB0/PZgCswO6bWGkbHGrLP8qTSep4wIXW471MOJNyfbdUZogmPJkeYbkMc33HVZ
 e5WKiIWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

I think so too. So maybe we shouldn't list 1 lane separately here.

-- 
With best wishes
Dmitry
