Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D215EE46F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3733E10E725;
	Wed, 28 Sep 2022 18:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EF210E725
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 18:33:57 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 l9-20020a17090a4d4900b00205e295400eso2419582pjh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=RCwN9AlZXOuaFvwKPoD1PGnGUo7LPQsYg7VzFOMyJew=;
 b=MHeB94dSU3FwqTwJadXEU9+F8OjEtOOwquMEtUMivcj5jdJ4cgrVk53R8QNAN5ENqx
 ZrVSf741fNPl6Ia6docjWSEc/hR3SS0SpxA02sEqPs7clmhuM+/rifA5ab8Wf7wIiCoR
 fSe2e0Rt0JanGxvlFsiqCQSZExoWR7z+ybZEbAz9KIZEHlBqez1Img/ekGpzieghvfAm
 +jFoe8pH2chP1xmjU2D8Pwd8SECv8NwXa4bsHuN8S5uoqvn4/IKzexrWAD4HmbLMpoWq
 mP7OotrWLOvGhGyhQKDVqcwVNm/AR0WN1d5P/gc9yweo26PGXqzQ6d/VV2rnU3MkY31g
 597A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=RCwN9AlZXOuaFvwKPoD1PGnGUo7LPQsYg7VzFOMyJew=;
 b=SFcWs1vszVd069H0xM/s90IV8eTF3JVFzMGsATJXS+V/vjuWI6BmGK8Naoe3e3iXau
 fLbxcsmLyUjoRYcpr+EbKlzrdPJ43d3DrZO9uPUCncUf5eWkyRCSvZxa2hs8yoo4dzKx
 j79357Sv4a63n26Tw2WnH33yq345anB03n4Yrx+72l4l9fHEcpKq7XGZaD5WH3JfqFdM
 i2UZMePl+jjbrtYQ6Ehve7Jv5Qc7PIKjm1QLBJ4W1tYrqML2ovSLg76NwYivG88SJYgp
 T8BazJOnLJcJ8lin3klTxO5LsBYq9fp86PPTqalqydyQBthwnNyKU70LK5Nlfbb6/731
 miHQ==
X-Gm-Message-State: ACrzQf38aZZEYboYG0DjATjKS434ohbrUHD9/Jo4pKXtw9nD4K20/HEw
 D9RP40a6ICb+5Ky0TeL1A7I=
X-Google-Smtp-Source: AMsMyM6k5db8r+hiQex825d7BF9QeN6Ds6JothB2v1yH9cYQ/oS6YP/TBXWy8yPTTm3B3uFFgZLUSg==
X-Received: by 2002:a17:903:244b:b0:178:1c88:4a4c with SMTP id
 l11-20020a170903244b00b001781c884a4cmr1090298pls.95.1664390036324; 
 Wed, 28 Sep 2022 11:33:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1a91:59b8:faf:7b4f])
 by smtp.gmail.com with ESMTPSA id
 t16-20020aa79470000000b0053e5b905843sm4366265pfq.203.2022.09.28.11.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 11:33:55 -0700 (PDT)
Date: Wed, 28 Sep 2022 11:33:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <YzSTkJNAyyF7ufOu@google.com>
References: <YzN6A9Y20Ea1LdEz@google.com>
 <YzQpY2Llwsh/V4xV@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzQpY2Llwsh/V4xV@maple.lan>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 12:00:51PM +0100, Daniel Thompson wrote:
> On Tue, Sep 27, 2022 at 03:32:35PM -0700, Dmitry Torokhov wrote:
> > Properties describing GPIOs should be named as "<property>-gpios" or
> > "<property>-gpio", and that is what gpiod API expects, however the
> > driver uses non-standard "gpios-reset" name. Let's adjust this, and also
> > note that the reset line is active low as that is also important to
> > gpiod API.
> 
> No objections to the goal but...
> 
> 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> > Another option is to add another quirk into gpiolib-of.c, but we
> > may end up with a ton of them once we convert everything away from
> > of_get_named_gpio() to gpiod API, so I'd prefer not doing that.
> 
> ... it is unusual to permit backwards incompatible changes to the DT
> bindings[1]: creating "flag days" where hardware stops functioning if
> you boot an new kernel with an old DT is a known annoyance to users.
> 
> I usually favour quirks tables or similar[2] rather than break legacy
> DTs. Very occasionally I accept (believable) arguments that no legacy
> DTs actually exist but that can very difficult to verify.
> 
> Overall I'd like to solicit views from both GPIO and DT maintainers
> before rejecting quirks tables as a way to help smooth these sort of
> changes (or links to ML archives if this has already been discussed).

I believe I was able to convince Rob once or twice that keeping
compatibility was not worth it (not in general but in a couple of
concrete cases), at least while device tree bindings are part of the
kernel. Can't find the emails though...

I think we should consider several options:

1. DTS/DTB is in firmware. In this case absolutely, we need to keep
binary compatibility as we can not expect users to reflash firmware
(there might not even be a new firmware). This situation matches what we
have with ACPI systems where we are trying to work around issues

2. DTS is shipped with the kernel:
	2a. DTS is present in upstream kernel - awesome, we can patch it
	    as needed and have one less thing to worry about.
	2b. DTS is not upstream. Vendor did not bother sending it. In
	    this case it is extremely unlikely that an upstream kernel
	    will work on such system out of the box, and updating the
	    kernel is a large engineering task where you pull down new
	    kernel, rework and apply non-upstream patches, rework kernel
	    config (new Kconfig options can be introduced, old options
	    can be renamed, etc). And then spend several weeks
	    stabilizing the system and tracking down regressions (in
	    general, not DTS-related ones)

3. DTS is not in firmware and not in kernel. Are there such systems?

So my opinion is that while device trees are part of kernel code and
have not been split into a separate project they are a fair game. If the
change can be handled in the driver without much effort (something like
"wakeup-source" vs "linux,wakeup" vs "linux,keypad-wakeup") - fine, we
can just put a tiny quirk in the driver, but if we need something more
substantial we need to think long and hard if we should implement a
fallback and how much effort there is to maintain/test it so it does not
bitrot.

Anyway, I hope Rob, Linux and Krzysztof to chime in on this exciting
topic once again ;)

> 
> [1] For this particular driver the situation is muddied slightly
>     because it looks like complex since it looks the bindings for
>     himax,hx8357 and himax,hx8369 are undocumented (and badly named).
> 
> [2] When the property is not parsed by library code mostly we handle
>     legacy by consuming both new or old names in the parser code.
> 
> 
> > diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
> > index 9b50bc96e00f..41332f48b2df 100644
> > --- a/drivers/video/backlight/hx8357.c
> > +++ b/drivers/video/backlight/hx8357.c
> > @@ -601,7 +601,7 @@ static int hx8357_probe(struct spi_device *spi)
> >  	if (!match || !match->data)
> >  		return -EINVAL;
> >
> > -	lcd->reset = of_get_named_gpio(spi->dev.of_node, "gpios-reset", 0);
> > +	lcd->reset = of_get_named_gpio(spi->dev.of_node, "reset-gpios", 0);
> >  	if (!gpio_is_valid(lcd->reset)) {
> >  		dev_err(&spi->dev, "Missing dt property: gpios-reset\n");
> >  		return -EINVAL;
> 
> Daniel.

Thanks.

-- 
Dmitry
