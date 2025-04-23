Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611C8A996F7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 19:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A77310E22C;
	Wed, 23 Apr 2025 17:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82FA10E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:46:57 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-525da75d902so53132e0c.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 10:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745430415; x=1746035215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLqipjscszx2Mp0FY64qeFZMiD5TTEV8hZP6rO4hjpA=;
 b=jogIrSuUEUuZijfAvVMS9rTEeaZdPLAOy929mpTpILzo8UX9v8c7gfMvULPhHgYzKR
 T8fvdQYN7xnH5OE6Ek4bvqRa9TolO8eTH/X1kIQBfZ5guoNob0Qt/CAGVvCRS2KQcVB5
 mNwCjNUedmeqnD9S6PQzTWneNUVkm9vNh6izV607e3avAIAy4fDLvecC0ZFW9ugkq9De
 yWWXE+VfqbH3H/qZJ0gdnbINow/ysHkjEA4Q32Fi4ma/lQf/usw0vIS2KOwe8alylqMx
 vVwsJyRBYC2dnxOwJ061zf5skVDlkm35D4qihnqnpCCncUf51rOY7hX5hwMX9uwHiJ/N
 /XGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdV8NpQrnpVuorMDYP7GCGaGsWwGRjYHD3Rp8I1Lsh0V9YbSjhphT+GMAGORhUYgqFJFjjPziNcNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgr4fGP962e2Na7ySYJOpiONKHw6cisY8rV398FrZgqwxfiSEk
 hxuoxwBS3wR3n3WD/9a7UOb29yC9+RlL3FrTmSgKdIOPhsV5qlQX2odXBvP/188=
X-Gm-Gg: ASbGncuZ2Fh/xlVvYx736ve2WqrbKivlBYsuDet4+yDXKtPoHam5m11whN7ewx9U5nF
 kIXh0cgmXQLapyZAGOjFNb8qjdemtXESujztSeDoiYjaiSvPbtxVMFh9LmQKPcR4hvwN9jsCAE5
 1u3G6u/llV6sQE2SNAl0dOPeSJE45WnlnHTOqoH/s4MIqKG+0IaeBPk0pZa5QDR9F7KEHj8vPvP
 x5CVANx2k10hxxP1L4HteLyrbMNBHSJ7PVahoHL2dLRYeGgTGj9acKAOiMDq0Ljs4fD7Bw1xxeO
 2CWSFQTgC46KSVPKHhgLT5k1I6LM6PY1V68QTIQvSE/mdbbzPCznWfZX4+ySmd7RP9rRplxpEZe
 ivCGXJdw=
X-Google-Smtp-Source: AGHT+IENQHebzECNrPKI3laznasm8dRnsy/ZBZw19pmr2DbgGa3pzefjB94sNbjB+x67w9mDeBxNmA==
X-Received: by 2002:a05:6122:30a8:b0:527:67c6:faff with SMTP id
 71dfb90a1353d-52a76a4b534mr339424e0c.4.1745430414720; 
 Wed, 23 Apr 2025 10:46:54 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-877647997besm2712604241.30.2025.04.23.10.46.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 10:46:52 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-527a2b89a11so65069e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 10:46:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXqC2Vte9Sb1tzLKqEX4Ebe9ChpdEF2jhw/mK91E+4sASHeiBgnAw3APSXfKsDSyGGYz2cTl5zGflU=@lists.freedesktop.org
X-Received: by 2002:a05:6122:2a02:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-52a76b54183mr283580e0c.9.1745430411699; Wed, 23 Apr 2025
 10:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAjthvTuIeUIO4CT@pathway.suse.cz>
 <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
 <aAkVcaRrMmqXRSFz@smile.fi.intel.com>
In-Reply-To: <aAkVcaRrMmqXRSFz@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 19:46:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUkhJm++zitVRQdSHJUo9McjYGeVz4Frv2sct_Can+aw@mail.gmail.com>
X-Gm-Features: ATxdqUEiZpgKy-OUmSil13Kt3gOTH1qjKd6FZI95GjTyFDCgENU6kR4WqaMubEM
Message-ID: <CAMuHMdUUkhJm++zitVRQdSHJUo9McjYGeVz4Frv2sct_Can+aw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Aditya Garg <gargaditya08@live.com>, 
 Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io,
 Sven Peter <sven@svenpeter.dev>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, joe@perches.com, 
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, 
 tamird@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Wed, 23 Apr 2025 at 18:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Apr 23, 2025 at 04:50:02PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 23 Apr 2025 at 15:39, Petr Mladek <pmladek@suse.com> wrote:
> > > On Tue 2025-04-22 10:43:59, Geert Uytterhoeven wrote:
>
> ...
>
> > > The problem is that the semantic is not the same. The modifiers affect
> > > the output ordering of IPv4 addresses while they affect the reading order
> > > in case of FourCC code.
> >
> > Note that for IPv4 addresses we have %pI4, which BTW also takes [hnbl]
> > modifiers.
>
> Ouch, now I think I understand your complain. You mean that the behaviour of
> h/n here is different to what it is for IPv4 case?

Indeed. "%pI4n" byte-swaps on little-endian, but not on big-endian
(remember, network byte-order _is_ big-endian), while "%p4cn" swaps
everywhere.

> > > Avoid the confusion by replacing the "n" modifier with "hR", aka
> > > reverse host ordering.
>
> Not ideal, but better than 'h'ost / 'r'everse pair. Not giving a tag and not
> objecting either if there is a consensus.

That is worth as much as my LGTM ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
