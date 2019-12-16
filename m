Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C6120535
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 13:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D026E141;
	Mon, 16 Dec 2019 12:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925776E141
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 12:16:32 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id f7so1976728uaa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g6hMK4zvmiSQXDEVIro/DLpNW8Dnq2eeAYZqmv+C7n4=;
 b=ACbNbFswU1bSLXpKw7frBiJCD6yT6A648nS5mwhOnzZ/oCoWad3p+XghmD1WWzlVJm
 txMzHtwXkBDWokJ/qZ+h2NJNPo9VbjuBgNeD2ooLabCNucUnCK0laHcbbaDut7vIo027
 DGIbWg5yK8l48N2llclSO2ZAL85UBWtMaooZlHhG8lnHmOvHVcS+QEgB/B532FqJdWQh
 Ud6qSt1MTC7AD4yTbOkjMO5VSHEg7XmLrE6VGezhugDqk9s7SNpN9mJC+dL9rWjyTL+v
 ag2YGxtfHBMl2JzSpFfkRk+npQR6zGCl2dRnuhF+/nv3CFHdQT4l5R3tgcRsFnEci7bQ
 ONyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6hMK4zvmiSQXDEVIro/DLpNW8Dnq2eeAYZqmv+C7n4=;
 b=mzNRST9wL+2+gxADJwOJt0iAXeqMUv5Rd+RApAAXnpULlj+CQiKZN9n4zMQxyvUh9q
 JhTx1lYRy9wAmgtxGy3Si0EmMslq9pH/OkNKWvaFkD2x7OwW2moz876veVSK1rCbtSZQ
 XZKAb6Qb5FHaIqbBHONY9auAQnnKlokURxC+Asg5Vi/kZeLGFWU8u6aE45V8mE7GA7dy
 UzmOuK2Rxrv8d45LG4KM8KjEg3YyTxQ/kpOtKWBI6W0jIpTMZiQa1pV1AOdqegOL+QOt
 JmY+aTSs+Cvo2Lh2CeOXpKN4HL7bOyuDaqcEX1vsWG577/wb1Yxs+aoQNnC/Qj9IX2HO
 0uvA==
X-Gm-Message-State: APjAAAUev4gSbqevkr+2j2hjDTA2wToqixRQ8MWWCTjMJnagqFHpwme7
 39kg3QzeMytKJOj5HCLmHIFTMDsINMqfk/HFMXdHyA==
X-Google-Smtp-Source: APXvYqxgrIn4al26ZnFpKqCL0TxyFBEwhX8AWXeCD4bBS7Ttf4sGA8fJ1Pg64Ke5L5GoUz3YDXkMxfaBaYcspaOS/YE=
X-Received: by 2002:ab0:1c0a:: with SMTP id a10mr22825812uaj.140.1576498591580; 
 Mon, 16 Dec 2019 04:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
 <1474a983-3e22-d59b-255a-edd3a41f0967@redhat.com>
In-Reply-To: <1474a983-3e22-d59b-255a-edd3a41f0967@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 13:16:20 +0100
Message-ID: <CACRpkdaYgpY=Anem00tPS=HPCD5XUrfWmWjvPkszggnHCpgK2Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Ugh, taking one last look at the "pinctrl: Export pinctrl_unregister_mappings"
> patch it is no good, sorry.

Ooops!

> Linus, can you please drop this from your -next ?

Sure, done.

> So I see 2 options:
> 1) Add an orig_map member to maps_node and use that in the comparison,
> this is IMHO somewhat ugly
>
> 2) Add a new pinctrl_register_mappings_no_dup helper and document in
> pinctrl_unregister_mappings kdoc that it can only be used together
> with the no_dup variant.
>
> I believe that 2 is by far the best option. Linus do you agree or
> do you have any other suggestions?

What about (3) look for all calls to pinctrl_register_mappings()
in the kernel.

Hey it is 2 places in total:
arch/arm/mach-u300/core.c:      pinctrl_register_mappings(u300_pinmux_map,
drivers/pinctrl/cirrus/pinctrl-madera-core.c:           ret =
pinctrl_register_mappings(pdata->gpio_configs,

Delete  __initdata from the u300 table, the other one seems
safe. Fold this into your patch.

Go with the original idea.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
