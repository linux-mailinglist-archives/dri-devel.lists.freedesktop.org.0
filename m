Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C134EE4EE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 01:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DAB10E2DA;
	Thu, 31 Mar 2022 23:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFBD10E2DA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 23:52:54 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so991353otq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QtLleTaHCucGPsRaBTO86s6P+Sr59PZKXVV2CO1MOzI=;
 b=yrZKqvtbEyS8r6bQxHjKQE2DQsP0JAI/Lfcu+F+2ld5Yy493vblUr4a1uOkUGvaZBM
 wUtqIvMIct3G1ZOz9BgT+WWb4MzlhS0UE0D1S42REcY4GThk2jfP3lafhjIVozR9tZIG
 EICXVgpQOGPW2vHcgSOCzcsgUGJDYKva909hzFvI7T7P/jyXo05qTpLcjSKsm98CAA76
 o0ZgfQd4XatUheipdo+PZU0CNKYGO+bHEpcFEAzZCC5k0rP7kopMx9b2NcGYjRuQOjcy
 LXcqNiFFXErixkUntSYPZUqueMiYL/K//H2G5JSwlMSYnXNgGrNz8L/3pA/H7tJwfRhw
 +4/g==
X-Gm-Message-State: AOAM5334GMNThA8sg/xv0hMULYuLD766MW4iIvC8vMRarslmOV8QTOms
 qfiEXSFP4wLA4exEmeFssw==
X-Google-Smtp-Source: ABdhPJyX8xvZxfDgWuF9nXNoW7PdIaVk5mK36vc6rmjM3if5pWl4svyYXlRWWFyKrZa+wn8F80OdFg==
X-Received: by 2002:a9d:75cd:0:b0:5c9:61fa:3a42 with SMTP id
 c13-20020a9d75cd000000b005c961fa3a42mr6614511otl.15.1648770773424; 
 Thu, 31 Mar 2022 16:52:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e22-20020a9d5616000000b005ceb68be2f6sm280208oti.63.2022.03.31.16.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 16:52:52 -0700 (PDT)
Received: (nullmailer pid 1730141 invoked by uid 1000);
 Thu, 31 Mar 2022 23:52:52 -0000
Date: Thu, 31 Mar 2022 18:52:52 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
References: <20220323154823.839469-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323154823.839469-1-maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
> MIPI-DSI devices, if they are controlled through the bus itself, have to
> be described as a child node of the controller they are attached to.
> 
> Thus, there's no requirement on the controller having an OF-Graph output
> port to model the data stream: it's assumed that it would go from the
> parent to the child.
> 
> However, some bridges controlled through the DSI bus still require an
> input OF-Graph port, thus requiring a controller with an OF-Graph output
> port. This prevents those bridges from being used with the controllers
> that do not have one without any particular reason to.
> 
> Let's drop that requirement.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
>  .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
>  2 files changed, 2 deletions(-)
> 

I tend to agree with port@0 not being needed and really like 
consistency.

Reviewed-by: Rob Herring <robh@kernel.org>
