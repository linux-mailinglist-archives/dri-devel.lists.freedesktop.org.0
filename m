Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B8A940C1B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80A10E4F4;
	Tue, 30 Jul 2024 08:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="akPG8Fwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CE110E241
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:46:36 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-65f7bd30546so22328537b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722329196; x=1722933996; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N1SVRoOfwAGT1ArgnhX1cCtDllghjDDbgYirxLnYNzQ=;
 b=akPG8Fwz0ReDbq17N2e/IySb0z/46LMW8/RkGPF3uacPj/GkxG73476UTZLet5G94h
 YcmF2DRou3tFmDQTzQztuOu0yhlvOh6GGFxrf8rDUm3lHZfAeShYeEGmHSDmB5dJRge4
 wrN8FJP2I+2oP5R0vo+zJeeJZ5rttwASeqHTF/Ja4EHWrPpf3Grv9CaHwBp1Mqv++Tpk
 PnaeXxEC3jX6nK8OKAqqsEbIkPXY6+kbhY4ETWzOs2mEZ8N7zYeg48qozKH9oHZfMLJF
 N06hTOSIO2DOz3/jnDAo3UuxxG22YTH+yH7E9uSECQRKoH3uz+xISm/lDJV0PbHUua5m
 D7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722329196; x=1722933996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1SVRoOfwAGT1ArgnhX1cCtDllghjDDbgYirxLnYNzQ=;
 b=XAodNd3z4FPzIGQvC6c9cjcZz2q0UKbjnElD4p+ZawCgbpmy2GWwyeHr8Df0YnjKic
 kbGKOvVcgksnAEXQbStGpGUn/bvtgpO7sgYKz8FFlylt68xTv6Jdc0KzRwX16iGJhPSo
 zah6QssW+jyh90Q14msfBUEedvt596pxKX0DipYHAvFAi7W++9QZvUQYc3gdZuMxMGxm
 i8Mvu0uY1AUJND5eVlzrkWAdFB9Fr71wNeSriSqQxxPkTAFiDS21V6U57TqhM/jtKzfV
 N7uJStW14Ohs+T8jYsh9oSPIv0O/H0lK2zQ/RYkSTxahFMoPKUi9F6x6wy0XLsE1I2rJ
 3IZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvqDT+08Mhs2LI3XxKsjOkPgUWoSGZ7wwpiP+BipNROyn2oGfQ/HRHKLv7kQYRSrJ6W62Bb/i7yyBdTXueir4/kPs34YQvXDNvOER7NF8w
X-Gm-Message-State: AOJu0YyV6telE8u6YR78uIA7tvPjfEBea3WdgD1f6UrxAnavlTddk6yX
 I/vHS7vxOuPi8+MBm0OGbl1Sfc4sNvQHi0EJBQSgBroZswvsj9V7y6y4/WKqx1ewXeXnAPTs5nl
 eUQRny7O2oSD/MDOLRIF8aIhGV4E5e07cLogzuw==
X-Google-Smtp-Source: AGHT+IHjFfHgqjmlzduFLfBafbIgZJ6xlEV6ruFB9cW2gDIL63vUlMWZer/56XD5APUD0hpf/X8faq6H0va63gFoa5w=
X-Received: by 2002:a0d:fec4:0:b0:65f:cdb7:46a7 with SMTP id
 00721157ae682-6826d4349a5mr12295097b3.22.1722329195668; Tue, 30 Jul 2024
 01:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
 <20240715-stirring-purple-toad-7de58c@houat>
 <c302bc47-6492-44af-86a1-3ff6a815e314@freebox.fr>
 <20240730-eminent-venomous-condor-8ef421@houat>
In-Reply-To: <20240730-eminent-venomous-condor-8ef421@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jul 2024 11:46:24 +0300
Message-ID: <CAA8EJprQJJ2AuB99RFU+d074PV+NHMPwjFWn_auju7HYQQ8R7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
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

On Tue, 30 Jul 2024 at 11:27, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Wed, Jul 24, 2024 at 07:59:21PM GMT, Marc Gonzalez wrote:
> > On 15/07/2024 16:40, Maxime Ripard wrote:
> > > On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
> > >> On 01/07/2024 15:50, Maxime Ripard wrote:
> > >>
> > >>> The i2c register access (and the whole behaviour of the device) is
> > >>> constrained on the I2C_EN pin status, and you can't read it from the
> > >>> device, so it's also something we need to have in the DT.
> > >>
> > >> I think the purpose of the I2C_EN pin might have been misunderstood.
> > >>
> > >> I2C_EN is not meant to be toggled, ever, by anyone from this planet.
> > >
> > > Toggled, probably not. Connected to a GPIO and the kernel has to assert
> > > a level at boot, I've seen worse hardware design already.
> > >
> > >> I2C_EN is a layout-time setting, decided by a board manufacturer:
> > >>
> > >> - If the TDP158 is fully configured once-and-for-all at layout-time,
> > >> then no I2C bus is required, and I2C_EN is pulled down forever.
> > >>
> > >> - If the board manufacturer wants to keep open the possibility
> > >> to adjust some parameters at run-time, then they must connect
> > >> the device to an I2C bus, and I2C_EN is pulled up forever.
> > >
> > > How do you express both cases in your current binding?
> >
> > It's not that I'm ignoring your question.
> >
> > It's that I don't understand what you're asking.
>
> And that's fine, you just need to say so.
>
> Generally speaking, you're focusing on the driver. The driver is not the
> issue here. You can do whatever you want in the driver for all I care,
> we can change that later on as we wish.
>
> The binding however cannot change, so it *has* to ideally cover all
> possible situations the hardware can be used in, or at a minimum leave
> the door open to support those without a compatibility breakage.
>
> That's why I've been asking those questions, because so far the only
> thing you've claimed is that "I can't test the driver for anything
> else", but, again, whether there's a driver or not, or if it's
> functional, is completely missing the point.
>
> > SITUATION 1
> > tdp158 is pin strapped.
> > Device node is child of root node.
> > Properties in proposed binding are valid (regulators and power-on pin)
> > Can be supported via module_platform_driver.
> >
> > SITUATION 2
> > tdp158 is sitting on I2C bus.
> > Device node is child of i2c bus node.
> > (robh said missing reg prop would be flagged by the compiler)
> > Properties in proposed binding are valid (regulators and power-on pin)
> > Supported via module_i2c_driver.
> >
> > If some settings-specific properties are added later, like skew,
> > they would only be valid for the I2C programmable mode, obviously.
>
> I think there's a couple more combinations:
>
>   - The device is connected on an I2C bus, but I2C_EN is tied low

No, this is not possible. I2C pins are repurposed if I2C_EN is low.
You can not call that an i2c bus anymore.

>   - The device is connected on an I2C bus, but I2C_EN is connected to a
>     GPIO and the kernel needs to assert its state at boot.

This is a pretty strange configuration.  The I2C_EN pin isn't supposed
to be toggled dynamically. Anyway, if that happens, I'd use pinctrl /
hog to control the pin.

>
> The GPIO case can be easily dealt with later on using an optional GPIO
> in the binding, but the current binding infers the I2C_EN level from the
> bus it's connected to, and I think we don't have a good way to deal with
> cases that would break that assumption.
>
> So I think we need an extra property to report the state of the i2c_en
> pin (and would be mutually exclusive with the GPIO if we ever have to
> support it).

-- 
With best wishes
Dmitry
