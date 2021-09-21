Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA54136AD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 17:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A676EA61;
	Tue, 21 Sep 2021 15:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6E36EA61
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 15:54:04 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id u11so13779573uaw.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 08:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xeKByOTS+lpH6VM+sT0RbBcDyOchg2h9uI8kPYfUR3g=;
 b=VZp3Q5VfrG+bCKVCkgcmzLKEzS//JnEbZsOg0TgJ8HzTVSHv4nV+leCgAeC6ayVz/f
 U4+o5sm8HqHRSEDYZ9k8ianscl9ZYl8pWyrVuPbxdFVxMkh1kZ6ItuXy4xma3nI+vRzj
 t0p+XrZ775KC1j3z2av4xhqlnezlIu4EcYHfHCUyqagOGe92emRCsBR+BbVy7p2+YXUr
 4HhBTCpSq1RtMP0IMzuren1kxGRxRM4exUP3tMIgzphAcpGMvQCpatWm/Q+OT3mSZ/hb
 GWrbATxJUi6ZlggX2GetwU+zcUUXjHRUt9KXwDzVPtZBkkqZkZPoW2+3AJtOGclx3Pp9
 /edQ==
X-Gm-Message-State: AOAM532AIPML6KbgLQ5g4mhwDK0A7dlKs8BD/Q827lt9Xp+5GUSm3im4
 AP+U1tTF4grrP2lCA3x1SMWcf/RUpdaNsDjgr5I=
X-Google-Smtp-Source: ABdhPJzjty7MGs32K3rhY6sUGT5fb8yVFIHG9t8ODt4dP8iZWbOtrhi5vyGYC5HXNaufTLBguH0mUeHSZNy5UK8vZbE=
X-Received: by 2002:ab0:6ec9:: with SMTP id c9mr18455990uav.114.1632239643731; 
 Tue, 21 Sep 2021 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
In-Reply-To: <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Sep 2021 17:53:52 +0200
Message-ID: <CAMuHMdVmTcERvHhLLDrZyC_TDLPU89ksitn0WduJkKqpePCKdg@mail.gmail.com>
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add binding
 for R-Car MIPI DSI/CSI-2 TX
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
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

Hi Laurent,

On Wed, Jul 28, 2021 at 6:26 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> can operate in either DSI or CSI-2 mode, with up to four data lanes.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> +  to four data lanes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Functional clock
> +      - description: DSI (and CSI-2) functional clock
> +      - description: PLL reference clock
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: dsi
> +      - const: pll

No interrupts?
The hardware manual says there are 9 interrupts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
