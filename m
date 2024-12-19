Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F869F872F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABFD10EDE4;
	Thu, 19 Dec 2024 21:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DTEhSrGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941AB10EDE4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:38:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so1232311e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 13:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734644298; x=1735249098; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oTQgRG8ZQeoyxzxk0jbNJKzUWVlbL9V58rgtOKJ2iSY=;
 b=DTEhSrGzFdqVBONsSZzBUR4VTd1U/Yj5DqhqbmXCayOngxLiAm6MaB2aAyXPNYFgEe
 a9Kx5W82IPUjgTO8qlFS7vC4oi9XCFT39n5Yf4adHcZdWSfoGCEECQNGpIk8SSTrAt6P
 3WrdEDPYF7bCPkfqNWWlcYQO2zsm+aXVgdZRWuzceyh7yhMlygTJEFZXEN/iP/XXtIKg
 T3zaPyt5qe9/KArtPl7CAVm+PCSDD5yG/5oxPWlgwLf23yq8B17qTbFZqU5I2/iyvzqI
 reb1/QQS6JPwbGHnCPtZWycIbRiKi+p0XlY+MVcgRn0vVZSKRlDLYjJ0ZSKbXkRskKP5
 3B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734644298; x=1735249098;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oTQgRG8ZQeoyxzxk0jbNJKzUWVlbL9V58rgtOKJ2iSY=;
 b=VWbC0s4Rt5LnVbaCjN+IaVipjV2ZsYmYpw3gpxYMI/iMxb1zTEoSqrUulZGoZesYZv
 nkBU3QNPbENS5sAU2zFvkLN6jPtkeQH0gjapFGXfOeKG24p6fWe6THp0eoLR/98tu8PX
 Wkwc8MOlwv1Azkvl/xldVyV7M4zR0HKWhgtn6MEAixjLMhCtNrWfuq+m6tU962FKg1Jc
 49htIK/s8+tRrsWVkDHJqEPUttB8IWdoGQNIcCmas+F/iTCPoo/xlPupu+b59oUBDV+r
 5xIAi00qgqCrh/PTI5FlqG40foi7kVmxgifSsFHcGq9a6fpKL1AW0tP48EBkPUhMEFd+
 CiTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe5Xn7aP+d8geFfWeWJxf5NJJ20tLZ+DC+Sz35jXOiNTK0bJVqLEauod1Xonc0BHxkGPk5DM+jndw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrTNwYoAdUlWQHNnxUhmi49BT08NZ4pcTIq/woGADi8I8p5M+n
 lCMPddVXtzruessHatWClNL2XWM6x9kHEkq22B+gzzso7qCuYy6BMX+mi7W7XG8=
X-Gm-Gg: ASbGnctYKBVOscroUb8uHeMt/12Xa2NDAvVPxWIj4OOAMk9RAEaX2i906NIgz32TRl8
 +8MZTTqUW+GBIM4qpPTCIXf+fR41IMw4uYNsJDyZKsQcBdYW2T8y/f4HKY7C7fNy3qqOa28NvKy
 FoBf/k+2viKxLLe500asCrSau0oMz59xGSibRoq6hpCBNu/k8ApSnruWSxznqgyAyiMnXGMHX7p
 /fZPQG+wURrS7zHMnvpoeRuWe0bSYGC/Q/IcyEiNJ2Hp/zRogF/pzW1H+yig4lAvNQsTfck6C6C
 pZzrU4COu/802nAf24Zq3yOyI3kWu9xY+5Yb
X-Google-Smtp-Source: AGHT+IES8fYfDCBFoMSaiKUYL3d5DPFWLCFfYZaVEL7vxd+WHdLg9lpbyJobEEWSDBsdi+fa6C/WWQ==
X-Received: by 2002:a05:6512:3511:b0:542:2990:58c4 with SMTP id
 2adb3069b0e04-54229905947mr12860e87.8.1734644297792; 
 Thu, 19 Dec 2024 13:38:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422381367bsm285343e87.153.2024.12.19.13.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 13:38:16 -0800 (PST)
Date: Thu, 19 Dec 2024 23:38:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
Message-ID: <b7dlgj5tfylglnd3z44vp6347q6gcru5dgnyxr5352jlckrb5k@kwbvh7zmponz>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
 <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
 <d5151b82-5f05-4826-99b4-e925c20550b4@quicinc.com>
 <7vdaasc3flhpabnorjty5qjorlbp22honuscgpbteakgagg2tq@frqa6flk2mmv>
 <df1a4457-129e-452c-8089-ee1e6f9a3e12@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df1a4457-129e-452c-8089-ee1e6f9a3e12@quicinc.com>
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

On Wed, Dec 18, 2024 at 08:55:54PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/12/2024 3:15 AM, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 08:50:02PM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 12/11/2024 5:46 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> >>>>
> >>>>
> >>>> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>>>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>>>>>> different types of cfg and layout attributes during initialization based
> >>>>>>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>>>>>> are organized into the layout structure.
> >>>>>>>>
> >>>>>>>> We didn't have an understanding / conclusion whether
> >>>>>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>>>>>> or two PHYs being placed next to each other. Could you please start
> >>>>>>>> your commit message by explaining it? Or even better, make that a part
> >>>>>>>> of the cover letter for a new series touching just the USBC PHY
> >>>>>>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>>>>>> so you can split the series into two.
> >>>>>>>>
> >>>>>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>>>>>
> >>>>>> What is "DP extension"?
> >>>>>>
> >>>> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>>>>>
> >>>>>>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>>>>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>>>>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>>>>>> It would be more efficient for a single driver to manage these controls. 
> >>>>>>
> >>>>>> The question is about the hardware, not about the driver.
> >>>>>>
> >>>>>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>>>>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>>>>>> we still decided to base it on the USBC extension.
> >>>>>>
> >>>>>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >>>>>> thought that usbc-or-dp platforms support that, but they don't
> >>>>>> support DP+USB pin configuration. Note, the question is broader than
> >>>>>> just QCS615, it covers the PHY type itself.
> >>>>>>
> >>>>>> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >>>>>> set the register from OS or are we supposed to read it and thus detemine
> >>>>>> the PHY mode?
> >>>>>
> >>>>> Any updates on these two topics?
> >>>>>
> >>>> Still confirming detail info with HW & design team.
> >>>> I’ll update the information that has been confirmed so far.
> >>>> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> >>>> TCSR phy mode is read/write reg and we can read for determine phy mode.
> >>>
> >>> Ok, thanks for the explanation. From my point of view:
> >>>
> >>> - Implement the DP PHY to be a part of the same driver. Each device
> >>>   supported by the usbc driver should get both PHYs.
> >>>
> >>> - Make sure not to break the ABI: #phy-cells = <0> should still work and
> >>>   return USB PHY, keeping backwards compatibility. Newer devices or
> >>>   upgraded DT for old devices should return USB PHY for <... 0> and DP
> >>>   PHY for <... 1>.
> >>>
> >> Yes, currently we have implemented like your description,
> >> Each deivce shoud get both PHYs, DP PHY for <... 1> and USB PHY for <... 0>.
> > 
> > Please note the backwards compatibility clause.
> > 
> For the USB node, we kept the same implementation as the original function interface, and the devicetree node definition also remains unchanged.
> In subsequent patches, I will follow Krzysztof’s suggestion to use a separate DT-binding to describe the DP PHY configuration, 
> without making changes to the USB devicetree and DT-binding implementation.

NO! See below. But basically NAK for implementing a separate bindings
and separate DP PHY driver. Also you can't just leave old platforms. All
of them have the same hardware, so all these platforms can be updated
simultaneously.

> >>> - I'm not shure how to handle the USB and DP coexistence, especially in
> >>>   your case of the USB-or-DP PHY.
> >>>
> >> For coexistence process:
> >>
> >> When we start implement DP part, usb driver team said only need config TCSR phy mode and orientation during switch in USB-C port.
> >> Based on your previous comments avout SW_PWRDN, I'm confirming with the USB team whether SW_REST/SWPWRDN/START_CTRL registers might affect DP.
> > 
> > Thanks!
> > 
> >> Anyway, even though the original SoC design supports DP or USB over Type-C，
> >> but on QCS615 ADP AIR platform, there are only four USB-A port which works with 'qcs615-qmp-usb3-phy' driver, and no USB-C port.
> >> DP port is mappped from usb pin to the video out sub-board.
> >> so we are unable to verify the switching case between DP and USB devices under USB-C.
> > 
> > That's also fine. We will get to that point once MSM8998 / SDM660
> > get USB-C support (the only current blocker is the support for the
> > TYPEC block of the PMI8998).
> > 
> I can't access MSM8998 / SDM660 documents now, but I have confirmed detail info about USB & DP phy design for sm6150.

The same PHY is present on SM6115 / SM4250 / QRB4210 and QCM2290 /
QRB2210, but those platforms don't seem to have a proper DisplayPort,
only the DP PHY as a part of this block. Please try gaining access to
the documents and make a design decision rather than making an ad-hoc
solutions.

> The 'usb-ssphy-qmp-usb3-or-dp PHY' on the current platform is essentially composed of three sub-PHYs, 
> which can even be considered as three separate PHYs: USB3 primary PHY, USB3 secondary PHY, and USB3 DP PHY.

Is there any software or hardware connection between primary and
secondary USB3 PHYs? It doesn't seem so.

> On the QCS615, the USB primary PHY is currently used to handle USB 3.0 communication for the previously mentioned four USB Type-A ports, 

currently? Can it be used in any other way?

> while the USB3 secondary PHY and USB3 DP PHY are used for the output of the Type-C port,
> but since the Type-C port is forcibly pin-to-pin configured to the video out board, the Type-C port will always configure as DP PHY.

This is the case for the particular board, not for the platform itself.

> 
> The internal registers of these three PHYs are independent of each other, Neither their respective SWPWR_DN nor SWRST will affect the other two PHYs.
> Additionally, there was a misunderstanding about the orientation previously.
> The USB orientation setting only affects the current PHY and does not impact the DP PHY. The DP PHY is configured in the DP_PHY_CFG_1.

Are you saying that those two registers are really independent? Well...
That might make sense as the two PHYs are mostly independent.

> TSCR_PHY_MODE can specify which PHY outputs to the Type-C port, and the global reset will simultaneously reset the two associated PHYs. 

Having the global reset means that there should be one driver handling
both PHYs.

> Therefore, the correct switching process is as follows.
> When switching the inserted device:
> 	1.Identify the PHY type.
> 	2.Enable the regulator.
> 	3.Trigger a reset.
> 	4.Enable the clock.
> 	5.Configure PHY type related orientation
> 	6.switch the TCSR PHY mode.
> 	7.Configure the registers of PHY.
> During release:
> 	1.Reset.
> 	2.Disable the clock.
> 	3.Disable the regulator.

What should we do during orientation switch? During the change between
native USB over USB-C and DP-over-USB-C? Please provide full
information, not the limited set.

> Our current design overall complies with this process, but it lacks the configuration for DP_PHY_CFG_1.
> 
> Shall we continue the discussion to clarify remain comments of the USBC driver?

As I wrote earlier, change USBC driver to provide either two PHYs
simultaneously or just one PHY and a way to switch modes on the fly
(personally I think that two PHYs better match the USBC PHY hardware and
the normal Combo PHY design).

Do we need to program this DP PHY differently for the DP-native and
DP-over-USB-C cases?

> >> However, I'm also confirming whether anything other will affect USB and DP each other.

-- 
With best wishes
Dmitry
