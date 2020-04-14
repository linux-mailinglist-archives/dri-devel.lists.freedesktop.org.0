Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA0D1A898A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822F96E512;
	Tue, 14 Apr 2020 18:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B046E512
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:29:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i27so667861ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9AGTb6lDHBIB4GO1K1r+d8ktTmCVjobWYQ9JHJM4Zyg=;
 b=PTIocG0VvzIAldruoPKZURKYsS1HhRGZANyy8ktFxeieD4t3hBX5ZXpiQ6ZZ6dzW8w
 9S9JwUUmz+WjxBR8Tlz0YYudR6xobHXB+Cjdxij8uahN4cTJQJa6YmGjSFkvFMEjuD7V
 wrxy/BuVfvF8ls5BFh2iqsY40PTb5ePZZ/OnRzOGmetLOkmzgrSAOwKiyKowjx2dqBj5
 q0ngbPUc5plfFb9GGLeq7KyYwcK/6BSuRHZy+G/LBeqbXxyKgpmOhQTv+vtDchmgaksm
 nuqdQVA0dN+C3r+MvRhhnv3KNSPM1+A4TM9RMOWC7rxwaGVBfYBRCMYQHCv7cQ1fRrVs
 0fUA==
X-Gm-Message-State: AGi0PubAvuyQ34a4sBwSLG9w184JGWDC8U7Ydx+PM6K0VZpZH1Jk4mZh
 5mgDAdBjD608xvmbpNyQGQ==
X-Google-Smtp-Source: APiQypIyuhxdNK/238sgyNwHWUvsPoGzbBLxBPmGRlma8x3qieuGQMoUbK0ZyJw4jS5KKGIHK/slKg==
X-Received: by 2002:a4a:4442:: with SMTP id o63mr6466018ooa.0.1586888972278;
 Tue, 14 Apr 2020 11:29:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 186sm6148048ooi.30.2020.04.14.11.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:29:31 -0700 (PDT)
Received: (nullmailer pid 27234 invoked by uid 1000);
 Tue, 14 Apr 2020 18:29:30 -0000
Date: Tue, 14 Apr 2020 13:29:30 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 09/36] dt-bindings: display: convert innolux,p079zca
 to DT Schema
Message-ID: <20200414182930.GA22691@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-10-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-10-sam@ravnborg.org>
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
Cc: Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 09:50:42PM +0200, Sam Ravnborg wrote:
> As the binding matches panel-simple, added the compatible to the
> panel-simple list.
> With this change enable-gpios is now optional.

But is a DSI panel, so it should be in panel-simple-dsi.yaml.

> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chris Zhong <zyw@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p079zca.txt         | 22 -------------------
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> deleted file mode 100644
> index 3ab8c7412cf6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,p079zca"
> -- reg: DSI virtual channel of the peripheral
> -- power-supply: phandle of the regulator that provides the supply voltage
> -- enable-gpios: panel enable gpio
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel@0 {
> -			compatible = "innolux,p079zca";
> -			reg = <0>;
> -			power-supply = <...>;
> -			backlight = <&backlight>;
> -			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 8fc117d1547c..328df95cbe88 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -143,6 +143,8 @@ properties:
>        - innolux,n116bge
>          # InnoLux 15.6" WXGA TFT LCD panel
>        - innolux,n156bge-l21
> +        # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> +      - innolux,p079zca
>          # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
>        - innolux,zj070na-01p
>          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
