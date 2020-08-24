Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C433250C3B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 01:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C3F6E5BD;
	Mon, 24 Aug 2020 23:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E6B6E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 23:20:28 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id k4so8821219ilr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 16:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8XWgtZ5vK4Up0B/TM+RG3qQRtltpsqm7mpiHnDxkI/k=;
 b=tFjHvqgDFHQ8v/p1KgjPC4oFJwCBgO9oX0Htis3SLPYAUrojGk+Q4iRWukRr+k1Zqe
 NYOdDNR/RvW223z97FYzSZ7FunfkHgXrc+HVOxj9w3RKlP/oSazuY33AEFei1fJShg6R
 hv132pJFF/aqF1JO43cRYDj55Bo7qvQSar4M9Fq9mtkq5xgjWFXLfNwsQhntoZEg8mbf
 shR82bIBwCMUi1iw/j8TqiTIzaiLaD6ffRk9isJ7ws8YX+xgWzXQgEMNC+va41LDYZD0
 socG/nmLrjucZK230SHQrd07WKtIvSnyF6hbeLmABFVWxAI7IIQoidblc+fvJD9MWlW0
 JoSg==
X-Gm-Message-State: AOAM533T8441suoAHFkqxNOMLZ61JXTLZOzBKLjEJs+9p8qkcr+oVzqm
 hywtybA46+kIxxu+npPAZQ==
X-Google-Smtp-Source: ABdhPJz81NPScr2o01A9W03ELR+DP9VWy39xJ2Ke3mVIJWm3TaZo+hozKvdkj9Tji8yfCnvlI+90Yg==
X-Received: by 2002:a05:6e02:f92:: with SMTP id
 v18mr6694844ilo.125.1598311228358; 
 Mon, 24 Aug 2020 16:20:28 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id s87sm8176382ili.73.2020.08.24.16.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 16:20:27 -0700 (PDT)
Received: (nullmailer pid 3523832 invoked by uid 1000);
 Mon, 24 Aug 2020 23:20:24 -0000
Date: Mon, 24 Aug 2020 17:20:24 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/9] dt-bindings: display: renesas, dw-hdmi: Add r8a774e1
 support
Message-ID: <20200824232024.GA3523701@bogus>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Aug 2020 15:02:13 +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Document RZ/G2H (R8A774E1) SoC bindings.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
