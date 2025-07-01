Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D46AF0132
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 19:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474C410E603;
	Tue,  1 Jul 2025 17:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AA28ZGDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3355410E5FB;
 Tue,  1 Jul 2025 17:07:56 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-74917867678so476221b3a.0; 
 Tue, 01 Jul 2025 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751389676; x=1751994476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otvAmKrNgrGmm953h66f4Y1tIUJExy7j19EPbj8H6iA=;
 b=AA28ZGDG+nB4IChojqo5hx9cAvd8EaIIc8kFygsmX8qe2/77VRQliGM01kVpm4xexc
 wMPFsOrbEEzGFQ6NCO5mhtwTxEvAV3h+KgX6YyKx9v0RT2Y6QjARcXFrRyWtos//Sypv
 ykeVAO6F9XOMU1JMNoGT3YRYys4CpiG+lMek2CvmQ4ppmGqp1ANhij3wilQ0TvB7usOB
 Sn9QS0WZxZhFGUeCnep0pHXy1Suyp41Lg8RHfUSqs9RZLEOiSMIVt9kWAKYgJYlV5qFy
 K20W5RsiLfbYUBEWuLLakDKRBefdOtrGUrl02UOfBQOLL3SJEvTyKfhEaPYrl0siCuwp
 QOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751389676; x=1751994476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otvAmKrNgrGmm953h66f4Y1tIUJExy7j19EPbj8H6iA=;
 b=Z2VrpsKb0Mv3iw6t9f6HgSlicobisnzi4ygYV0ekmb4coprELbZZkVmoZ5HiU/HBX3
 dw2IrFKzbemWf+5zVsk+KbNzaz4beer8XDH3eS6PlEfYEvJtZWubWVMA3e2znRi0kAxb
 W5/L7XltGlUgfN6VcFey7IStt1CzdvMwS3bbVsLwuwg+8TCuj7kWqD3zXMQsmf/iSyUh
 zvujqXhryTO0d3DV5iSzepwx2MlqlTsIhaHOihigPaLGXkwLL4zM/W9bSkcYHmmSeK3k
 M2DVkUVEDFIB/xsE7x86gg9ONaLsKsPjxbusrrbsP4NAF1trKxjTpIz+JPwpYHndkDKJ
 o1Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3i7CSanbxGIAS/r251KgidA5tTD5xrYc2N9d09wSBoiufVAhBdViUv4mlkuxwGx3M0gVDfDqF5gA=@lists.freedesktop.org,
 AJvYcCVxWz0nO20t/JmPsDClQZIdqn+xyej6q3vTRGwmkU68lJYGlZg03mht58mkBAwK8V+3edVDX2KcPQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhOFKJ4Y9pdIu7cbE196lmyJtfp9Zi8FFmTU2LPdYRuiltMV0h
 g4A5iYBBUAAEy2Bg0FO/EDxmNJaJQEgc3UqdOwK2OOjnbMABAq0RW5Fist1uguXp8jKrRC3LJeB
 pGDGqvVAjC1oLxq4YJVy6+M2U3mwVByw=
X-Gm-Gg: ASbGnctkYGTR6SEJOBwR243Lk1eFFcBHocPBG9yfvp5OAPdT2i/Zpxd3ULRzIYXyr6B
 hAcYe7GnZ2spbzYzfr9ZXz8Rl0b17y8zmMGAHvEE3lKjwT5EG0fKCGN0LFQc2OTGKEzQ4aPs+cy
 1xtAALXiQ5jbgVPocP0XHh/VmnMRwnqEWG+xZOQc6Q4eyy/m5nU9Tkvw==
X-Google-Smtp-Source: AGHT+IGgyj2cxaLL1I/RbT9oFzMdK+mMcfN6YoSZuvCYWImRFjEfnNWMRG/RDCPN3KNKY0Jv5Rbef8Y4TKqAiOAmPyk=
X-Received: by 2002:a17:90b:1843:b0:314:29ff:6845 with SMTP id
 98e67ed59e1d1-319519ee90bmr2461781a91.4.1751389675613; Tue, 01 Jul 2025
 10:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
In-Reply-To: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Jul 2025 19:07:43 +0200
X-Gm-Features: Ac12FXxPrxBmeSfKO3xPaPnHZ9Ojlak6uQ0jVcG0JF2jdPMZA5As1xRK0OZ6894
Message-ID: <CANiq72kb5b-Q4OwASfGg6gz94fCQSLH34u29umQRsF8MEhR+6g@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@gmail.com>
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

On Tue, Jul 1, 2025 at 6:49=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
>
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vador=
ovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks for keeping this up.

Let's see if we get some Acked-by's -- otherwise, we may want to split
by subsystem and avoid flagday changes wherever possible.

Cheers,
Miguel
