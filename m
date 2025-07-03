Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F933AF80D7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA1110E077;
	Thu,  3 Jul 2025 18:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jNXitEQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA8910E077;
 Thu,  3 Jul 2025 18:57:53 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-553b3316160so278861e87.2; 
 Thu, 03 Jul 2025 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751569072; x=1752173872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiAe0ywj3ALVyYeVpMIymC5Jme4Ulve8NgwE7MU7/y0=;
 b=jNXitEQSMsoGVoG2QoXBbtCsE9ISJFQ40OmJ3baZCUiMxY4sXvxnsBYMxmIKj8uTZB
 WyfQ3NL5yG2M6bQuCVKQOTdyX0ng0d0EzxhNxnAtKxR0YkTH1v/8DtYKGkXOtjlu8DzV
 u82GHJNNMzhkzIa5dqipVDfWKx62HmjItCoX8cXj66JcQLz7a60L1X5xgmjBv1e38sbV
 OT/zaXEA2Ngsy2mmtC4eZQFPmeibXq86kpwCT13S3ga0nIfSuCi7WicHAWeL8dzC3q1e
 SCSOUHk2B2JC2dMfErnzOS4fD841Y1FF9KU8oIC3A2sjESLpU0tm+oFUwpJ0X3DnVQZw
 dhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751569072; x=1752173872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiAe0ywj3ALVyYeVpMIymC5Jme4Ulve8NgwE7MU7/y0=;
 b=vr08jqe2m4pAFAw+GB8sQt3sgihCjT4Ny+urwRgDr0Gg0DRoKp34L7c/tk8cGkiq3L
 CRKKPKSqv5ojN/GfenKQCPHc3I/42zYaFhh8WX5H8SbHdi6fCl8I63Dg30eK/eIWJ5M4
 1jXIQM0qWoAKQaWp6xyAKTEpmMxqsZ/7gJivBzr8Y3MSM4UPC74OW+lJRgEKG55Rtjvh
 0WIFChyVc/z1IKFyQEK2zMw/K9Po/zJhWDz8WYcQGAQ2Vfx8jYrJYFH2xiYCHFnkrZKS
 ZmWLeKrHQYJhZqcSsIxvV9MJRxp0DZlOUg3fq/X7n4QDUm7CDlJpM7/Uxxt+u50V9BrA
 i06g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzYzqcMz0uHv+8g9O0nlPtD5/KkRBTNKFJXuMAHFmCAU/TyentKMkoHuJS7sc9cjFjTHKriVgz5mI=@lists.freedesktop.org,
 AJvYcCWyeAQlfY5W+d89J52Dm1RUvqf5g/jZA7vw/DsDk1gAu5a95tlx+tW/CdsYIToXXao3tmlEFfhgww==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcE4lFCcgFMBZoAZA896lF+H99pnvVHUXIL7RrSyxDI4aaCwh3
 jRUJJootrhqiV3i7DDeVNHkbI+V1PihbAHuTBh4hSaUnO0kATWW+R5fL9OfT1jIPNsE1BlUQYia
 C1IuRKW+9RCYtrbyMAZqpCIs3qZsh26E=
X-Gm-Gg: ASbGncv7khJ40xZoSPfNLrsOsmNr08NH80gO0cSfXwdHQNOHPqNacr98vW1Jz7V3gtI
 g9rx3H4xFV+//+VN7bnSE4gqNWc65g8gXBeIHhRHXUyNeGdgKBTOf9kZtESgh6uKt82F4MhLYaV
 jzrNmtDO+0id71y0e/YJfOIq2RLC68fE3bH4QI4R+MPLPl/g==
X-Google-Smtp-Source: AGHT+IG03u1s/dKr5lqrvPNQ09T92o4JjB8rN5Nj67CbTA0x433vtUSLN5UqSf5eZDmLPvVjVfuvUqvcmHi9wOrWOOw=
X-Received: by 2002:a05:6512:31c6:b0:550:d4f3:8491 with SMTP id
 2adb3069b0e04-556283804d8mr3415342e87.41.1751569071362; Thu, 03 Jul 2025
 11:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <CANiq72=61JhEf97JTkineo+FX+JG+Q9x9x86MC_hukSa9YSX3g@mail.gmail.com>
In-Reply-To: <CANiq72=61JhEf97JTkineo+FX+JG+Q9x9x86MC_hukSa9YSX3g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 14:57:15 -0400
X-Gm-Features: Ac12FXyZZloauRegGbOIuXfH_Sgil7e4CwfUR1COZp9IX8xKJZCjuiY3W9nvJEk
Message-ID: <CAJ-ks9mvLEPLMJS6E_UPc4bkRN1q09zYC_oL_pZ=E_Ff161USA@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
 Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

On Thu, Jul 3, 2025 at 12:26=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jul 3, 2025 at 3:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Can you help me understand why? The changes you ask to be separated
> > would all be in different files, so why would separate commits make it
> > easier to review?
>
> By the way, if we are talking about splitting, it is easier to land
> patches that can go independently into different subsystems and
> avoiding flag day changes (or making those as small as possible), i.e.
> ideally being able to land big changes across more than one kernel
> cycle.

Understood, though in this case I don't see how it's workable. The
formatting macros can either wrap in fmt::Adapter (and thus require
kernel::fmt::Display) or not (and thus require core::fmt::Display),
but I don't see how they can work in a mixed world. We can't have half
the subsystems implement core::fmt::Display and the other half
implement kernel::fmt::Display.
