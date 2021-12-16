Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B4D47737C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 14:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E225E10FE4E;
	Thu, 16 Dec 2021 13:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852410FE4E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:47:34 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id w23so47210408uao.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iBZapDL2eyvVMkB+C0NRFzbY4IahVxxfAnthP7sPxY=;
 b=OHwRuacr/XcZGZqR9yWrUub+kgYNtkidnfnkH4i+JGF3XmDguYMRB9opg3tl8ITFvz
 eVGtX0ThddMrd78Dv/uKnPZKUrQKNg0pSanYpH4LiUBhDBuSykX9JHIZQJP5L+vvEUzg
 2VS+K08o2hNK0Nu/VQ8tzYxTZiafMr6ty+mT+JdiT1AbDVlTx2T5tOo2BxxP2QT20ic6
 EFuWG2DTiLD/keBkBl8OQvpt5ycL+8FFfg8lEYRSjuuD5nUzpbVcuNWuItQT8BgzApe9
 ZaShwmgQcOzBoG2J5APbO8TEGi16OwhqovB5Pddi2InuvVThrKuHHEbo8CoQLoLlvfNs
 UbJA==
X-Gm-Message-State: AOAM5304YHFQmIAGQvbZZ006rAtUriB9RJC92hVRikaBLsqp/avvdCZ1
 QDYHUhY/BHiURbGCj0Izu66z3J0H8Xd4tw==
X-Google-Smtp-Source: ABdhPJxTKO4Ra5HTVv0mBsXytsmGB4Z1HL5U2oibKpDVFrI+6mH+APFXpeJNPDbFMMx27OvDzeyIgA==
X-Received: by 2002:a67:fd07:: with SMTP id f7mr2248326vsr.69.1639662453772;
 Thu, 16 Dec 2021 05:47:33 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id f11sm1104274vkk.50.2021.12.16.05.47.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:47:32 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id w23so47210197uao.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:47:32 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr5231958vsj.77.1639662451912;
 Thu, 16 Dec 2021 05:47:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639661878.git.geert@linux-m68k.org>
 <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:47:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUambn+yZu0Nnc9G1ErVRR4cfjC7AHfs139GZAW1GBqjw@mail.gmail.com>
Message-ID: <CAMuHMdUambn+yZu0Nnc9G1ErVRR4cfjC7AHfs139GZAW1GBqjw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
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

On Thu, Dec 16, 2021 at 2:41 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
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
