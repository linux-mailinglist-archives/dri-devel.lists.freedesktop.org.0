Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66C6E97E6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C087910E2D2;
	Thu, 20 Apr 2023 15:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033F410E2D2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:02:44 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-552ae3e2cbeso44658937b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002964; x=1684594964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AxUhM/jxNN72AyF4iUkssSBmkhq9B+Vz0NtwH/Pd3xU=;
 b=jLuzd/Twb+BecFDqpavNRfyKyLScwfmg732odOXO3n1gLJDSAOCxJtwAPCBTkoA+ab
 Umm/SqC1Q+fuc7sCCR0WT/dawSvCjv7FDD3PEST4884X+vkol6tbzZPxfopzHqkEKd0l
 ZeCdME52H1ue5Ql+iCsHEBvod1Lbd3S2T+0YHPZVEiGKeXBMhWl/awsw7faWUVDy//No
 1eRStVM4clKl1/gbagRzNDEJXiqDjOu5BNs42EHTxwRmOPucBBmrL0m4lvUK9hF9J5p4
 4MSlQQtBPYb+KnIZitEsKJGnspYJU13EoHY6s6QofSViwco68Bp07IYQXk8CwAwmVLEV
 lvqg==
X-Gm-Message-State: AAQBX9dTWOr7w6nwQp8Fwg2U1wNfwwsXwuou8NpJ75ibS1Ao/R5fPks5
 0rO6F2kyMKzW0ulrPbYQdxOpyv3p+dJuJ1Xi
X-Google-Smtp-Source: AKy350apMhlOp3E9KOaU1bbd3GDLRvi526SKENiAZnNbM7lI5IGL+24Pj1t3lHHtDpqM06QNaLyy3w==
X-Received: by 2002:a0d:d905:0:b0:541:5a5d:8fba with SMTP id
 b5-20020a0dd905000000b005415a5d8fbamr1331456ywe.13.1682002963624; 
 Thu, 20 Apr 2023 08:02:43 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 r124-20020a0de882000000b0054ee8426468sm381704ywe.21.2023.04.20.08.02.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 08:02:42 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-552ae3e2cbeso44657087b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:02:42 -0700 (PDT)
X-Received: by 2002:a81:d93:0:b0:552:b601:c814 with SMTP id
 141-20020a810d93000000b00552b601c814mr6145766ywn.24.1682002962377; Thu, 20
 Apr 2023 08:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 17:02:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAp=makAvusxDC_JRtPtjkr__a-vd9mEc6FjDkP76Vbw@mail.gmail.com>
Message-ID: <CAMuHMdXAp=makAvusxDC_JRtPtjkr__a-vd9mEc6FjDkP76Vbw@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] arm64: dts: renesas: r9a07g044: Add DU node
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

On Tue, Apr 11, 2023 at 2:08=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add DU node to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
