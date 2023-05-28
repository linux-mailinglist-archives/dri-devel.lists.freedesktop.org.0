Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C807139A8
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 15:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8357210E030;
	Sun, 28 May 2023 13:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C248A10E030
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 13:34:14 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-565eaf83853so8713547b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685280853; x=1687872853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UrEVsTM5vKIOld13EPKPZ9FVBGQ0zgJjZs6J4jvV/zQ=;
 b=YEjaEvz9E26Gf7MMtO58BQM3WmZoF5U+bwreby0QKR26gtFeB1Foq5RusqLrwrXals
 YXnJpK7564brgnQ7/jDKuyTTQAyKBZBzHi1PDgTEzl7zVqeF1DTC7tzvvqf8RUGsTM93
 DcDy9hIRswj5ipNgSdPu78QG5pRLSjPl7YMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685280853; x=1687872853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UrEVsTM5vKIOld13EPKPZ9FVBGQ0zgJjZs6J4jvV/zQ=;
 b=Kk+WzdoghNRTL/Ne28SqF+Ow+nq6TJ4QY+H1g1L+SpI56J2vwOT9TDH54Dpt8ioSFu
 6HTQoH6WKqSfTVrf0tap4Swa2KW6U4SDfS1YxpHQEX8GsOTkTH3WnYpFXjRSmodvSHqM
 heHG+0ZPnnVbgsH9fda73rlageVvRgkh5iGPwuoYg3TDpQXvc6zkkojt/qdJeQbLA/7b
 bcMQYKqjkh8DnGIpQ5e0vZuZwTeKRSARviaJ7hWx+H3OocFPaAVyovfeT2zN8YFhwjaf
 jL2LHvTlTFJyzKbBnYimJ3KkTS/zRZ7tJF7pQx7aBhaapKjDuERidQ8z/mo2eWyzONrS
 CwoQ==
X-Gm-Message-State: AC+VfDxWaOE4D1JS3eekwZbI5x87x0o5aFF5RSGOjstDh5mUy4uMuMEX
 Ofeq3CB0iZhxcQTGnrk88Pmi2FGVf51K0/jtHKHy5g==
X-Google-Smtp-Source: ACHHUZ6rNq1797W4VSS1+Dgqg217ZXWZz44DxffkTuC/Vs+7FWyf4bszCFSBGg9ZFpxgoyZiB9LuVSp5sjU/rWSWyb8=
X-Received: by 2002:a0d:e747:0:b0:561:43bf:fc8e with SMTP id
 q68-20020a0de747000000b0056143bffc8emr9154349ywe.10.1685280853448; Sun, 28
 May 2023 06:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230528132727.3933-1-aford173@gmail.com>
In-Reply-To: <20230528132727.3933-1-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 28 May 2023 19:04:01 +0530
Message-ID: <CAMty3ZB=XfMr7k31yHzZ+YHFxT0ifCbmR4+s5yw+YgTSJE0Jxg@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: bridge: samsung-dsim: Make some flags
 optional
To: Adam Ford <aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 28, 2023 at 6:57=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> In the event a device is connected to the samsung-dsim
> controller that doesn't support the burst-clock, the
> driver is able to get the requested pixel clock from the
> attached device or bridge.  In these instances, the
> samsung,burst-clock-frequency isn't needed, so remove
> it from the required list.
>
> The pll-clock frequency can be set by the device tree entry
> for samsung,pll-clock-frequency, but in some cases, the
> pll-clock may have the same clock rate as sclk_mipi clock.
> If they are equal, this flag is not needed since the driver
> will use the sclk_mipi rate as a fallback.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> V2:  Split from driver series.  Re-word updates for burst
> and pll-clock frequency.
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mip=
i-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi=
-dsim.yaml
> index 9f61ebdfefa8..06b6c44d4641 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> @@ -70,7 +70,9 @@ properties:
>    samsung,burst-clock-frequency:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      DSIM high speed burst mode frequency.
> +      DSIM high speed burst mode frequency.  If absent,
> +      the pixel clock from the attached device or bridge
> +      will be used instead.
>
>    samsung,esc-clock-frequency:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -80,7 +82,8 @@ properties:
>    samsung,pll-clock-frequency:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      DSIM oscillator clock frequency.
> +      DSIM oscillator clock frequency. If absent, the clock frequency
> +      of sclk_mipi will be used instead.

Maybe this explicit comment won't require as it is not listed in "required"

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
