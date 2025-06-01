Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BF1ACA04F
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 21:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8C210E09C;
	Sun,  1 Jun 2025 19:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NyUMWl2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CD310E09C;
 Sun,  1 Jun 2025 19:43:09 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54998f865b8so3542984e87.3; 
 Sun, 01 Jun 2025 12:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748806988; x=1749411788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlttJep6rq3I8+o8EQ7DmNCSKFq6mJq8IUZsLPjanpw=;
 b=NyUMWl2RIB/ozSc9O5j54P6lw075LTTvqTEzFUkLHX/YZM8CBuwS1EqKfCm9pgLNL5
 8YppaGmjiikJhs864l0TJFnrn00/wL2aVncJ4dc74DdD6UN5m1ck/CtuO9v1JUITBatf
 jp4P0tL5LFx2PkavNkHgsnIBK6FcDTQyS/oGWSVZEclhuJOxG2KaxVmvAV9zjCZq3grv
 Wp/YZryjkXSaGE604vsxaJeCDaQoXS27hNYHBCmDwNw/HG+oTHI+vyvivv0ssbII6oa2
 DdwhyqgLMvDWU7lTj6EFmuaMfJtO4Fbrd0yaRc2DCOX8ghXT8ZqKUa3V8sZs8sim0DBD
 RDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748806988; x=1749411788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlttJep6rq3I8+o8EQ7DmNCSKFq6mJq8IUZsLPjanpw=;
 b=sF6rsfk3vuinWfHo4hRfODOk7Lz9UGbdTFRuuGu6dMY8z+ruExA3DVc3Z9yLn7nkXR
 GB6Ti6nAWmu90/TQJ5LpyMnWar/hNE6eUPxfuHSd0OD2Q6ASH76pTmP22ptjIe+QevzD
 biusfSOVCiVoYEFc9iQ5bREE0wKpTUveT4bS96moxjTxK1V8LZOU5J0LeEObrP+vKuH1
 QbDRSkxHQd2x7RWCTdpLrrsPl0R4n9TueWD/lENLg74gX1Vd3vF2VIpwGPeCjxoA0OGJ
 wFKbXZfJOsUDqfVnWEpEVE0pMvMHg97FLyDbCuagiTDsJ9I7vWickAEEFY+eNIU7HxUF
 /irA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3URIb9dFlFg65osgh7j9lpR2iSANX/AAqEUsWwlIh/jilMy0uLBvwKojZBQ7JO7XJU3ChHd4gLg==@lists.freedesktop.org,
 AJvYcCWjeR054Ap3QbvuJkJVMMXHdalO8jpBmvJNeALf5Q2ILfuXUHNkH0L5/e5ub4mk2IPTCDH3F9deUH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD0YD7/m8NLRhJyp1nRF8oF9pGB1k6wMRHuSkQqK/488ViVCIp
 xDNVm681Z/3zxmORoUZxcmaYNDg1qGKdjSrCWdK8lmiFCdc0wxcxoHPKuHjaMMxJW0ayoAxrpQ3
 pRBGQ4kc8iE8usVNp73tC4ipqpEUpRho=
X-Gm-Gg: ASbGncsUVMIda+SQufikF43Rhw8mpSm+G55f+ww5mxpipJX28xfjqYP1/iNipGnOrCM
 xwLFkNKG6hygpiKFoOyOhGShtCMRcmJg2SDgeSDHim0cRFcfUdHpTBp1WgQ5+4sw69UzFee6l3A
 JXN3pKbAmH+Q4iAXy+0SJqHOIy7aI3hZXfs5dg755G2uN3mlKqD+tqaXDiyCuthaIAipE=
X-Google-Smtp-Source: AGHT+IHtRgXkoammUnbUpN1dYXGck9bKGEUGn5GT5cV3fPbuB+pGOqAmc7vwPC05DiWkj0JlBHypesZfOXv6vLdnG6Q=
X-Received: by 2002:a05:6512:3d28:b0:553:2c58:f967 with SMTP id
 2adb3069b0e04-5533b93b8f9mr3282822e87.56.1748806987505; Sun, 01 Jun 2025
 12:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
 <20250530-cstr-core-v11-1-cd9c0cbcb902@gmail.com>
 <DABC3ZAQ01GG.1VT5NL7PIMTEO@kernel.org>
In-Reply-To: <DABC3ZAQ01GG.1VT5NL7PIMTEO@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 1 Jun 2025 15:42:30 -0400
X-Gm-Features: AX0GCFsKjS9hgEwmEsRuHll_MOXzoBWv1p_-8FxpcxZc3tsgxztATvJimliHSmg
Message-ID: <CAJ-ks9=awTggTjr-_dkaWLQRkQVwkBQKiJzdP9dA7_=zFKRY+g@mail.gmail.com>
Subject: Re: [PATCH v11 1/5] rust: macros: reduce collections in `quote!` macro
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 1, 2025 at 12:24=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Fri May 30, 2025 at 2:27 PM CEST, Tamir Duberstein wrote:
> > Remove a handful of unncessary intermediate vectors and token streams;
> > mainly the top-level stream can be directly extended with the notable
> > exception of groups.
>
> What's the motivation for this?

I was squinting at the macro to understand how it worked and spotted
these oddities.

> I wouldn't spend much effort on this file, as it'll go away when we add t=
he `quote` crate.

Eh, this seems to be in the "I'll believe it when I see it" category.
