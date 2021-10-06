Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E728423E95
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 15:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD04E6E497;
	Wed,  6 Oct 2021 13:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6456E497
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 13:21:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4521D61131
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633526481;
 bh=alLVztSAR+zVhYna8rbF1fpO8IxYlGuubsf+eUj4w7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LA2pWPMjZ3SDJfTNaMtXKEA7qH1qd0wKJoRh5nF+GBXKwnp7d8i2+YUTanlc0RJAq
 Fm+i+NwvR+JMZrDNMbjnX9467AT4OwbLefUUUwQcuFle60Q9G5+eXwx0p+IY9i416i
 VYHa7pX3ttGiKyqj2TNBpVPkWQiLNDNc9XGIQNzBuCmew/mwIOEGkWyY+f4ghmLD2J
 NMkAyevkRH8EXv29THThnQc/WuKf7yvkEte9ZW0izgOD+riEIIW2M0Fyx+qI9hAkHE
 y2LvYwvpWlqF6ylW669UBcQk2BQkA1ROhx8t6hUkLZ5eNoGdEzTCC38MOUVhqYSssI
 rpsjzx8JYKCpg==
Received: by mail-ed1-f46.google.com with SMTP id f4so4498090edr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 06:21:21 -0700 (PDT)
X-Gm-Message-State: AOAM531l0/9U80DRC42sA9iddvLT3fBAOf1E7mIJqAqXqyhVVA4QpXkp
 qAKnbvFR6yv/GSCHZ6HkIl+vUryXYEdU2uR3BA==
X-Google-Smtp-Source: ABdhPJw7MkXaYsUDoeBX7SmE6lCrAD2fJ87SwrdDv7Ez4blzswV4YKvWC/bciH0EDYeIZW5/+bMmgH6JkWx3e/KTAp8=
X-Received: by 2002:a17:907:7d8b:: with SMTP id
 oz11mr6746523ejc.84.1633526479452; 
 Wed, 06 Oct 2021 06:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211006074713.1094396-1-alexander.stein@ew.tq-group.com>
 <20211006074713.1094396-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20211006074713.1094396-2-alexander.stein@ew.tq-group.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 6 Oct 2021 08:21:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJDNCdc8iqKWqo9r30VnPgXUuNvhzF7aSjA9N7OmYH1dg@mail.gmail.com>
Message-ID: <CAL_JsqJDNCdc8iqKWqo9r30VnPgXUuNvhzF7aSjA9N7OmYH1dg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply
 bindings
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
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

On Wed, Oct 6, 2021 at 2:47 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Add a VCC regulator which needs to be enabled before the EN pin is
> released.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 07b20383cbca..149cff3233c2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -32,6 +32,9 @@ properties:
>      maxItems: 1
>      description: GPIO specifier for bridge_en pin (active high).
>
> +  vcc-supply:
> +    description: A 1.8V power supply (see regulator/regulator.yaml).
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -94,6 +97,7 @@ required:
>    - compatible
>    - reg
>    - enable-gpios
> +  - vcc-supply

You generally can't make added properties required unless all DT files
already had this property. It breaks compatibility.

Rob
