Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9442A715A53
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F8510E139;
	Tue, 30 May 2023 09:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E251510E139
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 09:38:58 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-568ba7abc11so12779147b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 02:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685439537; x=1688031537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtzfKWVbN7jaIx42M6eciXxIXho9ZJ7/2HvWUUp93A4=;
 b=hQHhDZoTzuDI0C7UyCtemh1hnS4gWoysMYpYlhSCwujVj+tWO87d3w1ARGZg0bqUkE
 l0u+ljvmPfFoVbYWCbP03PrUX364WeLHtduJCIZ+LAhb+4uYeyBlYDqp0ipyY22nVfcq
 s1atZTteN1YS6hiI0pQyuXftzDfFaVXNB/cPdLjvjFiievcrMTOmOI8N6pzV6L5DxToX
 h8uxOB5NuHQl7Kq/4md+U0ozl3T/DD4pvfpF2CpFnwRZtH1y+fNLOj3bOPFmFoeOIues
 638BSbK3m1c6UfRbHGXGELfJMspnXUw+gGOMl692XSAMgsbMZhLhCbLzsyUGmBB5XcG4
 CmKQ==
X-Gm-Message-State: AC+VfDx5/dOIYSGPNWENCKQKIENDUhMo2RUQymdpY0LUBHNXVKHvgdFF
 j7w3ziMDOpcIn7/tw5geoRnYEa1nzO8BCQ==
X-Google-Smtp-Source: ACHHUZ7C9069arIq/qrwIBQQH8WtENZgBRevM7Ntjanak9VjM8emlxP4tMdx0dWVWN1c+pcBvJpq2Q==
X-Received: by 2002:a81:7445:0:b0:565:eedc:8dbe with SMTP id
 p66-20020a817445000000b00565eedc8dbemr1526114ywc.27.1685439537452; 
 Tue, 30 May 2023 02:38:57 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 h82-20020a815355000000b00564bc2ddca3sm4332653ywb.25.2023.05.30.02.38.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 02:38:57 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-565e6beb7aaso36929757b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 02:38:57 -0700 (PDT)
X-Received: by 2002:a81:a155:0:b0:568:d586:77bd with SMTP id
 y82-20020a81a155000000b00568d58677bdmr455434ywg.1.1685439536879; Tue, 30 May
 2023 02:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 May 2023 11:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
Message-ID: <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, May 30, 2023 at 11:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Replace manual handling of EPROBE_DEFER with dev_err_probe() to simplify
> the code.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Thanks for your patch!

I sent a similar patch before:
https://lore.kernel.org/linux-renesas-soc/62adddea1fc5e9133766af2d953be7334=
f4622aa.1638959417.git.geert+renesas@glider.be
leading to your comment that the deeper paths should be fixed instead.

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
