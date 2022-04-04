Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D2F4F199F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 19:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141F810E392;
	Mon,  4 Apr 2022 17:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4914210E392
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 17:52:17 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso11565189fac.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 10:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FaqwoOuFdp3mYFpYfAC7s77bL5XItpmi/AKqa1/L498=;
 b=mb6BTWaSOhc58nvJ5sW8OX7o8W1L8CgyksOOhjxTfCNAb70jmwaxnSZtiEJOrThyBQ
 APxefi1qiJX79VKT4NpaObX2RbleITOuwRoRPKWxQ5qd1Y9bFeHp6En6xFy2juKGSWj8
 SGYn39GFHVpPFiPeTNaPVfna7/0YMBekbPzmoYsp0x++A3xthJF/Enxyn8ULWcHjB7gQ
 nLrteJDbPSB8pQs75euLAkdfSE5YpB44XvbCet1EmWDc71kgSiV6H1d4zNjrmQLxSbiB
 zH7Db9zyZZe6HuwjpJIAJvaXpmHxXDYboYu3lLwzyb8BFZWPAscpm2TNglYj9/AuIAMI
 ZffA==
X-Gm-Message-State: AOAM53179Q7VcspdnEsnTN8EtVkkQ4QY2o0YDVP2MBayqwctwTgaxvTm
 Balnfdl5CDm5vVHxr7Qb3Q==
X-Google-Smtp-Source: ABdhPJyJ/DcWKiZZQ7wjgJ2leztwWA9q+1hZSIYfCI7fzuMeDtYG0jTryrPTAl4WfoKgFuZA7Rc+1Q==
X-Received: by 2002:a05:6870:a688:b0:e1:e71b:c385 with SMTP id
 i8-20020a056870a68800b000e1e71bc385mr183324oam.173.1649094736527; 
 Mon, 04 Apr 2022 10:52:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a17-20020a4ae931000000b0032933be7230sm3212352ooe.4.2022.04.04.10.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 10:52:15 -0700 (PDT)
Received: (nullmailer pid 1615596 invoked by uid 1000);
 Mon, 04 Apr 2022 17:52:14 -0000
Date: Mon, 4 Apr 2022 12:52:14 -0500
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH 3/4] dt-bindings: drm/bridge: anx7625: Change bus-type to
 7 (DPI)
Message-ID: <YkswTpDiPYfdIFtE@robh.at.kernel.org>
References: <20220328120956.1848795-1-xji@analogixsemi.com>
 <20220328120956.1848795-3-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328120956.1848795-3-xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 08:09:54PM +0800, Xin Ji wrote:
> Change bus-type define for DPI.
> 
> Fixes: a43661e7e819 ("dt-bindings:drm/bridge:anx7625:add vendor define")
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 0d38d6fe3983..4590186c4a0b 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -106,7 +106,7 @@ properties:
>                remote-endpoint: true
>  
>                bus-type:
> -                enum: [1, 5]
> +                enum: [7]

Changing is an ABI break, but didn't we revert adding this?

>                  default: 1
>  
>                data-lanes: true
> @@ -158,7 +158,7 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> -                        bus-type = <5>;
> +                        bus-type = <7>;
>                          data-lanes = <0 1 2 3>;
>                      };
>                  };
> -- 
> 2.25.1
> 
> 
