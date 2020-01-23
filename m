Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D074C146B88
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 15:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8603B6FA14;
	Thu, 23 Jan 2020 14:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EDB6FA14
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 14:41:57 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id l9so3091610oii.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 06:41:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XyyEYmd6rzPdE4SjzNvt9zLoM4bcWk4jZl+F6inRdac=;
 b=suDBmcDw90MqybIaRebsNKTlGOBF0drfZ4EjLwnZTdvQP6pwxkI+n/VRWG3VtSqiZg
 s6bOjAOjTwXIX3V5unOXzjIXtULuXvwbe/3fgDmkhruI91IoykijoxPblThTgyIbV538
 j5MTMOPglEVuse2QASdcYnNaa+xCpXpr747ZuHFEwdXxlZRgp32LsadF6pBxejhP7mFg
 Apa3V0rRpQzhq5gWRenjfDPhrJqQpwGOwqSyW8vi9cw//+GcbGRLmhPmKa7DNg7v4lR/
 qwGY5c49wVBkPDySlo0kDrFlx10CeEYoFF79sxdxnty5UrM52V3sCxpaPXy038PrEYEW
 RydQ==
X-Gm-Message-State: APjAAAXsi10ZIVgZPfLb1CYy7sgbWl0bfPms3ut9RG/ourYkDORz5/Rs
 K+o8a+VtxqK3NQqZpI6kPA==
X-Google-Smtp-Source: APXvYqzBkE5Rv9HPj5Qd04PviHLLr7khBD4hO9ohPV1CuplqS7AN8jQmX3T8AbcYgjI08E1/d+keNA==
X-Received: by 2002:aca:2118:: with SMTP id 24mr10597649oiz.28.1579790517079; 
 Thu, 23 Jan 2020 06:41:57 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k17sm846309otl.45.2020.01.23.06.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 06:41:56 -0800 (PST)
Received: (nullmailer pid 8536 invoked by uid 1000);
 Thu, 23 Jan 2020 14:41:55 -0000
Date: Thu, 23 Jan 2020 08:41:55 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
Message-ID: <20200123144155.GA29553@bogus>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
 <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
 <20200120190249.GA9619@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120190249.GA9619@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 08:02:49PM +0100, Sam Ravnborg wrote:
> Hi David.
> 
> > > +allOf:
> > > +  - $ref: panel/panel-common.yaml#
> > 
> > not all of these properties are applicable.
> > 
> 
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - dc-gpios
> > > +  - reset-gpios
> > 
> > Missing optional rotation and backlight properties.
> 
> Thanks for catching this. I have written a little .yaml files
> since I applied this - and learned a little more of the syntax.
> 
> See attached patch for my attempt to fix this.
> Please review.
> 
> 	Sam
> 
> From 6b54fb0a071c0732cd4bd5b88f456b5a85bcf4f2 Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Mon, 20 Jan 2020 19:55:04 +0100
> Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
> 
> David Lechner noticed (paraphrased):
> - not all properties from panel-common are applicable.
> - missing optional rotation and backlight properties
> 
> Fix this by listing all allowed properties, and do not allow other properties.
> 
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
> Reported-by: David Lechner <david@lechnology.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: David Lechner <david@lechnology.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/sitronix,st7735r.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
