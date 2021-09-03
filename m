Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B624004DB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C26E8BE;
	Fri,  3 Sep 2021 18:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB256E8BE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:30:11 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id s20so284608oiw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zXZWn49SeYULR27oPdqfYDxVloOAcpotNgEeaQQkahY=;
 b=umOzV1x8qqUPWXTdDMv3MaFqKYlEg+2BgF99AkRixlVpXOIXWx1h1ZBEfJ1M0mDx4a
 Y/N88omq0cCz82WIOEBn+g8lTq23AlEFn0sRYkPv9qeFzPBgnVnXmmB1bOTGMTtWSQf1
 OWniB1Vjji6JwuFxTwKnf0Th0TTA2IWeq4lWN4ALm/rkRQngwCFlyYuo04idK76gcPqT
 0QS5o+++eCqAD7PSu6+7I6vjswXjyCpPcX982Ua+Mrdt4s8sXAXqHkbDS6LE/M7fu+6w
 h0jyO36pYr/qIB4K2cGPTbZIwuu6hFvlgwtRq5HFcMiI608D6hEK9XK40qm6E6LLJ+Yo
 Sgmw==
X-Gm-Message-State: AOAM532i4qhvb7gdcMz7vDAdnp70l0JAd521c30HaPkcfJyh5gvXYuk+
 IYGgbvM0p9PEUSB5uaUr2A==
X-Google-Smtp-Source: ABdhPJx3hL3AJSHZwy0Aq2QOZ9EUcNpzTqI6OvlG/ngaS7zBBifcfepIXOtxa6KBjnYgFOcstVXXaA==
X-Received: by 2002:a05:6808:3a8:: with SMTP id n8mr177425oie.10.1630693810492; 
 Fri, 03 Sep 2021 11:30:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f126sm1223209oob.9.2021.09.03.11.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:30:09 -0700 (PDT)
Received: (nullmailer pid 3239574 invoked by uid 1000);
 Fri, 03 Sep 2021 18:30:08 -0000
Date: Fri, 3 Sep 2021 13:30:08 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 10/52] dt-bindings: display: Move idk-1110wr to
 panel-lvds
Message-ID: <YTJpsBTz2vp1ZKhH@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-11-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-11-maxime@cerno.tech>
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

On Wed, Sep 01, 2021 at 11:18:10AM +0200, Maxime Ripard wrote:
> The Advantech IDK-2121WR Device Tree binding doesn't really add any
> useful content that is not already present in the panel-lvds binding
> aside from a requirement on the data-mapping.
> 
> Let's move it to the generic panel-lvds binding

I'm concerned this change means we can only have LVDS panel schemas in 
lvds.yaml. Having another LVDS panel schema means 2 things. First, they 
can't have a 'panel-lvds' compatible. That's probably fine. Second, they 
will still need to define 'data-mapping' (unless implied) and will need 
to include it from somewhere. So we still need a common LVDS properties 
schema and panel schema(s).

Rob
