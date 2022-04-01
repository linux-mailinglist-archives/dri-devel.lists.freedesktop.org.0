Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F44EF9F8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102DB10E321;
	Fri,  1 Apr 2022 18:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FCF10E25D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:37:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F41A9B825B7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12F7C340EE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648838225;
 bh=fQM70pxHpxiX1FeJKE4worrxEtU7Eak9lRJ7i5UvQEk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Vc2fLdaRjIVRrV62aPlxQUOxv/QfCuSL7O3XCHJ/owgmgNz0Bwi0aGnw/QF0Z277n
 fMidykLFCCpSbfXhfl+VXVVRy+BPSfcLS76/A2E274QEJlkgp8OO+VGuJVVr4sA6Jw
 e5VUgJXUua4OJzWf56gvmqRjrKcSzF+p7lTJIPeddOZAjAoakra5m9XTPnxnKRCeJZ
 4uuCvg937L6/R9LAqxPjYdCn78syGDXzJyeMkDR4n4pleAyYekvPa3V20OssQfV3Pj
 JSZoghcZqKPe5+u5TcWY6Mzox+hK1WtNE6mJf86xsjV9+s5BnMuEykyMbNEnHYTRT/
 IgxqYa/F4iEVQ==
Received: by mail-io1-f44.google.com with SMTP id h63so4152314iof.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 11:37:05 -0700 (PDT)
X-Gm-Message-State: AOAM531SXQtB1dEgm2gyBdTln44PSQxQUGMChlE8vqo/AnJ4gYttK0c8
 xt6tvMP96xsdMLxSjsITib8h1lrM/RelPFbndA==
X-Google-Smtp-Source: ABdhPJxLY1mp9VU1Pc31zhS33bAyC96dkuPiu09gGLjiGSGRSReQqCsf/EE95lVPAt07WlsMY+rJT+9aZ8WGPYcnkEo=
X-Received: by 2002:a02:1107:0:b0:321:78dc:890d with SMTP id
 7-20020a021107000000b0032178dc890dmr6613762jaf.236.1648838224826; Fri, 01 Apr
 2022 11:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220401163755.302548-1-marex@denx.de>
In-Reply-To: <20220401163755.302548-1-marex@denx.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 1 Apr 2022 13:36:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKVkc51sXWE6Sh5yHxLX0vJWgFpn8cmjjKSBx4dYzA8qA@mail.gmail.com>
Message-ID: <CAL_JsqKVkc51sXWE6Sh5yHxLX0vJWgFpn8cmjjKSBx4dYzA8qA@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/3] dt-bindings: display: panel: mipi-dbi-spi: Make
 width-mm/height-mm mandatory
To: Marek Vasut <marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 11:38 AM Marek Vasut <marex@denx.de> wrote:
>
> Make the width-mm/height-mm panel properties mandatory
> to correctly report the panel dimensions to the OS.

Adding required properties is an ABI break.

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-d=
bi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-db=
i-spi.yaml
> index f29789994b18..c2df8d28aaf5 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.=
yaml
> @@ -83,6 +83,8 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - width-mm
> +  - height-mm
>    - panel-timing
>
>  unevaluatedProperties: false
> --
> 2.35.1
>
