Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47AD4004E7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940B46E8C1;
	Fri,  3 Sep 2021 18:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374096E8C1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:31:58 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso121166ota.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ugNRiYvpM3x4KIHxvO4xruJNMre5tOIxPNx+6YHichU=;
 b=kC/rUHixKkJIhPMa0i7qX5keEStfBttw9raPNTHkukKktRway6O1a1VgmjXunvnewQ
 Z9F6o6yyQnY45JIMYiydQS67MkoABOrQCmXLImtdhPLh4CL583kFPabSHGR2sxYNp4g0
 9Sv3HpsB0kmt6f3Z/Xh7Wpoh1PUj9wHW7XDnRX0qzmuQa/SvTMgqJjCkSH6tvI3MMDMP
 ucKtL2fMYq8MSZJhQI2pSoiMHJdIe+kJXY8V/EgnJJEw04cprmCGUv4P9JrEaYZ59zmk
 Ie7TWuJWBudb8g2vKSVX9hy+CaKLDBkYA56kmsu9yldUwq9eN9e0eCDq7MEqfdAQ1+4B
 OJBg==
X-Gm-Message-State: AOAM530CzhxL7ErKh3/SdhdlfJtH79FjdlY8Ee0POGesHicnn1W6cN1y
 d9Yhvp1jjmzBaOH9E2lVzQ==
X-Google-Smtp-Source: ABdhPJxiLBgdn/zP04HUB1R1+uFgw/HZ6rd2wJCTAIKvz2eTx5de55RgucOE77IIZUtJ2xdRk2rP2g==
X-Received: by 2002:a05:6830:4c1:: with SMTP id
 s1mr324387otd.221.1630693917528; 
 Fri, 03 Sep 2021 11:31:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y7sm1125047oov.36.2021.09.03.11.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:31:56 -0700 (PDT)
Received: (nullmailer pid 3242483 invoked by uid 1000);
 Fri, 03 Sep 2021 18:31:55 -0000
Date: Fri, 3 Sep 2021 13:31:55 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-sunxi@googlegroups.com, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 17/52] dt-bindings: display: aa121td01: Fix data-mapping
Message-ID: <YTJqGwg6WhCUW9L2@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-18-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-18-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Sep 2021 11:18:17 +0200, Maxime Ripard wrote:
> The Mitsubishi AA121TD01 Device Tree Binding was requiring a
> data-mapping property value which was set to another value in the
> existing Device Trees. Fix this.
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/mitsubishi,aa121td01.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
