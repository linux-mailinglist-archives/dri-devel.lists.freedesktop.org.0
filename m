Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB8332F560
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 22:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059486EC6E;
	Fri,  5 Mar 2021 21:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F4F6EC6E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 21:40:45 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id x78so4133403oix.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 13:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FrtZD0Mxkh4WDaMKcW/EnbPtCK0COhu80YMa0TPWoyA=;
 b=VY+257zTcWhIWAexEmcLCfU3Ui4ighOdrnrsCgyUO+R/la20meZpmY5PFMvN3MhCFw
 mG0K3A6qJqyrr7J0elTO+jRdizszo3lHMh6QHk+z1t4YBrqsBdnO5uykTEnQhYcjtM3c
 syeI0N0Iz5k4DDm08tIErCWzw6QY2CtXMpxKE0kZEYCI0MW0FJKCcgD7SXue8OwZNJNC
 8jHVUx63miTNWDvcU8+XijQNlaEKh27tdhYTps92HzIKcC4+PqF41HwK6IUoYmLhonOY
 oi9NluK+8qHv7gUdMOlHyqVoRPIcD7o1rGDb1imnQVysLywDu8Gwv2uDCCDcgIvP3lM4
 1VSQ==
X-Gm-Message-State: AOAM530V38AwvgjxkHxaYLYerSHVTpR7bWOrxIIxl5E5QhDV9vqK91AH
 oOmd+7f6UhM9NHfz1poFSA==
X-Google-Smtp-Source: ABdhPJxVRhFgsIi1pRC4A6txSVjHyhjaQx3TFOQATWLDTcUHIF2Otv7xYVByzgR19ecgkbJMqxEqKA==
X-Received: by 2002:a05:6808:93:: with SMTP id
 s19mr8641466oic.115.1614980444871; 
 Fri, 05 Mar 2021 13:40:44 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z14sm935904otk.30.2021.03.05.13.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 13:40:44 -0800 (PST)
Received: (nullmailer pid 693277 invoked by uid 1000);
 Fri, 05 Mar 2021 21:40:43 -0000
Date: Fri, 5 Mar 2021 15:40:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 Chipone ICN6211
Message-ID: <20210305214043.GA693229@robh.at.kernel.org>
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210214175211.105107-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 14 Feb 2021 23:22:10 +0530, Jagan Teki wrote:
> ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> 
> It has a flexible configuration of MIPI DSI signal input and
> produce RGB565, RGB666, RGB888 output format.
> 
> Add dt-bingings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - updated to new dt-bindings style
> 
>  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
