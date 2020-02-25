Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E416EDC4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07346EB7C;
	Tue, 25 Feb 2020 18:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08D36EB7C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:18:10 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a22so199391oid.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yiMVySvuuBlNCELv1IEvGZ2avIS4ux6UUmlN6NsgO3k=;
 b=ZWc46Wi5YMLQVeFw9N7OgfF9Rv+n3u750BIwLsQRnpijiNBwJrvBwwF3pZC74emUMP
 9Q4kxRlVAVCSCbGJIIqVZUTUeN/u+8zXL3Lt7/R9KQ/eE2vXUXB2D6XJD9Fe2Eg/c+mw
 sT7Pjp31wScE4Q9aL4DnNU1lheukRf49CqK0arZm+ir0ge9iJMD5WjzW39w6Vk0SIdWH
 53AdEfNtWV6RcwYdSZmKKhG6Y4ZRw/Jo+RXNSVrLAOvuZWPm2T3nopc1D9Ual3RAUJA2
 4bVZr3l2caM3sCxdog+bYXECpxNta2ZN2naQQAjlzZgu2YBMtlCuLGoC3A8eAHxIkiaW
 7oIQ==
X-Gm-Message-State: APjAAAX/p4iugLxwZ/8glmNNUUF5WGdUec48w+avywGpg2E2t9ne0WyS
 boCVpJ/1ZRLlNgXhjxZwiw==
X-Google-Smtp-Source: APXvYqw28xdyGvjSdjDarHW2s0Fb+onlANDW5taKELi+Efvfv9JYUmEAg2FjeRAIn4sbu4cnKvc/jA==
X-Received: by 2002:aca:2803:: with SMTP id 3mr177830oix.162.1582654690275;
 Tue, 25 Feb 2020 10:18:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i7sm5569443oib.42.2020.02.25.10.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:18:09 -0800 (PST)
Received: (nullmailer pid 5749 invoked by uid 1000);
 Tue, 25 Feb 2020 18:18:08 -0000
Date: Tue, 25 Feb 2020 12:18:08 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 31/89] dt-bindings: display: vc4: dsi: Add missing clock
 properties
Message-ID: <20200225181808.GA5699@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <2d7aaa0bdf3f0cb66d14700fb77348453b3cd29a.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d7aaa0bdf3f0cb66d14700fb77348453b3cd29a.1582533919.git-series.maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 10:06:33 +0100, Maxime Ripard wrote:
> While the device tree and the driver expected a clock-names and a
> clock-cells properties, it wasn't explicitly documented in the previous
> binding. Make sure it is now.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml | 11 +++++++-
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
