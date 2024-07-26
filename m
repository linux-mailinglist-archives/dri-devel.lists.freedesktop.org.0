Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACB93D682
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 18:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A5210E28C;
	Fri, 26 Jul 2024 16:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E331110E28C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 16:03:57 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso2245079276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 09:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722009837; x=1722614637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rnrmsk4LAjav0+NDZkmFZGtCIbLnhTN3Oc8OLeZ+jtU=;
 b=faKsBdIZdxa6495EyRuu+SYQisMK+PmgEXw78S7NGhCFumpelOKb98goIlypNJCdug
 EWETVV9ynUOOlub/GxxL/E7tcjPtVCZzAmRBPgg8BTJbsUtj+P8kLN3fqHSR/PE1Fray
 MgwEj3BcP8sttoJLF1jlbbufb8LPy97CL0SuXTBSY89JZJQNX7bO/FOv88YhkV4WmoEz
 FZ68WdcewMGrS2II2egEtYQyiaxD78nMmjRVYM9HWBc8oB0RZ1tfxKLIUPRBAgPzT4hd
 ZU1bkdBwVnD/swNvl/wfFEaJKDVQfefze+3k/F70wAokOJAh3MNB5fiDjjwaYFGPaQcr
 aNhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwvVicW2/VzJthn9oh6+O5Rj/S0Cjg/fs8VTq6t8dfNF6gYKmTpfX/BtOfP+VQvUd5usubi2ni5sGvTU5IZSjoMhyj8eojzZtdOXlEOFqB
X-Gm-Message-State: AOJu0YzMa8sJgT78wxwOmdBayrEgUqUeH6qgP9NJd/VOqUAkfFqoxnUp
 8nKQ7qPe5+x5RNVN9eY6eKZ8IFgXbzUIEf6zzHP+wt8alZv4JbO+qUYTJQzg
X-Google-Smtp-Source: AGHT+IF+Twdld9KH9rcfPFU0Q4QJPlJu7F5osq0J7bFBjhtt9vBU6k1G+5PxeQmcjG0weWZ0WWbGYA==
X-Received: by 2002:a05:690c:23c1:b0:615:1cbb:7b81 with SMTP id
 00721157ae682-67a0a60d184mr2671727b3.46.1722009836663; 
 Fri, 26 Jul 2024 09:03:56 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-67567b4a883sm9308047b3.58.2024.07.26.09.03.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 09:03:55 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-66ca536621cso24498707b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 09:03:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrSC/yzQxWpa4Z/GWyRhmUSzOPb6dUUlBgj8QEgTEWQHLWIHp1uSMB8APATxm7kp69h53pQNJUx9cWbrZzbJATHQ3OMz/qBRYn2/0VtI59
X-Received: by 2002:a05:690c:dd1:b0:644:b209:4de1 with SMTP id
 00721157ae682-67a050f3e25mr2849197b3.2.1722009834893; Fri, 26 Jul 2024
 09:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 18:03:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo_9j84ENEz2zupQnc922bA00XM9qxcisRSKhnZHYdNg@mail.gmail.com>
Message-ID: <CAMuHMdUo_9j84ENEz2zupQnc922bA00XM9qxcisRSKhnZHYdNg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
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

On Tue, Jul 9, 2024 at 3:52=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
>
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs. Currently there is no user for the DPI interface and hence there
> won't be any ABI breakage for adding port@1 as required property for
> RZ/G2L and RZ/V2L SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v1->v2:
>  * Updated commit description related to non ABI breakage.
>  * Added Ack from Conor.

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
