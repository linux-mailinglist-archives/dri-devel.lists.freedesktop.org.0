Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8152EB185
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 18:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05858985A;
	Tue,  5 Jan 2021 17:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0131D8985A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 17:40:14 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id o6so89492iob.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 09:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8QCUqXr2bzGc5ddkxZAj8Vxc5oTvsGwo9juSuaK/DNc=;
 b=IINQvzA7jFPM0NBLzoy9gREzgOt68IOd+tod7Y7sxbWfutYwHOXeUv4gid4SdsTZV7
 /H9gJmnHT2uJaYc19XKQvOjC3zqKsS7F5YXTnlrqVRq8NrD041tHhZL/8XD5Z1pxFaE9
 ms6J+c4u3HImobdYBJjgv3u8j5X/XXB4wuJOMeBi29iWsIsCicR/zwCFvkBwRQBlTBsy
 1dLLvsTZfOFrzhnCOMRHpQoG0js+NhcGfrlBcMvFiYODwtUd9ZPgAW5WbisjhXOOH5Mk
 KcMZ/aob/ZJDp0vXrtvBoDpcpoor4yBGlTIr6D8s8XnBf8wXmgcqK4Cuc+H/jfkyUj6C
 Pcxw==
X-Gm-Message-State: AOAM530be5/Ty3fO0zw8glgcJm/XfttjY/agoJlR3Qp1Yp2wiR6tPht4
 5FdgV3gjuG5d7Nq4R5McaA==
X-Google-Smtp-Source: ABdhPJxCW42aLPbGC5oVtd7TRg3rkrFk+Qrm1SC6TjLARKSfiB9JNiyQ7YL2gLDjCHBjUScpozxZgA==
X-Received: by 2002:a02:7692:: with SMTP id z140mr666018jab.21.1609868414264; 
 Tue, 05 Jan 2021 09:40:14 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y15sm121208ili.65.2021.01.05.09.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:40:13 -0800 (PST)
Received: (nullmailer pid 426116 invoked by uid 1000);
 Tue, 05 Jan 2021 17:40:08 -0000
Date: Tue, 5 Jan 2021 10:40:08 -0700
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
Message-ID: <20210105174008.GB1875909@robh.at.kernel.org>
References: <20210104230253.2805217-1-robh@kernel.org>
 <X/RjziK30y56uZUj@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/RjziK30y56uZUj@kroah.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 02:04:14PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 04, 2021 at 04:02:53PM -0700, Rob Herring wrote:
> > DT properties which can have multiple entries need to specify what the
> > entries are and define how many entries there can be. In the case of
> > only a single entry, just 'maxItems: 1' is sufficient.
> > 
> > Add the missing entry constraints. These were found with a modified
> > meta-schema. Unfortunately, there are a few cases where the size
> > constraints are not defined such as common bindings, so the meta-schema
> > can't be part of the normal checks.
> > 
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Cc: Ohad Ben-Cohen <ohad@wizery.com>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> <snip>
> 
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > index 247ef00381ea..f76b25f7fc7a 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > @@ -83,6 +83,7 @@ properties:
> >        Phandle of a companion.
> >  
> >    phys:
> > +    maxItems: 1
> >      description: PHY specifier for the USB PHY
> >  
> >    phy-names:
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > index 2178bcc401bc..8e2bd61f2075 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > @@ -71,6 +71,7 @@ properties:
> >        Overrides the detected port count
> >  
> >    phys:
> > +    maxItems: 1
> >      description: PHY specifier for the USB PHY
> >  
> >    phy-names:
> > diff --git a/Documentation/devicetree/bindings/usb/ingenic,musb.yaml b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > index 678396eeeb78..f506225a4d57 100644
> > --- a/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > @@ -40,7 +40,7 @@ properties:
> >        - const: mc
> >  
> >    phys:
> > -    description: PHY specifier for the USB PHY
> > +    maxItems: 1
> >  
> >    usb-role-switch:
> >      type: boolean
> 
> Any reason you dropped the description for this entry, but not the other
> ones above?

No, I should have dropped those too. I dropped cases of genericish 
descriptions on common properties. There's nothing specific to this 
binding here really.

> 
> > diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > index 388245b91a55..adce36e48bc9 100644
> > --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > @@ -15,13 +15,14 @@ properties:
> >        - const: ti,j721e-usb
> >  
> >    reg:
> > -    description: module registers
> > +    maxItems: 1
> >  
> >    power-domains:
> >      description:
> >        PM domain provider node and an args specifier containing
> >        the USB device id value. See,
> >        Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> > +    maxItems: 1
> >  
> >    clocks:
> >      description: Clock phandles to usb2_refclk and lpm_clk
> 
> Same here, why remove the description?

Really, the question is why keep 'description' on power-domains. Perhaps 
there's a little value in the reference to sci-pm-domain.txt, so I left 
it.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
