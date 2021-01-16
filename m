Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342122F8D71
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 14:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F286E069;
	Sat, 16 Jan 2021 13:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69016E069
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 13:44:43 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o10so17337639lfl.13
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 05:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FNhGar/ixldlY+SFdNHhUUClLY5raSV5R71u6rIvoU8=;
 b=PXKPyFOobv4j13l7WfEy2vHHf/PKw4Szyo2nYiJARHk8Trm3r2ZqJQgp+87baSfO87
 ghdr3mpwhTSOWOXLIVz+3nbXVCZITtEOsooplXXxWViKwpLIY+fOhtF1tolu4kLWP8Vq
 RqJIAG3o7rxS3bAfS/v3e0oRbObhZOw6F1EHaDidHSh1iijeSQ3/3JuXMlPEvhekXvVf
 L7LO3EvKMVn+nS3dC/OQPTdvKVv7+QJ3RMJewtN14KApSSWEmUxpiDkeU5y0SnqIHk1x
 Y/WbZ0s8J8vif53Aj8d7B68Wo00D4+Lu3jR+PcvUmn0A0Tl+k0fQDaWMFZhP6QJqLLdd
 XVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FNhGar/ixldlY+SFdNHhUUClLY5raSV5R71u6rIvoU8=;
 b=a4OCn+TAGsE2Q9VzIEyp4phBkORTeEX4QC19eHMZEsYZ+h8wRnIfeIiOHrhXKk/Pbz
 EswqfT5DnKbjjPUSOhhrG9UtL7jHhHtGgNgV0cmZpr3Ta8o14/vq7ESP/y+/ABZlcOQx
 O0+zEI+jNy/Wu+aS6xdBGtOZSdAsPsyaVlrGQ8iji1hSBg4/OKDKH4vk7LLjcckTWq+l
 mH2VUV9SaRx1TGvHnM4Ghhz3pfKUPfIgW+IaCllHQNikdog05FHPoMLitz4apl3guImy
 ZaIK6jW3LUQHdYrOmn5QorB+kiI2AFD+3ht9QOUEEkyRcxMLLuehiqjXE/s/xaD2bjrD
 sHrg==
X-Gm-Message-State: AOAM532r81n6voU/PK+FUYfg0Y3jKYkllZGSf0NIfehTP28zVj8G8q2V
 KUeGJzGnCFdbEL8/WMtd2YQcDS9oJpbuDaDY8ZY=
X-Google-Smtp-Source: ABdhPJxwVQAWBK58o6BP6rAw+L4QzBWswyYulqUVfPlOYNjLDXq73+Wpl0MJKzRqkM61Qr0KIk0Oukzalw+hVXPrnvk=
X-Received: by 2002:a19:4856:: with SMTP id v83mr7412006lfa.583.1610804682059; 
 Sat, 16 Jan 2021 05:44:42 -0800 (PST)
MIME-Version: 1.0
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
 <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
 <20210116124856.GA3406@portage>
In-Reply-To: <20210116124856.GA3406@portage>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 16 Jan 2021 10:44:30 -0300
Message-ID: <CAOMZO5DKann0ojZrhjyXOqrRq9owtgrrZTGwttD_bU0-KO=aBg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
To: Oliver Graute <oliver.graute@gmail.com>
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

On Sat, Jan 16, 2021 at 9:49 AM Oliver Graute <oliver.graute@gmail.com> wrote:

> > power-supply = <&reg_touch_3v3> is not correct, as the reg_touch_3v3
> > does not power the LCD.
>
> yes, but how is the LCD correctly powered then?

J4 is powered by VCC_5V and VCC_3V#.

> [    7.795980] pwm-backlight backlight: supply power not found, using dummy regulator
> [    7.804436] OF: /backlight: #pwm-cells = 3 found -1
> [    7.806563] of_pwm_get(): can't parse "pwms" property
> [    7.812026] pwm-backlight backlight: unable to request PWM
> [    7.822929] pwm-backlight: probe of backlight failed with error -22

You need to fix this.

> [    7.876831] imx-sdma 20ec000.sdma: Direct firmware load for imx/sdma/sdma-imx6q.bin failed with error -2
> [    7.884231] imx-sdma 20ec000.sdma: Falling back to sysfs fallback for: imx/sdma/sdma-imx6q.bin
> [    7.916013] printk: console [ttymxc0] enabled
> [    7.916013] printk: console [ttymxc0] enabled
> [    7.922351] printk: bootconsole [ec_imx6q0] disabled
> [    7.922351] printk: bootconsole [ec_imx6q0] disabled
> [    7.952397] 21e8000.serial: ttymxc1 at MMIO 0x21e8000 (irq = 68, base_baud = 5000000) is a IMX
> [    7.970794] 21ec000.serial: ttymxc2 at MMIO 0x21ec000 (irq = 69, base_baud = 5000000) is a IMX
> [    8.033015] ------------[ cut here ]------------
> [    8.037826] WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/panel/panel-simple.c:577 panel_simple_probe+0x5dc/0x6b8

And this too

> [    8.846104] imx6ul-pinctrl 20e0000.pinctrl: pin MX6UL_PAD_NAND_CE0_B already requested by regulator-gpio; cannot claim for 1806000.nand-controller
> [    8.859641] imx6ul-pinctrl 20e0000.pinctrl: pin-107 (1806000.nand-controller) status -22
> [    8.867851] imx6ul-pinctrl 20e0000.pinctrl: could not request pin 107 (MX6UL_PAD_NAND_CE0_B) from group gpminandgrp  on device 20e0000.pinctrl
> [    8.880930] gpmi-nand 1806000.nand-controller: Error applying setting, reverse things back
> [    8.889726] gpmi-nand: probe of 1806000.nand-controller failed with error -22

And this pin conflict too.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
