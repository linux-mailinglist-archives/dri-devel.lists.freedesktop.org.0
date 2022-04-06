Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D822D4F6385
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9B10E454;
	Wed,  6 Apr 2022 15:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D6489E08
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:43:17 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id e4so2802118oif.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 08:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zm0gltZzePsTxjzckZtmhsyfP1/8o8D5XY9uAa+8SjQ=;
 b=jgj0DQCwcSbxaLqFXGYF4yDOwoKGjT+AEpJX6Z/4LL1nNCXYEbQzXOhnOoGcH/Ox7i
 lWSvM03EttYuN/nGcqfYibQlL5Ql4JqVsPNmgS9Mox/zY4BtF2G4/lhZ0PJ+dXDt89IN
 tTsGlaP9I8p0gFPkdI4s4bvOKnKyjM4mw0QSVy6ELdpuldG/lY37oW+D0mQKxEOZq6Ee
 7D2GEswwaSHU/bJS8SrnDyH3l19XzVM4Ag3GW7hXdehekM/RaWbLJ1lesDCyn6RRxoY9
 okTo5/JhydZNnDnvZbF6h9q9QngS1eGfU63D9ia/02UXNhh+pNm0rx42fv8Hw4SD4TNY
 6TIQ==
X-Gm-Message-State: AOAM532KwjXSRn4KeMTzpaCsFTR4FFsllWTlXDKiKPukUwIKMEQtV0ai
 wXwOtkjN2G45P5UTHv3PNzmBiuCi5w==
X-Google-Smtp-Source: ABdhPJzeazWOgofzEVWYmwO7b8kSZEd7/9CWRnKH+S7isZUkaFj9UwOUoWXUCGuMU+R/y4krcswH5A==
X-Received: by 2002:aca:2311:0:b0:2ec:cb84:c5bb with SMTP id
 e17-20020aca2311000000b002eccb84c5bbmr3776315oie.246.1649259796324; 
 Wed, 06 Apr 2022 08:43:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bp21-20020a056820199500b003298e6877c7sm378089oob.29.2022.04.06.08.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:43:15 -0700 (PDT)
Received: (nullmailer pid 2300667 invoked by uid 1000);
 Wed, 06 Apr 2022 15:43:15 -0000
Date: Wed, 6 Apr 2022 10:43:15 -0500
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add TI DLPC3433 DSI
 to DMD
Message-ID: <Yk21E3nZo678iGz/@robh.at.kernel.org>
References: <20220331150307.58777-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331150307.58777-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Christopher Vollo <chris@renewoutreach.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 20:33:06 +0530, Jagan Teki wrote:
> TI DLPC3433 is a MIPI DSI based display controller bridge
> for processing high resolution DMD based projectors.
> 
> It has a flexible configuration of MIPI DSI and DPI signal
> input that produces a DMD output in RGB565, RGB666, RGB888
> formats.
> 
> It supports upto 720p resolution with 60 and 120 Hz refresh
> rates.
> 
> Add dt-bingings for it.
> 
> Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - fix compatible
> - drop reg description
> - fix enable_gpio description
> - fix port@2
> 
>  .../bindings/display/bridge/ti,dlpc3433.yaml  | 117 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
