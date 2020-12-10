Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741B2D643C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 18:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FE76EA96;
	Thu, 10 Dec 2020 17:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF656E952
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 17:59:12 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18FE223D57;
 Thu, 10 Dec 2020 17:59:12 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1knQDe-000EFC-23; Thu, 10 Dec 2020 17:59:10 +0000
MIME-Version: 1.0
Date: Thu, 10 Dec 2020 17:59:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 01/15] irqchip: Allow to compile bcmstb on other platforms
In-Reply-To: <20201210134648.272857-2-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-2-maxime@cerno.tech>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <e0f1aed2b0007eab6e9192ac73fd411f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: maxime@cerno.tech, eric@anholt.net,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 daniel.vetter@intel.com, airlied@linux.ie,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-kernel@vger.kernel.org, mchehab@kernel.org, tglx@linutronix.de,
 dave.stevenson@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 2020-12-10 13:46, Maxime Ripard wrote:
> The BCM2711 uses a number of instances of the bcmstb-l2 controller in 
> its
> display engine. Let's allow the driver to be enabled through KConfig.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/irqchip/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index c6098eee0c7c..f1e58de117dc 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -131,7 +131,7 @@ config BCM7120_L2_IRQ
>  	select IRQ_DOMAIN
> 
>  config BRCMSTB_L2_IRQ
> -	bool
> +	bool "Broadcom STB L2 Interrupt Controller"
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN

I'm always sceptical of making interrupt controllers user-selectable.
Who is going to know that they need to pick that one?

I'd be much more in favour of directly selecting this symbol
from DRM_VC4_HDMI_CEC, since there is an obvious dependency.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
