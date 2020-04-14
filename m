Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1001A89A0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EA06E51A;
	Tue, 14 Apr 2020 18:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FD66E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:33:40 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j4so652900otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y6fTbhAGjUqtEqIQeLbjwq2Y7LbkDLyubMZdyUKSgGo=;
 b=T3kq6P61rtrH0+eJ/Wl5dQwfaYFLfmnn4pV8xVWWzGJIDNsFCjl2csWAhBa9BelS3W
 DmU/HVoWDjH+OpXqKxZbPd34Nefm5hdgsRoo3cX5Dxtza8/kMwCVls9BjdA6q8ZdoZx3
 dgOArocWReFxXKIExnhgIfZrBJGgI2Jl4BdvLxs7XZzDOQBbdp9MAeGtPw7DWlKXzTDv
 b1nYEHnNtzQyJRP+0JurIPYIPiXZ4hobZYfrJSihMwkMq/eAwqPCMA5qfMys6/hZcOv8
 bhGGApag5k1UFFp3lFIjhE0EV1Ifeg//bTQmumCCHsXezBjz47dYbz1P1Pa2+p2I8nfm
 kutQ==
X-Gm-Message-State: AGi0PuarpW9PkbzqcAd16STFWXGyYoSrtl6yBsiAinSNN8L6M/bIosBQ
 cZyVjaebq8pwZz6nurYkkg==
X-Google-Smtp-Source: APiQypJNJEnuJ3469ro1N9gTXG4VstjQ/AHsekMbRu/t0zl+h1EdXCUm7BuvNnm4UDqqjuQb03vq2w==
X-Received: by 2002:a9d:17ec:: with SMTP id j99mr19228937otj.213.1586889219475; 
 Tue, 14 Apr 2020 11:33:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n38sm994163ooi.21.2020.04.14.11.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:33:38 -0700 (PDT)
Received: (nullmailer pid 6699 invoked by uid 1000);
 Tue, 14 Apr 2020 18:33:38 -0000
Date: Tue, 14 Apr 2020 13:33:38 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 14/36] dt-bindings: display: convert
 kingdisplay,kd097d04 to DT Schema
Message-ID: <20200414183338.GA6560@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-15-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Nickey Yang <nickey.yang@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:47 +0200, Sam Ravnborg wrote:
> kingdisplay,kd097d04 matches the panel-simple-dsi binding.
> The only difference is that enable-gpios is now an optional
> property.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Nickey Yang <nickey.yang@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/kingdisplay,kd097d04.txt    | 22 -------------------
>  .../display/panel/panel-simple-dsi.yaml       |  2 ++
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
