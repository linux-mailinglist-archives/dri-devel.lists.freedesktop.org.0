Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C475D477378
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 14:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4423710FD03;
	Thu, 16 Dec 2021 13:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CD310FC35
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:47:10 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id p37so47200300uae.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rzheh/b2C4XgE1n4fabpDIDD9PrwJO02lF9Zwrd8B1s=;
 b=GgOLuph6n14sMhz+z/Y6WyUBx50J/6WCYeqFsXAx76uVOipgoNK9hJAOlH77k82XKM
 XddEFyAmAhBx3azGCvT7MeMXVWa6dkHLkZLZ68xjnMSQxM+BktiHWCbriU/s+0ySWvS0
 Vv6Kem80ShEe3dn+IQdDg4yn85OKEt71M3ba2kD/r5DZS5Wntav3l1rSn8lta6ZwRKIt
 Rke48IYXdSLYZzIOoUJHrHQgupJ4WlHnVjvT07SqW6/4QXzUvFfjgWofOKtXFydcywac
 BcULlEtRihpxuzuPmDzm+pnj2FzKbtC79fh6om1C6GHZ6fDbPLEBd6ZC5ZnOM7Vq1Omz
 AN9w==
X-Gm-Message-State: AOAM533KfR+LTEHmqdPYun3ek9YFNck021gNIaDi6YN4XUhHsmDRYkYC
 acGFvdFvv9BgWtMDXJgdB0NUZOvPsW3PzA==
X-Google-Smtp-Source: ABdhPJztWEL/aCFsUb6E1Hyp9cqILIHle2UNEKDZToT9jNQibri2C/rl+o7pQF/oOWZQeu8syEoUYg==
X-Received: by 2002:a67:d208:: with SMTP id y8mr5578273vsi.87.1639662428365;
 Thu, 16 Dec 2021 05:47:08 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id t20sm1116434vsj.27.2021.12.16.05.47.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:47:07 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 70so16839230vkx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:47:07 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id
 z15mr6137098vkn.39.1639662427136; 
 Thu, 16 Dec 2021 05:47:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639660956.git.geert@linux-m68k.org>
 <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:46:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEF8r=usQMUGdw5NMLrgthgsvAB=LVm0j_uMx-eqepow@mail.gmail.com>
Message-ID: <CAMuHMdWEF8r=usQMUGdw5NMLrgthgsvAB=LVm0j_uMx-eqepow@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
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
 <devicetree@vger.kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 2:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G2L SoC embeds Mali-G31 bifrost GPU.
> This patch series aims to add support for the same

Oops, please ignore this email. Sorry for the noise.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
