Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CDE4A7B99
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226B10E65B;
	Wed,  2 Feb 2022 23:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EF910E162
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 22:10:09 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id b22so933667qkk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 14:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Rr5xR3phcMmOtciTLGMao2x+J3LzUpf33KP5PgsG6mw=;
 b=fcP42zsjJKBRLsCCLNxeBAvGoAUH+RgY1jYrpOhhT8bMHr7+15EWYSucDQfP1oORdR
 v8va2D+TIvGEUfFpYyk+KAAnpvrPj2Do2UURxQqDM2NZ0yrVKHV/Tmvmi8VnHPqEl5Sj
 FzsjYO1CSUmsISBtPa5x3zIEsUBOu9RZDDuPyg2QqPpe+3i2ouYdl1b7XJc+7Yz287oe
 n4Ll3sdxxGbRuNPqe8Va40e5cgmVlDZI5fIN6fBWjGY94knmRKOKljCldyrgDLu4eqFI
 61yZGnSZcmCnvpc5Ppek75k/hWgHufZ8NwnxWp4bgKiaLrzdRDurexHwqhp4Nqyni8AG
 h/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Rr5xR3phcMmOtciTLGMao2x+J3LzUpf33KP5PgsG6mw=;
 b=z/Q2Z87ZRLZtc/rPC2K9PD5sYMWndkOZZZPy+AHS2Vs0iNeavwroVVLQCjjO0Sjixh
 Oz3/O3vskQqDmma1ZbLLt1x/1UftgRxr+iohmXXci/VR8tN7jrC9qNbo8UTFie7PbHd3
 vkEqz6FkODIu4zijnJmxjnFyBt2uG0P4ka5LHUN2GdRmAU1by0dRLYKd5Tu454lc1k/A
 SqFzlYpUX9AaKHv0CyyfwLIimYE7FwTRRaKbSFGtMv6Ef5+fOrHRhw1t80oIMsiCo/d2
 u55U4BwElp3uib6i+KB/GTAR9Vyyj/c96hJscLJTZMiOCJxGzqLMKUbZB0dRDeXR9ZpR
 I5bA==
X-Gm-Message-State: AOAM532/B8yBMLm9uWwgdHHu/nY5TlwdAZXP/UD37LR+vlbYYJFYzY3u
 hbIZojPADi9uIHeCL+JJig==
X-Google-Smtp-Source: ABdhPJwRpKyRhMilcGtomGensbv6thBpUXpxVK7cAkdNeBk0lqsREJF6QVbIyABhwvxgVYCy4DCMsQ==
X-Received: by 2002:a37:4648:: with SMTP id t69mr21000172qka.702.1643839808031; 
 Wed, 02 Feb 2022 14:10:08 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id o13sm7298868qtv.36.2022.02.02.14.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 14:10:07 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:c4e6:e49c:6958:ac58])
 by serve.minyard.net (Postfix) with ESMTPSA id 68539181297;
 Wed,  2 Feb 2022 22:10:06 +0000 (UTC)
Date: Wed, 2 Feb 2022 16:10:05 -0600
From: Corey Minyard <minyard@acm.org>
To: "Verdun, Jean-Marie" <verdun@hpe.com>
Subject: Re: [Openipmi-developer] [PATCH] HPE BMC GXP SUPPORT
Message-ID: <20220202221005.GD2091156@minyard.net>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <20220202175635.GC2091156@minyard.net>
 <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
X-Mailman-Approved-At: Wed, 02 Feb 2022 23:17:36 +0000
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
Reply-To: minyard@acm.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Amit Kucheria <amitk@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Marc Zyngier <maz@kernel.org>,
 Hao Fang <fanghao11@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Hawkins,
 Nick" <nick.hawkins@hpe.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 02, 2022 at 06:14:57PM +0000, Verdun, Jean-Marie wrote:
> > This is far too big for a single patch.  It needs to be broken into
> > functional chunks that can be reviewed individually.  Each driver and
> > each device tree change along with it's accompanying code need to be
> > done in individual patches.  The way it is it can't be reviewed in any
> > sane manner.
> 
> > -corey
> 
> Thanks for your feedback. We are getting a little bit lost here, as our plan was to submit initial
> 
> - bindings
> - dts for SoC and 1 board
> - initial platform init code
> 
> Then drivers code avoiding to send many dts updates which might complexify the review. We wanted to send all drivers code to relevant reviewers by tomorrow.
> 
> So, what you are asking ( do not worry I am not trying to negotiate, I just want to avoid English misunderstandings as I am French) is to send per driver
> 
> - binding
> - dts update
> - driver code
> 
> For each driver through different submission (with each of them containing the 3 associated parts) ?

Arnd gave an excellent explaination for this.

To be clear, you need to split out changes to individual subsystems and
submit those to the maintainers for that subsystem and not send them to
everyone.  That way you reduce sending emails to people who don't need
to see them.

Once you have a set of patches for a subsystem, you can submit them as one
set.  That is generally preferred.  The "git send-email" or "git
format-patch" tools are generally what we use, they let you compose a
header message where you can give an overall explaination, then it sends
the individual changes as followup messages to the header message.

-corey

> 
> What shall be the initial one in our case as we are introducing a platform ? An empty dts infrastructure and then we make it grow one step at a time ?
> 
> vejmarie
> 
> ﻿
>  
> 
> 
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
