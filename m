Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FFE1A8E24
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 00:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA876E5A9;
	Tue, 14 Apr 2020 22:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E076E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 22:00:02 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b13so1378840oti.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L1I6J+GVjnlwCVqQEMnud8REAvNZ6BVdyLiYBiiCNQU=;
 b=ahXDEOtObkIhKwsA/Ds7iRDEuht5+NXqFEuCdLEsdhAZSjXbFsc+zWl+YcIzMBP4rW
 En8B4FSuIAcUR0x2Gz/h0tblwFpCDzz/3ftFQm3zY1EO8xnm4B2dKKIXjXh796Grsojv
 Zbe3BeDHQXPlgWv/JoRQrFt42e49IUCiEPymbwwAKIt8rbT+r1oxBlwQ7b+ZBIBYoldR
 iCOUttXAAGeKYKCTawacqFsRAO/5CtrmvVE6F3Xa98IisHhSqwwCJLE2DhEpNmd/h+PS
 +WCBnTtq4o2EEJyER9KTogKTDKm3fRYzaAunzJb18KyJD9Sh6IJh735DxUm7iKSJ5Jmn
 HMlg==
X-Gm-Message-State: AGi0PuZ1Yr46Gc0vilK4Y96PUMaNdqqISfgh+X8vkP06SgJMBTUemPdl
 CKZloW8qfabw+/AXwLSwUQ==
X-Google-Smtp-Source: APiQypJbdgOqQtDbAuA0ml+fwiQ0T0JQ1mWT/DZowS+twshAN8exXxrEeN2/uqlQ6qDxjO/f1OGnFQ==
X-Received: by 2002:a05:6830:1d2:: with SMTP id
 r18mr20268515ota.327.1586901602102; 
 Tue, 14 Apr 2020 15:00:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r65sm5924724oig.0.2020.04.14.15.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 15:00:01 -0700 (PDT)
Received: (nullmailer pid 4140 invoked by uid 1000);
 Tue, 14 Apr 2020 22:00:00 -0000
Date: Tue, 14 Apr 2020 17:00:00 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: bridge: Convert simple-bridge
 bindings to YAML
Message-ID: <20200414220000.GA31265@bogus>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405232318.26833-3-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 02:23:16AM +0300, Laurent Pinchart wrote:
> The simple-bridge driver supports multiple simple or dumb bridges,
> covered by different compatible strings but otherwise identical DT
> bindings. Some of those bridges have undocumented bindings, while others
> are documented in text form in separate files. Group them all in a
> single binding and convert it to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/adi,adv7123.txt   | 50 ----------
>  .../bindings/display/bridge/dumb-vga-dac.txt  | 50 ----------
>  .../display/bridge/simple-bridge.yaml         | 99 +++++++++++++++++++
>  .../bindings/display/bridge/ti,ths813x.txt    | 51 ----------
>  4 files changed, 99 insertions(+), 151 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
> deleted file mode 100644
> index a6b2b2b8f3d9..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Analog Device ADV7123 Video DAC
> --------------------------------
> -
> -The ADV7123 is a digital-to-analog converter that outputs VGA signals from a
> -parallel video input.
> -
> -Required properties:
> -
> -- compatible: Should be "adi,adv7123"
> -
> -Optional properties:
> -
> -- psave-gpios: Power save control GPIO

Not documented in the new schema. Did you intend to change to 
'enable-gpios'?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
