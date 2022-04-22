Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8150B32E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A13B10F941;
	Fri, 22 Apr 2022 08:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822FE10F7BD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:46:57 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id 204so5364542qkg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 01:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxqEisi3EFgZNuKu/pNszsfri4ZDMq5dlFw0H485MCw=;
 b=vgCC1v63YKDK9e07JGpBY8CImo9MMEQFhlheOsHfYCFTPAQBePxuZej8LmfXVbK8ll
 UCqbzRwZwSoWR07r8Pz6KZxWjoy+yOv0RQfwkYBceGaQ44PCvY9pnvzSaAoFdkMMOYGE
 lVD9bcLA31m+arAppaWX/1DixogADLOWdHrB/SZUBHBoXm6pAvdK75oIX7AdRiJmg3eh
 kpeliuTOZEafXNZ0qB3cKo+rEPVdmbl5GhTN3B4fwct25/Byk3kk3+/02CD//L8MkSjL
 qKOoAolE6mTReDRtybJccdhw6QG5lplInI6tx5CSakEFjh5m/Ga1klTmyy1nC0ZtxqLG
 ns/Q==
X-Gm-Message-State: AOAM531MBk6A7ZYfmna4bfYRxEfnz1lAZf50nsotklFchsODjNnfY0AP
 w7YNLHI2bVaHmfpYG6dCZVgd24VmJNNdeA==
X-Google-Smtp-Source: ABdhPJwm6kf5aTKbK00mzVdyY5s5uQdn8rOHh5HcVDB11VI+BTaMltRAf70FHIU8BzYo6krgvZq41A==
X-Received: by 2002:a37:9f0b:0:b0:69e:765f:7728 with SMTP id
 i11-20020a379f0b000000b0069e765f7728mr1906756qke.760.1650617216409; 
 Fri, 22 Apr 2022 01:46:56 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 c136-20020a379a8e000000b0069e5df9d953sm649780qke.34.2022.04.22.01.46.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 01:46:55 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id f17so13241741ybj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 01:46:55 -0700 (PDT)
X-Received: by 2002:a25:32cd:0:b0:645:81ae:bb78 with SMTP id
 y196-20020a2532cd000000b0064581aebb78mr3373655yby.506.1650617215207; Fri, 22
 Apr 2022 01:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Apr 2022 10:46:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
Message-ID: <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: Fix typo
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Thu, Apr 21, 2022 at 6:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix typo rcar_du_vsp.h->rcar_du_vsp.c
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * rcar_du_vsp.h  --  R-Car Display Unit VSP-Based Compositor
> + * rcar_du_vsp.c  --  R-Car Display Unit VSP-Based Compositor

Perhaps drop the file name completely instead?

>   *
>   * Copyright (C) 2015 Renesas Electronics Corporation
>   *

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
