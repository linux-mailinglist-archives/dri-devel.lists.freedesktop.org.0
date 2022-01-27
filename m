Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B7549D96F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B02A10E58A;
	Thu, 27 Jan 2022 03:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22F610E58A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 03:40:21 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y84so2124928iof.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 19:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A7/Kp3F6JWjpBg8AuPne8Hm8StpS8mXuWpdkN/2AU28=;
 b=fIB7aJiW04CE0H1xvznsR47TuEwPDzJp8RmW7I8/i8S3uJLJAhMiNwdn83BxGgnrhD
 cEEMtcdaxxYvkeBylZj4ihG5yHA+CP0L4WNBPaa0xtIuxGHomcmUH5MCSP/spp3lsdu1
 aL8020kO/ekms8qNuzpMx96rFyQDzf9lR1vAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A7/Kp3F6JWjpBg8AuPne8Hm8StpS8mXuWpdkN/2AU28=;
 b=z13eFeE+wfqzJQ9+tS5cl5v3OZMThD0bdG67ji1ItdLlO27YGM7xOTO26xJkZEk7Nw
 LvIrn7Fv64aF3JSTyb3XzW2RWm3fBQYka26EyVj7bXkUN/MzxygJ+yRjoqO2DzfLRhIH
 F4Y9VtX3Gk/NAHvdV0m0kx4OZMygcffvrn7wo9njJIpDGLmcqFx9DMcsnKn+lbrlooeL
 HcX2kfK23DwRyWcxwE0XZVFhyO6inuhjzGVsTzzAfvJkbi6EP3GxjywhAjOqAS0THVS5
 7sCBtELv1JLROCkVE19R2mVVAtWzxEM7PwNgizbcViyRepvNaK9/arWJ3hahg4OUeZx7
 5rHA==
X-Gm-Message-State: AOAM530xr+y+WV7HUgNX/LFzUd9YMA59LttWrG4Xe52SjWXPcVOFFdbT
 ayPwKJjJjUK7zpGH/48ToazzWTio/pnmSVcteIHXoQ==
X-Google-Smtp-Source: ABdhPJxf7p8s8pOwk6s2VFdm1yidnImAK0pRyPmSP1y9SUn43IX4YQpe/YpYv1woP96uuTgIFCZig/trFIy74MFsBHs=
X-Received: by 2002:a05:6638:1908:: with SMTP id
 p8mr182550jal.282.1643254821165; 
 Wed, 26 Jan 2022 19:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20220119151751.986185-1-hsinyi@chromium.org>
 <20220119151751.986185-4-hsinyi@chromium.org>
 <CAG3jFyv--OkEOxHr=61oAw8Q0bMdkftZu47M-N0YTiOB0YyiQA@mail.gmail.com>
 <CAJMQK-goEdzWT=q-Tabb8hPUDTNwwq6E0HqR3Wxw_JpREK3T0w@mail.gmail.com>
In-Reply-To: <CAJMQK-goEdzWT=q-Tabb8hPUDTNwwq6E0HqR3Wxw_JpREK3T0w@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 27 Jan 2022 11:39:55 +0800
Message-ID: <CAJMQK-jL40QNXjGUF5Z7sjnCNXTFM5cyVrqEPm+h5uvS2hzm6g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 2:25 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Wed, Jan 19, 2022 at 11:36 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > Hey Hsin-Yi,
> >
> > While I can review this patch, I don't have the authority to merge it
> > since it is outside the scope of my maintainership. Rob Herring,
> > Daniel Vetter or David Airlie would have to Ack this patch.

hi Rob, Daniel, and David,

Can you help ack this patch?

Thanks
> >
> > On Wed, 19 Jan 2022 at 16:18, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > List panel under aux-bus node if it's connected to anx7625's aux bus.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Reviewed-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  .../display/bridge/analogix,anx7625.yaml        | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 1d3e88daca041a..0d38d6fe39830f 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -83,6 +83,9 @@ properties:
> > >      type: boolean
> > >      description: let the driver enable audio HDMI codec function or not.
> > >
> > > +  aux-bus:
> > > +    $ref: /schemas/display/dp-aux-bus.yaml#
> > > +
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > >
> > > @@ -167,5 +170,19 @@ examples:
> > >                      };
> > >                  };
> > >              };
> > > +
> > > +            aux-bus {
> > > +                panel {
> > > +                    compatible = "innolux,n125hce-gn1";
> > > +                    power-supply = <&pp3300_disp_x>;
> > > +                    backlight = <&backlight_lcd0>;
> > > +
> > > +                    port {
> > > +                        panel_in: endpoint {
> > > +                            remote-endpoint = <&anx7625_out>;
> > > +                        };
> > > +                    };
> > > +                };
> > > +            };
> > >          };
> > >      };
> > > --
> > > 2.34.1.703.g22d0c6ccf7-goog
> > >
