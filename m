Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33ED13C763
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4F26EADA;
	Wed, 15 Jan 2020 15:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380636EADA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:24:05 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id l9so15700095oii.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 07:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P/3+h18PWi0rPObNUTxyncVSLqQVYDEB0c+gxo42pyg=;
 b=Gr0bVcclh0mduOJgYt9QJnkkhpWJbqiCx/gybmeTH+DtLffgUEwNrtXll85nH0lUen
 VnXvNxtZ4m7dTn7/naJGoJeVgTmjD2tbJ1UjPvIsr4RAjbaMpLNg9j58LUEvnIyEYyz6
 pdCTusDIElCetPZ7OrjySljLeVD79yQyw+eJKQ/WsWLVVL6RXpHdmORHgiDP99jEjSBO
 R5XWQ6y4NP1wBt1VO3wtO+zFYZOY2yxj5RpKWx+T64yOWv9YZ1O262Tg7MIslTIxlRWf
 gIA3kWzRvsQFmqVV35gl3Pt5g0FgaGBmIzE2oqV5L0uV9n38dAzIFy9otaACe1fOjhzL
 +Hkg==
X-Gm-Message-State: APjAAAUL0Df6ceKxx/phhu+sygpN5i27ms4R/Pttp0RORRy4woGXIEzf
 O+E5eQhRUH4z4WHCgQ8E7MDDy0s=
X-Google-Smtp-Source: APXvYqzEFFshl9afXXuh1Bz2sMjj3L0c7W6/Mdqss5peCZmcbmaP9W/p7VjxnhGYbYfgs+d6+S5Dkw==
X-Received: by 2002:aca:33d5:: with SMTP id z204mr230122oiz.120.1579101844117; 
 Wed, 15 Jan 2020 07:24:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l1sm5733782oic.22.2020.01.15.07.24.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:24:02 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 22040c
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 09:24:01 -0600
Date: Wed, 15 Jan 2020 09:24:01 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 4/5] dt-bindings: arm: sunxi: add binding for PineTab
 tablet
Message-ID: <20200115152401.GA15812@bogus>
References: <20200110155225.1051749-1-icenowy@aosc.io>
 <20200110155225.1051749-5-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110155225.1051749-5-icenowy@aosc.io>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jan 2020 23:52:24 +0800, Icenowy Zheng wrote:
> Add the device tree binding for Pine64's PineTab tablet, which uses
> Allwinner A64 SoC.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
