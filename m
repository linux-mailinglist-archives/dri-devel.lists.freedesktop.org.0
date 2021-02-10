Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40112316A33
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 16:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29CC6E30C;
	Wed, 10 Feb 2021 15:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B11E6E30C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 15:30:48 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0EB864E45;
 Wed, 10 Feb 2021 15:30:47 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1l9rS1-00DMb5-Nz; Wed, 10 Feb 2021 15:30:45 +0000
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 15:30:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
In-Reply-To: <20210210144043.s4plyc7ekwnnu7k4@gilmour>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
 <20210210144043.s4plyc7ekwnnu7k4@gilmour>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: maxime@cerno.tech, dave.stevenson@raspberrypi.com,
 tglx@linutronix.de, eric@anholt.net, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, daniel.vetter@intel.com, airlied@linux.ie,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 mchehab@kernel.org, linux-media@vger.kernel.org, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 2021-02-10 14:40, Maxime Ripard wrote:
> Hi Dave,
> 
> On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
>> On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>> >
>> > The BSC controllers used for the HDMI DDC have an interrupt controller
>> > shared between both instances. Let's add it to avoid polling.
>> 
>> This seems to have unintended side effects.
>> GIC interrupt 117 is shared between the standard I2C controllers
>> (i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.
>> 
>> Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
>> doesn't appear to be an option for l2-intc registering as an interrupt
>> controller. i2c-bcm2835 therefore loses out and fails to register for
>> the interrupt.
>> 
>> Is there an equivalent flag that an interrupt controller can add to
>> say that the parent interrupt is shared? Is that even supported?
> 
> Indeed, it looks like setting an equivalent to IRQF_SHARED would be the
> solution, but I couldn't find anything that would allow us to in the
> irqchip code.
> 
> Marc, Thomas, is it something that is allowed?

No, not really. That's because the chained handler is actually an
interrupt flow, and not a normal handler. IRQF_SHARED acts at the wrong
level for that.

I can see two possibilities:

- the l2-intc gets turned into a normal handler, and does the demux
   from there. Horrible stuff.

- the i2c controller gets parented to the l2c-int as a fake interrupt,
   and gets called from there. Horrible stuff.

Pick your poison... :-/

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
