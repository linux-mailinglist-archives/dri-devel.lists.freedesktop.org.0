Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFBE4D2A6C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2610E811;
	Wed,  9 Mar 2022 08:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8AE10E917
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:15:30 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id 11so1246351qtt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 00:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dxAUDyS9GJLYSOSCc/5rpqFIxvMO8bZDSJoz+/4nqZE=;
 b=ItubG/kX5aAgSxqgmWmPGflJeQi4eUTi43vpVsSh5oB2uFiCFW+sJOjHyrGTsHfuUp
 p0y561IcCVXw4ZNDgokIHt1b/cQ+Yx4aKGLqV1sFk3ch5OpfzhS7K11cz6TA2tumjo0F
 hFn5TYUkgcRrgpTHs7vdBE4jgEGvsSnHmjT+byUjMtk3W2Ph6yRdXAeYgmdJ4R3X1V4l
 AZvDUWDqx2/GXjkt7jgA7oXfZs+BF1ZZzCoSFHwLWqVCTt9y7lhY7DfIpOhxfyMerja0
 8UvHwGhNt2TvBf9gpjd8DvwexsNAiXqshufoui7XtEA41LJ/dPMJo6TfivtPc66XWXVH
 KilA==
X-Gm-Message-State: AOAM531T+VCpSVsfV3TPg4jazhtQDQKSMV+GY0R9UQ4guEhAgcK1H2zb
 DkDibS2GBga8+XepaVPXRL2zyx/vzT/ouA==
X-Google-Smtp-Source: ABdhPJxGmKO0gexSRJUqSf/9AJHaWpFSExZRppTA1d9ktiHptW4i+LXW0yaJ/RgQAn13oLmanHXWBw==
X-Received: by 2002:a05:622a:148d:b0:2d6:b8ec:70bf with SMTP id
 t13-20020a05622a148d00b002d6b8ec70bfmr16938593qtx.520.1646813728863; 
 Wed, 09 Mar 2022 00:15:28 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 s5-20020a37a905000000b0067d35f2fdb1sm562011qke.37.2022.03.09.00.15.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 00:15:28 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so13805787b3.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 00:15:27 -0800 (PST)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr15779778ywi.449.1646813727425; Wed, 09
 Mar 2022 00:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Mar 2022 09:15:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuu8-wEfVRZo-yLCBaTYhOa1No1mE+SgekW3jQW9+9ig@mail.gmail.com>
Message-ID: <CAMuHMdUuu8-wEfVRZo-yLCBaTYhOa1No1mE+SgekW3jQW9+9ig@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Document RZ/V2L SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 10:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The Renesas RZ/V2L SoC (a.k.a R9A07G054) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
