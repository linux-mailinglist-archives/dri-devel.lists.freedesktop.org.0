Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27D454290
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C651F6E463;
	Wed, 17 Nov 2021 08:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F126E44E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:24:26 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id w23so4138736uao.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 00:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pLki4VXVNEgH7BpAr7thCy6liKqtc8dZxgXibG/LDtU=;
 b=E+odLi/n2xrcIB+7TE6bIiAE8dDA8Dv5DMejFAuLWquhtNnF7KdoSuOqRUUPDuf+N6
 5rj3QQnjWEQ5794cJuF3xuAwBMTRD6PQSowYpFhvHTyczolhxO5M7ueyQ51sibGStQBt
 lOPekdDFzoNtxIYB7r9kOE9vr7mzby85SpYDPBX8K7jUNNkMEIeRFADG/2eKU1nl//ZG
 KcUQot1oi+nEzqoXZ/X3HM9AhfFqlPwRsy4M74QmSA01QYXGRVjau2UPVCfjErx2WSz9
 Wsjz9kyMBm+KguloXNeQiJxpSU9MhX1bdKtdUdHYZOYX/AcwAQ//6gIciAvZQL4cIdHF
 Q4Xg==
X-Gm-Message-State: AOAM533AvKJE4qpoBvplhW3ctCZugzungaE2EvTntBam8HoCnXn4rWiP
 EwTzKXqbdqr9kIwQf2kkKc5gjGVrl6iS9w==
X-Google-Smtp-Source: ABdhPJx37nUd75vjc4m9i9tdFd/SS1BOpKNgbUBR27NkLc9l4786Z/sG+Ye3D7c6ufzyfwwOqJ3aDg==
X-Received: by 2002:a05:6102:38b:: with SMTP id
 m11mr65053123vsq.36.1637137465625; 
 Wed, 17 Nov 2021 00:24:25 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id j17sm11739686vkp.27.2021.11.17.00.24.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:24:25 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id p37so4116316uae.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 00:24:24 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr20823663uaq.114.1637137464301; 
 Wed, 17 Nov 2021 00:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
 <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
 <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
 <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
In-Reply-To: <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Nov 2021 09:24:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgGz5FSidaGpp8YRRSnJfwdP4-wOkXdVx+mydXnMAXHQ@mail.gmail.com>
Message-ID: <CAMuHMdWgGz5FSidaGpp8YRRSnJfwdP4-wOkXdVx+mydXnMAXHQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
To: Nick Terrell <terrelln@fb.com>
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
Cc: Hector Martin <marcan@marcan.st>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Helge Deller <deller@gmx.de>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nick,

On Wed, Nov 17, 2021 at 3:20 AM Nick Terrell <terrelln@fb.com> wrote:
> > On Nov 16, 2021, at 6:05 PM, Randy Dunlap <rdunlap@infradead.org> wrote=
:
> > On 11/16/21 5:59 PM, Nick Terrell wrote:
> >> I=E2=80=99ll send the PR to Linus tomorrow. I=E2=80=99ve been informed=
 that it
> >> isn't strictly necessary to send the patches to the mailing list
> >> for bug fixes, but its already done, so I=E2=80=99ll wait and see if t=
here
> >> is any feedback.
> >
> > IMO several (or many more) people would disagree with that.
> >
> > "strictly?"  OK, it's probably possible that almost any patch
> > could be merged without being on a mailing list, but it's not
> > desirable (except in the case of "security" patches).
>
> Good to know! Thanks for the advice, I wasn=E2=80=99t really sure what
> the best practice is for sending patches to your own tree, as I
> didn't see anything about it in the maintainer guide.

All patches must be sent to public mailing lists for review.
You might get away with not doing that for a simple and trivial fix,
but be prepared to end up on people's "special" lists if you did get
it wrong.

We are Legion. We do not forgive. We do not forget ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
