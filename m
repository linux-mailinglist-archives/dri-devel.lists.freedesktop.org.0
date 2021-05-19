Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5EF389739
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 22:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FC66EE87;
	Wed, 19 May 2021 20:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433726EE83
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:01:59 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id d21so14207799oic.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Kjcp8Kbu/gHUzT4EN3gAJeFDCsJxXxZEegj91MDV0s=;
 b=Bs6k4D6beOkNxjUuxt2eG5IkYXGvGdALdGOneCJ22SZIVkgoaKnCS4nOMFzCtG8aqD
 1kJOH4OzY0N/4Upm3lbR9MB7EtRJUPDCHCdXRBEWoNp5Kfo5rp96AvJIzbwkltWOvxai
 dXtEWpkek2/qxzBjSn8COkfWQYYIH0VyaKhcezU5Wjp8pXVMZhSGKqVX0AXHFISiarbm
 0QmguTDcBv1i8wxc+sRHo81eQhBkSL/50Lio+oX1ampDtfoqxiK4D+5/XnatWdRJmTPp
 nLE5Ycl5AyJS6OVg6/rb/tmyDq+c/Y+C0y6o0evN+qcgDWYJfMYGUVV//lPqyaoE087e
 CRqQ==
X-Gm-Message-State: AOAM533kpdSVKpYfLFuXF9YnvZMVZ2wdiSmUPKkzzyygxaUkjdpnn/S3
 m0+PTi9J6yorTYW8htqbhQ==
X-Google-Smtp-Source: ABdhPJydgRnEx3u0Yk7JGxUcjCToYZAuHSoyNE8WhQh23y3bTA4GIZ9QjzcusOLgg0cgOuCwZQ3YAg==
X-Received: by 2002:a05:6808:309:: with SMTP id i9mr731417oie.14.1621454518528; 
 Wed, 19 May 2021 13:01:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y13sm164017ots.10.2021.05.19.13.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:01:57 -0700 (PDT)
Received: (nullmailer pid 3552474 invoked by uid 1000);
 Wed, 19 May 2021 20:01:56 -0000
Date: Wed, 19 May 2021 15:01:56 -0500
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v7 03/10] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
Message-ID: <20210519200156.GA3535665@robh.at.kernel.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 01:09:00PM -0700, Douglas Anderson wrote:
> We want to be able to list an eDP panel as a child of a ti-sn65dsi86
> node to represent the fact that the panel is connected to the bridge's
> DP AUX bus. Though the panel and the bridge chip are connected in
> several ways, the DP AUX bus is the primary control interface between
> the two and thus makes the most sense to model in device tree
> hierarchy.
> 
> Listing a panel in this way makes it possible for the panel driver to
> easily get access to the DP AUX bus that it resides on, which can be
> useful to help in auto-detecting the panel and for turning on various
> bits.
> 
> NOTE: it's still possible to continue using the bridge chip and point
> to a panel that _isn't_ listed as a child of the bridge chip (since
> it's worked that way previously), but that should be deprecated since
> there is no downside to listing the panel under the bridge chip.
> 
> The idea for this bus's design was hashed out over IRC [1].
> 
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Possibly we might want something fancier that could be included by
> other eDP controller bindings. If we want to do this, I'd love to be
> pointed at a good example to follow.
> 
> Changes in v7:
> - ti-sn65dsi86: Add aux-bus child patch new for v7.
> 
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 26932d2e86ab..51f5a29e216c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -70,6 +70,11 @@ properties:
>      const: 1
>      description: See ../../pwm/pwm.yaml for description of the cell formats.
>  
> +  aux-bus:

As this is a node:

type: object

> +    description:
> +      It is recommended that you place your panel under the aux-bus node
> +      here to represent the control hierarchy.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -201,11 +206,26 @@ examples:
>  
>            port@1 {
>              reg = <1>;
> -            endpoint {
> +            sn65dsi86_out: endpoint {
>                remote-endpoint = <&panel_in_edp>;
>              };
>            };
>          };
> +
> +        aux-bus {
> +          panel {

We should perhaps have a separate aux-bus schema. Something should 
define the child node is 'panel' and nothing else. Though perhaps 
connectors are valid too?

> +            compatible = "boe,nv133fhm-n62";
> +            power-supply = <&pp3300_dx_edp>;
> +            backlight = <&backlight>;
> +            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +              panel_in_edp: endpoint {
> +                remote-endpoint = <&sn65dsi86_out>;
> +              };
> +            };
> +          };
> +        };
>        };
>      };
>    - |
> -- 
> 2.31.1.751.gd2f1c929bd-goog
> 
