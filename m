Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114453DE111
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 22:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9456E241;
	Mon,  2 Aug 2021 20:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FED56E241
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 20:53:53 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id f6so16043924ioc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 13:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CMmbkJn1hqKrrKfWcOMgT+dzBp8rg8s8rjX9yupZqck=;
 b=OD7tNZkItZlQ1ZDb3QBY0QiGTB6rTN3Y/lWZymAdrBWRiEmLYqT+xkxXeug+XN/aYv
 AsiCOu3R+Ylpbd+xLkJuQ72VbNUiG3DacRHpkQnmYymYHPTDFDyevzXyXggnwV5UdXf1
 OKUQmQcsFek3HLt7xhZATOTIqz6ihXz67WQWGdNokDciebK/tDNdPqcoihd4fwWbwnOZ
 yUfoE9KXc2h0Q/Q8KzuXi5fJDmM9hKQGBf1K6f9CeFYplMXrPTucUcwsj6lSNczFEM3V
 usol/S37vzyJy7ITXHN2iHn0Zom+VBH9MvDo9FHd+KKyywJWRCF/Cv7+sq3S6QrAjpPd
 JGJw==
X-Gm-Message-State: AOAM531YO9pCoT3w7ipmKOjzJL19C3tAbZMRdi7om5RbPRk5qYMl5rD3
 /Yob/gokoQZwrfDWzoC1/yzte+Jhtg==
X-Google-Smtp-Source: ABdhPJz6AI1jSrvVWmHeW1RFE01hM2uoqCxwrHYU5Cud/yUlAuMXyxMxVo5/EcUnQIPvWHBC4MNpgw==
X-Received: by 2002:a5d:93d1:: with SMTP id j17mr2310903ioo.123.1627937632798; 
 Mon, 02 Aug 2021 13:53:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g26sm7778228ioh.48.2021.08.02.13.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 13:53:52 -0700 (PDT)
Received: (nullmailer pid 1591239 invoked by uid 1000);
 Mon, 02 Aug 2021 20:53:50 -0000
Date: Mon, 2 Aug 2021 14:53:50 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V4 1/2] dt-bindings: display: bridge: lvds-codec:
 Document LVDS data mapping select
Message-ID: <YQhbXvNoR1J9NCAE@robh.at.kernel.org>
References: <20210727161357.8842-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727161357.8842-1-marex@denx.de>
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

On Tue, 27 Jul 2021 18:13:56 +0200, Marek Vasut wrote:
> Decoder input LVDS format is a property of the decoder chip or even
> its strapping. Add DT property data-mapping the same way lvds-panel
> does, to define the LVDS data mapping.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use allOf
>     - Move the data-mapping to endpoint
> V3: - Rebase on V2 submitted a while ago, reinstate changelog
>     - Drop the allOf and un-rebase on previous pclk patch
> V4: - port@1, remove $ref: /schemas/graph.yaml#/properties/port and
>       add $ref: /schemas/graph.yaml#/$defs/port-base
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 33 ++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
