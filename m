Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03F51A8B21
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 21:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DC06E177;
	Tue, 14 Apr 2020 19:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FE6E177
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:40:56 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i27so917989ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rA3IETH0xgn8ebwBJlBRbndhRKsHnPU2NvYNY3hNsKA=;
 b=Oo5Ixps4fJJeEZnUuFLQuIRtl3VOyomE4KRlcviMZECsn7MyNs0FoOhTl3a8a1nPEP
 c3Lmi7JAR38KltIg1AUiHQeGoLZnqjq65pxXO5MSdpGDA2glCMyQf9tuOuEGbLUBtWih
 jaC0g5CqpzpTVxT3S+Z0GlSgRX37+JjqBK+zAKZVc9OgYiq8cYxLPLRqpONjOr433kD5
 wlvqX6sY3+D+ypJVGYeabBnMZds3AJhWO3sIWK0I/9v1HiNcPMI60ImWl4Li2iRbIuZs
 iMdjjfY1xjTchITLmGfHF/z+djHOhkCscYnMxS2YUmCADwPP1I0bkcQctjs/qS6x7h/u
 vR0w==
X-Gm-Message-State: AGi0PuYV/ePlqsei+1AKU6VMCVYaVL8bXlrPE4ODcAsCrLTIm5HiWwJY
 7JsxeLhouXZszcan7bzuFg==
X-Google-Smtp-Source: APiQypLI/AKUFg7kJsQaGhZnEKT2eudBr8nOypqMfZWA4MgD+9PzQn1dP3iPfKOpVxnuDsfLnEXp4g==
X-Received: by 2002:a9d:24a4:: with SMTP id z33mr18571236ota.326.1586893255888; 
 Tue, 14 Apr 2020 12:40:55 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h14sm2044908oov.11.2020.04.14.12.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 12:40:55 -0700 (PDT)
Received: (nullmailer pid 14986 invoked by uid 1000);
 Tue, 14 Apr 2020 19:40:54 -0000
Date: Tue, 14 Apr 2020 14:40:54 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 3/4] dt-bindings: media: add wiring property to
 video-interfaces
Message-ID: <20200414194054.GB29184@bogus>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412182012.27515-4-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 12, 2020 at 08:20:11PM +0200, Sam Ravnborg wrote:
> The wiring property is used to describe the wiring between
> the connector and the panel. The property can be used when the
> wiring is used to change the mode from for example
> BGR to RGB. The first users are the at91sam9 family where
> such a wiring trick is sometimes used.
> The possilbe values are so far limited to what is required
> by the at91sam9 family, but using "text" allows us to extend
> this in the future.
> 
> There exists similar properties today:
>  - display/tilcdc/tilcdc.txt: blue-and-red-wiring
>  - display/atmel,lcdc.txt: atmel,lcd-wiring-mode
> 
> Neither of the above are defined as endpoint properties.
> 
> The new property "wiring" has a more general name and
> is defined as an endpoint property.
> It will replace atmel,lcd-wiring-mode and may replace
> blue-and-red-wiring.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..c3bb87c5c9a9 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -141,6 +141,9 @@ Optional endpoint properties
>  - link-frequencies: Allowed data bus frequencies. For MIPI CSI-2, for
>    instance, this is the actual frequency of the bus, not bits per clock per
>    lane value. An array of 64-bit unsigned integers.
> +- wiring: Wiring of data lines to display.
> +  "straight" - normal wiring.

Don't really need a property to express this...

> +  "red-blue-reversed" - red and blue lines reversed.

For a common property, I think this needs to be looked at in terms of 
formats and some of the format negotiation work Boris was doing.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
