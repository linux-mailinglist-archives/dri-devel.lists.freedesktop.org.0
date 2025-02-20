Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C7A3D57A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AA010E4BE;
	Thu, 20 Feb 2025 09:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qAKcZ7wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5AB10E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:54:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 289D261370
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271D3C4CEEF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740044913;
 bh=TjkBgIVDkPykxXfTNJkQ2/RRYs8MAYcHrObSe1QzYi8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qAKcZ7wgZuAYLUnbQT2K5Y+OaKIl2b0NIVilbOArOJb/bQ0wZdsBMW9onVK21z2Jj
 5VFP7KcCkAq9zVNWPUJyiz84NFNgk5rhD+0A3gnPGBfSyi5DseWdIqABWomU1C6WcF
 54jKiXmybEOmhD6L5sqrc+wDAefM4ycWC5+ptPODhyy63a31cLb06Z6WS2aDS4WR5e
 ivH+xzA/Lf3RuZw1TZwXB+KSmTmEY0eHAZ90samLCXG0zmbSP+Oh5qLy9BWfTMRpVf
 Dl/pY55A3BnmCqNkGO2eyF45f6sUmLhq5yqA4zZ8CEAQou9s4Yas3XgyXx+/j4Y1Wi
 ReKVWCmS7jVvA==
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e5dc39ede40so709324276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:48:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUS+fw/Jh5S5VzlKycUg0WyQ7ZBtdbzcuw6Yej7PqQkMY1uAnd8ABjNK1ieCqr4+9B3gCXf6ROxo2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw//bRWLaMeD+psdIh6GqAEYyZjikDu+d6iPWrZvzpdxFaFZI9R
 BpWhMqZCvSN4Tz7+zVH2nQ54nGpF64SPgbJTsKSeCr27BQE4StFgLXsUF6nx08/UdT8/hRbiziG
 40kpDM4me0AHLjSurqh+sZUQtGlUti1UmsWayRQ==
X-Google-Smtp-Source: AGHT+IHVyfnxjQQ5aEaDqqPnDXAHxGc+7AeDEznGEtYCeqwlDBOrCPISJFLJj/LtX4uF5vP7GOn1wFrzCA3FuOZVTpY=
X-Received: by 2002:a05:6902:2384:b0:e5d:e52a:5383 with SMTP id
 3f1490d57ef6-e5e0a0c72ccmr4853420276.25.1740044912333; Thu, 20 Feb 2025
 01:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20250220094456.32818-1-clamor95@gmail.com>
 <20250220094456.32818-2-clamor95@gmail.com>
In-Reply-To: <20250220094456.32818-2-clamor95@gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 20 Feb 2025 10:48:21 +0100
X-Gmail-Original-Message-ID: <CAN6tsi7gxP9TiZYMGUgpHKbMU03tpJAYkpt0QQxM9QGS-p9f8A@mail.gmail.com>
X-Gm-Features: AWEUYZl04SviqWXBbPQ4Tq2Q2RXXyF_nx7L186IU5dhzMZQzi8Vi4vOrBvQbNso
Message-ID: <CAN6tsi7gxP9TiZYMGUgpHKbMU03tpJAYkpt0QQxM9QGS-p9f8A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindigs: display: extend the LVDS codec with
 Triple 10-BIT LVDS Transmitter
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2025 at 10:45=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> LVDS transmitter used in the Microsoft Surface RT.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.=
yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 6ceeed76e88e..24e89c1d0c76 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -33,6 +33,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
>                - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
>                - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
>                - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitt=
er
> --
> 2.43.0
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
