Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4C82A6FC9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 22:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7881B6E836;
	Wed,  4 Nov 2020 21:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FCD6E836
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 21:40:44 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id y22so138696oti.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 13:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vxoN1R9RfGCh3RGhg2wYE9qV8ZcxH+XD7kYhc9N9ioE=;
 b=eDQgFKg/gvCJlD7WJz+C3vgVyjWbEsI9K5LCX6s54Mg7WBaHL5SBRl4xtYgyFJwMgg
 h4CwA2yiLmWJTRhHgpC1GK6EO9MFXlqZP4OQqZuEodtdcQgzVdwxaj4frAPQXOSd+BIq
 vl3rIEfhupM7j2FGmjvzAhCRmobkNC6DdgIWPJnJybK0asDWs9gHfxGJQ8EX+mBl+XYX
 rK30Ork/IqMZXgEmZlsVzQLYF+jitcz++impqzA3s8K6RQBRZEZU4lnR+mFpRNGOkiac
 mErH2Ig3wt/QOHG5ztFKYh+ZGEzsxn0Fe3FX09/GC6Qmh4PmdCrzfJRZRHWWpNqetezZ
 RyRQ==
X-Gm-Message-State: AOAM530AlZVczf9z3SjJ3ERVYPkKB3nHkqgdePReKwCyuLID8KNp4iL+
 neKoUYRVOne6rLfN23lt0g==
X-Google-Smtp-Source: ABdhPJyjkquJkQavca5dYB1F3bBim/u9ogfjjxUUyl649Lki08IW51tJRaxE54QlhHT8DgcgURU9YQ==
X-Received: by 2002:a9d:69c6:: with SMTP id v6mr8549539oto.138.1604526044195; 
 Wed, 04 Nov 2020 13:40:44 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f124sm767912oia.27.2020.11.04.13.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 13:40:43 -0800 (PST)
Received: (nullmailer pid 4170255 invoked by uid 1000);
 Wed, 04 Nov 2020 21:40:42 -0000
Date: Wed, 4 Nov 2020 15:40:42 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add a property to deal with
 WiFi coexistence
Message-ID: <20201104214042.GA4170221@bogus>
References: <20201029134018.1948636-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029134018.1948636-1-maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Oct 2020 14:40:16 +0100, Maxime Ripard wrote:
> The RaspberryPi4 has both a WiFi chip and HDMI outputs capable of doing
> 4k. Unfortunately, the 1440p resolution at 60Hz has a TMDS rate on the
> HDMI cable right in the middle of the first Wifi channel.
> 
> Add a property to our HDMI controller, that could be reused by other
> similar HDMI controllers, to allow the OS to take whatever measure is
> necessary to avoid that crosstalk.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Renamed the property
>   - Split it into a separate patch
> ---
>  .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
