Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9EFB3FAFB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1C210E65D;
	Tue,  2 Sep 2025 09:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMAnIhXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4943010E655
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:46:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822WuxO031339
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 09:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kuvcx9dK+4uPO7PcKf2xDvCA
 /wZvMuQBYtW1BRkUMHs=; b=bMAnIhXaL4tjXQoR242+kYg3wyyhu8xAaePglGcF
 rX5tb9HzfAvjws3tmxb8bkdJ2TKxWrbU9xEj43O1eD+HVJjlOMgxj24sZL0ifFU+
 JGPGBe0mkYm8Dsj+TkVgO7vcdqsX9MNKNYXdo3D5wMX1M9l2zdQIjVY4C0q88Xx7
 lMzcCHo8Rmiz/CvGGDJPKCz2s5zlaiBsqoF3uoaaYnV8ss3UkYTgR7tyzqTA00mX
 ub09LEkAnNUF4EsRb9ap87MR16rrRCcYmp8AcAGcvOoqT1mfVTvQl8WwUX5AgobT
 OiQwK0kRTpVrWwJ+HjHHv/LHOz+Celi5n2TutAWVr1VMyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw92rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:46:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b2ecb8e64bso62772611cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756806364; x=1757411164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kuvcx9dK+4uPO7PcKf2xDvCA/wZvMuQBYtW1BRkUMHs=;
 b=Ownmf+6BZ/zZ/CNh17r7fNfWb4P1/u+8D1yIVE2k1xOlFddvE9Y8Zr164dRJwklsbr
 Sza20dVES8dntH9Dh1KcYTx1f4xoXpTwYbovOe/D3GTiY23gO4gVJlVsv+g0IrZ8TFMa
 zdutsts2cnztMwiMJiqZC4zDfPJa7+pMq6nq/Ffw/MzzK+FJXKVMsmIj2BVhTzziU+kf
 VDpFYPjp+JwpZGCuTODCwtKynOhyehxdxpsNG2xLn7vp9vmhWTT/5HovqH+TQv828Bil
 F2hLJ6FwGYS+sQZ1MEKdlvOyQZ6uKlH/X7fIYBXvhtq8hKL8tG5JZRggUMhIJdwGFqBk
 E8AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFb4IC6Ab7+x+Xu85Ez2tW/dUc/nveK48a75fVdWh4D7Cp2V75cPfv+zMcvh8kqtnknxIb6rzMEX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLxl3cjkfr1ZLWzkC97B1noMV/VHC5CFTc6dXHN9inRRyebspi
 QxguR8vspinAZP6bsz3cN4SoF/ZPqjaZqToO87OYLaqp1ZnkWDrnsrTZ3XA9MDXRODLop5kLvps
 abZF/gBdV8gWQThAZvLaP1YfdqoEZD0ANhJ5OFTMWvPZSjtDOHBn3k35LvtfPyFHU//3nmfI=
X-Gm-Gg: ASbGnctxLTu9d8gpCt2ip4A/8i5fWij/h3uEfWnRKqzRQYtsKYNukGuK+5CSb5huQ9y
 vGS3QVutYska32QmIqQpSzBAyYyc25zEbin+bsKwn1mB4O2PUrTVE2C6o4w4HQV8e57qsZlaX7q
 djMcLkC+MDm9ZaVU62OQqD9GF6Kgcrb/jU1IUO5L8qO6wEKvDHjG86Q8Kai4LtTpikweagcRg6p
 0TC0Ol5uNikv+kx9tqzWsLBp3dBZz59VtKiSTpz0tKa5Uhvyw1znWfe57fiuVYZteDFnhLuGDkZ
 Sv+frSmLZojrK3R/k5bAwDYGXzaLFTTzRQ4jA9o03Ovh++JQvCDfZWdpvwqRWJw1WESkj9PAjU9
 FO9Iyaa5GpfrAyKuQsga4WidO/Lo/b0URtm0LbO41USwE4hhtJAQQ
X-Received: by 2002:a05:622a:1898:b0:4af:af49:977f with SMTP id
 d75a77b69052e-4b31d843106mr110962981cf.30.1756806364108; 
 Tue, 02 Sep 2025 02:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6+NH9LnUGOobc8Z3ipkGt2tyqr1PSej/+J4YRMh0RhCCuZpIUdsEIhFAtonApsNUh/JxvIw==
X-Received: by 2002:a05:622a:1898:b0:4af:af49:977f with SMTP id
 d75a77b69052e-4b31d843106mr110962671cf.30.1756806363442; 
 Tue, 02 Sep 2025 02:46:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c91d37sm3581281fa.19.2025.09.02.02.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:46:02 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:46:00 +0300
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
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
Message-ID: <tl4fskw6yq6rniwwqkrvnulfpgym3jswlt5bmulgquogv7xkct@6bl4boesilsw>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
 <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
 <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX87yPZvOwS/0p
 6SxunloLd8GJrSY4eBJCvKtWihT0JU4KT+TnnUF5Yc6akkadn9jsGWiYQyV7m/DU1Gyb0Oy6nq5
 tRDGmxR0O+Do082lbYBbd4qt7Fq0B3HD4gD9BS4f73ve4F0s/+xPrKN29ilpkgJz9iu5xuIQm0D
 Kt7kJQOIWlH9lEM6XuFopKwlXEoh5ZPlQlnD7QxFUkNJO3UMXVlfRe529ckKDRlG1plhhQu+uGZ
 p0Zh6IuRLif9G3gcpk+OaKLP6HKAhZNK0bCkvksHtHs2arA+Wc5iXU2mAwPzbnmLZc/Vy9Lng19
 DcuymZfyBJbDMoR03vyBs4geVrC6ZPGJPNWxCUQMLa4H0CkdnAT6RQKqXysplWzN3qMx57peeZr
 vYo7HNwy
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b6bcdd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=SY17gm6z-Ks54HuadOoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rsCvuGB0IJ8nfvl1WncGaX-JKmSKHDN0
X-Proofpoint-ORIG-GUID: rsCvuGB0IJ8nfvl1WncGaX-JKmSKHDN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On Tue, Sep 02, 2025 at 11:35:25AM +0200, Neil Armstrong wrote:
> On 02/09/2025 11:30, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 11:00:30AM +0200, Neil Armstrong wrote:
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
> > > Nevertheless those QMP Comby PHY can be statically used to
> > > drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
> > > etc... without an USB-C connector and no PD events.
> > > 
> > > Add a property that documents the static lanes mapping to
> > > each underlying PHY to allow supporting boards directly
> > > connecting USB3 and DisplayPort lanes to the QMP Combo
> > > lanes.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
> > >   1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > @@ -76,6 +76,35 @@ properties:
> > >     mode-switch: true
> > >     orientation-switch: true
> > > +  qcom,static-lanes-mapping:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 4
> > > +    items:
> > > +      enum:
> > > +        - 0 # Unconnected (PHY_NONE)
> > > +        - 4 # USB3 (PHY_TYPE_USB3)
> > > +        - 6 # DisplayPort (PHY_TYPE_DP)
> > > +    description:
> > > +      Describes the static mapping of the Combo PHY lanes, when not used
> > > +      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
> > > +      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
> > > +      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
> > > +      be connected to the DP PHY.
> > 
> > It feels like this significantly duplicates existing data-lanes
> > definitions. Can we use that property to express the same semantics?
> 
> Well yes it has the same semantics, but not really the same meaning. data-lanes is designed
> to describes the lanes layout/ordering, not the type/mapping.
> 
> Here, we do not describe the ordering, i.e which source lane is connected to which endpoint splot,
> but which lane is supposed to connect to which internal PHY.
> 
> Anyway, I'm open to suggestions.

phy@abcdef {
	ports {
		port@1 {
			endpoint {
				remote-endpoint = <&&usb_1_dwc3_ss>;
				data-lanes = <2 3>;
			};
		};

		port@2 {
			endpoint {
				remote-endpoint = <&mdss_dp0_out>;
				data-lanes = <1>;
			};
		};
	};
};

phy@cafecafe {
	ports {
		port@1 {
			endpoint {
				remote-endpoint = <&&usb_1_dwc3_ss>;
				status = "disabled";
			};
		};

		port@2 {
			endpoint {
				remote-endpoint = <&mdss_dp0_out>;
				data-lanes = <2 3 0 1>;
			};
		};
	};
};


> 
> Neil
> 
> > 
> > 
> > > +      The numbers corresponds to the PHY Type the lanes are connected to.
> > > +      The possible combinations are
> > > +        <0 0 0 0> when none are connected
> > > +        <4 4 0 6> USB3 and DP single lane
> > > +        <4 4 6 6> USB3 and DP
> > > +        <6 6 4 4> DP and USB3
> > > +        <6 0 4 4> DP and USB3 single lane
> > > +        <4 4 0 0> USB3 Only
> > > +        <0 0 4 4> USB3 Only
> > > +        <6 0 0 0> DP single lane
> > > +        <0 0 0 6> DP single lane
> > > +        <6 6 0 0> DP 2 lanes
> > > +        <0 0 6 6> DP 2 lanes
> > > +        <6 6 6 6> DP 4 lanes
> > > +
> > >     ports:
> > >       $ref: /schemas/graph.yaml#/properties/ports
> > >       properties:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
