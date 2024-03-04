Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC10870496
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 15:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7FD10E9E1;
	Mon,  4 Mar 2024 14:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="feFQWQcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99B5112237
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 14:55:50 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-47265f1c676so598195137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 06:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709564149; x=1710168949; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AWTkZgsoLpPKdOGgcn1hzOrRfxw8EPkwi9BIWs11TSI=;
 b=feFQWQcpZPAYYbzKXPZ8YQewmAE9AuAqtpFg/jYP0Z6rqTLEI1mXgaf5ONHzWx/9Nu
 MzyYIuXGSe7OhvD81TuLLh9GEhHgoLXmcGKOLTYkKJRUJ9tIA/lpmpIGrO89norKAEfU
 GZAI+fiLzVfHQ2ABTL40uOd33XBDZ7w8xafGxXODsJdIBfzj9KhbLmnWpwgDWfAmFuS7
 MzxJIPapVu1RHCJTRPQI7yVBYALZq6DHdMoEKBWVltNcfDQR/ouTDc5d/mzCxxuFWnxn
 WGvkpZNKI77zT13doHR9jhBEjdTAnPJZpexsTl6NjOxqLcgu99yCKRzI9QSiFLyrAhAP
 nc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709564149; x=1710168949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AWTkZgsoLpPKdOGgcn1hzOrRfxw8EPkwi9BIWs11TSI=;
 b=hF43KAaQeXWaMOHvd482o8PKV/+orZxt7EB5ANcqm6htqv74TEscHRPGes9uKQtW3J
 MU+T3egeFrhAHLBk4MNVfy70VcroYNyUrW8a4Ue3SYXM7So8vbxbhVU6DzbXomSjevC3
 Eww77lHUebGqtnMjl24vy3d+PsdNIJ8nl9jNZK0k+SyxXgmjub4WGzERaOMNbvWorqgW
 gpUCzteX64vXD3Jgtgewuc46cEi81iQXg3p84DY4JGxZMsTCYqRPEDaYrIl2zEI3SryG
 JWWBb55A8koUxHeIiuLDrVoXhqpYSsXsfGxcRl2UaheoPT1bSHpdoAMeUqY1tqPyoys0
 G1/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlsERTt88qYRav7eh4QHGGecA71Kx5+iDTcTE634GSK655OEiMPDNdHxPF8X2Mrvvft4pyF67sBrrleyzJTJIuGVzPbgpJWg78LnLGW48C
X-Gm-Message-State: AOJu0YzMhUxZfCNwu7ptejVym3QIBpGxWHdKelsiBcRijoTCVf1Yon3r
 VeEJ36OwcIOUq3FKHOBN6A+0ICE+YSdq89keup/0m0HFvuraEj3xYpRg7VRi/P+C5m5N/yTNIrv
 hsmqAqBaihOLxwBsBfobzB/svq/uKSWI7p2Uc/A==
X-Google-Smtp-Source: AGHT+IG934W8fniwCAisOtWNbw/y515juXyLVnR2Fiu+gO0N2Ek8hxZbk2Rv0Vp8Lo6V1b7KKlvuokOu6sTWZN3xv2A=
X-Received: by 2002:a05:6102:2927:b0:472:d517:24cf with SMTP id
 cz39-20020a056102292700b00472d51724cfmr879625vsb.15.1709564149443; Mon, 04
 Mar 2024 06:55:49 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com> <87bk7u5n9h.fsf@intel.com>
In-Reply-To: <87bk7u5n9h.fsf@intel.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Mar 2024 20:25:38 +0530
Message-ID: <CA+G9fYtQobCEno5oRgqPzhHrjff4zMki=9fWwJ1NPtKeKQ+aUg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
To: Jani Nikula <jani.nikula@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Jani and Benjamin,

On Mon, 4 Mar 2024 at 15:31, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 04 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > Removal of the backlight include from fb.h uncovered an implicit
> > dependency in powerpc asm/backlight.h. Add the explicit include.
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Closes: https://lore.kernel.org/r/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com
> > Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
> >
> > Not even compile tested!
>
> Naresh, please try this patch!

Thanks for the proposed fix patch.

Steps to reproduce:

# tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig ppc6xx_defconfig --kconfig-add CONFIG_PMAC_BACKLIGHT=y
config debugkernel dtbs kernel modules xipkernel

# Applying patch set
Applying: fbdev/chipsfb: Include <linux/backlight.h>

The reported build regression is fixed but build failed with below errors.

My two cents,

I should have copied the full build error log in the morning.

Few more build errors on powerpc builds,
------------------
drivers/macintosh/via-pmu-backlight.c: In function
'__pmu_backlight_update_status':
drivers/macintosh/via-pmu-backlight.c:74:21: error: implicit
declaration of function 'backlight_get_brightness'; did you mean
'pmu_backlight_get_level_brightness'?
[-Werror=implicit-function-declaration]
   74 |         int level = backlight_get_brightness(bd);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~
      |                     pmu_backlight_get_level_brightness
drivers/macintosh/via-pmu-backlight.c: At top level:
drivers/macintosh/via-pmu-backlight.c:108:21: error: variable
'pmu_backlight_data' has initializer but incomplete type
  108 | static const struct backlight_ops pmu_backlight_data = {
      |                     ^~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:109:10: error: 'const struct
backlight_ops' has no member named 'update_status'
  109 |         .update_status  = pmu_backlight_update_status,
      |          ^~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:109:27: warning: excess elements
in struct initializer
  109 |         .update_status  = pmu_backlight_update_status,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:109:27: note: (near
initialization for 'pmu_backlight_data')
drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
drivers/macintosh/via-pmu-backlight.c:136:37: error: storage size of
'props' isn't known
  136 |         struct backlight_properties props;
      |                                     ^~~~~
drivers/macintosh/via-pmu-backlight.c:154:34: error: invalid
application of 'sizeof' to incomplete type 'struct
backlight_properties'
  154 |         memset(&props, 0, sizeof(struct backlight_properties));
      |                                  ^~~~~~
drivers/macintosh/via-pmu-backlight.c:155:22: error:
'BACKLIGHT_PLATFORM' undeclared (first use in this function)
  155 |         props.type = BACKLIGHT_PLATFORM;
      |                      ^~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:155:22: note: each undeclared
identifier is reported only once for each function it appears in
drivers/macintosh/via-pmu-backlight.c:157:14: error: implicit
declaration of function 'backlight_device_register'; did you mean
'root_device_register'? [-Werror=implicit-function-declaration]
  157 |         bd = backlight_device_register(name, NULL, NULL,
&pmu_backlight_data,
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~
      |              root_device_register
drivers/macintosh/via-pmu-backlight.c:166:19: error: invalid use of
undefined type 'struct backlight_device'
  166 |         level = bd->props.max_brightness;
      |                   ^~
drivers/macintosh/via-pmu-backlight.c:176:35: error: invalid use of
undefined type 'struct backlight_device'
  176 |                                 bd->props.max_brightness / 15);
      |                                   ^~
drivers/macintosh/via-pmu-backlight.c:179:11: error: invalid use of
undefined type 'struct backlight_device'
  179 |         bd->props.brightness = level;
      |           ^~
drivers/macintosh/via-pmu-backlight.c:180:11: error: invalid use of
undefined type 'struct backlight_device'
  180 |         bd->props.power = FB_BLANK_UNBLANK;
      |           ^~
drivers/macintosh/via-pmu-backlight.c:181:9: error: implicit
declaration of function 'backlight_update_status'; did you mean
'pmu_backlight_update_status'? [-Werror=implicit-function-declaration]
  181 |         backlight_update_status(bd);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
      |         pmu_backlight_update_status
drivers/macintosh/via-pmu-backlight.c:136:37: warning: unused variable
'props' [-Wunused-variable]
  136 |         struct backlight_properties props;
      |                                     ^~~~~
drivers/macintosh/via-pmu-backlight.c: At top level:
drivers/macintosh/via-pmu-backlight.c:108:35: error: storage size of
'pmu_backlight_data' isn't known
  108 | static const struct backlight_ops pmu_backlight_data = {
      |                                   ^~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:108:35: error: storage size of
'pmu_backlight_data' isn't known
cc1: some warnings being treated as errors
make[5]: *** [scripts/Makefile.build:244:
drivers/macintosh/via-pmu-backlight.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>



> Michael, if this is fine by you, ack to merge via the drm subsystem
> along with the regressing commit?
>
> BR,
> Jani.
>
> > ---
> >  arch/powerpc/include/asm/backlight.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/include/asm/backlight.h b/arch/powerpc/include/asm/backlight.h
> > index 1b5eab62ed04..275d5bb9aa04 100644
> > --- a/arch/powerpc/include/asm/backlight.h
> > +++ b/arch/powerpc/include/asm/backlight.h
> > @@ -10,6 +10,7 @@
> >  #define __ASM_POWERPC_BACKLIGHT_H
> >  #ifdef __KERNEL__
> >
> > +#include <linux/backlight.h>
> >  #include <linux/fb.h>
> >  #include <linux/mutex.h>
>
> --
> Jani Nikula, Intel

--
Linaro LKFT
https://lkft.linaro.org
