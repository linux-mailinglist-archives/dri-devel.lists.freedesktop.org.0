Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDD26E977F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F94110E0BD;
	Thu, 20 Apr 2023 14:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4AA10E063
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:46:25 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id l5so2286868ybe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682001984; x=1684593984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucGFoKzyMkvbqBH4ukYaF9U0mjf0Vik4MYd/Gcx2gRc=;
 b=dHOjdiIiDNCT4ThKRZJyJnk+h3C8JJN3kWLqERHOHzehj5okUW69RO7OneHUvCg2FN
 arY8OaGc9ZkA+4ItTItRm663BRlFfnZjcM8lhsboyo+LfqySmkRTDdjd/Vzahd2qHVC2
 X49MG51WNytXwqV/g5O6ijBg/qcjGrNqCih3kCDZ3i3IdCVqGv14VRQAwcjIdcYE7TvC
 3uwL7u2KcaB+4DPbjiTZ9HkNpX0xcR9nzMKutyxbRkgyivHIY3378C19bvh5edfku79o
 ERA/opDiwdp85pNNRCyv+VwpGpGuK4N4Fmz1RNr4uXwQqYW4z1g/OH2Wqi0u9sldBSxe
 Fd3w==
X-Gm-Message-State: AAQBX9eYUsrZaNjqAAwqCGGSjLPUQxEHuOu05sHTYxwy5sY8XPJ9+ddD
 gZGkgHr0q4qUU7GqLJzcfwEGCz57EKa45U43
X-Google-Smtp-Source: AKy350aV50IXjSuoFr3351J5gPcg9aGOBAUCKhzwAAs72xCTAry3pDAEzsFxUHt6kpFc7rA1AO3fNA==
X-Received: by 2002:a25:f808:0:b0:b80:e32a:abbf with SMTP id
 u8-20020a25f808000000b00b80e32aabbfmr1566468ybd.15.1682001984216; 
 Thu, 20 Apr 2023 07:46:24 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 16-20020a250310000000b00b95068ccaeesm327801ybd.55.2023.04.20.07.46.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:46:22 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-54ee0b73e08so46495387b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:46:22 -0700 (PDT)
X-Received: by 2002:a0d:c8c3:0:b0:54f:bb39:792b with SMTP id
 k186-20020a0dc8c3000000b0054fbb39792bmr896173ywd.26.1682001982220; Thu, 20
 Apr 2023 07:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 16:46:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTR8-yDfX24V-_+fR-i4pv8XH9fhDinRok1MAp+80psw@mail.gmail.com>
Message-ID: <CAMuHMdVTR8-yDfX24V-_+fR-i4pv8XH9fhDinRok1MAp+80psw@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Tue, Apr 11, 2023 at 2:11=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -16,8 +16,13 @@ description: |
>
>  properties:
>    compatible:
> -    enum:
> -      - renesas,r9a07g044-du # RZ/G2{L,LC}
> +    oneOf:
> +      - enum:
> +          - renesas,r9a07g044-du # RZ/G2{L,LC}
> +      - items:
> +          - enum:
> +              - renesas,r9a07g054-vsp2    # RZ/V2L
> +          - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback

"*-vsp2", really? ;-)

And with s/vsp2/du/, it doesn't match patch 6/8, where you use
"renesas,r9a07g054-du" without the fallback.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
