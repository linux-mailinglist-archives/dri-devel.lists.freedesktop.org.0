Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D84C72728E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 00:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6777310E568;
	Wed,  7 Jun 2023 22:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EF910E568
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 22:58:58 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-77abe33790dso88823439f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 15:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686178737; x=1688770737;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iB9XrQ+a6WIZmp+zbM7Qeq67vgXTSlPM9tziF9ThlVU=;
 b=jJhzAIiMdqPhjNLQqSP5Ko14mH3fz1CmaX+p/rmbrw13mq3m5mrRFVSmqqyf7EB0Do
 7cydLb1jpKGkas566mHk25IOzqLZUeHfpK/pXsGlsyLz8355YLYVvjsTaQ3fzVJAXx7q
 HMxx/SjOaXQm+EcchNnET6HL4nWS2XDsI9PQcXXRW8Jn7u5ZVKQV6CQsrTC22FAT7/SH
 jk3DWtpjwkCsYX1GfMos4zTcslz6bK1rIrbgmmwC20LnMItqhmP6ruUYUtFRMFW7B35d
 oRDNSMYuCnXEhr7mDz6loel6Zsetsnro4fJGxymv+PbJGUtCVZICrJL4HPehOKX7nNek
 2G2g==
X-Gm-Message-State: AC+VfDzvfxBo9bJHfICviPuqE8OZtglX7/k1hIGmqJbOQDSejcFt+JF5
 lnVFS5oFl1sxDdxThxfWIg==
X-Google-Smtp-Source: ACHHUZ7GyWclAIE0PzlN9Vgtpl3sBod7vdf2FQhPd2yqzwfylkGB++YMGy6fetz+l45NA7qKGSVwng==
X-Received: by 2002:a6b:e609:0:b0:76c:826f:2188 with SMTP id
 g9-20020a6be609000000b0076c826f2188mr6026686ioh.6.1686178737285; 
 Wed, 07 Jun 2023 15:58:57 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a02c618000000b00411baa5ec5asm3665517jan.154.2023.06.07.15.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 15:58:56 -0700 (PDT)
Received: (nullmailer pid 139626 invoked by uid 1000);
 Wed, 07 Jun 2023 22:58:48 -0000
Date: Wed, 7 Jun 2023 16:58:48 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 2/8] dt-bindings: display: panel: mipi-dbi-spi: add
 spi-3wire property
Message-ID: <20230607225848.GA131389-robh@kernel.org>
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
 <20230607115508.2964574-2-l.goehrs@pengutronix.de>
 <69fdb6a2-12b6-547d-019b-c77dd2bd98cf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fdb6a2-12b6-547d-019b-c77dd2bd98cf@tronnes.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 09:59:47PM +0200, Noralf Trønnes wrote:
> 
> 
> On 6/7/23 13:55, Leonard Göhrs wrote:
> > Some MIPI DBI panels support a three wire mode (clock, chip select,
> > bidirectional data) that can be used to ask the panel if it is already set
> > up by e.g. the bootloader and can thus skip the initialization.
> > This enables a flicker-free boot.
> > 
> > Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
> > ---
> >  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > index c07da1a9e6288..2f0238b770eba 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > @@ -87,6 +87,8 @@ properties:
> >        Logic level supply for interface signals (Vddi).
> >        No need to set if this is the same as power-supply.
> >  
> > +  spi-3wire: true
> > +
> 
> I don't think this should be added here. spi-cpha and spi-cpol are also
> supported but they are not mentioned. Instead those are documented in
> bindings/spi/spi-controller.yaml. Why they're not documented in
> bindings/spi/spi-peripheral-props.yaml instead which this binding has a
> ref to, I have no idea.

spi-peripheral-props.yaml are properties of the controller in the 
peripheral nodes. spi-cpha and spi-cpol are properties of the device 
which are completely invalid on some devices. We can only check that by 
documenting where they are valid. I think spi-3wire is similar. There 
should be more explanation in the spi-peripheral-props.yaml commit 
history.

Rob
