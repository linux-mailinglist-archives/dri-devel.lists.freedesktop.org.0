Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE71B4004E5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EDB6E8BC;
	Fri,  3 Sep 2021 18:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CE76E8BC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:31:46 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 y3-20020a4ab403000000b00290e2a52c71so1769612oon.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7YUEaLycuiNZIqQPxowaB/DzCRnSBQk4WOtC1nrNe8k=;
 b=dNRiEd9ce94iduiIdOD2sR3hid3yJzj3eUHB22UUuQLshDVGeWRXargvhPe4CyPsqG
 4XYX+7AlnS8GP/zNJsEMRREmQZ/y2UAAhj4tIj9hHnStPJb2kjaB+6mgyCDaBsqYgNsG
 dYhv6YI6ulb0WcvfbhgkmLpqxG3d+UpHnJke1wlWY7L0Vp9GUPNuJi0TqGQf86j7Yi9P
 clYPeSdsEpOwWTkhi/nTX/cn07yEPHwvZOGhKfHdgDjiazIgkUFgGjI34nhgOz1mhOuo
 +k89Ts1N8NoUOb730feBSK9jPzhLlH9Bb6aUlX5ZQxcqlKWkISnfaAa28llWON9EKLDF
 bOqw==
X-Gm-Message-State: AOAM5338cbi5FgpwjP2kOCoQT1DiK9M2uB72Dqm9NHJLZCGnlGYJcIB/
 B0YkldqvxMiG+ehBG8jnEg==
X-Google-Smtp-Source: ABdhPJyXKhseSCW1zAJyrbWCky6N9IzOhCOmDR1ZhY805AlrcjKlndiol7QkXNptee2ltvQ+cH5Grw==
X-Received: by 2002:a4a:e923:: with SMTP id a3mr4056877ooe.45.1630693906079;
 Fri, 03 Sep 2021 11:31:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z18sm25893oib.27.2021.09.03.11.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:31:45 -0700 (PDT)
Received: (nullmailer pid 3242167 invoked by uid 1000);
 Fri, 03 Sep 2021 18:31:44 -0000
Date: Fri, 3 Sep 2021 13:31:44 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Frank Rowand <frowand.list@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 16/52] dt-bindings: display: aa121td01: Remove unused
 vcc-supply
Message-ID: <YTJqECYzHDb26joE@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-17-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-17-maxime@cerno.tech>
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

On Wed, 01 Sep 2021 11:18:16 +0200, Maxime Ripard wrote:
> The Mitsubishi AA121TD01 Device Tree Binding was requiring a vcc-supply
> property. However, neither the existing device trees using that binding,
> nor the driver were actually using that property which is also redundant
> with power-supply. Let's just drop it.
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/mitsubishi,aa121td01.yaml         | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
