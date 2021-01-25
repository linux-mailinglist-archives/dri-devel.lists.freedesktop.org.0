Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4EC303821
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32466E457;
	Tue, 26 Jan 2021 08:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06316E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 21:29:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id rv9so20123182ejb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Wlbod8JHGZ21A4x47Cvv07nirv4Z4f0HRDNM2760h18=;
 b=P/foCwvKNfI3fFrDQJaSqzb0cm4uroP0oS06O/Kpw9tPfPfBO7j/NrlDVPA1yNc4jK
 2dyxRhwgzmYdudFhIgR4q1G1x71yBDYiDbJTann3M4ebNjDgZzjqlvo51RZbGb0DCRb+
 qEh2pekFi27lNkagDnIaW91q71jQcaKcVC4/xlLa4gWzo9s5k3qF5qhAIQ5m0w8LGTh6
 dfFwwGDojRgByhyfzvOSSMAUaScl/1IuWwZW+6LDn8/OWyDo6VPvwiljOzAQJjVULSfe
 cBxk5VUcLN+nmfdkqmXOc4UWLeOaupBKvYMl7AxM0eNuslBpenJeNHdS/JLLiE5MP6Yx
 2wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wlbod8JHGZ21A4x47Cvv07nirv4Z4f0HRDNM2760h18=;
 b=bI2zzDuI8jJTu/taaWFx6i1G172Zkms0duLr3cSaAaZ093vSH9j8+pcMDATe9wWitH
 PTVAnMjtjPFAIUSCqJ8YLzRWogp+MaQRC1uGMut6Nk2Zzz+kJzFDYNhnUZU7aw8m8+vT
 HnKh9tiDOHPMFENknCPVRC/gnlTcYukwoHWyOjPif9XKCer+y1iE+z9fRoMRJbTQ/H1H
 3N3R8w2Mn7yNl8Ba6ZIizsZXD+P/dqaoS+C8izeSWQMNSLM2Ng66w5qxzKH0NjNEXSgq
 DqE875NyYurtJw3e3sDf4Y/y01KJm4MmORT8VQOtRHVqj6UWsJJJ9IjL9Z5EK2RIlGHn
 Ax3A==
X-Gm-Message-State: AOAM532cjcXMdf22g+pB/edtwHpCsbTQU/os0/F/0U3aJ69oc1w2CXNS
 BtZPlGYOd+b/9AKxGuPXG4E=
X-Google-Smtp-Source: ABdhPJxdKE/fF3AXYaF6LwrFBwRIt/ZMycdvlPfowqbMBv6RSyplon+Q93MUTcggcjckr997lzrGgQ==
X-Received: by 2002:a17:906:154d:: with SMTP id
 c13mr1571463ejd.471.1611610169570; 
 Mon, 25 Jan 2021 13:29:29 -0800 (PST)
Received: from localhost
 (ipv6-99dd8b8f16e7f879.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:99dd:8b8f:16e7:f879])
 by smtp.gmail.com with ESMTPSA id g25sm8803257ejf.15.2021.01.25.13.29.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 13:29:28 -0800 (PST)
Date: Mon, 25 Jan 2021 22:29:17 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210125212917.GA4177@portage>
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
 <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
 <20210116124856.GA3406@portage>
 <CAOMZO5DKann0ojZrhjyXOqrRq9owtgrrZTGwttD_bU0-KO=aBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5DKann0ojZrhjyXOqrRq9owtgrrZTGwttD_bU0-KO=aBg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/21, Fabio Estevam wrote:
> On Sat, Jan 16, 2021 at 9:49 AM Oliver Graute <oliver.graute@gmail.com> wrote:
> 
> > > power-supply = <&reg_touch_3v3> is not correct, as the reg_touch_3v3
> > > does not power the LCD.
> >
> > yes, but how is the LCD correctly powered then?
> 
> J4 is powered by VCC_5V and VCC_3V#.
> 
> > [    7.795980] pwm-backlight backlight: supply power not found, using dummy regulator
> > [    7.804436] OF: /backlight: #pwm-cells = 3 found -1
> > [    7.806563] of_pwm_get(): can't parse "pwms" property
> > [    7.812026] pwm-backlight backlight: unable to request PWM
> > [    7.822929] pwm-backlight: probe of backlight failed with error -22
> 
> You need to fix this.
> 
> > [    7.876831] imx-sdma 20ec000.sdma: Direct firmware load for imx/sdma/sdma-imx6q.bin failed with error -2
> > [    7.884231] imx-sdma 20ec000.sdma: Falling back to sysfs fallback for: imx/sdma/sdma-imx6q.bin
> > [    7.916013] printk: console [ttymxc0] enabled
> > [    7.916013] printk: console [ttymxc0] enabled
> > [    7.922351] printk: bootconsole [ec_imx6q0] disabled
> > [    7.922351] printk: bootconsole [ec_imx6q0] disabled
> > [    7.952397] 21e8000.serial: ttymxc1 at MMIO 0x21e8000 (irq = 68, base_baud = 5000000) is a IMX
> > [    7.970794] 21ec000.serial: ttymxc2 at MMIO 0x21ec000 (irq = 69, base_baud = 5000000) is a IMX
> > [    8.033015] ------------[ cut here ]------------
> > [    8.037826] WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/panel/panel-simple.c:577 panel_simple_probe+0x5dc/0x6b8
> 
> And this too
> 
> > [    8.846104] imx6ul-pinctrl 20e0000.pinctrl: pin MX6UL_PAD_NAND_CE0_B already requested by regulator-gpio; cannot claim for 1806000.nand-controller
> > [    8.859641] imx6ul-pinctrl 20e0000.pinctrl: pin-107 (1806000.nand-controller) status -22
> > [    8.867851] imx6ul-pinctrl 20e0000.pinctrl: could not request pin 107 (MX6UL_PAD_NAND_CE0_B) from group gpminandgrp  on device 20e0000.pinctrl
> > [    8.880930] gpmi-nand 1806000.nand-controller: Error applying setting, reverse things back
> > [    8.889726] gpmi-nand: probe of 1806000.nand-controller failed with error -22
> 
> And this pin conflict too.

Ok I fixed the pin conflict with regulator-gpio and added a 5V
regulator node in my dts file. Now the display is working fine!

I'll post the dts files soon and check if there is something to
improve for this patch.

Many thanks for your help,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
