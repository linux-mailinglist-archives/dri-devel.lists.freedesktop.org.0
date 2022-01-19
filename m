Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C39493D52
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483410E1DA;
	Wed, 19 Jan 2022 15:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD9510E277
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:36:07 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d1so2530179plh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMrhSxzcq06Y5Du1J5LkmKoFAbKXMAXT3vH7sejriLY=;
 b=ssfImEcNw476pH+KakbvvBbRQNHR8We3jAnB769CrsR7ZqdjUaTl54C8lg28NNpwt3
 Ujsw27eeIbDM0koFZgiviggwBTeQ8pIjeVcgMaH+REWTo1G0rvLESHp0tpSQkfClxlwd
 2mJasD5GOAEw50iMq2vIfwwGOXZeh6nenLxsszU6upFCfLwZvLFmOgFDEP/YteNgzZUS
 cjs54BZG2ME/5bpw7J6x46p9gWGGFTnCbyuChO84a11jFnn4ZgBhuaf/PeXJh2NFEKpm
 hn3fEtEtv0B+n7QD8jAlB0FqXoaJvl8AyYH5Wm0oZhDctURSmdH7zuB6yXwDNZvzBCX1
 +oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMrhSxzcq06Y5Du1J5LkmKoFAbKXMAXT3vH7sejriLY=;
 b=HwGGcZl3Gg0xc0OyKq87k3nKO1gxREwNegO8pR3j0ci8VgFaIdXpoGxkdtUUAOaTaq
 P1OafDXHynud4SP97FMEFQ23AZvhsviUUSqlk2sZ4Bqyy1lIBHW6vtOBaq3u7n6Alrs1
 hTjDyKZvro0nis4E3xA2RdUlzkPGxwwnTk5AcCB4KGcZiu9y3UxU9PAr9Bq+piwYewfp
 n3Gti11/fG7aieKIf1fnBY597FCg2UY4fH6TOSR4sDsBZHZ7Ub4lvbK1RbvQ9g7RfiP0
 9grM7CPC/z7NLN7hMa5fT/li2QiQpn19vOHIBcTj6jy7mSx6kHM0w2NqtGMUqDgjKiAw
 aPNA==
X-Gm-Message-State: AOAM530D7GD55/MZ7AKnxEL5UCja6Z32FO0Ulg/daNdJAEB+XIinZd7C
 uMhrB1IgSv0Ih8+j7R7YnLc0/5c5G68d3RykK6VJ27AiyyYG6w==
X-Google-Smtp-Source: ABdhPJySyCqqeyw8uXJjJaFzQvTXGSC/lm5A2BRldYPOCcLjtNFpPECtLJjCIH4Pg2dEw9rTuxak1N3cylwER/vXAC8=
X-Received: by 2002:a17:902:b189:b0:149:6c45:24c with SMTP id
 s9-20020a170902b18900b001496c45024cmr33136123plr.21.1642606566766; Wed, 19
 Jan 2022 07:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20220119151751.986185-1-hsinyi@chromium.org>
 <20220119151751.986185-4-hsinyi@chromium.org>
In-Reply-To: <20220119151751.986185-4-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 19 Jan 2022 16:35:55 +0100
Message-ID: <CAG3jFyv--OkEOxHr=61oAw8Q0bMdkftZu47M-N0YTiOB0YyiQA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Hsin-Yi,

While I can review this patch, I don't have the authority to merge it
since it is outside the scope of my maintainership. Rob Herring,
Daniel Vetter or David Airlie would have to Ack this patch.

On Wed, 19 Jan 2022 at 16:18, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> List panel under aux-bus node if it's connected to anx7625's aux bus.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../display/bridge/analogix,anx7625.yaml        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 1d3e88daca041a..0d38d6fe39830f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -83,6 +83,9 @@ properties:
>      type: boolean
>      description: let the driver enable audio HDMI codec function or not.
>
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -167,5 +170,19 @@ examples:
>                      };
>                  };
>              };
> +
> +            aux-bus {
> +                panel {
> +                    compatible = "innolux,n125hce-gn1";
> +                    power-supply = <&pp3300_disp_x>;
> +                    backlight = <&backlight_lcd0>;
> +
> +                    port {
> +                        panel_in: endpoint {
> +                            remote-endpoint = <&anx7625_out>;
> +                        };
> +                    };
> +                };
> +            };
>          };
>      };
> --
> 2.34.1.703.g22d0c6ccf7-goog
>
