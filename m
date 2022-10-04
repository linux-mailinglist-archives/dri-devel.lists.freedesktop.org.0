Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 830575F43AD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 14:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7444110E630;
	Tue,  4 Oct 2022 12:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EF610E5E1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 12:54:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b4so14223078wrs.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 05:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PkPNtuib5iRHSYoXuvCITszxB1jeo5nPeYiHHZL01UU=;
 b=aKbbnZoDBY06Fjy3RSKQhfzAXP/Fpd7Z0NocPlMkBTEjqE9KysXAj0smHAg6k5bZ52
 G3kcQkx0Y+fM9LPYRSAHWxnErO5LuGtgSVK5VU7qtIpqFjFr8isprkSzhfCKvlZNg5Uc
 bblamli2YxIlhbGYCKmlXDAzxtU1rW+o67ONYWDWlTadw7ufy/9sA5vbxKE5/l3KtwTE
 z2gYoyV1NmPHkKI13GaBFPLMSiD5exh43C6GJXFeIVNiDI/a1bE/3dHN4HF/N3uh3LPY
 CplV3F1T6nmpxOHlfxlj29KE5vlrZJQcjHRWqW7O8bdocUUXeHQeZbuxNPrGVVl6tSYg
 r5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PkPNtuib5iRHSYoXuvCITszxB1jeo5nPeYiHHZL01UU=;
 b=aSCWZ7PY0Cx4Y4xnjeVGbJnIBMCTvstR9J5K+bG32GQJhUwfgvCzLPMXZZ5BCTomKj
 TE9pu5pro/ILINkM9HoyJpvzLg8UAity9LIMzqEpQnweUF8aXmKye8Bq4jkHyNEQKkU7
 5I5osLXQz2sWYk+pD4+Xk4M9kGl1bbybqjoIvJj9LfmqgXzrUUyWBmERoDiJCcUb2s3q
 +ZxKylAVw0L0nZASTs+2zjGjEWMN+ZCZGyzyU7+srgmOnnV5ab3mnHGfQERIulMlhMhM
 LvJYNeYZ3gkHfw8MUe4TsGDOgeQLnGnQ2YB7ddt0LJjmM83FSYLojFLpnpj0rzkZWbei
 mywg==
X-Gm-Message-State: ACrzQf1EgJ2mTvGfRH3ZvoVh2fJWIRgHHlg+Wms9aBLKTCSZycLwVdag
 VEle+Oy1miYh9XG/zTwFOVSqFg==
X-Google-Smtp-Source: AMsMyM6zkuocVUmsW5crCUEXtpbvBS7DDgsVlES5Am7dCaMtOQ/Tak12eHP2HL2OCi1vm5tQZq3p3Q==
X-Received: by 2002:a5d:588f:0:b0:22b:5cc:e1d3 with SMTP id
 n15-20020a5d588f000000b0022b05cce1d3mr15148579wrf.142.1664888095272; 
 Tue, 04 Oct 2022 05:54:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003b4ac05a8a4sm25305803wmo.27.2022.10.04.05.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 05:54:54 -0700 (PDT)
Date: Tue, 4 Oct 2022 13:54:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <YzwtG8CT9sTCqQQk@maple.lan>
References: <YzN6A9Y20Ea1LdEz@google.com>
 <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
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
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 04, 2022 at 11:02:06AM +0200, Linus Walleij wrote:
> On Wed, Sep 28, 2022 at 12:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>
> > Properties describing GPIOs should be named as "<property>-gpios" or
> > "<property>-gpio", and that is what gpiod API expects, however the
> > driver uses non-standard "gpios-reset" name. Let's adjust this, and also
> > note that the reset line is active low as that is also important to
> > gpiod API.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> I think the gods of Open Firmware will try to punish you for such
> incompatible changes. But I have long since renounced them.
>
> > Another option is to add another quirk into gpiolib-of.c, but we
> > may end up with a ton of them once we convert everything away from
> > of_get_named_gpio() to gpiod API, so I'd prefer not doing that.
>
> We need to know if i.MX is shipping device trees stored in flash,
> or if they bundle it with the kernel.

This part is frequently found in add-on boards so it's not purely an
i.MX-only question.


> In the former case, you have to add quirks, in the latter case this
> patch is fine.
>
> Sascha, what does the Freescale maintainer say?

IMHO for not-in-the-soc devices like this the presence of in-kernel DTs
isn't enough to make a decision. What is needed is a degree of
due-diligence to show that there are no obvious out-of-kernel users.

To be honest, I suspect the due-diligence checks will probably yield a
green light for this one. Most of the tutorials for the popular HX8357
devices, show how to run python code in userspace that sends raw SPI
commands. That sucks but at least it doesn't raise any concerns about
bindings maintenance.


Daniel.
