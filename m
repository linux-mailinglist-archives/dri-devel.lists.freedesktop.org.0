Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43937AF006B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600AE10E5DC;
	Tue,  1 Jul 2025 16:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XTG1XFqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C87510E5DC;
 Tue,  1 Jul 2025 16:47:16 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32b7123edb9so36217621fa.2; 
 Tue, 01 Jul 2025 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751388434; x=1751993234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ymyz98G6WAIWhgot7OyS3l+nPaHFTvJsU8EnPPnV3hw=;
 b=XTG1XFqnyoucrDnUgMk4lVoxTdY0Xd56kMMwCE8WHS4yn/hPz4mtNoYlwUQrz2QwPy
 Bqs+PCBUvsmaV2oFGDg6gNc3Hzm/qmedwfsgLdOc3CBrRrT2jzXhHfa0peZoZpFxkRFH
 mUrbZsD5VRH0ZqeR6f8V8nTQQAuIECA363k9BrJeS/JJNGmdt3bK8ftP6hY4HZsqyEbp
 8kIMIFb6NFwecrACmSJV1+qvLxYKtv6w8TBPshg8X/cWe2hs/GVpNIP/0QT9pgKEDa0K
 +cDPKEw2rp7jcjYrYNex9wh90B5GTokfnKgNWlP+vowYgjurQ8iCvidOHQAbYM2V22Ue
 ML9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751388434; x=1751993234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ymyz98G6WAIWhgot7OyS3l+nPaHFTvJsU8EnPPnV3hw=;
 b=OfHfq+MWectev3dgElpIoP5UGFUpUnM1U72HCz9D1eAfm45AhQ6f3jNk8+zG/5EO/s
 6ixNDHolaJ5PGbxYiOUr3ZY6wjQHnhkyJqUvCHaXA3CL5QiyWi+Ej71qNXASpVXkhRdO
 oDTHhri7yJr4XYYYRh91rzccLDMXwi4ci4J9ifsloOvLVlUeew2CmvOU4u6N+t8ZOQzF
 KqPUUgOU7aPICzA0y5Br0Eq2uZfAelGU8zTukAY0u8hj/kn6SaU9uI+dBlJ9F2zNpZOV
 vLeqN7l5zNjV1XKZp9CwYlbVM1+zU9PYzMg+XtWwctWdd4ai9/dCOdazFxvkA9Pj+4El
 qmXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIA8LnUrxjJo7OqImLXLk/iaCqi+oYTgkl1njp85naIsy/NlBtD1eMDoWF0FQPIHlETO6qmEMJlDg=@lists.freedesktop.org,
 AJvYcCWmucrk/HcpSU7pnndwuH7yzmPnMuhIOyKgVAE4M8YgCdsKbyKOnhQrhha70HzWHRVbNAw+z3Nx0Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWt8cgsQ7W87hI9y/YnipVRkPGeVBbVoGLLj8IaAzHpABcmBfq
 jtzTfLvTipwaTWcAS1vkxDxXl1Mc3ByCSZQemgtBiEaHDOgcaTVlUc+6iXhVqTRax2lUXgcsxRy
 vJTtbgTwu6MZFL/mT/XVngHraqiblPqE=
X-Gm-Gg: ASbGncsgkDKTfdsGOC0DP3wLOs3UUPvJIKXxQ0Z9eMdr7zzjEhYX9JieuirEMF3CTWd
 pqqzv+Zlygjka45XJaGjKPRZPY06j67Of0+uA6ojDsbY9wh3BpH3zonGd3x0oNTwGWWf0p+XoBU
 AIooyEkJgHK9JqAO1rAV5ZOr4G8G0KeLAJYYRcZJuqLlsvgYJFa3IJOpjSxSJ8yjYntWR7ut0fP
 8clJg==
X-Google-Smtp-Source: AGHT+IFASHXyh6nKAuBWNflJbwzC1dxAvHKvYXKVWM4leUPhMKpN6FRK5U0/hoCDkOtFemkDVZIaXGSG2DOrBLCq8Rk=
X-Received: by 2002:a2e:7c08:0:b0:32c:a907:491f with SMTP id
 38308e7fff4ca-32cdc464463mr36198291fa.15.1751388434129; Tue, 01 Jul 2025
 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
 <aGO7-SQUUgg6kSVU@google.com>
In-Reply-To: <aGO7-SQUUgg6kSVU@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 1 Jul 2025 12:46:37 -0400
X-Gm-Features: Ac12FXw8AGP83JXgR8yzKwPiapZfBBkrNyDazktnve1kCOVkl79eviuMomA9o84
Message-ID: <CAJ-ks9kbsTRrRN4yP7GmphozPyZHgbaAGJmLXR42NVgJ1ie_SQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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
 Benno Lossin <lossin@kernel.org>, 
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

On Tue, Jul 1, 2025 at 6:44=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Thu, Jun 19, 2025 at 11:06:24AM -0400, Tamir Duberstein wrote:
> > This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> > have omitted Co-authored tags, as the end result is quite different.
> >
> > Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vad=
orovsky@protonmail.com/t/#u [0]
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Overall LGTM. Only question is whether we should re-export
> core::ffi::CStr from kernel::ffi. Reason being that right now we are
> telling people to never use core::ffi as the integer types are wrong,
> and I think it would be nice if we can continue to tell people "never
> use core::ffi".

I agree that'd be nice. There are existing references to items in
`core::ffi` scattered around (e.g. in rust/kernel/drm/file.rs); it
would be good to clean all those up together with CStr provided we
have some ability to lint against new occurrences.

I'll leave this as-is for now since this series has already churned
quite a lot, and the cleanup can be a reasonable first task for
someone.

>
> Either way, for the whole series:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks! I'll send the rebase on rc3 momentarily.
Tamir
