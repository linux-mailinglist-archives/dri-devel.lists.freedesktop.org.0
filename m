Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603EB16EDA8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239C36EB75;
	Tue, 25 Feb 2020 18:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8510F6EB75
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:15:02 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 18so235302oij.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sRPxV5iSvPN80K6tvKNtciXRBCMachxheO+dmsdwNT0=;
 b=edOJoht4ilf08MYvv7P75YkM+PPA1++xqt1jawlN9y/YiymiO558cdmjOqx2ttT3dL
 0S0bwhSCh8PwTR2gl7Tmj93zRGXt4TOLF4phEq+kDCQjlGd2Iol1UagZE6ihgZB2qfBB
 LiE2ddw9BJAtgQ6abM6hL9852IGelwcPQVuJ5b7f0JEpEUIhTx+YOeY7jruudu0KAk1V
 YTi6l2yd7dMphH78LbHcn1I9bOI7yjoAwzSbL7xrbF/Hs4khpFHrX21WzVbJXvQsdKDt
 mvdo1yABrZhtR0uOhvU1zj2XOtGCcd1NohrDbWO3AgvqURMW/icstdagvK5tYu/J/yiB
 ArpQ==
X-Gm-Message-State: APjAAAWA/h3eOVpBKazoRfoCTTtKT4DrL+4w4D9EkX4cuC/V+v37YNPp
 NxRJkxIKOt/oUw/Uee4iiUoDZvY=
X-Google-Smtp-Source: APXvYqxWUUIv2aQqOuCp8OaRKWv2QrkvHU2RtzwROvmadfZZRS7+D+CIBSg3H3p92q957/Sr7GWDHg==
X-Received: by 2002:aca:5f87:: with SMTP id t129mr199368oib.36.1582654501742; 
 Tue, 25 Feb 2020 10:15:01 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i6sm5902042oto.62.2020.02.25.10.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:15:01 -0800 (PST)
Received: (nullmailer pid 601 invoked by uid 1000);
 Tue, 25 Feb 2020 18:15:00 -0000
Date: Tue, 25 Feb 2020 12:15:00 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 02/89] dt-bindings: i2c: brcmstb: Add BCM2711
 BSC/AUTO-I2C  binding
Message-ID: <20200225181500.GA538@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <9e427ff22fa40b7146b44aee6468559499deb1f1.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e427ff22fa40b7146b44aee6468559499deb1f1.1582533919.git-series.maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 10:06:04 +0100, Maxime Ripard wrote:
> The HDMI blocks in the BCM2771 have an i2c controller to retrieve the
> EDID. This block is split into two parts, the BSC and the AUTO_I2C,
> lying in two separate register areas.
> 
> The AUTO_I2C block has a mailbox-like interface and will take away the
> BSC control from the CPU if enabled. However, the BSC is the actually
> the same controller than the one supported by the brcmstb driver, and
> the AUTO_I2C doesn't really bring any immediate benefit.
> 
> We can model it in the DT as a single device with two register range,
> which will allow us to use or or the other in the driver without
> changing anything in the DT.
> 
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml | 40 ++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
