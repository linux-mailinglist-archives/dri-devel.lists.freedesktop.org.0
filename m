Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3CC7FB8EC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 12:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B0A10E4D3;
	Tue, 28 Nov 2023 11:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D25D10E4D3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:05:19 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-db3a09e96daso4739938276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 03:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701169518; x=1701774318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oy+o1kVweIOL0AWQDo7Tqifh29KAZj1zX09r8Nx2UH4=;
 b=b3cvdt7kl1ZOdzqZR+DslGInqCdEKmNX0BSh1yL0eqGnaCx/Ndn2hRUXCYXD9IaeoI
 g874vrjqSW6T4aeWR5MYg24uHrucHgKgRdod2LAj6m17zRd/Q/KknrR1CVA0ibGzt0Ny
 dOWqZBfU82CqU7CCxiUBmoramG0M0hVCmFt2HTKEBTJwAZAYxMpSLCnYpDh+RMS850jt
 +HbogsGKhus9vo4vPOm19b4PwNUp7eFnu+Nvnhe7/CHXXIU8GWgekVOGxHDTUTi5Wrm7
 qxWqn8Uj1I+EhfIHTfJpkdQEXx8XyGe5ed/ljb3ALpiQ710/b+687Al97fUfBpdkReYb
 oYwQ==
X-Gm-Message-State: AOJu0YyYlRsVjmviE96e06a/l3Y/x11MrVABNvuquhV3626QHhwqalRk
 DjB8Lk3omOtisD+exI2mBGzveHhuT3zUtg==
X-Google-Smtp-Source: AGHT+IGap7iIOpioGdgh/SRXVoPNfjYx3uR5NS3Qplal6VrHJduLkf8UslOMmNruimFSJ8rLgCNV+w==
X-Received: by 2002:a25:b222:0:b0:d9a:ede4:7126 with SMTP id
 i34-20020a25b222000000b00d9aede47126mr14502446ybj.44.1701169518279; 
 Tue, 28 Nov 2023 03:05:18 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 j85-20020a252358000000b00db3fdaaa4fasm3599292ybj.1.2023.11.28.03.05.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 03:05:16 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5c8c26cf056so54492287b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 03:05:16 -0800 (PST)
X-Received: by 2002:a05:690c:2e10:b0:5cf:809e:6b64 with SMTP id
 et16-20020a05690c2e1000b005cf809e6b64mr7788821ywb.48.1701169515975; Tue, 28
 Nov 2023 03:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231128105129.161121-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 12:05:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZGmP9Q3vahYaMWFqi0w4GWdSY1pxiunWtobn5RR1_PA@mail.gmail.com>
Message-ID: <CAMuHMdVZGmP9Q3vahYaMWFqi0w4GWdSY1pxiunWtobn5RR1_PA@mail.gmail.com>
Subject: Re: [PATCH v15 4/5] MAINTAINERS: Update entries for Renesas DRM
 drivers
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 11:52=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> The rcar-du has never been maintained in drm-misc. So exclude only
> this driver from drm-misc. Also, add the tree entry for sh_mobile.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # shmob_drm

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
