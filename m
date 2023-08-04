Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B1277031F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 16:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D968910E08A;
	Fri,  4 Aug 2023 14:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15B310E08A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 14:30:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 869101BF20D;
 Fri,  4 Aug 2023 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691159451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t++1Z5akKqagHeEalypyouonyVszmZK48XoJiFUEp4E=;
 b=GkkcPC1XBNB9Us8c65heaMzMpgsfu5/kOjjNQggqZ2uFmqsha7o/BwdOOK+BVfavk9ai8T
 e0vAC2pYhOLunEn2JmcZ8+9iUYOHx8U/UHycSzID1NUB8IYqu7q101/vZM/81ATabP7AEg
 AD7aa2cNXAmNjCUdNcm4fMoMsaet9Poa/zkzZ6uuPmIr5pKS6X/xcSLwfACOsQ2bFIMvge
 7rwoiiK+fWabflyg6AhFqyPaM4sqaGEArobydEN+oij7GHKjeIHTdvbSI8C+fmM98JPxHa
 v2JthmqwzNVE3XSeOEitX5WPN0ITlG4ySvmaucqZ9dmZPW4nzpnU7vY2y8d+nQ==
Date: Fri, 4 Aug 2023 16:30:47 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel-simple: Add Innolux G156HCE-L01 panel entry
Message-ID: <20230804163047.60881a2b@booty>
In-Reply-To: <20230804101912.696a02aa@booty>
References: <20230731210258.256152-1-marex@denx.de>
 <20230731210258.256152-2-marex@denx.de>
 <20230803162314.122fab64@booty>
 <9b236561-36af-da7a-2caf-892be68e2b76@denx.de>
 <20230803170659.2e44e204@booty>
 <01496199-5be9-7084-735d-55a11e30217f@denx.de>
 <20230804101912.696a02aa@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek, Neil,

On Fri, 4 Aug 2023 10:19:12 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hi Marek,
> 
> On Thu, 3 Aug 2023 19:10:35 +0200
> Marek Vasut <marex@denx.de> wrote:
> 
> > On 8/3/23 17:06, Luca Ceresoli wrote:  
> > > Hi Marek,
> > > 
> > > On Thu, 3 Aug 2023 16:25:37 +0200
> > > Marek Vasut <marex@denx.de> wrote:
> > >     
> > >> On 8/3/23 16:23, Luca Ceresoli wrote:    
> > >>> Hi Marek,    
> > >>
> > >> Hi,
> > >>    
> > >>> On Mon, 31 Jul 2023 23:02:58 +0200
> > >>> Marek Vasut <marex@denx.de> wrote:
> > >>>        
> > >>>> Add support for Innolux G156HCE-L01 15.6" 1920x1080 24bpp
> > >>>> dual-link LVDS TFT panel. Documentation is available at [1].    
> > >>>
> > >>> Interesting, I'm bringing up this exact panel right now and found your
> > >>> patch.
> > >>>        
> > >>>> The middle frequency is tuned slightly upward from 70.93 MHz
> > >>>> to 72 MHz, otherwise the panel shows slight flicker.    
> > >>>
> > >>> Using 70.93 MHz here does not show any flickering. I even tried going
> > >>> in the opposite direction and set 70 MHz, and to use different
> > >>> backlight settings, all without any flickering.
> > >>>
> > >>> Do you think you might be using a defective device? Would you have a
> > >>> chance of testing another sample?    
> > >>
> > >> I have literally one such display.
> > >>
> > >> Which SoC do you use (and if applicable, which bridge) ?    
> > > 
> > > The panel is driven by the DSI-2 output of a i.MX8MP through a TI
> > > SN65DSI84 bridge.    
> > 
> > I use the LT9211 , so I wonder whether this might be another Lontium 
> > specific oddity.  
> 
> Or maybe not. After checking the LVDS clock with an oscilloscope I
> discovered I was actually sending 77 MHz. After fixing it I found that
> my panel (of which I only have one sample as well) does not display any
> output with pixel clocks <= 75 MHz. It works with clocks >= 76 MHz.

After checking lots of other details in my video setup and doing
cleanups, I finally managed to have this panel working with the
intended 70.93 MHz clock (and also lower clocks such as 70.00 MHz).

Is it too late to change this patch? Or should I send a patch on top?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
