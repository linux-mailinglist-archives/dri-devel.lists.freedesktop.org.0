Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422811D47C4
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C0F6EC12;
	Fri, 15 May 2020 08:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E973E6EC12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:07:33 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id r25so1490052oij.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/l9oPI71kjLa9yCqc2AeiXieWbvI5Uv7cd5K8zEEsA=;
 b=r5WA+6LJWXqXgLWkI5hIt1evBkMlLUyKYJk6gusUVhULMwtxivS3ZkAxS/L2K4FGts
 fK1CWIoatf2oOxyR39JRv1wtARJ5Ed7UJWhF+AwEyuia151VvDAYS9xIcSYWhWzhOCFa
 O/ZPMWd5qvmy2aRpExyfq17L3j+Uu2LJkGvQ6/2CAgihUHlK64uWPV3Ifo5ey9/POmhC
 GGiOTgCa5q21KjESgLw8RVb0lafaMrxOTFElsTAH3BKJ/KSBSiIkk/VScEwXQ+MCbtag
 Qz5xpE3PsROn2TvEwJOF95CylukVtNgBqI5HW6znMOPHg2VWF35S9JDOSEz9b5i0HvXj
 scUw==
X-Gm-Message-State: AOAM533ZVbpsDtJYJi5BmsRezW+AmwfJB4zIGSQ03U+UqMr8fjMO6Uoh
 MV0pEqf+ecE3wkqOx9kW49gC65mx7qwjoBYyN7I=
X-Google-Smtp-Source: ABdhPJyErN+HOdoryL9a+qrA5jS1QtF8ISgAgJhQlVisYA/ZIJxYb2/gT8DJlzexoFM8SVDaWPFz+YrxiiExKEy5HA0=
X-Received: by 2002:aca:895:: with SMTP id 143mr1186258oii.153.1589530053041; 
 Fri, 15 May 2020 01:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 10:07:22 +0200
Message-ID: <CAMuHMdV2f26KkH5NgRDQjb2CEg0Br4=axdd5OGAeqqGX-HnKSg@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: media: renesas,
 fdp1: Convert binding to YAML
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, May 15, 2020 at 3:42 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car FDP1 text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml

> +  renesas,fcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle referencing the FCP that handles memory accesses for the FDP1.
> +      Not allowed on R-Car Gen2, mandatory on R-Car Gen3.

Bummer, we don't have family-specific compatible values to enforce this
in yaml ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
