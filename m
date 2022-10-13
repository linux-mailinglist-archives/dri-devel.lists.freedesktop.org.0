Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE875FD966
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 14:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C41D10E21E;
	Thu, 13 Oct 2022 12:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB5310E21E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 12:43:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b4so2682311wrs.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gFL+3ZqTNQ0jAeQ0BPwipAbFLiwXOxlfEp1/HJDetMI=;
 b=VoFnV5SLcBBiz1iP+USM4ERmiHztM1qhrWGXXnzA+n2JphKF/PV3WP+tQLfo1V/WZg
 zrz4XrSeAIXscbce56til+dnXxsIBQvyjXz25AKnWwsibpdbOYz6i3phpcERiiT/E0Vx
 RSfIly/JkROs2RGIJR4ULYzq66mEUCBYWOp8uPRXN/ZoXcEl1JId6yrz3/ImqBzGJhfu
 Hji1PMqS4lUxFG9/VVIItVo9ahiZb2wI5iI7aJgtA/61CS137qs7f+a/DX3Ht/QnVRVW
 NiHH7jX2C0b4RVzQUhAKH5tzhhUO4mmdcOdWMz6baykUUDB9B6+BHntcngAkQITyfi6J
 KO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFL+3ZqTNQ0jAeQ0BPwipAbFLiwXOxlfEp1/HJDetMI=;
 b=a+ZL0sWVvqKkfPzdAKgoQGYNLyHIxOVanjX6qtD2K2sePisXRnSkwsg/9Oq4fV2PNs
 7oAOkp8O7UlWCKa/w1jaHsUR4yNZLCZqTpW1rtCvQz240ZYKQ/VhvuU+pes0XWG3fZ5S
 60N6VLsVbfP/vvho0PAqYMa5C4i5+NU/+yfwx+E7LKp2vPCPdqWcmXI82TdhyH70OSCC
 jRHzugengwDTWFzRqjNYhoIJ729IwsTLrrpRQO6UXbW2ofVGxPyZkVNwNdz+voh7zlaB
 JSG9jpOd118Dd5OmuhQHtnPfrKtehHGp8lynAjpy4ao+S1J9wqL3m/ciZm7fRkcuI6Ic
 HXIA==
X-Gm-Message-State: ACrzQf3MVlDSOuX3tUakuHQ8mTYH2ygm846D0X+WQXWJOjnoYlX9z7Hx
 ZKpYMRWjtrjECBMpVRAXDgTGGw==
X-Google-Smtp-Source: AMsMyM4wXATrnUjeGnfBevz2YqoW6F0UBPLgNZxr7qyXYH6BLvynxwwy3ThKFM67S9PZfcNv00HhJg==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr20624644wrs.632.1665665034607; 
 Thu, 13 Oct 2022 05:43:54 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 u3-20020a056000038300b00231910fa71asm1912596wrf.57.2022.10.13.05.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:43:54 -0700 (PDT)
Date: Thu, 13 Oct 2022 13:43:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <Y0gICNqed+55mwuX@maple.lan>
References: <YzN6A9Y20Ea1LdEz@google.com>
 <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
 <YzwtG8CT9sTCqQQk@maple.lan>
 <CACRpkdZ-DfZKgCOHaKn1UZ8vVwy1dEiFBBDNdxu6VNzrUdeEtA@mail.gmail.com>
 <YzyZJSwy9xsy69WL@google.com>
 <CACRpkdYecQPUd-evVpOpMLY1XUa87kP4i+E694QfTtDbEarJfQ@mail.gmail.com>
 <Yz6oS/zdNIOEtWxI@maple.lan>
 <CACRpkdYdZaxSGy+YiexKtffKvUEr5dcu3g=1zY3Tfhv5WMDtew@mail.gmail.com>
 <Y0ck3jopU+Z74xqn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0ck3jopU+Z74xqn@google.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 01:34:38PM -0700, Dmitry Torokhov wrote:
> On Mon, Oct 10, 2022 at 10:36:00PM +0200, Linus Walleij wrote:
> > On Thu, Oct 6, 2022 at 12:05 PM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > > On Thu, Oct 06, 2022 at 11:03:15AM +0200, Linus Walleij wrote:
> > > > On Tue, Oct 4, 2022 at 10:35 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > > > Dmitry, could you fix this? Just patch away in gpiolib-of.c.
> > > > >
> > > > > Sure, I'll add a few quirks. I wonder what is the best way to merge
> > > > > this? I can create a bunch of IBs to be pulled, or I can send quirks to
> > > > > you/Bartosz and once they land send the patches to drivers...
> > > >
> > > > When I did it I was sufficiently convinced that I was the only one patching
> > > > the quirks in gpiolib-of.c that merge window so I just included it as
> > > > a hunk in the driver patch. If there will be some more patches to that
> > > > file I guess some separate patch(es) for gpiolib-of.c is needed, maybe
> > > > an immutable branch for those if it becomes a lot.
> > >
> > > Are renames likely to be a common quirk on the road to libgpiod
> > > conversion?
> > >
> > > I admit I sort of expected it to be common enough that there would be
> > > one rename quirk in the code supported by an alphabetized string table.
> > > Such a table would certainly still provoke troublesome merges but ones
> > > that are trivially resolved.
> >
> > Dmitry added a table of sorts, the problems are usually a bit unique
> > for each instance of nonstandard DT GPIO bindings, that's why I
> > mostly solved it with open coding in gpiolib-of.c.
>
> OK, so I sent out the patch adding "reset-gpios" -> "gpios-reset"
> translation quirk to keep compatibility with the legacy names, but
> we still need to figure out what to do with incorrect line polarity
> in current DTses in tree. Unlike with names we have no indication
> if out of tree DTSes specify correct polarity or not, so we can't
> reasonably come up with workarounds that are guaranteed to work for
> everyone. I see several options:
>
> 1 the driver could continue ignoring line polarity specified in DTS
>   (and use gpiod_set_value_raw()) and hope that they all/will be
>   wired in the same way?
>
> 2 we could fix up in-kernel DTSes, allow flexibility of connection
>   in new designs and respect polarity specified in out of tree DTSes,
>   but accept that there can be breakages with old DTSes not contributed
>   to the mainline or DTSes that were "cached" from an older kernel
>   release
>
> 3 add another quirk forcing "active low" polarity for the legacy
>   "gpios-reset" name, which will allow us respecting polarity in
>   new "reset-gpios" name.

I don't think they is any point in having a rename if legacy DTs break
anyway! Thus if there is a rename then there should also be an active low
quirk applied when the old name is used.


Daniel.
