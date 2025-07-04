Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F161AF924D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B1410E081;
	Fri,  4 Jul 2025 12:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HvjbTIn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED0C10E081;
 Fri,  4 Jul 2025 12:15:41 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-31384c8ba66so182823a91.1; 
 Fri, 04 Jul 2025 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751631340; x=1752236140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTF27XEasyApS1nP/vyqUwBctBYmx+jAOL8SGdjCGlg=;
 b=HvjbTIn/podv9zGc0ayQJvvbAyP9qFrjkN6U3xY7ccog/MBTqxmVLcr2wRAUwvhQ5M
 4YuB00D37MfaUyVDa1Ac+TFMgRPz/Uj7cIBGRUYjF8MeN9SStRXjHjsmZEHUctorCKlj
 UyXxm5a49rn29RfCIMFHM9njhSWko2nVOatLj7I36IdXAGodnu+MpXs5uYm7MDSIrGvy
 KgVJhF4I7+mVbZOW4gmsyIZvs+SkN+v03oFaVAusYbtKhM5p6E1hvGokQTWLGaIrlogq
 rlkA67Z2rNoO6ErLwA9ryQwRQVWf/c1MtkvO7aUm9ciN7RGMV2Any7zJmTTVr1rdd1/o
 aH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751631340; x=1752236140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTF27XEasyApS1nP/vyqUwBctBYmx+jAOL8SGdjCGlg=;
 b=dNYUNI2Luq3trBhYRYGnDTsuhQpySpvooMe1d90hinqnM/suo77DjZUJv2aq7SQBYY
 OqfRHE2SbLGabHtPZ929myS1e86EgFkTMT11v1zp7bt5kATETwm/xojB6wlDUFkel5tR
 oP00BWaHzUwVskuGXWqcihE5mJZ4imzrnHhWycdQQ9F5Sri0mcbC4FVSTTSMARMnvenr
 VZ9+1rvR8qYJcWeLlo5P7HB+aRkAmcZaDlXxcsZbXS9AZOPvxWGcvhO+1lnRqr2igq0k
 De5Nujjxx2slWqgqfixHUwQFYDQ+am3KvSo9mxAmidm1wCcIo5mNxiBESUQogz4rmNHI
 SFAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXuaQXohZI0ItiBY0qxUMttLzS8bu9mt0Ua7h6l6n3x7tR188BSZozvtVo9d1pqAJe4iWsH102P2k=@lists.freedesktop.org,
 AJvYcCWZ52YZM5AiNeIqzxFumBdXYdCfdevvgbQmjfARLeMdjrmMtZileb4TUEKtnAjWx1EMvEmITKJU+A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvzFce8cWokQybLb+jMT32VN2CByktogG2HncpoegGO2NXkqjh
 HkFHwQsdEaNe64KkqWyTVUNS4vg7bZ881ew64pHAvn1LWVj9rLJaAmD+XmBkhJuyMfCoVX062i6
 n0+JIQ450yGbnQfUdizX6YyyaFs+0pN0=
X-Gm-Gg: ASbGncvJZi7BTJuUGwO5TW095uAUIlGdtBbvUtsZMK2XlFndX7o66kMx751N/9htxbU
 5M8aOIbQNyZZcGpgAsGCDpUtwCrPwk8OiVV10EWvEJw/tinZTlyNC+w84gNNdBmwbtLBjA1oalY
 VOJ9mO8T5AHOKZkz28vIOwRonM5FmQ/FqWchFpXi0REKY=
X-Google-Smtp-Source: AGHT+IGMzjCKsb3QoFjzETIEVKGlrEiZLPHE+Z9w68l6rNpjdGz0kB0KwvlouvJt/ly+yLKAz3cW4FDCb2lbzAAjjzI=
X-Received: by 2002:a17:90b:3fc3:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-31aac44a149mr1478613a91.1.1751631340480; Fri, 04 Jul 2025
 05:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org>
 <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
 <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com>
 <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org>
 <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Jul 2025 14:15:26 +0200
X-Gm-Features: Ac12FXzPtonKP26H72mazeNQheIxGcJYasTsJs3cNwtUf90Sdk9qUBYY8YzvhN4
Message-ID: <CANiq72nZhgpbWOD4Evy-qw2J=G=RY4Hsoq9_rj6HGWMQW=2kTw@mail.gmail.com>
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

On Fri, Jul 4, 2025 at 1:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> That would probably work. We will probably see regressions because we
> can't just replace `core::fmt` imports with `kernel::fmt`, so new code
> may appear that uses the former.

That is fine -- it happens all the time with this sort of approach.

Cheers,
Miguel
