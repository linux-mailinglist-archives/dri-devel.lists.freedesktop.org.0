Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276E6D0838
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E02410EE7B;
	Thu, 30 Mar 2023 14:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EA510EE7B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:26:39 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id z83so23710960ybb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680186398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYAj9pqSL7hDBw0RLOL8GO8jrfaq2Goh8quwi8z2P+U=;
 b=o+Dzd58+BP9xg6ilalPvcpuhfUPZR3bAjkdMgibJu8M4CaBS+4HpGC8nrvhXslDKi5
 R9ko5gdcv4ZXVQMu0pWzS75IsVcF1Ton2sDrpHiZBqUMI7Yz5iqXkHTN6D3PcqbHvvYy
 6cQ7sBlSC6cI6kQwBTscSXjNqYmxod8+5Ol0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYAj9pqSL7hDBw0RLOL8GO8jrfaq2Goh8quwi8z2P+U=;
 b=lgrvQzjnJ44ZLUgcegnt5JyOMYemGWZmbeiSXieDpFTyYoPunMk1lQxSM1s5yOt2vO
 PI7blTE6ZzMB/1Ygx0PY2YxDVjqXeUYh71IZM7BZBWfd5glWyIaW94kccnthKg4HPGEA
 +RSPdld0anR/F9oV0Gsznl2FBtndazwZZv4t7MT1I1kuL7JT1QCs58o729AWbm0jAWy4
 MzxaoPfGKWbBsP5Rjp74TGacYwEDF2uEWjhPxZ0NexrQmP+UrJSOgmvOCcH1ua10Cob4
 jv9prttFOBW4wU9AWdmAI41XeCJUhvpEfucRZqnlYDg5RawDDy5dJEG3kgGbxmDw0XfP
 TZPg==
X-Gm-Message-State: AAQBX9dlJIm/H5DVbXnvD3iOSuWg3u7AOq3WgMpbgZ0JWd2IfXNUzUYV
 oUqTbEChLtRCS7FwnFNPeun/j2w2jmC5m+U7W90INg==
X-Google-Smtp-Source: AKy350YNV+2K9E9YDUGfrkxdbFk0oBtF0klAUoQNYSyuJPRoz9XL+Uy7LTLKyvnC+os/wbNNqOe+3HzdkUlRBHdlxGw=
X-Received: by 2002:a05:6902:154a:b0:b3c:637f:ad00 with SMTP id
 r10-20020a056902154a00b00b3c637fad00mr16184012ybu.5.1680186398403; Thu, 30
 Mar 2023 07:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230330101752.429804-1-francesco@dolcini.it>
 <20230330101752.429804-2-francesco@dolcini.it>
In-Reply-To: <20230330101752.429804-2-francesco@dolcini.it>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 30 Mar 2023 19:56:26 +0530
Message-ID: <CAMty3ZAQPEnCgj9r+tsuqiOzRzHPnKSEXcDqE7LKHH16Zu2Wvw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: sn65dsi83: Add DSI
 video mode
To: Francesco Dolcini <francesco@dolcini.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 3:48=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> SN65DSI8[34] device supports burst video mode and non-burst video mode
> with sync events or with sync pulses packet transmission as described in
> the DSI specification.
>
> Add property to select the expected mode, this allows for example to
> select a mode that is compatible with the DSI host interface.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml  | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 48a97bb3e2e0..ebee16726b02 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -35,6 +35,14 @@ properties:
>    vcc-supply:
>      description: A 1.8V power supply (see regulator/regulator.yaml).
>
> +  dsi-video-mode:
> +    description: |
> +      0 - burst-mode
> +      1 - non-burst with sync event
> +      2 - non-burst with sync pulse
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]

I'm thinking this can go to dsi common code since the video modes are
common across all controllers and make the core initialize the default
and update if any sink devices are willing to change the modes. Sound
like a big move but worth useful.

Thanks,
Jagan.
