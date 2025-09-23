Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC7CB957B0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 12:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5590710E5E1;
	Tue, 23 Sep 2025 10:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCT5YuN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CA310E5E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:45:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HG1L006717
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QliD1n9xy/2XCUdFKu8941e4ETR46EUUmd/ECFnedT0=; b=TCT5YuN5yyg6V5lP
 +oPpau14OqQ5ZlUfTkPDvNWoBDr2ZTf6SP0fcIUFURx7R5Irl044q0/EBTDc8bAX
 Jt/xhkAUFIQFLBDJqprwVtOllYO17qb0yr7h4X9zF/pxBFRcTsfpqTo5G2sLI4LN
 TfFkaoStJuEIYuqLxKsxlWJnu74ZEYCceuG6t7xnV32CmD3gbzqjJMHTwi3Hhcqh
 Yf19nlw13fF7+H7IBkz8DOMa5xJKkAdAS1w/qJ3qiFKxRRqamdbiDdwGWV7UDORI
 BBCdohVva9tBmBSEg8i7U0BY3oyDEWauOfC+TO8cTeblrrmjpT+8zH1V9TiUplec
 QN8wjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhraqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:45:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d38dbc0e29so11970861cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758624343; x=1759229143;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QliD1n9xy/2XCUdFKu8941e4ETR46EUUmd/ECFnedT0=;
 b=Bk3AxBIif02d7YknYE2aK0Sscf61LDz+Ut22Bq2zqYP5OOEV/Jp8QADRopOoz2/OlA
 zIxQgnlqvfywBU/pMMzGxVddQgvZAO2LJHiPyn9Vu+xxD2zXOiu3SC5q7RQL/06IYlXY
 1Z4sD+D9hI2u/EGvNU849f5QHzfdpTqATQOOmNguU4IlZN/QhG3m+KbogfGyjB9PtvNs
 vrmQIn/gnRHfIl0v3CcUx4jVCc/FlvD8zCc7dZTAnWEgcUQfRGQBiK3Vn6kqK5Bs0NNe
 oi0kNNE3VYl1pJgipvjicz6oMa88L+9e1t+8XGLbRbSmBUDVEpjWP7fFnS3um0sQF64m
 GkEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6jGtTzNg/T0LTmVrmePukErQng1MoAhzLyKIQYgtgGtsODu87RcsJ3gu7Z9ZINGgdGFtoUod9BwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7TUtF1CyjzDfKnT1kMcXLPT+hqSZSDvntprbzHMd6hV2WR78x
 bJwZX0dKeuZiCECVylfHJIdnRVvYikrLqWVphtm1NMVEH8aN7MOOjzfsmLu+SeMpt3NLjajPRXy
 cbM4Pu2Yss0vqLe9WCJxMuL3abAF/efjxgjccR+bV0iDmHZf3Jnb8XF1bWmsA2ZwRC1giesk=
X-Gm-Gg: ASbGnct4Tx4Fv+9uNENy3xDay0eYdnw+62zfy8zzq3RPVrentCD0PZBnjABkA3t52Bu
 eRQYtC4Vc8HWgY0vsZDNap+RhMZ7SphzwalwHBCCri8Blb9EbatCR/oNYzoRMLXLyuhR0vpJc3F
 aQAEK2gKO4RJVrcjdg2NeWWxHbNi/oyYWVKPkYn3ABjDPqQKS6bXL6G0DuO8pzeaPK5thvMjg6S
 YmsmGYOi4w8eVZYLfCqUGT1LshWwVQQ76ZyZ/7yNYJ20t6FaZ1KffaiGQ+dR1F9UFC9CjWYK5Kc
 jgd2x559GSLGaMonmQS+Lg2/YPR0qmKIeoAUa408zg3sOwMfYzLvBFVI48s8XM8JNC7KEVoWZLP
 /L0u/popEAp/A/OwCKjU8sv0+ohnn/rJ2034i43RwJkH56ZWHmszp
X-Received: by 2002:a05:622a:553:b0:4b7:90e2:40df with SMTP id
 d75a77b69052e-4d36708263amr20612721cf.1.1758624343337; 
 Tue, 23 Sep 2025 03:45:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiYj54pkLfQJi4mBKnM8awsCwLOK/0GZu894Y6oYBprrn+tmmkltO3sOFH+V8iuDnCGbKBNQ==
X-Received: by 2002:a05:622a:553:b0:4b7:90e2:40df with SMTP id
 d75a77b69052e-4d36708263amr20612281cf.1.1758624342548; 
 Tue, 23 Sep 2025 03:45:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57c56d475a7sm2237990e87.42.2025.09.23.03.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 03:45:41 -0700 (PDT)
Date: Tue, 23 Sep 2025 13:45:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Message-ID: <p3kgqn3euumhysckh4yyqavqv5y6any5zcrgkrcg3j5a7z7cyw@lfpkla5p3put>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
 <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
 <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
 <8396dd15-9111-4ceb-a561-6ed57727546f@rock-chips.com>
 <jm32ujhxslsx5snes4o66t2grb5uxhsaapjqahektfck66g6hb@fx6f53yojlcr>
 <dc554831-4368-43f0-b92b-896fd920e239@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc554831-4368-43f0-b92b-896fd920e239@rock-chips.com>
X-Proofpoint-ORIG-GUID: wxPFTW9DVHWnCR-sTafuMBhdJ06ryiLf
X-Proofpoint-GUID: wxPFTW9DVHWnCR-sTafuMBhdJ06ryiLf
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d27a58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=JfrnYn6hAAAA:8
 a=s8YR1HE3AAAA:8 a=KKAkSRfTAAAA:8 a=Y8DisfNwMWTW2FRaHhwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=uGDpjx9DKq9E8W49yboe:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX2cs8ZapLVoS0
 r8Z1cQzr/rtpJ01yDoSHhGfrepGFWGP3COa+NEajCbchN5meTYVOkTItkYYmeix0NWZh1mbZzmh
 mL6cHkCbTm+3dFJAFuZaGmsv5OoCzTO83fMNwLhfywxN+UH2yE3U/e4UL0RrKIHRDkxAI2OGPoC
 jCisfhgoACO9rBdpkLXBZiHnp2UNLj8rZetaR3TPMtO5dgUxsVyv4igpFJ+5P/9l4dtFxuo3D5Z
 KBqmMxtOUKd1I8+f3s65LSBlT7R1MXToVIeRnnOLsWZZimvQvL1n7ybUvPhQ8qbo/lP3V+sbPqS
 6smt7nri9r/SozytjuhOKLYVEzB7Oslee44h5p0leBiqcLvr1EBb/mq1ftit4h19vk0A007PI6R
 7M00nqq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
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

On Tue, Sep 23, 2025 at 03:17:20PM +0800, Chaoyi Chen wrote:
> On 9/23/2025 12:51 PM, Dmitry Baryshkov wrote:
> 
> > On Tue, Sep 23, 2025 at 11:40:33AM +0800, Chaoyi Chen wrote:
> > > On 9/23/2025 11:17 AM, Dmitry Baryshkov wrote:
> > > 
> > > > On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
> > > > > Hi Dmitry,
> > > > > 
> > > > > On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
> > > > > > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > 
> > > > > > > The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> > > > > > > supports software-configurable pin mapping and DisplayPort lane
> > > > > > > assignment. These capabilities enable the PHY itself to handle both
> > > > > > > mode switching and orientation switching, based on the Type-C plug
> > > > > > > orientation and USB PD negotiation results.
> > > > > > > 
> > > > > > > While an external Type-C controller is still required to detect cable
> > > > > > > attachment and report USB PD events, the actual mode and orientation
> > > > > > > switching is performed internally by the PHY through software
> > > > > > > configuration. This allows the PHY to act as a Type-C multiplexer for
> > > > > > > both data role and DP altmode configuration.
> > > > > > > 
> > > > > > > To reflect this hardware design, this patch introduces a new
> > > > > > > "mode-switch" property for the dp-port node in the device tree bindings.
> > > > > > > This property indicates that the connected PHY is capable of handling
> > > > > > > Type-C mode switching itself.
> > > > > > > 
> > > > > > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > 
> > > > > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > > > ---
> > > > > > > 
> > > > > > > Changes in v4:
> > > > > > > - Remove "|" in description.
> > > > > > > 
> > > > > > > Changes in v3:
> > > > > > > - Add more descriptions to clarify the role of the PHY in switching.
> > > > > > > 
> > > > > > > Changes in v2:
> > > > > > > - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> > > > > > > 
> > > > > > >     .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
> > > > > > >     1 file changed, 6 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > > > index 91c011f68cd0..83ebcde096ea 100644
> > > > > > > --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > > > @@ -51,6 +51,12 @@ properties:
> > > > > > >           '#phy-cells':
> > > > > > >             const: 0
> > > > > > > +      mode-switch:
> > > > > > Having the mode-switch here is a bit strange. I think the whole PHY
> > > > > > device should be an orientation-switch and mode-switch. Otherwise it
> > > > > > feels weird to me.
> > > > > I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)
> > > > I couldn't find the comment on lore. Could you please point it out?
> > > Sorry, it is v1. I added an orientation-switch and a mode-switch in the top-level PHY [0]. Comment is here: [1]
> > My interpretation of [1] doesn't quite match yours. It doesn't say
> > anything about moving mode-switch to dp-port. It basically pointed out
> > that you already have two ports.
> 
> Yes, I think this can be easily changed, as long as the issue you mentioned below is resolved.
> 
> 
> > 
> > Also, I'm not sure how the current construction works: you register
> > switch and mux for the dev_fwnode(tcphy->dev), however the lookfup
> > functions should be looking for a device corresponding to the port OF
> > node (which doesn't exist).
> 
> In v1, that is fwnode = dev_fwnode(tcphy->dev) .  And dt like is:
> 
> 
> &tcphy {
>     port {
>         tcphy0_orientation_switch: endpoint@0 { ... };
>         tcphy_dp_altmode_switch: endpoint@1 { ... };
>     };
> };
> 
> 
> Since the binding already includes a "usb3-port" and a "dp-port", it can not add another new port.
> 
> So after v1, that is fwnode = device_get_named_child_node(tcphy->dev, "usb3-port") . And dt like this:

I see it now, I was probably looking at the different revision, sorry
about it.

> 
> 
> &tcphy0_dp {
>     port { ... };
> };
> 
> &tcphy0_usb3 {
>     port { ... };
> };
> 
> 
> Sorry, this looks a bit hacky. Do you have a better idea? Thank you.

No, it's fine from my POV now.

> 
> 
> > 
> > > 
> > > [0] https://lore.kernel.org/all/20250715112456.101-4-kernel@airkyi.com/
> > > 
> > > [1] https://lore.kernel.org/all/4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org/
> > > 
> > > 
> > > 
> > > > > 
> > > > > > > +        description:
> > > > > > > +          Indicates the PHY can handle altmode switching. In this case,
> > > > > > > +          requires an external USB Type-C controller to report USB PD message.
> > > > > > > +        type: boolean
> > > > > > > +
> > > > > > >           port:
> > > > > > >             $ref: /schemas/graph.yaml#/properties/port
> > > > > > >             description: Connection to USB Type-C connector
> > > > > > > -- 
> > > > > > > 2.49.0
> > > > > > > 
> > > > > -- 
> > > > > Best,
> > > > > Chaoyi
> > > > > 
> > > -- 
> > > Best,
> > > Chaoyi
> > > 
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> Best,
> Chaoyi
> 

-- 
With best wishes
Dmitry
