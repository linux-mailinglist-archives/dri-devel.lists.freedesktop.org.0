Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D30BE9ED62C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17710E407;
	Wed, 11 Dec 2024 19:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uakyB/BI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660F110E407
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 19:15:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso80103521fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733944534; x=1734549334; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xwJG5tVEAPuDua/+zEisi7SKCgTlTwRIJJOT5jh9lAk=;
 b=uakyB/BIJ9uXqbH4u+0JQ55oTkJeUwB4YFz3bP5Ak96a4q9uV8nWqIUIMpQ41jfVId
 hwlPWIneY0y4vJBsWxbVOaD076c4VFGc/FeEVLcBGKoAnHY5P2Z3FQAC5D0bZbfWUqSp
 lB2tl5m4Z13ChIt+TMyiyWiZ5ASzl3YlThvfs5v+IiWsvha8s5VDh4d4ojmiUkZcu5Or
 2xExUdltPaJQbel+YrQpW5q8zBxZD5B0iu7rsd2Nt/IYVF6+CvxWRTcdyhz6G7Xiah5U
 IgUxXmewFn3tbvE0jh19sLnGmS/0uqvvCT9JuquPiPz2POUBPZSjl3qGQn8Y/2Uw0ofo
 xGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733944534; x=1734549334;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xwJG5tVEAPuDua/+zEisi7SKCgTlTwRIJJOT5jh9lAk=;
 b=NftovRrmsFOqbIibZ+vfqIH7khj/n6H0prPw4r+Dd0yyL4WK+sRhPd3fY1kU75F3jo
 ksynopSwP+JnEVBQpQZBWUPNdVE9BSSikkd9xB9E9+B/OzMFtINXQhxpY1+5v5yXK3HM
 MYBLpEjyddGlo/fljrvVW1t6v97euFPPKlvLtvEsGUv/THJz5Fpru63GtkUeRrAhD/Nd
 ut6vzFwHqiQyPv677I/K7gyzXqEawDtkezkbdUdvFn3rS8cCokefu+8t3YkPIN8ktXHI
 nPldqMa/5F3/nnbgKgwvvrJYAIvPhyjCan6vXRlj6ja3jOUfGXXP8uB29+9DQT8GyrFD
 kDqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSdZxR44uyYmIB7XicuQ8Y6yFuZBtzGuMKVpQY42aZ/9pV26TTIBReHtAgm6V69lQ555pwFeHhMwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpn4wwaml0UvhO1oeN8dUb9pun/XDvoYGbvT6Ydf13z+HiOMPh
 7LhN6qAEyawj1t+iQQnkKd3UikUowWi1WZtIal/shuGvt/g0b00j14dcUZmj+S0=
X-Gm-Gg: ASbGncv7fTdvvjkiMagqSZB94l+BlJRsrFJzHE2abRseyoB2arTGKPKc3fF3Fwatb78
 eVyW3/iKBotZOo652oO7ETD61B2dyJ+5+VmW/Lc4J+vckn9wzElhJySlAFUjWpoqrOX+UQZmVsu
 uHHAoBD35xcUggCGcygCvFAcgJun2sxmIc0wSN6Dee9010mmQZEg3247SLN0uGLggod4lNSD43Q
 j6HYlWLMYvbHi+M33oGqOh1qCDr1PB07/v2FSE/4KyVrAH6iVYboAFAVtitNSUngrp9jDuWsj4m
 EAl7arvwjL141wa5s8/b06SJY+TpibiAgA==
X-Google-Smtp-Source: AGHT+IF+vVtTZWka6wAG9ssDBMOZChK/BACOngdEv98xkt4y+52aaxKOJEYpuiSr8ME5jDwv2CFS9A==
X-Received: by 2002:a05:651c:886:b0:302:4115:acd with SMTP id
 38308e7fff4ca-3024a21c6c9mr1832311fa.22.1733944534510; 
 Wed, 11 Dec 2024 11:15:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30220583defsm10758071fa.4.2024.12.11.11.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 11:15:33 -0800 (PST)
Date: Wed, 11 Dec 2024 21:15:30 +0200
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
Message-ID: <7vdaasc3flhpabnorjty5qjorlbp22honuscgpbteakgagg2tq@frqa6flk2mmv>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
 <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
 <d5151b82-5f05-4826-99b4-e925c20550b4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5151b82-5f05-4826-99b4-e925c20550b4@quicinc.com>
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

On Wed, Dec 11, 2024 at 08:50:02PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/11/2024 5:46 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >>>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>>>
> >>>>>
> >>>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>>>> different types of cfg and layout attributes during initialization based
> >>>>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>>>> are organized into the layout structure.
> >>>>>>
> >>>>>> We didn't have an understanding / conclusion whether
> >>>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>>>> or two PHYs being placed next to each other. Could you please start
> >>>>>> your commit message by explaining it? Or even better, make that a part
> >>>>>> of the cover letter for a new series touching just the USBC PHY
> >>>>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>>>> so you can split the series into two.
> >>>>>>
> >>>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>>>
> >>>> What is "DP extension"?
> >>>>
> >> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>>>
> >>>>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>>>> It would be more efficient for a single driver to manage these controls. 
> >>>>
> >>>> The question is about the hardware, not about the driver.
> >>>>
> >>>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>>>> we still decided to base it on the USBC extension.
> >>>>
> >>>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >>>> thought that usbc-or-dp platforms support that, but they don't
> >>>> support DP+USB pin configuration. Note, the question is broader than
> >>>> just QCS615, it covers the PHY type itself.
> >>>>
> >>>> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >>>> set the register from OS or are we supposed to read it and thus detemine
> >>>> the PHY mode?
> >>>
> >>> Any updates on these two topics?
> >>>
> >> Still confirming detail info with HW & design team.
> >> I’ll update the information that has been confirmed so far.
> >> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> >> TCSR phy mode is read/write reg and we can read for determine phy mode.
> > 
> > Ok, thanks for the explanation. From my point of view:
> > 
> > - Implement the DP PHY to be a part of the same driver. Each device
> >   supported by the usbc driver should get both PHYs.
> > 
> > - Make sure not to break the ABI: #phy-cells = <0> should still work and
> >   return USB PHY, keeping backwards compatibility. Newer devices or
> >   upgraded DT for old devices should return USB PHY for <... 0> and DP
> >   PHY for <... 1>.
> > 
> Yes, currently we have implemented like your description,
> Each deivce shoud get both PHYs, DP PHY for <... 1> and USB PHY for <... 0>.

Please note the backwards compatibility clause.

> > - I'm not shure how to handle the USB and DP coexistence, especially in
> >   your case of the USB-or-DP PHY.
> > 
> For coexistence process:
> 
> When we start implement DP part, usb driver team said only need config TCSR phy mode and orientation during switch in USB-C port.
> Based on your previous comments avout SW_PWRDN, I'm confirming with the USB team whether SW_REST/SWPWRDN/START_CTRL registers might affect DP.

Thanks!

> Anyway, even though the original SoC design supports DP or USB over Type-C，
> but on QCS615 ADP AIR platform, there are only four USB-A port which works with 'qcs615-qmp-usb3-phy' driver, and no USB-C port.
> DP port is mappped from usb pin to the video out sub-board.
> so we are unable to verify the switching case between DP and USB devices under USB-C.

That's also fine. We will get to that point once MSM8998 / SDM660
get USB-C support (the only current blocker is the support for the
TYPEC block of the PMI8998).

> However, I'm also confirming whether anything other will affect USB and DP each other.

-- 
With best wishes
Dmitry
