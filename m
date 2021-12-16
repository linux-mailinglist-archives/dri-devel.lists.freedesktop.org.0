Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFD34773A3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 14:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA4A10FF85;
	Thu, 16 Dec 2021 13:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66D410FF81
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:53:04 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id gn2so1351741pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4uF+gM1G86VM+Kpj4DovgZM1B/9K1RNtYVUSewjskIc=;
 b=utUfR9XKymWE7nMJop35uPiT7wrBX6EdB3otd5xKXh9K2ZgdljwKjzjKysWwI9tk90
 Zu02JFLgVT5E06Bgv31zMbyyPQn/QoyUmCIydhpmiW4HggsKyHdJz7c011Gk/Isfqk9Q
 BXBXG43owCWV5WaG0s6hhxRkMh75WVOtvruxEZD9B3/AOtpP/MtBfSv0j/Mqp8xgxtaj
 N9LfFPWlonz7K0bXa6keKe0hGIE2UwVZdPYHLFrSKC3tUmqs1nY9xnKgtKVXPITYNxki
 1mXuzen5M7QmZm1jI0uPnVLIzBBpVS23X8riZU1+NgRy+a+Ns5YMfufA4FdC+7tq08fS
 eNBw==
X-Gm-Message-State: AOAM531FgBKGUMlrbqcs7/C48bqlLSlCcLKxYEt8c5+QYTxJK2b7Awco
 8djQP2jX/4UhAa2vmmEOpKyOTyyMkzeuRA==
X-Google-Smtp-Source: ABdhPJzNW3oUZpI1U4nj+/LFbuIU6RUPnY7qa25rrQASkNpoPXNCyH5GScf/ee6GNU1sIYNkD5uJJg==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr6154566pjb.240.1639662784272; 
 Thu, 16 Dec 2021 05:53:04 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52])
 by smtp.gmail.com with ESMTPSA id d13sm5369292pjz.7.2021.12.16.05.53.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:53:04 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so22726830pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:53:03 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr5543879vst.5.1639662468579; 
 Thu, 16 Dec 2021 05:47:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639662093.git.geert@linux-m68k.org>
 <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:47:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVL=dSku5MU5PjRz4owdb5ZOiWb3rymZxZ_TLVNhSwLkg@mail.gmail.com>
Message-ID: <CAMuHMdVL=dSku5MU5PjRz4owdb5ZOiWb3rymZxZ_TLVNhSwLkg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
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
