Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1C1E5413
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 04:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1526E156;
	Thu, 28 May 2020 02:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CF16E156
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 02:41:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c8so8017965iob.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 19:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aJSvdBSUP8hCC8+rgsz4EB7YLn+fmauMUvtrBMNRvO0=;
 b=aZB3xKKfWlRyPA5hlSDKUl8Bui/k6m1n0KNL3Rx/IlWyiZ4OSL82VsdE6aT2bFb0id
 2jipoyw3aE7XJo6Yyra0oavE+PRxEMYhOEwBALKJFQT26sbtHJixQJf4l9bqRm8ydGf5
 XfzswdkcmnjS2wSBAryVEc3KlZKEcSzBb3x+tI9/7HGyv50DNR1kFyWSrTqGzjftYAJ9
 3t3Bw3e/nrJuUBFA/y0gQflIfRvM1rVdX4XyET9R9X8WJ4RXt4wsPbdMcckzlPh9akNi
 UBZ+sJ/ux8F8LoamKsC7gyUdLQqBvTckdjZcajYrAVREX3rVzSL3w5yO4RlLbWdF+oYM
 +bzg==
X-Gm-Message-State: AOAM533zDFBcSTgU48lsAc27WjUH4TEVvB7/1JWG/cSrgOdXmEOvBbgh
 r5IYpDT0ahir7ZOF6W+uaQ==
X-Google-Smtp-Source: ABdhPJwSqz8Y/sFww2/trT6sggJFiwuWfVKWn54mRv6JFqUdmLygooXIQDu0sxeliOzsjWUfS6ELdw==
X-Received: by 2002:a5d:9e51:: with SMTP id i17mr691242ioi.8.1590633672645;
 Wed, 27 May 2020 19:41:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u2sm1917979ion.50.2020.05.27.19.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 19:41:12 -0700 (PDT)
Received: (nullmailer pid 3259982 invoked by uid 1000);
 Thu, 28 May 2020 02:41:10 -0000
Date: Wed, 27 May 2020 20:41:10 -0600
From: Rob Herring <robh@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: panel: Add binding for Xingbangda
 XBD599 panel
Message-ID: <20200528024110.GA3259935@bogus>
References: <20200513212451.1919013-1-megous@megous.com>
 <20200513212451.1919013-3-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513212451.1919013-3-megous@megous.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Martijn Braam <martijn@brixit.nl>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 Rob Herring <robh+dt@kernel.org>, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 23:24:48 +0200, Ondrej Jirman wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel. It is based on
> Sitronix ST7703 LCD controller.
> 
> Add its device tree binding.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../display/panel/sitronix,st7703.yaml        | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7703.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
