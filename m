Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42FAF7DBD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 18:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C2A10E008;
	Thu,  3 Jul 2025 16:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wf1qBKFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1D510E008;
 Thu,  3 Jul 2025 16:26:23 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-234d3103237so226235ad.0; 
 Thu, 03 Jul 2025 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751559983; x=1752164783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSyt4WnF+qHRwEMJ5395X7EAvgdTWUY/zMhaiamm5RI=;
 b=Wf1qBKFS5JGCR+vWv+2z5wFcvtDDt7jjGS1GtDrLlo+eCG1sKqzelcdQ7aEs//KwC9
 iRlB7hoTMphP9I41dMgk6AzZ3o6D2MB3hcPARo+OuUCrbRgizEIGORoUFoCDLtOUqVsN
 T9yNy9gWdk3AxROYLjZGJ6vxGUvUEmnAhdNCQgpr3H+WmDmA7IRBxP/MpBcszu8WWiSv
 vmjdfLhLt2SwmOLlEn/e04cDm2YP9WTAg9VAIkcBlnkRl+fHCi+NOWwEz9yzc3zttvxq
 WC6N6uFAR+pk0kw5h6tNwEf7/ObKoh3RT7qvcjFbQafGZO8G+bJZBcYdzLMgjtjfjVH5
 DcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751559983; x=1752164783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rSyt4WnF+qHRwEMJ5395X7EAvgdTWUY/zMhaiamm5RI=;
 b=ouQnAeHve6asGmhpbPU47SSr847h8/KPiJdkuAwHRYna61Jb/jR3Odep0Vw24+FjFe
 XsVPLec25a+7BpWNnuOhZglAiAYrako/FNuHF2iKRB/IhHf2GzOppB4aLM4YMRf3T+Y8
 B/N7kCqukO/CdL8VybF3UoxoVMbrEL9jJkNJXAPDBDFEtWf1ySdnjuKL0/j9rbBES5yJ
 g3OkT+UFhD2zlTKvjvz5nIDdrrHhuXzHWmLUldIS3bxHR7x9bqsei2I/2/dpsjDRkRrS
 RTgbP7xj+ci/EVjaXBT7jJRz/4rNxamJkRadNFLXpBSWa43rvlWMsvYUawaZgf8Hr9DN
 EtAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrOHrt/80V7l1yRqAO22/gt0rdlbRnBgvVclf9QMyTSXcVcagailrcFru57ZGniajL0BSnTbYo0sQ=@lists.freedesktop.org,
 AJvYcCX24BkMm++HNMDX1gq6u9Jf+djndfmvfh+GnBwqXneM+r9QEVGd0z+OHVbt9AaEseDDqb9pTuXR3Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhppiZZIWtnQbSZXBKBHp+sTal2RT49GdA5UPf1ph3LcU25itu
 reepd+iFbl75EmtElX6R8PLsddmh1Ei3NA1C41dIP/qGWj23okS+c8DXSzdIuoRtlXH7nKZFPF2
 SAUq38u1/jPUlvCyZEQ+OfUQJGBD3+XY=
X-Gm-Gg: ASbGncuQ95XCFx2jeA6aztgX1iUPyiaVuJoTKQufIylTxP7RhdPqmz+QagbM3YUsFmC
 3YyzySzOqSAmTAx6OGlHHpzvNQ/HTdDuqO3lNdBv0nHxv7qZOmic7B+guE/3P1BUumqMBT6G25n
 +z4xlQ+Wpwrwg3Ag0Y0y5WOwGo4OpuGlqimCP+OPEIlF2IJhjW2UQ74w==
X-Google-Smtp-Source: AGHT+IE2AsrunGhRqAPTssN0vu1pH9T/puSPtq1EYmN/wZ3G149WG6FCC+weBXEH09090+WjrZpEYCR5WVBab3y8bBw=
X-Received: by 2002:a17:902:d50c:b0:234:cb4a:bc1c with SMTP id
 d9443c01a7336-23c7b2c48abmr14508535ad.6.1751559983011; Thu, 03 Jul 2025
 09:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Jul 2025 18:26:09 +0200
X-Gm-Features: Ac12FXyK3yF1o66pvRj95wQBg--_tN8783HmS0ZULfxKl6rLdQ-EP0UVIzak-4s
Message-ID: <CANiq72=61JhEf97JTkineo+FX+JG+Q9x9x86MC_hukSa9YSX3g@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Tamir Duberstein <tamird@gmail.com>
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

On Thu, Jul 3, 2025 at 3:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Can you help me understand why? The changes you ask to be separated
> would all be in different files, so why would separate commits make it
> easier to review?

By the way, if we are talking about splitting, it is easier to land
patches that can go independently into different subsystems and
avoiding flag day changes (or making those as small as possible), i.e.
ideally being able to land big changes across more than one kernel
cycle.

Cheers,
Miguel
