Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC184FD436
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D550510E54C;
	Tue, 12 Apr 2022 10:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FA910E552
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:02:02 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id a5so15741988qvx.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GJevxi4v3BdwCsfHixr17F9OepLpLQ7iEJJh8wLkyU=;
 b=WujwqX3xu9pFgBeqECN5AGSd06/FI4seLWiNlI3tmWfBrJnCt+2R+5222xgwRnAC8g
 Vd+2t7piWScuPyIiPJ3MQArmASAjC8IGOp2phct3cYyWOcL52XxbR1MCmhQ7P9osxI7n
 6Se1FblhW5nCg923XBeiM4SY4VoVBQeUq1wWTmq1b1tIpECabRvyu2YEcbdIzutYtmzw
 jyISYHkjdfSC9xBIxuTOV7cEM+5LtN9OEuuB5X1SeAiAIkOvRUDEPQ/gpDqBxsVewRGa
 e+CGNQYHwnI7JRjh28T20cUP5ixwbsgCPaw+R6JSAC0yZ/51chuhSxW0xUXbBpoOF1JK
 ZS/Q==
X-Gm-Message-State: AOAM5321DkbntJVDn4aMvI0/jvs/3vJJGSRWfX3jI8z9He4578K1que5
 OqwARuCveJQeRXk9nxz/tesqxDaySU5MQyjL
X-Google-Smtp-Source: ABdhPJySpiA3faBBJXKgbFhBIZOKU6X+3Ikw+6rJhhcW8XnrBwPT136O+17G2q47b/TXcX+n53JsCA==
X-Received: by 2002:ad4:5be3:0:b0:441:7bd1:29bd with SMTP id
 k3-20020ad45be3000000b004417bd129bdmr30509849qvc.14.1649757720693; 
 Tue, 12 Apr 2022 03:02:00 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 z19-20020a05622a029300b002e1a763dac1sm26739840qtw.9.2022.04.12.03.02.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 03:02:00 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-2ebd70a4cf5so136590637b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:02:00 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr29214841ywi.449.1649757719734; Tue, 12
 Apr 2022 03:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 12:01:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKDn3tAS01vm7be9SF0=rsWLMD1vxmNtdTyhHHBJHrtw@mail.gmail.com>
Message-ID: <CAMuHMdUKDn3tAS01vm7be9SF0=rsWLMD1vxmNtdTyhHHBJHrtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, Mar 16, 2022 at 2:11 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l
> DU module found on RZ/G2L LCDC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -40,6 +40,7 @@ properties:
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU

"renesas,du-r9a07g044"? Both RZ/G2L and RZ/G2LC have an LCDC.
I believe the lack of parallel data support on RZ/G2LC is just a
limitation of the package?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
