Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451F602BC8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 14:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B855810EF32;
	Tue, 18 Oct 2022 12:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA53E10EF36;
 Tue, 18 Oct 2022 12:30:24 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id bb5so9471224qtb.11;
 Tue, 18 Oct 2022 05:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LA5Rw3StwiOqL+QwzJgo3njgEZhTbHuX12wcOa2B5Os=;
 b=vSP6iNVYSYd2aVZ/ob0iR+eul0CC8Px4iQ/gaQOZ0bhycA2tgOyl/M1givlLaRlehO
 Zk4qFg6xHY2CYORcRN0qIS2bS4w2JJllTTOJD1upvSZB/foodMOfFkuoz07iguH5aKyx
 IhGPez0Xt9J+GErnFFjFAkrBAl738iPaA2ATybBSqZrczGfbSIHVcEnnsLcSaAl8iMXi
 bjFkfNTln3+comy3GFnM9ITY2r7pVJf5NPgaGq29Oxtt5evLPKE7E/mQrMq//BJ7pzCw
 0AAZC7MMyzDpWSfk3Vn3+oG/vq3elRHH3ZnlxrZvIvYG5GgDXHvTYvEQJmYB0TJB4++v
 dl3A==
X-Gm-Message-State: ACrzQf1/UUThqceq/8cbDNIBZo2JR5kgK3HAcCh0dEf3L+82F36Wk7uA
 4n23cOKwFUsbxJ5eh/kBupW48bI0CaHqEA==
X-Google-Smtp-Source: AMsMyM7Wd3Xr9m5hQ04W69XBa+VegRFwIYXJyAeowqZxtIg/g6zXxDbp3bkTVP633XWMUq+n33L2zw==
X-Received: by 2002:ac8:7fcc:0:b0:39c:f1b4:b3c4 with SMTP id
 b12-20020ac87fcc000000b0039cf1b4b3c4mr1802692qtk.551.1666096223526; 
 Tue, 18 Oct 2022 05:30:23 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05620a245600b006b953a7929csm2338453qkn.73.2022.10.18.05.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:30:23 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-35ceeae764dso135625857b3.4; 
 Tue, 18 Oct 2022 05:30:22 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:357:2422:13b4 with SMTP id
 135-20020a81098d000000b00357242213b4mr2107285ywj.316.1666096222450; Tue, 18
 Oct 2022 05:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221017145157.1866351-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
 <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 14:30:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
Message-ID: <CAMuHMdVbo0wMaVVhe4f4tC9-TW2+DsOVAB77TtLdnsG=us8Q2A@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.1-rc1
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
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
Cc: D Scott Phillips <scott@os.amperecomputing.com>, linux-rdma@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kvm-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maciej,

On Tue, Oct 18, 2022 at 12:39 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Mon, 17 Oct 2022, Geert Uytterhoeven wrote:
> > .> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9abf2313adc1ca1b6180c508c25f22f9395cc780/ (all 149 configs)

> > >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > > 2616, 2621
> >
> > mips-gcc11/micro32r2_defconfig
> > mips-gcc11/micro32r2el_defconfig
>
>  Where can these configs be obtained from?

By following the links in the URL above you removed while replying? ;-)

http://kisskb.ellerman.id.au/kisskb/buildresult/14818296/
http://kisskb.ellerman.id.au/kisskb/buildresult/14818298/

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
