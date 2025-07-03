Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02231AF82B6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8648710E8F8;
	Thu,  3 Jul 2025 21:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LPOC1hA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74F310E8F8;
 Thu,  3 Jul 2025 21:38:40 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2352b04c7c1so622045ad.3; 
 Thu, 03 Jul 2025 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751578720; x=1752183520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHNodlGoraqosvL2in94YD46DI6OCuusa8x3ST+BCu8=;
 b=LPOC1hA2MiOizLOeiR7A3XibECWw3jmCvhAiH/pJCkwzTDAJpuHMndGhO2N1L+ubCR
 iEQ3RQQVHYICLsQdLLH+nTRqlsCi+5g9rlbr+NFmMc2ue4fmN7KgWmr+5Ov4goLbX2+e
 T/UhtOxz5xKZRk+V5M8yR2LUk1on4SZvx9bSU05WTiNMT+xefXOYkUYTzKchTgCurkcI
 BFDu1+RJNttVzfG+3uhqzMjlGYpJTvZSyTFaVdCIGeLHKuLoa0aMT6h0u2xAujeRZY4e
 txWxvVncCcSF+3YeYxx7LGILPE8eTWyBOChIFs+1/IK4eLogMSMakXYasHPC01Yanpju
 biKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751578720; x=1752183520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHNodlGoraqosvL2in94YD46DI6OCuusa8x3ST+BCu8=;
 b=XDhFAw+1jTEhz/93p6+MCKjEBbJnqphFRyrVMzvGf7RUWDT3YHzJ/T7B7ZGnLCjmMr
 7gZ1gkf9uGe9J5/0+fTl1w03kW3/F9OTqNfgO3Nt1OGSjqeMf2idE/K4wtm7cSBWexOd
 /IdwCshoKGpjialEuvE+eFLsXgO8UyuRRlZY+ccZcH/Mff4UC03XFx1BTKI8ecKpf7sl
 24zw0VTAN1LuKdh4qQ9VnuNgboDhqiGm/10VsZJkDxoC4d7hbQ5zN8JHfJ+e3Qb6krdw
 q0X835g7eI273CvOopx9dY2jid0fPJ24QpOrvO+ngo7LiXGpc0M78h1n4RgEhw9s1giX
 qldQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJWcu2mYaVkBy7/LF2OzpoFUxBz6UjNZSzDNdYB12tKx5I61m4zCvyzTRU2g0kVJ5WjRpOhyPNRg==@lists.freedesktop.org,
 AJvYcCV4NkajbVb0zweDARWHNLTs2vm3zk1jsprwt7yjNJkbTP2eDhiWPNBsPlNodl94Nb1HIdYkaG5Lt18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVIHlk1FsG9IToJn5O1FTI4/KascR5U+7JLH2cTA1dicF1NHcA
 XbHnAz9GajjQ6bYVo1T/ewgAUN8EdF1wHv7kuQNR7jeTc129oUIpgTbfaej/HwXelbLrZpTPlgb
 lCa4RdNSAUoBBG3tQoFfC3f62DurdXrc=
X-Gm-Gg: ASbGnctVks0Sof//tt7PAZUpYsBfrElrXFP3zQ/yIUVRyWKBkacQ0gbaI758IZam1sb
 EIAE8e5HeThR7/aOdhM/W0jr49vjNqeNe3pjMRgXAONsF3irHHXdK4dE1nVa7MZzdDFi7gtv5Be
 7HaVrP1VNkqxXis+Am70mogP9YNAkRW18ykUF7y0UYEVo=
X-Google-Smtp-Source: AGHT+IELtB5XgtVh1TIl503YSOBpKDzFFV0lUuu4UGNcygnKkLkVRq6ABgmlhe/GC2s+Ns1XtRhxYcb0/TcFag3V8H0=
X-Received: by 2002:a17:902:c404:b0:234:f4a3:f73e with SMTP id
 d9443c01a7336-23c85ec795bmr1697845ad.9.1751578720047; Thu, 03 Jul 2025
 14:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch>
In-Reply-To: <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Jul 2025 23:38:27 +0200
X-Gm-Features: Ac12FXwdXJJ0hQiiGaabkdHfelYANMQVK7rSTVhFAhKXDapeaUgG2_fvXL2LwP0
Message-ID: <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>, 
 Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
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

On Thu, Jul 3, 2025 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> A small patch tends to be more obviously correct than a big patch. The
> commit message is more focused and helpful because it refers to a
> small chunk of code. Because the commit message is more focused, it
> can answer questions reviewers might ask, before they ask them. If i

Yeah, also better for smaller reverts, as well as typically easier to
backport if needed, etc.

Cheers,
Miguel
