Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D156B26028
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CCB10E223;
	Thu, 14 Aug 2025 09:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rl3mgwzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5A210E223;
 Thu, 14 Aug 2025 09:07:35 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-24458276e4cso911375ad.3; 
 Thu, 14 Aug 2025 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755162455; x=1755767255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L58BGBn53CdEaQI/pHX66dG5GkpXtAAIQcYXknidNg4=;
 b=Rl3mgwzyvNCvsFTVlflzaMUGot0E542BdkTWnGf8ytA8BGkGFiQ6WCrceIOY55l+iX
 S/a/M2e/QXxfstWL0U3Yze7lmS+f8iukMoUlhEK4BKNNWt9qK8Nv8DW5qcTNXXv9EGci
 QaiPt3To9gNmvhYke2dEuzotFdRL4c1FzIfEA6SHn5v2XwooiFStJLTxPgvvx/tMEJji
 J7enIkGcm0bHIOhicQatjTdPYTTRxcOVQ8oFySLV/aYOjj/f8o1RtiYJtWuwTlM+e8Fb
 uWwdPZOT2rJYoM78Vs+oOvblTnIo0Yr2EV4HPvbl6DsQHL07LOeMv3nFjy0Bblsm/DKq
 9hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755162455; x=1755767255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L58BGBn53CdEaQI/pHX66dG5GkpXtAAIQcYXknidNg4=;
 b=wa2f+tLNLwVT/gWpQ7jhAUhf9/dwTU+whnoMxxe84Kph3/SiJVF7w0tnGAZ6/VT1nl
 UfoTgyI2oPX5eBkRGvBcBwD+6j7Uw29mAzPD3ugty5wonzna/uzbkP7Pc2jKRFGxp8pK
 2A0m8Ar6uwSXeCa+hEer68DqB7rJzO1FjBqhUvx6AxNnfNA+AqrnBLoRpQCavuFzFU1u
 HRnhzLtlmG+kvf9bmzQFU6Mfe9qS/Hn/Er2jXGrXgFTaja6YoRhD1I2wSvXOxYiq9keD
 3k+7d3zuPvKACdDi8sMg6qes8U6SGAlM8LEnoNI47WxfljXYIYfADlFUyxFIUIycb5WO
 AyXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTJN9HtdS/NYqa9PR2NUIh+aJ7mC+hSzyeHfUJ913MlXIm1r6ZGKc5R2fGXL9N3gwj4Z6cDHsJXSg=@lists.freedesktop.org,
 AJvYcCWuZYhm98MLocv8ZCaiPY8S2XlKlEqcI5I/rzq+trsPfcZRf5wNlb6Vys09IM5FYTm48VXw2/wt+Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2gb7Xy3iO6h9kqusqI0yQO1ert3X9MJjCyGM2JXvgNlBw0a0Y
 cu0n4lsJ+eYRvvDW4UIM9Arfe6ktp/aoF2rNTQSN5c0YduQpraGvHaW/s4sJW4dfJzGaSR3c1lD
 PqGJxVNATD434aV4grsXBEJ951ylJ0P4=
X-Gm-Gg: ASbGncutOYj1bb8+pOO/TH8/HdDEWmvENGxrvwZBFbtN/uQDvhuVh5y2ObV4tclfNb5
 05/DG3sxDFLRCrvpR0nG55ykKvrigr+LcIUm60KADQ5A8pvKXdtjyceoURGz5qAJeWTDUxbWep/
 4iqrs6fJYalRkLfR+32Hs4/M/uLRpcMHWdWNFzGtl4lm467nX13NEbcdTIS8LQUjf9QFTsv+BxE
 PIH
X-Google-Smtp-Source: AGHT+IGz6bvQQDm0FDjw3b6Z4zK6LWUctdhJrkeBml6MEiQLxKVKVm/2E3KeNDssnbiZd1rTjK+/reiEgrFQf4jGtow=
X-Received: by 2002:a17:902:ec8d:b0:240:5c13:979a with SMTP id
 d9443c01a7336-2430d22a83dmr44771485ad.9.1755162454741; Thu, 14 Aug 2025
 02:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
 <34d384af-6123-4602-bde0-85ca3d14fe09@sirena.org.uk>
 <aJ2dST9C8QLUcftA@google.com>
In-Reply-To: <aJ2dST9C8QLUcftA@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Aug 2025 11:07:23 +0200
X-Gm-Features: Ac12FXw9McZU8Dlo3fmof7Lor15J3uB_TM7gEYyMiiYtjURPvTaxggH_LYJAg0o
Message-ID: <CANiq72nnXG8mzGD5ydu1pMpaBAHTWvfQWSo0w38xefu=1JSURA@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] rust: replace `kernel::c_str!` with C-Strings
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Brown <broonie@debian.org>, Tamir Duberstein <tamird@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
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

On Thu, Aug 14, 2025 at 10:24=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Tamir mentioned to me that he ran into a daily limit on the number of
> emails he could send.

He is posting the updates around the migration in Zulip:

    https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/top=
ic/CStr.20migration/near/527957336

Cheers,
Miguel
