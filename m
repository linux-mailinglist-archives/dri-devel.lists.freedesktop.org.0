Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A012B9440A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 06:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401AA10E557;
	Tue, 23 Sep 2025 04:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl+LV8UH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9C710E557
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 04:52:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N4W1AT015626
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 04:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1ysyyR+HSBxqCI8FuQWOZHxXbhAf2dscJgNWIhtU+ys=; b=Bl+LV8UHw8nBOeNg
 NQIkWQ/9ghyTSiJpE5s3ltpVJJsx54k2D57hFQg0RSns3glajhRuY9DHDsdHNr7z
 8/Iun4mHhE1YK7M8Y743Mh9rZilV7wAynsNrbt/ATzPy0BNYMzi0plv+VFySLZl0
 YDo+hK6a/y7hmmRc+2AuKr8RmiPAME+hyuztfZbtK6us+/K4HW+XfwSqRqAS8F+h
 +pqyfOw1pcveSMNnazD3JxfhKfPmeutiJFyK6UCOOa040okTLj6ULcvLTiuWqd69
 41Iome+o+KiZfvuPyASZP5AkD/ztoycFxi+7hmuWQpFYAvFedC2EB9xxeFbVMbAH
 8+zQLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhq8nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 04:52:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-82968fe9e8cso1426333585a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 21:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758603120; x=1759207920;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ysyyR+HSBxqCI8FuQWOZHxXbhAf2dscJgNWIhtU+ys=;
 b=bC5+GR4wkYTzaN7ZR3Cu7NsbjqYvVd3jJEMzAMynrpJL6V2acUff8A9+b9ZJfcFWl/
 yTbEKyHGf5/hDwAY7RSvqBN53yAjdo7saowo75Y9ALVe6R8ybFJ0G5uYySjxJAH0XLrm
 rjpv0Kn5T4S0nxvpBszEv+Qq2BN4UOOOVBO67SrV2R/FrcwI4RX+EsVSOekHlyh0bWUq
 CLEQa3wJ1zEk0FpIkjoY/2Eunv8dG3oY5MBeFh4CeNdmlWQGhE6k+R0jQw6B+1cVFOMI
 gC1o9/x8DowBxdttiDTmHecC0EBZLj0+LSNdCqz4BDT3upzwoH1B4TBNmsDO388AjN4L
 cG9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMqMBRuHgOMkV3+J2oXhYEzjcbRVFDJkZkjuNek62ymTV/lTV8SqlPKnGhrreuqYs3209ixJUwMcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI4LHNLOt13pIjgwYWyGWjpt4uJI23r6NwC65lgwOpfIlskqag
 mqe5A3RHkCYLmNIMlIfky/3TjN81AMaAsUO0/+qbHkM0990hJaqXnFxcuNvjYmIFkXrI5uVyup+
 vwgtnuB8hAEFYxCDXPplJ8JRK2a+vdLWnyzMh4cV6YK78bKxaIwPZBqDUQdY6VwgwVGk+/5I=
X-Gm-Gg: ASbGncuK3KAS7N9qcdAev9f9fhoh1gqb2HZufphnrL5yNfMxy+BhA5AcqYdryn0YpKa
 02ehZUpon+xCtez/qxJfleeDcj7QDRMIewWoN3euq5cNXOJXzln1cHP1uOLAd1zDQ5dMvnRYoEr
 JBg/61EOmJKsWVZRNtjZOILaJB/ocSDIQNjz+lyP1SacLy8aLG4XGSWvB8/Fzt/GI+0BJtuEcdh
 DdR3SQFrSzCousSgltoZXGC2OH2umSaSHl/Qh671kRfEJoxwMoAx3KT9JnqvO1yU0/Txp3PRnNx
 lXZdBCqs7jsuOIjmuVyI6wFqBaAtmleHdFO6dgkrtjik3dqnJbRpc+9Adkm5c/1CrlruWZLM64m
 NrE3HWHeZx54zO+Y8ya67T5DUSyjvsmG9r91KGxe3JgmMVQmiX0wt
X-Received: by 2002:a05:620a:1923:b0:812:48b9:2eb0 with SMTP id
 af79cd13be357-8516a8202bamr136830385a.19.1758603120280; 
 Mon, 22 Sep 2025 21:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKxvB+ebtnxiMgBizv494obsHW1ZlzjCI32T27z/Odi7Kl2wEkCUAGK1+a+EPj6Wq2e5gDkQ==
X-Received: by 2002:a05:620a:1923:b0:812:48b9:2eb0 with SMTP id
 af79cd13be357-8516a8202bamr136828685a.19.1758603119745; 
 Mon, 22 Sep 2025 21:51:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-365694f1be4sm23536661fa.17.2025.09.22.21.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 21:51:58 -0700 (PDT)
Date: Tue, 23 Sep 2025 07:51:55 +0300
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
Message-ID: <jm32ujhxslsx5snes4o66t2grb5uxhsaapjqahektfck66g6hb@fx6f53yojlcr>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
 <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
 <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
 <8396dd15-9111-4ceb-a561-6ed57727546f@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8396dd15-9111-4ceb-a561-6ed57727546f@rock-chips.com>
X-Proofpoint-ORIG-GUID: _LkPDgkg3QRxirsKBhLi1GbHFiMofrgg
X-Proofpoint-GUID: _LkPDgkg3QRxirsKBhLi1GbHFiMofrgg
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d22771 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=JfrnYn6hAAAA:8
 a=s8YR1HE3AAAA:8 a=KKAkSRfTAAAA:8 a=SBpjGD6abgB5dFENKZUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=uGDpjx9DKq9E8W49yboe:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX6nB7MgHQYffS
 KHAiZXOuajD1pRWULw5jM79f16YYpq57xDXfuWd4gJuHg2yuZe4KhrTqGlz3YQCf2jwIGZF0sOv
 ZOIGCkux5QDs/RM+4XfufSsosqkkg3fnqEejjCE0rMCUqfMvjHd6MMwzMvcMb92B7X1I0cE8Xz/
 y6gx1HD2owUKHuyJ9lAGrIExWiiXiUIBGDtgSJiPb00qiHDJp5vf3CGV3fKeWhAHAVF8wB95V3h
 oTcA9Vz41u0ipNSPnIRznuhPyoWQXR0SjMzMzNEm1jj1oGEZELYJDPMeBzFV7cLgWSzyf8ge2Wr
 +tEU0zud/7hcJ1Xrmc1sopW/Z2NiKqZwP+8lQPmpBH6taGsQCaPxlsgyFG1K9+2wCPZ/2AflJGx
 fLio7h0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
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

On Tue, Sep 23, 2025 at 11:40:33AM +0800, Chaoyi Chen wrote:
> On 9/23/2025 11:17 AM, Dmitry Baryshkov wrote:
> 
> > On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
> > > Hi Dmitry,
> > > 
> > > On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
> > > > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > 
> > > > > The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> > > > > supports software-configurable pin mapping and DisplayPort lane
> > > > > assignment. These capabilities enable the PHY itself to handle both
> > > > > mode switching and orientation switching, based on the Type-C plug
> > > > > orientation and USB PD negotiation results.
> > > > > 
> > > > > While an external Type-C controller is still required to detect cable
> > > > > attachment and report USB PD events, the actual mode and orientation
> > > > > switching is performed internally by the PHY through software
> > > > > configuration. This allows the PHY to act as a Type-C multiplexer for
> > > > > both data role and DP altmode configuration.
> > > > > 
> > > > > To reflect this hardware design, this patch introduces a new
> > > > > "mode-switch" property for the dp-port node in the device tree bindings.
> > > > > This property indicates that the connected PHY is capable of handling
> > > > > Type-C mode switching itself.
> > > > > 
> > > > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > 
> > > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > ---
> > > > > 
> > > > > Changes in v4:
> > > > > - Remove "|" in description.
> > > > > 
> > > > > Changes in v3:
> > > > > - Add more descriptions to clarify the role of the PHY in switching.
> > > > > 
> > > > > Changes in v2:
> > > > > - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> > > > > 
> > > > >    .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
> > > > >    1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > index 91c011f68cd0..83ebcde096ea 100644
> > > > > --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > @@ -51,6 +51,12 @@ properties:
> > > > >          '#phy-cells':
> > > > >            const: 0
> > > > > +      mode-switch:
> > > > Having the mode-switch here is a bit strange. I think the whole PHY
> > > > device should be an orientation-switch and mode-switch. Otherwise it
> > > > feels weird to me.
> > > I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)
> > I couldn't find the comment on lore. Could you please point it out?
> 
> Sorry, it is v1. I added an orientation-switch and a mode-switch in the top-level PHY [0]. Comment is here: [1]

My interpretation of [1] doesn't quite match yours. It doesn't say
anything about moving mode-switch to dp-port. It basically pointed out
that you already have two ports.

Also, I'm not sure how the current construction works: you register
switch and mux for the dev_fwnode(tcphy->dev), however the lookfup
functions should be looking for a device corresponding to the port OF
node (which doesn't exist).

> 
> 
> [0] https://lore.kernel.org/all/20250715112456.101-4-kernel@airkyi.com/
> 
> [1] https://lore.kernel.org/all/4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org/
> 
> 
> 
> > > 
> > > 
> > > > > +        description:
> > > > > +          Indicates the PHY can handle altmode switching. In this case,
> > > > > +          requires an external USB Type-C controller to report USB PD message.
> > > > > +        type: boolean
> > > > > +
> > > > >          port:
> > > > >            $ref: /schemas/graph.yaml#/properties/port
> > > > >            description: Connection to USB Type-C connector
> > > > > -- 
> > > > > 2.49.0
> > > > > 
> > > -- 
> > > Best,
> > > Chaoyi
> > > 
> -- 
> Best,
> Chaoyi
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
