Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E48250C11
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 01:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE2E89F3B;
	Mon, 24 Aug 2020 23:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0A89F3B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 23:05:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id g14so10547438iom.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 16:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=grnX0VUhlQ7UkI6SwTPw8N7QvRi6xvd/z+SkEjq5s38=;
 b=U2+CDUajIdtTw5bf5WvCFMVXj+ULFga78lCkF5yydUL+PcSauyOzfzWThU+QYWPFPO
 E6Wn8QtpQ7/9eQPai344ysbS0FEJgTNP2FiXtdtqJnBt+dqtQMDSt7MrBPkxOdEtDUaT
 VADMtvkiij2uQ/GJ4bPKtIFOUE62cjwHqBETpiACCoNXADWexnoOJGRh2K/W0whiTQC7
 tnyLC6THEgb0qdfLaqiF47x4jBmnN+uzFzHGF68I/cxs2e2eRBE2I8XMUfQDCSygUnBl
 tdS9rxMgemHI9m1uChmyNsfZ2QOO1wG53gwfr908rE0XK3kUVzp9v34OMe6ldtAAx2uD
 P2NA==
X-Gm-Message-State: AOAM533Rhw5PSRwu+WkLA8oKlJpLYfAxlk9vlBPCDw5amE6Ft3+3MozW
 OIHm4JBEvwpOJQ/R4/lDVQ==
X-Google-Smtp-Source: ABdhPJytoxNmBvblOQpX2IFcshYzh8s4J78tGM0KQSovKW3qVcPlQofuNB/4DhfHCAVDCI8+ecT0Ag==
X-Received: by 2002:a02:6983:: with SMTP id e125mr7654790jac.78.1598310301391; 
 Mon, 24 Aug 2020 16:05:01 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id e23sm7410122iot.28.2020.08.24.16.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 16:05:00 -0700 (PDT)
Received: (nullmailer pid 3498823 invoked by uid 1000);
 Mon, 24 Aug 2020 23:04:58 -0000
Date: Mon, 24 Aug 2020 17:04:58 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Message-ID: <20200824230458.GA3489164@bogus>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> Document optional vcc-supply property that may be used as VCC source.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 68951d56ebba..3248be31eceb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -79,6 +79,9 @@ properties:
>        The GPIO used to control the power down line of this device.
>      maxItems: 1
>  
> +  vcc-supply:
> +    maxItems: 1

Probably should be 'power-supply' to align with the 'simple' panels. 
That's also to signify there's only 1 supply. Using 'vcc' would 
encourage adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll 
NAK because at that point it's not a simple bridge with no configuration 
(it's arguably already there).

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
