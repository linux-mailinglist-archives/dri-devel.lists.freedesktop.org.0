Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1D761C34
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 16:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C1B10E03A;
	Tue, 25 Jul 2023 14:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D25010E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 14:46:53 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5774335bb2aso63790027b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690296412; x=1690901212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kxOdPyZyaJv5gxG+QtuGeWvPDhLsU0ZIVKhTdMmlNw=;
 b=l1eZ3BOxxv+S6rxNy09QEhoItyI6H73SyCe3OdpN18J9Bh8IZ+hnEEBrvbIw9f7tdq
 QYIePeB+SM1LDW68pGP8qcoVoMqr8S+bBfyaMi/VfO2I1CuccvwGHsG0wF2HY88ht5uH
 pLks5cSY/jUIZgJOBMzZqUToCStI7J/wi2zJ6gVEbaz1qzHgbFek0Rb628pz1ZXp+Dg3
 UmiM2zgABD5vPtpLuWQp0cnVTl6xyKrafGfRMukarHi6bIzNl2cRlmjF6g9qlOVQWma2
 GJMjQjswuvdAUscbWXaXY2Blishg2ll9HjnZlYDYRez1KuB3C1fxwsjKTnHgv2LnTSmb
 0dlw==
X-Gm-Message-State: ABy/qLZdbHIqXWUmyoYSlDnzjq9UrSnAEpZdPJumN4hsQxY8NyMQHQYF
 5iwwpSGibzPGQD73BrM1EoYv50UcNx+K/Q==
X-Google-Smtp-Source: APBJJlFaIdgWercbzFwt9UPTpaNlscR5NV1Iz1CNjbNA7j/v4aqQuSYTwVGRyVB7OjZA3czinRytlw==
X-Received: by 2002:a0d:dbce:0:b0:56d:2c60:2f84 with SMTP id
 d197-20020a0ddbce000000b0056d2c602f84mr7861010ywe.46.1690296412445; 
 Tue, 25 Jul 2023 07:46:52 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 y145-20020a0dd697000000b00583b40d907esm2480253ywd.16.2023.07.25.07.46.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 07:46:51 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-c01e1c0402cso4820536276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:46:51 -0700 (PDT)
X-Received: by 2002:a05:6902:1350:b0:c83:27d4:c0d6 with SMTP id
 g16-20020a056902135000b00c8327d4c0d6mr8607825ybu.37.1690296411349; Tue, 25
 Jul 2023 07:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org> <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
 <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
 <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
 <ZLcLnoAoJmQ9WTuM@slm.duckdns.org>
In-Reply-To: <ZLcLnoAoJmQ9WTuM@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jul 2023 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo=17kYsNEYr=qyVceRpJ4D3jMFrMOiqaH--OOhJOM4w@mail.gmail.com>
Message-ID: <CAMuHMdUo=17kYsNEYr=qyVceRpJ4D3jMFrMOiqaH--OOhJOM4w@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
To: Tejun Heo <tj@kernel.org>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tejun,

On Wed, Jul 19, 2023 at 12:01=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
> On Tue, Jul 18, 2023 at 11:54:58AM +0200, Geert Uytterhoeven wrote:
> > I gave it a try on a system with an 800 MHz Cortex A9, only to discover
> > it makes no difference, as that machine has 1600 BogoMIPS:
>
> Oops.
>
> > workqueue: blk_mq_run_work_fn hogged CPU for >10000us 4 times,
> > consider switching to WQ_UNBOUND
>
> It could be that we actually want to switch to UNBOUND for some reports b=
ut
> the above triggering most likely indicates that the threshold is too
> aggressive.
>
> > Artificially low BogoMIPS numbers only happen on systems that have
> > the related timers (Cortex A7/A15 and later, Cortex A9 MPCore,
> > and arm64).
>
> Ah, I see. Thanks for the explanation.
>
> > I will test on more systems, but that will probably not happen until
> > next week...
>
> Thanks, really appreciate it. Can you try the following instead when you
> have time? I just pushed up the lower boundary to 4000 MIPS. The scaling =
is
> still capped at 1s.

Thanks, with the below, I see no more WQ_UNBOUND messages.

> From 8555cbd4b22e5f85eb2bdcb84fd1d1f519a0a0d3 Mon Sep 17 00:00:00 2001
> From: Tejun Heo <tj@kernel.org>
> Date: Mon, 17 Jul 2023 12:50:02 -1000
> Subject: [PATCH] workqueue: Scale up wq_cpu_intensive_thresh_us if BogoMI=
PS is
>  below 4000

> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c

> @@ -6513,6 +6516,42 @@ void __init workqueue_init_early(void)
>                !system_freezable_power_efficient_wq);
>  }
>
> +static void __init wq_cpu_intensive_thresh_init(void)
> +{
> +       unsigned long thresh;
> +       unsigned long mips;

This fails to build on mips.
Apparently mips is a predefined preprocessor macro:

$ echo | mipsel-linux-gnu-gcc -dM -E - | grep -w mips
#define mips 1

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
