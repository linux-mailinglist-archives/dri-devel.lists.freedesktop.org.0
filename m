Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF3C250C38
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 01:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437A6E5B4;
	Mon, 24 Aug 2020 23:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009826E5B4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 23:20:07 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id g14so10576816iom.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 16:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gK1GTkCC8Zew+U1kaN27vLD8RJiFflkvDjKcjyT1Kno=;
 b=khR4HfPNqyQ3cs3xMeLp+4pSqjkI5ItKz8oSbUr99RvZXrLVTnaHAEf1xqnbc5YkY3
 9unPGaBYXkpB1ZkPaMXolesioccTqwg5omPM+HmroNSv6Ht9BtyRGWXsykinBf2ourYR
 TKkiNo7IoHawvcUztaNF+/Ym3Wv/7PA8+tj1o5vhLweL2oV73rv9K73Hwg7davoFXKOn
 WhKyejyQ37n+DAFM14jydzqTJWYtLKITXv5mOAtmtL/OXGWXRDQxaUVB7NVrA5aqHb47
 3rR/8PzBQ3Xoqh5kn8T+gD3UFtBk7X6dK6OzWYHVij/RIFtTkv5eaDgS6WU1m84KM9ZO
 C+VA==
X-Gm-Message-State: AOAM532Ph6bMPvf7zyhHMK/v030h9jhrGSvEMGxpdXeqYK6OGKnvaVUA
 QL5xVA57GX+EkY/WVmwEQw==
X-Google-Smtp-Source: ABdhPJxBYS4/DghsKLFxaoIr2jx3kUrfxLwg3FjAD4LLPIstojRTz703uiXN219DtKHssoSq7utgPQ==
X-Received: by 2002:a05:6638:1a7:: with SMTP id b7mr7739743jaq.1.1598311207296; 
 Mon, 24 Aug 2020 16:20:07 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id d19sm543169iop.14.2020.08.24.16.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 16:20:06 -0700 (PDT)
Received: (nullmailer pid 3523179 invoked by uid 1000);
 Mon, 24 Aug 2020 23:20:03 -0000
Date: Mon, 24 Aug 2020 17:20:03 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/9] dt-bindings: display: renesas, lvds: Document
 r8a774e1 bindings
Message-ID: <20200824232003.GA3523119@bogus>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Wed, 12 Aug 2020 15:02:12 +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Document the RZ/G2H (R8A774E1) LVDS bindings.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
