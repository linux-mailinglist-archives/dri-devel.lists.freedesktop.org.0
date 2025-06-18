Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923DADF527
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8045A10E24E;
	Wed, 18 Jun 2025 17:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wg8sO82e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A04D10E24E;
 Wed, 18 Jun 2025 17:57:49 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-234c26f8a25so8007405ad.1; 
 Wed, 18 Jun 2025 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750269469; x=1750874269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6XFf8IdJRgq64/sNAX2ri3Q7ZGbdF1/uOpdG54+E2M=;
 b=Wg8sO82eadnUM+ZlM/kE6u9/dITt3dgifarSlbcY6xPh3aRdP7nej5C7AkfclDELyl
 0P3PhGOkrW2wsuVWBzxD/TsuvI2FTgG3pnHCy3av4BZ5DFo/pufz/AkuhMaWp7BsSHdm
 dcjAMR9kY7rA5S3+e8Bi+GD0VLo2q+wUm6Px7zrEYFeoZ6cuWTsMCS8cKF2TxrzrYUpV
 JcWZgIEszNTNxS4i+zY/UhqaMVu95J43foitu7mVEtZkhnXBE67AOnPwHbgoZEDPemKU
 5jMVE09ES5WgbXGzde7kjFLZPXdK43E98BBWKPOLtEhkye+o1Rzbm+/15f8+F1HVhEyd
 KKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750269469; x=1750874269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6XFf8IdJRgq64/sNAX2ri3Q7ZGbdF1/uOpdG54+E2M=;
 b=Ex4RfclJjNHqjD5+3N73kBqZ3g9Z6yF3lkOxX6PcNuYBFJ41XNcl6XktauPQvMlx1f
 LSl83Y7JjF+2pXSC0ObU5UYloGcq+R9aJ2vzTkiX+pI8j83tsoy/NssEIqIR0+bSpjSD
 URY3cMH4PV25h0nyKKG00CuSK+EYzNCnn1ZpnTbTDJBBAOsuHue14vQH8CMWSbSwmv49
 qm2/IWfplHMeiMUnqCP21Sc2OGEV8kg81UeuZbHBqeD23Q9qLTGPWo/KHVbld+wy7wyR
 qZwiroSfu3+x6OfJ4KJY3K5dpSdZ7DUgMq6NCZloBKqak9Oqt+bSUAGYJFmjfH/LCcw8
 QuaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFNjlPN2v+4zivpXgTiW+c77QO9MW2hOj4xaNdhb8eioF8GqbK5JiE/aI0SwvU89pqpWZQ08/VIbY=@lists.freedesktop.org,
 AJvYcCXQl0oZq5YqRDDsBlP00vS/1vlxrgm9Ru5sqfGd5Js1sCVjF8mnZP0rokVqdGmM5NW4OSMrLLQDWw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXkkHoLbhGrQwYqkhLXrXmV3g0btEp/ejMzw86zLMsSDr6/gdq
 Uvl0/ELItJXVJgY7EBEnZ5lyfmAhrV8S7NdiC6ZmuoMIn+nOQpaniLtfN2Es1cDUgLF+swhlTJE
 OSaMXd0Bpe0olvIAP00BWbIG0tJBrrx4=
X-Gm-Gg: ASbGnct7V/cdyYtaqRFQLoPhwBkvFJsVyVrtHYiiWbtU+8b3VfiQiE9o3raqqCmLpHg
 EhDUXiWzflJ1PJRpCJbKwzblAeRQKtl30H4iYxO8Mp68wZ6Pq0sRV6eOG4c/DNWBIzDdkpN4Wx6
 y66Qv7y5kdG5LnOCW20LcAZFQh3U83kcPY4IncaqWLJEE=
X-Google-Smtp-Source: AGHT+IEVtT/3f0vGFFzsBMs3GOlT0P6QvR0Bn0p1lko9fCNW+9HJclQmxYU6vH8Ok8iI/KHslbJ7BSrFR23F0qaUQxU=
X-Received: by 2002:a17:90b:5251:b0:312:e9d:4001 with SMTP id
 98e67ed59e1d1-3158c10362dmr113240a91.8.1750269468961; Wed, 18 Jun 2025
 10:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
 <CAJ-ks9=6RSaLmNmDBv-TzJfGF8WzEi9Vd-s=1wyqBcF7_f7qQQ@mail.gmail.com>
 <CANiq72kgnKH2SSp76EdPeysExBWasqhTyf1JyReR65g6FMsidA@mail.gmail.com>
 <ccbc2a76-20fe-4f70-b69b-9d05b59f24b8@kernel.org>
In-Reply-To: <ccbc2a76-20fe-4f70-b69b-9d05b59f24b8@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:57:35 +0200
X-Gm-Features: Ac12FXxqyN47ZI8vqKVbteA5mz5j0mgRRC1KtP63MHI54ZnGo4ZP4CLfw3Of01s
Message-ID: <CANiq72mboC5iz0Z0ZnAAMNr70aQT1vddZ=cXFSO-5_CveVTCng@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>,
 David Gow <davidgow@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tejun Heo <tj@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Wed, Jun 18, 2025 at 7:44=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Independent from that, won't this potentially leave us with a lot of warn=
ings
> from code that goes through other trees in the upcoming merge window? How=
 do we
> deal with that?

Yeah, good question.

Since they are Clippy ones, it should not be a big deal (e.g. we
already had a case of a lint Clippy lingering for a long time due to
timing of merge window etc. in the QR code).

In this case, I didn't see new ones in -next yet when I looked, so it
should be mostly fine I think. It is also why I asked Tamir to re-send
it at the beginning of the cycle, and then a v12 to include a few
newer parts that were missed that landed lately.

So, worst case, they get fixed during the -rcs.

But, yeah, a while ago I proposed to have -rc1 to -rc2 as "treewide
cleanups time" -- it would make this sort of things (that is not fully
automated, but close) easy.

Cheers,
Miguel
