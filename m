Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9F9E82C7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67C710E65F;
	Sat,  7 Dec 2024 23:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JJxE0Bh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-16.smtpout.orange.fr [193.252.22.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5754A10E1AC;
 Sat,  7 Dec 2024 09:22:12 +0000 (UTC)
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by smtp.orange.fr with ESMTPSA
 id Jr0rtoBX1FYs8Jr0stWfeK; Sat, 07 Dec 2024 10:22:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733563330;
 bh=5FIX3GE2Cphszv8rtvt9crE9ghdCcm+668GDkaRhBU4=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=JJxE0Bh3YuY/GeL7dxWU68dBkMqzpZZryV60aF3NeHxMEBOVwiqyme5h35r4WpXRG
 IDPFPEKKGqfaYjsl1gEA6SICBCnokqmytgqaN0VxNhqnUevQ2kdiEvVgRCqJu9xC81
 tZXhlDRt4gU9YMgpK+cnXOa6PAbiOeVRPkehlvg4cRzw9Eh6Th1KMqLyTvj4Wt8nzv
 yvffqw/Tqmm3CR1b9eBHXWHE1UXYiTmU5cJ3HC7xfklmmg2mLRwSz62yYANlPz47n6
 DVKwB5rlEkJsSA2fYcC97TRQqqmKrH+gPs7y8oyBwq6rhhU883nxRrc4Kj1GWnww1f
 jfywcH+Z/Vqqw==
X-ME-Helo: mail-ej1-f53.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 10:22:10 +0100
X-ME-IP: 209.85.218.53
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa650ccbe0eso51474566b.2; 
 Sat, 07 Dec 2024 01:22:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmMan0IOt3HXwrj8gz/OCGITiDAMzPRPKQ1ryPAqLnfPb1OuTxAktNTBkM7wB3og3VABIBh5Z5Rt+j@lists.freedesktop.org,
 AJvYcCX5bWxwDPwlVBQDQfHchF62e+5Dn4bIbgjaOi2D8jb7s6A5H18iSJvGoa8W5xv1TILNxER0Oy9mHwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEyIbXLb1Qo8hQuLXpbGSLr9kyHPpIZVN98TBpZjtd1f1HyUxG
 olk5qLEmKxSdASvDyJ2x7phUgecX8L67IYkVumZ2ekI/6Z3a/cSbQ43WCB6HgcI10BZ3emJC77j
 RvvAMDLDm4QFJN3HbpfJJ+Xkp21o=
X-Google-Smtp-Source: AGHT+IHtHlVyoW+nRFmP2KVhABtFl5ikoWMC68HCGMKZEPnxOyfyDUMalss4BKk3XOGNHnTjXwFKxuaBrlfCMkC7FxE=
X-Received: by 2002:a17:906:9895:b0:a9a:238a:381d with SMTP id
 a640c23a62f3a-aa63a2c64eamr136036766b.52.1733469982863; Thu, 05 Dec 2024
 23:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
In-Reply-To: <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 16:26:11 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
Message-ID: <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: uecker@tugraz.at
Cc: David Laight <David.Laight@aculab.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Martin Uecker <muecker@gwdg.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 07 Dec 2024 23:46:21 +0000
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

On Fri. 6 Dec. 2024 at 15:40, Martin Uecker <muecker@gwdg.de> wrote:
> Am Freitag, dem 06.12.2024 um 02:25 +0000 schrieb David Laight:
> > From: Vincent Mailhol
> > > Sent: 05 December 2024 15:31
> > >
> > > -CC: Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> > > +CC: Martin Uecker <muecker@gwdg.de>
> > > (seems that Martin changed his address)
>
> My current one is this: uecker@tugraz.at

Ack

(...)

> > > > > + *
> > > > > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> > > >
> > > > IIRC Martin has agreed in the past that the accreditation can
> > > > be removed - especially since it refers to the 'sizeof (void)' trick.
> > >
> > > I tried to look for such message:
> > >
> > >   https://lore.kernel.org/all/?q=f%3A%22martin+uecker%22+__is_constexpr
> > >
> > > but couldn't find it. Do you have the link?
> > >
> > > @Martin, do you agree that I remove the accreditation?

So, do you agree to have the accreditation removed in compiler.h?
Personally, I do not mind. I am also OK to remove you from the
documentation and add you to the CREDITS file if you'd like to.


Yours sincerely,
Vincent Mailhol
