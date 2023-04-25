Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F16EDD17
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C0E10E6B6;
	Tue, 25 Apr 2023 07:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58C410E6C7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:47:44 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-b95c3b869dcso18604029276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 00:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408863; x=1685000863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXATlI8zQFpvioDHoFlOVVEH9bB1ha5NF20/P873Yjo=;
 b=G9eFKTre4/btaa/yH+S5JUh07cDP6P1lpk3oJws5IdTVSfSvQ8658h1mbbExk97aEa
 ZPJH+L3PCuV/j5OZQMwRKmQ5uyW2KXyj6gYF8rQl/cqqNNRjvvRoKHTpp39mQwxbuC7G
 i37J7G0s3yOnVTXItJsXkq4ZuF7HG5sXw1+GtlS4tHon2KSH0+7kRjVKyy5nNnYvl5uz
 RJvdQR7JwcglvlsT15MRuZoe8uh7ZId87WHNPS5SII85w7fsWTdh+xLAop1/oMPXyStE
 zE/h3rdhQ572xlEHSXVX1dogtoSyl78oPKNBotTeBI2/0SpUsXP2AJmRYzcPvGsQMQ67
 9vSA==
X-Gm-Message-State: AC+VfDyF86eobW76Yw9Q/cv6+3+kvoRQQbDQKKHR42jKVn0xqQjjEg1+
 /V9eOSKc0nx7ARudT3Vb1qs5g8+/vmRQ6g==
X-Google-Smtp-Source: ACHHUZ7J2EqdpEuS0yl14cEPcqoGf5Y3Y5he1nrLiTCQY2hB9KWPpOCO2MOnoEgNPjuWwEXClpzDJQ==
X-Received: by 2002:a25:18d4:0:b0:b99:b742:3c91 with SMTP id
 203-20020a2518d4000000b00b99b7423c91mr3198229yby.3.1682408863025; 
 Tue, 25 Apr 2023 00:47:43 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 i83-20020a256d56000000b00b8f448e1b6csm3354717ybc.1.2023.04.25.00.47.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:47:42 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-b95c3b869dcso18603939276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 00:47:42 -0700 (PDT)
X-Received: by 2002:a0d:dbcb:0:b0:54f:8636:2152 with SMTP id
 d194-20020a0ddbcb000000b0054f86362152mr10417319ywe.15.1682408861984; Tue, 25
 Apr 2023 00:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 09:47:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx65YSb7THMKVFjWt8BnvsR5yOXhR1T2PZ=coPPARXpw@mail.gmail.com>
Message-ID: <CAMuHMdVx65YSb7THMKVFjWt8BnvsR5yOXhR1T2PZ=coPPARXpw@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] dt-bindings: display: renesas,rzg2l-du: Document
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 6:10=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v7->v8:
>  * Fixed the typo vsp2->du
>  * Added Rb tag from Rob as the change is trivial.

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
