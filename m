Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C8530EB8
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 14:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715F910F511;
	Mon, 23 May 2022 12:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482F10F50F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:50:57 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id v10so13573648pgl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ilj++Ggb7llLz57zgVX1b/Z8NvW2D80Wu/CN7999mMc=;
 b=B/SsoT/+byAK0AaxCAVGEG6xRk+crrJBE0uiDdtI5grAW03H7hT9qJzmgI8VhBzp+Q
 Va3elBHMweP63hMtDOR+m+DtbeuKRb5nGVeCeWOrTP8UPqwpcH1k2FDpepJ7P5sGvOhG
 zFOU6f1Viw40N7nCcUWy9d07hq5uc/eXA3rXjiqvrP8G3moSMDgt15/MR9pNSJzuUQ8+
 XlDaPIxkGwZAiZSUDcpLUwHDPq8tr09TqlXdfGr8A04VjLS9VFgqD7BQWl/iCJppElD8
 OZ1jpoXPnWAruKbl73m2f6EYC6zz3aNX66d3R1aWeWdIywfZnKJiatMF6BIdJieo738z
 092g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ilj++Ggb7llLz57zgVX1b/Z8NvW2D80Wu/CN7999mMc=;
 b=GLla3X4IL6Cvv4TwanlU3aqZKFwHAf8B5QIe/O3PWoFgwkQcc1BY0tOW2MfUjEv4jD
 qgt5bIRZq3CWK1LKugeT1cl6MRjHAav4GbI/vnb7LXUYsKcV5IQsZCMLBURyHlTIaetF
 Y3Fwskyj18b6Ke5FtIaJgU5ke9RSE/EyScNmpF2wX+CZy27CuyJN0WbFsEHnZd8Gn48X
 oY2i42Pj17pDMbzLtls9dBnlzRcv1taYBnABYtHMw3s6y/q1FdYxGSf21bF+1mTjpZpP
 jRsbnn6twSzJHs+NQtnw6LmGTAGgu6pp5DXlz7cThqZXLBZzvkyCnNvaRun3FnpUz1Xk
 39sw==
X-Gm-Message-State: AOAM533mAd8uYluCb21kUIiWUOV1KXqUqftV/0r/1COKL+l1wLwSWn6z
 qPjLpIOKJn2ND9rMayN8mKlwyLUrHQOx3m2trYSWEw==
X-Google-Smtp-Source: ABdhPJyLSJ2440TIxfxfmgkgMC3GqHEF0cfFCLR88/BeyvY07y92xOk7gPrXsnjmllmXOES0I0RbHdLmMeWivM7EtDs=
X-Received: by 2002:a63:d04a:0:b0:3c1:65f2:5d09 with SMTP id
 s10-20020a63d04a000000b003c165f25d09mr20154616pgi.201.1653310257217; Mon, 23
 May 2022 05:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084615.13510-1-robert.foss@linaro.org>
 <20220523084615.13510-2-robert.foss@linaro.org>
In-Reply-To: <20220523084615.13510-2-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 14:50:46 +0200
Message-ID: <CAG3jFyt=wjbvgGOqgDZDk5ayChBaf6JcdVwv3L6wkGejbjrG4A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "dt-bindings:drm/bridge:anx7625: add port@0
 property"
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, xji@analogixsemi.com, hsinyi@chromium.org, 
 sam@ravnborg.org, tzimmermann@suse.de, maxime@cerno.tech, 
 jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 23 May 2022 at 10:46, Robert Foss <robert.foss@linaro.org> wrote:
>
> This reverts commit 7328736d270aa4fa6fcd033ade02acc2874a2db5.
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 4590186c4a0b..35a48515836e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -94,22 +94,7 @@ properties:
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>          description:
> -          MIPI DSI/DPI input.
> -
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint: true
> -
> -              bus-type:
> -                enum: [7]
> -                default: 1
> -
> -              data-lanes: true
> +          Video port for MIPI DSI input.
>
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> @@ -158,8 +143,6 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> -                        bus-type = <7>;
> -                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>
> --
> 2.34.1
>

Signed-off-by: Robert Foss <robert.foss@linaro.org>
