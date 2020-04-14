Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13031A89A1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C6A6E51B;
	Tue, 14 Apr 2020 18:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A0A6E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:34:23 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j4so655488otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aNpXt9qm6dstm/l/OTZTWrrbGypmP32+1gU0CVpcu1M=;
 b=D2S9G3DHg3K1Lg3hBN00e/nKbof4xkvtG95xaeHf7VV5VHn8s1p2095LKjt9vONJhQ
 wjXJsmT8Qh9HNHLEQB8ZHDtnHp70TEuURDd1zlT/2ApAMylTx9Yavmv8OVbbIXRLOo/I
 s0mI/Hpo3WX0CJjDsH4Ba+3MLH+5ne6O+dawKFj6wnojgOWhqnrhga0ZvFJ/LNNgW4oC
 DjhUPUvHDmYrWe4LRPyy15/BRkMu8tybxKDwnvsxsk1+fsOiMbBH+hcx/MTxoreSpL/Z
 w08Jn7sH8mU+LOCbecIymXcZy7rYoj6SwdaHBinWGAirMXe9QaImAgX8zX3vhR0LXZdM
 Ic3w==
X-Gm-Message-State: AGi0PuZEP8ryniuA+Jhpr2KG8m2h9pnuU/KCr7tImBNR321MQ9kBEZzZ
 tFaOUKQ9dOPT7eGYo3gyMA==
X-Google-Smtp-Source: APiQypI5VZ2X3L0W4mQUSHIi4zZIKsimyyqqm60TzLPNKiCX1GwMUgV7yB8M4Zm21eK5G/p2jmzSGg==
X-Received: by 2002:a4a:b60b:: with SMTP id z11mr5991200oon.86.1586889262976; 
 Tue, 14 Apr 2020 11:34:22 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g12sm1075727otk.71.2020.04.14.11.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:34:22 -0700 (PDT)
Received: (nullmailer pid 8690 invoked by uid 1000);
 Tue, 14 Apr 2020 18:34:21 -0000
Date: Tue, 14 Apr 2020 13:34:21 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 15/36] dt-bindings: display: convert simple lg panels
 to DT Schema
Message-ID: <20200414183421.GA8641@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-16-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:48 +0200, Sam Ravnborg wrote:
> Add the lg panels that matches the panel-simple binding to
> panel-simple.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Brian Masney <masneyb@onstation.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Alexandre Courbot <acourbot@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/panel/lg,acx467akm-7.txt   | 7 -------
>  .../devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt | 7 -------
>  .../devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt | 7 -------
>  .../devicetree/bindings/display/panel/panel-simple.yaml    | 6 ++++++
>  4 files changed, 6 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
