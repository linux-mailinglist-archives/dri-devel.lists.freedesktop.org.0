Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A732505F5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 19:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4056E062;
	Mon, 24 Aug 2020 17:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A0E6E062
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 17:25:00 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h4so9508144ioe.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 10:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8lTTj/jmM6acdQm8/e8F2732+IJ43OBKaVG2UWzljck=;
 b=fBwIGto2xsmCYkx51HBGxiXBoJyPgLjBurFNLJT5is8hYoGZdXkfF3DPMmouISwcyH
 uQ9HWz+V6Cswy1Qx3kwOki69VP1IG+3hqHbWZzX1OfAKQvTm46jckRRnR40H4rUsFHH4
 zV8TG6od0IOUhbshhQ0yF+QE/+FYvIh/jtUNkw9dSKBsfXt+66wyGHJwANX59qbcDgUu
 jFDc++vXv+GP1sPQukhaLrGD0LA7hWgkVBnXulzv1ZXx5B+2uB8y7WOzS05E52qB1Hpe
 uw2OZG7Hu5LV2pXsqXnryMGLaFAHhWn9QmqCb2p10Hh6VRGT/rRQEi73X6Tw+/Rx0JEX
 ux5w==
X-Gm-Message-State: AOAM532Hioo8VZmk0TniUmxufA0W9e/FVnf0Wh5bFC4nk35kOTlUhTMt
 lWYXGeKxNyEOQaAhdtW9Pw==
X-Google-Smtp-Source: ABdhPJyTBX3p/wehrALXgNAMThV85kOSRDteKPInM12uyjqGIejIB3rM+0JIUP9uewe8zY9koeq3tQ==
X-Received: by 2002:a02:cf36:: with SMTP id s22mr6745606jar.80.1598289899733; 
 Mon, 24 Aug 2020 10:24:59 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id c88sm7669699ilg.5.2020.08.24.10.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 10:24:59 -0700 (PDT)
Received: (nullmailer pid 2928413 invoked by uid 1000);
 Mon, 24 Aug 2020 17:24:56 -0000
Date: Mon, 24 Aug 2020 11:24:56 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200824172456.GA2926958@bogus>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 10:51:48PM +0200, Linus Walleij wrote:
> Let's use a common.yaml include for the backlight like we do with
> the LEDs. The LEDs are inherently incompatible so their bindings
> cannot be reused for backlight.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the | for the description
> - Drop the "default-on" property, we're not using it.
> - Drop the minimum 0 for unsigned u32:s
> ChangeLog v1->v2:
> - New patch as suggested by Sam.
> ---
>  .../bindings/leds/backlight/common.yaml       | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
