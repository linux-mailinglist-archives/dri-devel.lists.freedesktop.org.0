Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0A135F0D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457086E923;
	Thu,  9 Jan 2020 17:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9586E923
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 17:14:38 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 716302075D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578590078;
 bh=Dch1iGkhTV+eYdJdzZBn4xYXbKV8xPq0X3G4VgsfXEM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C4n5O6/0S00QhfNWP8s/GpLMHcZE7jx9perbLBZwGrsT8my8StFTHdlaxcxFfQMMc
 ya6pRTPRNoPiGxvt8flGOMw9aLD5wl7eBnc9S16M2UgVsyX2yS4yJU7FS4zNqrg6O9
 cSzCZhFCkoZw9SuoYtQQ1jNBPQH47Yh4XC0uWvJE=
Received: by mail-qt1-f179.google.com with SMTP id v25so4644299qto.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 09:14:38 -0800 (PST)
X-Gm-Message-State: APjAAAXWEzzRgPBJ9PRna4oa50K/orXNcT44N70265KSIEPWgA9iUtS7
 ZI1usfVx4Vm2BYrtvfn1qGyZ8IIqRu3kKP7glg==
X-Google-Smtp-Source: APXvYqzapBWqvVlPCkoZzEPyI6taChV5dThBfHj/lQBiEQvTNIevbWEXIyuSW398SFqpdsfSbqSBDGVgQxNPtTh73oI=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr8935081qtp.224.1578590077587; 
 Thu, 09 Jan 2020 09:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20200103152801.47254-1-maxime@cerno.tech>
In-Reply-To: <20200103152801.47254-1-maxime@cerno.tech>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 9 Jan 2020 11:14:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+nVOb5+yg=bOJMyOocJD6kst0BX7NGhZepNtm_B_35ow@mail.gmail.com>
Message-ID: <CAL_Jsq+nVOb5+yg=bOJMyOocJD6kst0BX7NGhZepNtm_B_35ow@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Convert Allwinner display
 pipeline to schemas
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <seanpaul@chromium.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 9:28 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Allwinner SoCs have a display engine composed of several controllers
> assembled differently depending on the SoC, the number and type of output
> they have, and the additional features they provide. A number of those are
> supported in Linux, with the matching bindings.
>
> Now that we have the DT validation in place, let's split into separate file
> and convert the device tree bindings for those controllers to schemas.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>
> Changes from v2:
>   - Changed a number of maxItems to minItems to make more sense
>   - Fixed a few enum that were improperly declared. This raised a bunch of
>     warnings that were unnoticed before. Fixed them.
>   - Added an if clause to the HDMI PHY binding to check the number of clocks
>
> Changes from v1:
>   - Declare the ports in the bindings
> ---
>  .../allwinner,sun4i-a10-display-backend.yaml  | 291 ++++++++
>  .../allwinner,sun4i-a10-display-engine.yaml   | 114 +++
>  .../allwinner,sun4i-a10-display-frontend.yaml | 138 ++++
>  .../display/allwinner,sun4i-a10-hdmi.yaml     | 183 +++++
>  .../display/allwinner,sun4i-a10-tcon.yaml     | 676 ++++++++++++++++++
>  .../allwinner,sun4i-a10-tv-encoder.yaml       |  62 ++
>  .../display/allwinner,sun6i-a31-drc.yaml      | 138 ++++
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       | 118 +++
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml | 273 +++++++
>  .../allwinner,sun8i-a83t-hdmi-phy.yaml        | 117 +++
>  .../display/allwinner,sun8i-r40-tcon-top.yaml | 382 ++++++++++
>  .../display/allwinner,sun9i-a80-deu.yaml      | 133 ++++
>  .../bindings/display/sunxi/sun4i-drm.txt      | 637 -----------------
>  13 files changed, 2625 insertions(+), 637 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
