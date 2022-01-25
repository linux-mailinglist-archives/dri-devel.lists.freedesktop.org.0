Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1149AC5C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 07:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8DB10E8F5;
	Tue, 25 Jan 2022 06:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F8A10E8F5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 06:26:02 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h23so22391167iol.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 22:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2U6KYB1yIQCjzCwnLoBdcZ/4jIE7qR7aI2a0GGlFPd0=;
 b=HAh7abheMqYTAcBVQo2TAGzKQeui2rCxOSx0l50yhx4nTVqN2AstIUKf9gCw/aXkzv
 tsZ2yumaQFT1WhY8fj4ObQgr7vfrJdGdo1SuWV/+HheBzq3mjOZY1XnBaIYK2ixMdsT3
 2djpmAPyZ37v2dQ1migYZeIwUTm6xBHLJnw3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2U6KYB1yIQCjzCwnLoBdcZ/4jIE7qR7aI2a0GGlFPd0=;
 b=6lbzdbjgfVO/TOnAp9ND8WJ5HDOgUAe7FzXpOKMGlz8oNpqdQFk3T1x94pFLp9n7uB
 L+21rNR668tLUaNd8wRzhY7q3Rx0KVDnjZzeIKgAQO/i/xrI3nZGvdKwHi5E94gx7hL0
 r3UZGidFfFfiLuD8Z761p0VNRleWA4HCZY5RjmJxrJbu3eQqEOwoqcGbHgN97qPCeiNA
 vC9+Qwdm4cjTZumn1jYZjkBZMgeLkKMkuA1uiKrwduLaq2vX9CaCPkxLgw403mKO3ARe
 JLDGdsPT/v884C7z8bj8xTRhouS1t5CnC12SaFFQb59RqoJXiAPcEivGdBzuJL+oAIcj
 n69A==
X-Gm-Message-State: AOAM531MuT6MHY4lg7RWBr8AtWmEopHLxOjahKw8Tu4O9X0mu+GVU06R
 C8yLIF9vYgX5NKYF1jUxwKwnP+LCpB/VxaXyL2JJHQ==
X-Google-Smtp-Source: ABdhPJxu70h8wl5OczMCGfVK32YiOQthjoUZTQv5YcNKB9G0Rzj180pdM66UAKwXmAmEz90meAioZOoKHPN36d2Pakg=
X-Received: by 2002:a5e:9706:: with SMTP id w6mr9650262ioj.204.1643091961104; 
 Mon, 24 Jan 2022 22:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20220119151751.986185-1-hsinyi@chromium.org>
 <20220119151751.986185-4-hsinyi@chromium.org>
 <CAG3jFyv--OkEOxHr=61oAw8Q0bMdkftZu47M-N0YTiOB0YyiQA@mail.gmail.com>
In-Reply-To: <CAG3jFyv--OkEOxHr=61oAw8Q0bMdkftZu47M-N0YTiOB0YyiQA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 25 Jan 2022 14:25:35 +0800
Message-ID: <CAJMQK-goEdzWT=q-Tabb8hPUDTNwwq6E0HqR3Wxw_JpREK3T0w@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 11:36 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Hsin-Yi,
>
> While I can review this patch, I don't have the authority to merge it
> since it is outside the scope of my maintainership. Rob Herring,
> Daniel Vetter or David Airlie would have to Ack this patch.

hi Rob,

Can you help ack this patch? thanks
>
> On Wed, 19 Jan 2022 at 16:18, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > List panel under aux-bus node if it's connected to anx7625's aux bus.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml        | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 1d3e88daca041a..0d38d6fe39830f 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -83,6 +83,9 @@ properties:
> >      type: boolean
> >      description: let the driver enable audio HDMI codec function or not.
> >
> > +  aux-bus:
> > +    $ref: /schemas/display/dp-aux-bus.yaml#
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > @@ -167,5 +170,19 @@ examples:
> >                      };
> >                  };
> >              };
> > +
> > +            aux-bus {
> > +                panel {
> > +                    compatible = "innolux,n125hce-gn1";
> > +                    power-supply = <&pp3300_disp_x>;
> > +                    backlight = <&backlight_lcd0>;
> > +
> > +                    port {
> > +                        panel_in: endpoint {
> > +                            remote-endpoint = <&anx7625_out>;
> > +                        };
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> > --
> > 2.34.1.703.g22d0c6ccf7-goog
> >
