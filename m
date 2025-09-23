Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8BB94142
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C8710E53C;
	Tue, 23 Sep 2025 03:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHGnxezE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8729C10E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:17:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MG6ACM027509
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bMb7C2zDppeQTKGSH4djX/sY8FExMuELVy1N+D87Fjg=; b=XHGnxezEa/2Uh3/5
 AlxnmfeU39uhBRTepsSKDOYGtjOv65Batzfrkr5rmyt64pqUM8zQ0v7jXcgUDnEW
 wdfpN6ICL/zvfPpPg7+UBoPUXeuvVpWime1N7Q7zbvD2/PN9JFNg9fimXQ1Y1erK
 2DxwsfMFlQNsdSseVlu8JduF1Ir67zt3vRoejAPo5UCmAfmcp5RniBb5ci9PxE8d
 mr1yz7bSUjfZYsaTjrW3eqLFq16DnEHnEQeFN1dTSPOw+0ukSVH/irHkqNc0NoNZ
 OICwCifD1C2LCAXl9vlgNMz48sO8ULSNl9geCp54SMI8jQ6O03h6LDXHxZnGONrd
 uhmynA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhq1uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:17:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-773e990bda0so104014256d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 20:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758597436; x=1759202236;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bMb7C2zDppeQTKGSH4djX/sY8FExMuELVy1N+D87Fjg=;
 b=ACAy5v1y1v0wKE3wM1Ye+si8JCGUiKpRYUQmkqQHh9dTglDXHKh+9eVJT3iYtUIYQO
 CSl7/7f/C0XVZg3OiEvveBa+1ESqNlymq1wB4r3B3CamgGle+s9ZAuZcloy/FiS7xXov
 GwZcy3e05BYaWKLfWe3QyuZs7iPCjqzW437KCdGdoKjIuXG8+kNCKieEXObYO29/UAGr
 0E3HRQaNDSVNj5UlztythmpDhzIM8VN1bGQlGrJfItNpG7FsIAl3O4tyvKq1VLIKyZi/
 5L/cwCSk+HwtUUYV8/49DX+KmiyWHAobL5kp/KKuIMsTuQ1L7NLktJ9rcmYw1VCDS+Zd
 cGFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXtgYNoVdkHYivdBYluIT6c8DVMmg+qluI0pgifoEoZycQosSj4Pl4pUw9gyQOkNWBJBBOl0z+VDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhkELg7Ey6Lbyt1CpRvMgjYFk+x/o2AzCNAvKkMtltBkM5cmZb
 aScB0I2446vAjOPsZ2/RBUPdtluCCHF2ZiLwP6qkvagjZN0PvkNRd7Rx4CLlHsCPBJShHkLmFvQ
 OPBeLjIMVBVqTurUsm1vD+5aAJq1xXI3UhnC/tBTdfwoMvlVaFuJiDRDMflQe24TJU64V2e4=
X-Gm-Gg: ASbGncuJZ4HI0mIdxFWy1c6Lbo+LQkrWGrSMPRCTbGb/hQ/f+B/IhR+OxwSMSTjU3V2
 LMpIJPU1oIjC3hxafF06ZXIFg8cvRXpvrn466n0AgEqwVJ99fC+OdbKm+/oFk3XEcPs/Sj10Klq
 A+FlpFzsASs62E5zAl8yt/kd64CFjbLzZflWyps6iWYW7V9TKPMkB5UUHvufpZnd3bI4B0M4RL1
 srN0wm6mkTl4HKVaKTUCy2l5hVgPIeSBvU5d29mCmy68Eyr4N7JBX20XVCGniJHFQZ9Xq3I5nir
 GTGUteN8qBJ0nXrhtZy9r7zct+Rkbn7WQmlSWY/TRY4Qz/g4CohW1Tai4P3DNSgmpnQEuufVK9r
 Qy8YjNFl7wuFUQBt5Hl11382OFqoyPhyyJd8csekpjOGyrdv9zC24
X-Received: by 2002:a05:6214:2a8f:b0:741:52cf:a104 with SMTP id
 6a1803df08f44-7e70169a36amr13294436d6.5.1758597436487; 
 Mon, 22 Sep 2025 20:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn0eBFPbnW3yR2CGZz8WEuSgYw6bETDind9f429+o4fUJgBVTohgVWJzPvbfpV811TCcIXOQ==
X-Received: by 2002:a05:6214:2a8f:b0:741:52cf:a104 with SMTP id
 6a1803df08f44-7e70169a36amr13294086d6.5.1758597435854; 
 Mon, 22 Sep 2025 20:17:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57a9a81f52asm2678963e87.124.2025.09.22.20.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 20:17:13 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:17:12 +0300
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
Message-ID: <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
 <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
X-Proofpoint-ORIG-GUID: 3iV8mteLUMLB3Qz3j3QBjNEYJSbBq8Jk
X-Proofpoint-GUID: 3iV8mteLUMLB3Qz3j3QBjNEYJSbBq8Jk
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d2113d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=KKAkSRfTAAAA:8 a=uIhu009UdGQP6qFfJxgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX/0e6dw5sj8eJ
 GCK2ZnkyW2oG8r7y9cp0r2KayGMb7upeR7KecVTTnzBP5IiAqzZZQ4gDuqX8uUXf231TSyoI8vO
 arQYjAWcYrS7wLQrZTS2d7AnCQPove7tULhIxnTUQzzAYmeW5iW33HHe1bsmWdo0wQWnP1ZpPUW
 N8Odu0MVdUzwdUPdX4lx6mFo12VreQUL7QpkpqxHcTKmZIiLqgDj5/K2mlTYYTSoyI9UkY3aM9t
 bHEbMdG2pWsFW6EP4fkmIXtny8po9Wj/KWOXp/q1upnnQ9Rf34YGJDAL4jeXhfGN2MUSzc+3cb+
 dU7PwvRw+jUQ+mTzvIK6BbFeOIdJ84fJALTAEhZG2FDLE39Jn5qfCP93dTsSQIodidWGyxrYY1X
 w99PcZc4
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

On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
> > On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> > > supports software-configurable pin mapping and DisplayPort lane
> > > assignment. These capabilities enable the PHY itself to handle both
> > > mode switching and orientation switching, based on the Type-C plug
> > > orientation and USB PD negotiation results.
> > > 
> > > While an external Type-C controller is still required to detect cable
> > > attachment and report USB PD events, the actual mode and orientation
> > > switching is performed internally by the PHY through software
> > > configuration. This allows the PHY to act as a Type-C multiplexer for
> > > both data role and DP altmode configuration.
> > > 
> > > To reflect this hardware design, this patch introduces a new
> > > "mode-switch" property for the dp-port node in the device tree bindings.
> > > This property indicates that the connected PHY is capable of handling
> > > Type-C mode switching itself.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > > 
> > > Changes in v4:
> > > - Remove "|" in description.
> > > 
> > > Changes in v3:
> > > - Add more descriptions to clarify the role of the PHY in switching.
> > > 
> > > Changes in v2:
> > > - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> > > 
> > >   .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > index 91c011f68cd0..83ebcde096ea 100644
> > > --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > @@ -51,6 +51,12 @@ properties:
> > >         '#phy-cells':
> > >           const: 0
> > > +      mode-switch:
> > Having the mode-switch here is a bit strange. I think the whole PHY
> > device should be an orientation-switch and mode-switch. Otherwise it
> > feels weird to me.
> 
> I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)

I couldn't find the comment on lore. Could you please point it out?

> 
> 
> 
> > 
> > > +        description:
> > > +          Indicates the PHY can handle altmode switching. In this case,
> > > +          requires an external USB Type-C controller to report USB PD message.
> > > +        type: boolean
> > > +
> > >         port:
> > >           $ref: /schemas/graph.yaml#/properties/port
> > >           description: Connection to USB Type-C connector
> > > -- 
> > > 2.49.0
> > > 
> -- 
> Best,
> Chaoyi
> 

-- 
With best wishes
Dmitry
