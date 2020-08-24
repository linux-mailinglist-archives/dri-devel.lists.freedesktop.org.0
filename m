Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8F250B8D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 00:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AE289D8A;
	Mon, 24 Aug 2020 22:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4897F89D8A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 22:20:25 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id e11so8725166ils.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 15:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0w69xLXRX2cuqy8PwcvPK4rswz8AxstRYcdWsnyCdmA=;
 b=ldHyoC5jldGVbyB+PyKKpnH8c4gPMVZpmOzvJS0Jx/Z3n9ppoBuwEh5TCiP7zUGvEx
 mf4JXQLtBVcCCIuSeDgq9Lj9OgxrHvzGo6sVVmm+nfahJKvB+jqJJSGrCpe56xGU6QeJ
 erztaAdquavob1BmdtTkG9P4lditPdxFepEdUmpTifXDSQ2eiYS5QauX9wBB7YiCdF/3
 oRPyWl2dQzDZ0LWmlBYZSIDOWFHc0oA66r4zZVSsqR7myS3VjYHJ5g2Bn5K9fE1Vge+r
 itv5iTSjmcxVw3ci3GRHMcEgdYT5xTy6vKxwCGXUkhJ/aA6pZQT3e+r9oKC7rOk0YGT6
 jhWw==
X-Gm-Message-State: AOAM5312z4KsbI0H62bQW/vKi10TAO3xhj0DM9msusEBynS+JcFep0kB
 KOGS/MCe+nExepKOAcS7yA==
X-Google-Smtp-Source: ABdhPJxzMDMMF6nPOlKvaw2WTcX5LkAjXE1Yqq4HUP/4S6BqQ3nLU632NSDshEZNOcpbstiGcm3pIg==
X-Received: by 2002:a92:b503:: with SMTP id f3mr6137211ile.222.1598307624686; 
 Mon, 24 Aug 2020 15:20:24 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id y8sm7204300iom.26.2020.08.24.15.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:20:23 -0700 (PDT)
Received: (nullmailer pid 3420535 invoked by uid 1000);
 Mon, 24 Aug 2020 22:20:20 -0000
Date: Mon, 24 Aug 2020 16:20:20 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas, du: Document the
 r8a7742 bindings
Message-ID: <20200824222020.GA3420392@bogus>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Aug 2020 18:49:48 +0100, Lad Prabhakar wrote:
> Document the RZ/G1H (R8A7742) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
