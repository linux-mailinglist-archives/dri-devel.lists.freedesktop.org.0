Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097241D47CF
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AEF6EC13;
	Fri, 15 May 2020 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9076EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:10:41 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c3so1217021otr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vKa3opg7C6b7eZU3bWUoqo8wy/Mm7/l4FtIPg5wr+z4=;
 b=dqDpvRrPSy8OIbMYI38kVPlT2pO9GR5Wu6ocWNlBrkZzJaqeYPOKM8fS90bMFucPDp
 lz0/zJhgjMtWElJ6QiGD3y1iYG3dspw9eNIEBOssnG4JZSraLgcPdUtioW/wPM1kJHIf
 vhVgZuaNDhW//oKZlCNO37wgyU1YXvnKssp862qBiaD+lDF/yGG3TP7/4+fUZAARP+MD
 HkPYqi0LBqSFU6kcftzITIHO+m7PztFR996wrf8w5av2WI2kYssjgNAiYEU2efEMH8TU
 YlJT7LDX7NWKNak3OXx7cI0Y3ZIKc6t5cen0sVIfbeD09e5Zqa7RSfRkkvsDdLgM437p
 GXRw==
X-Gm-Message-State: AOAM532sDFjVdqkqM8NCaTEvB7nbBrZd0PdZIkwajAkTtkjbKVbGz+xJ
 t1qUf+O9f2VzeorbqwDf6kUKfgvj5CSr7Wddxoj3m49b
X-Google-Smtp-Source: ABdhPJwvC2aP4d3PtU39rRiNVY4+dbRfoi/AZvTo2CERwlcKdM+RGAs4CQ5/a7guuTjJ0b2BBZab5vp6AeIiTj06zSs=
X-Received: by 2002:a9d:564:: with SMTP id 91mr1398559otw.250.1589530240994;
 Fri, 15 May 2020 01:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-8-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 10:10:30 +0200
Message-ID: <CAMuHMdV4BbQnrJKJSe8+Pyf1UtECr284AdwwvEj01-1Bx-dDQA@mail.gmail.com>
Subject: Re: [PATCH 7/8] dt-bindings: media: renesas,
 vsp1: Convert binding to YAML
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

On Fri, May 15, 2020 at 3:42 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car VSP1 text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -0,0 +1,83 @@

> +properties:
> +  compatible:
> +    enum:
> +      - renesas,vsp1 # for the R-Car Gen2 and RZ/G1 VSP1
> +      - renesas,vsp2 # for the R-Car Gen3 and RZ/G2 VSP2

I would do it the terse way, and just write e.g. "# R-Car Gen2 and RZ/G1".
Up to you...

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
