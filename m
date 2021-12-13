Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE14737FF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 23:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D4B10E88D;
	Mon, 13 Dec 2021 22:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32A110E88D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 22:51:07 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso19030873otj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TXNuhThSZzYh5dHlQEsy87eUYOOCcMvcopbthlMlzi0=;
 b=jFpiASBD4k7dHE9IWRVyiBOI+Gx536eox1eF7PHbbDe4Z7uq2M4lkYYb88oMbEFE1Q
 GDbroW2agHYyQDUDx79Bu60UgNCm8czxZQxY+DV+oDwTTiz9yRJkH8aBGAF7vaVIgzdl
 M/8jImeO4oWdr07wJSMGoAs7sOBZEVO3f/KFWn5JiKRo3zeq5HVvEvBKiLVzdam4nB1c
 /naWMFZvcvQ5pW0oWI0LaqKKf371FnXwvwZObdf717A2f3H5hZqbdM2nTKBhDmuhGtkT
 ru4PZB3qBqDJW1zTFZf1ipn27xmJCI9tZ6h/EXjINNKCuelitJZg4htsdcCsLPfZVdFV
 6f1w==
X-Gm-Message-State: AOAM533eVcLSTUhtyIhVTCwlxQZurL6bWNHpnIqdPVeV56mjxflqPxw9
 tKD3upXMWm02nLpeLsUgQg==
X-Google-Smtp-Source: ABdhPJxCfZL3SzReunSYLPdv6bxyyePW0yFhigNTzi/mCZehsa7+8nCDGdg/U+lRD5jiU+CUp/zDpg==
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr1156068otl.329.1639435867068; 
 Mon, 13 Dec 2021 14:51:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e4sm1490630oiy.12.2021.12.13.14.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 14:51:06 -0800 (PST)
Received: (nullmailer pid 1725465 invoked by uid 1000);
 Mon, 13 Dec 2021 22:51:05 -0000
Date: Mon, 13 Dec 2021 16:51:05 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] dt-bindings: convert power domain node for rockchip DW
 MIPI DSI
Message-ID: <YbfOWXZJAZDuEU1V@robh.at.kernel.org>
References: <20211206212651.126405-1-david@ixit.cz> <26502781.jAYDHVeSjN@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26502781.jAYDHVeSjN@diego>
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
Cc: - <opensource@rock-chips.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 ~okias/devicetree@lists.sr.ht, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 11, 2021 at 11:55:58AM +0100, Heiko Stübner wrote:
> Hi David,
> 
> Am Montag, 6. Dezember 2021, 22:26:50 CET schrieb David Heidelberg:
> > Convert into YAML format into format, which can be validated.
> > 
> > Changes:
> >  - drop panel from example
> 
> the patch subject is strange, talking about a "power domain node".
> That needs a fix.
> 
> Some more things below.
> 
> 
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rockchip,px30-mipi-dsi
> > +              - rockchip,rk3288-mipi-dsi
> > +              - rockchip,rk3399-mipi-dsi
> > +          - const: snps,dw-mipi-dsi
> 
> > +      - items:
> > +          - const: rockchip,px30-mipi-dsi
> > +      - items:
> > +          - const: rockchip,rk3288-mipi-dsi
> > +      - items:
> > +          - const: rockchip,rk3399-mipi-dsi
> 
> what are these for?
> 
> I see that px30 uses the dsi without the snps part, but you
> can also just add a patch adding that second compatible to px30.dtsi

Or drop snps,dw-mipi-dsi as it doesn't seem to be all that meaningful. 
But I guess that's more invasive so maybe stick with changing px30.

> 
> I don't think we need to support both ways.

Agreed.

Rob
