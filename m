Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC4AC4484
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 22:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5DC10E3F9;
	Mon, 26 May 2025 20:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PDdwxU4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6577610E3F9;
 Mon, 26 May 2025 20:42:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-32923999549so25112121fa.2; 
 Mon, 26 May 2025 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748292145; x=1748896945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUmUNbUCgQeGYiOspE2SyC9Ks1s3ZxLZ5UKKm2WjJzg=;
 b=PDdwxU4NCLHjTE6WFnLvNbPl/ahYSRhW9lG0TDc4H/kX6Jj8pla3AoWH8axYutQqU9
 hJkHC1pLJzg9j3mstfkBcnOgYoxA51wM5cYmDMDlAKongcBJNrSKzbYVy0KWBrhm7gVY
 qtUKw8A34DwZpqa2Yadde8a2VWh+vSYUg2GRIO+x6SZRuFsLHbS7gJZ3boyw9HXtY7Dz
 4ONVcDdRu16RjUhX1vba1Cv3Rq8JUhuhu6FkvwVyhbq/uCcV9sRSLB05qoj50jF2YlNI
 Jk4ZndcyUdcE+5tIMsWjMa2KabY+IDmuYBJLSmrECyToFtGu6WPoQIhoIgEL3WNvibbi
 BNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748292145; x=1748896945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUmUNbUCgQeGYiOspE2SyC9Ks1s3ZxLZ5UKKm2WjJzg=;
 b=Yvzdv7xC4qsnzMZ5AcPQ5psIV55vcwQsWyCzkdAW2qru8SPp5SmifmOAwmA/+klDTA
 1s6MHjgopcCx8mBkl9ZOTI1bMYXutCi8tJ1QfVNItrRDWAJz8r5nkc+YAEIsXwL/l35r
 6CdW/dkeTb9/N1247WnhgqjOAIFPXjJQORJ3gKhNYumCvmYhH0chkrJdQVYvYQh4/WcI
 wJIGszJzhp1vzae9Vv2ZZvXmnAfYeM2wwuv2y+Y/xx2HOiTGQnzUza9Fq+6Dg8RkbUEU
 ZMXv5vk9UqtXdsUYMf0nB5HT6r9kj/kXNQbSXg0dFP8jEuUi2Kmg5i8YOeVn+oyk5eQM
 xFfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFERKQL90+Cwt/8oqs4YfnNEvPVfE2o1ICBH4rZneHw4TOl4OYOS4tChPt5THyJTCCAk9fPm2PvIA=@lists.freedesktop.org,
 AJvYcCWX6WCFuvvgt9gEKwU6nkYSUpsX9Woel5gOgQwJDLvoeUFaUZbsK7WPNxbxmdqAOz1n+jBagAoNBA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0WDofwdzdkRztSs4iPSoHirEnEKMzkmoyrf1vWgm1Wc1LC2yU
 sYSRgJAQ+OXMUadYgz2rn09NGdNttZLIsUL3YvGR6BaqlnMxi6nob5e/Q9OLg/DrZ2NHOit5JU9
 Yhb6x11KkqaYjbbZ0FBgW9Q11GYcseUg=
X-Gm-Gg: ASbGncvtX0/hpIhp9goa3i6ypgY/72ewZrKmpkvKSiooBbRKtECs12qmaqFtWhbKT3f
 TK+Tg6NL2qAoUveuXzzArXO7mtemwcvJbQ9LA+8OpOZ4SG36oWdQSH0c1IktxIMaO4Xj1K6Fp9y
 jVH6IVR+olEVCovjmOJyJLO9zi8J1Y2YoUcbjdkIyVwJ/gng73RxBlMjKlvmkwECh9te2vQw4I/
 AEQ5A==
X-Google-Smtp-Source: AGHT+IGPgo+KZWDTPWJ/8ifTkY1Vatt42x8Q1KGRg7v+MsCMTuGoZeMjT/G3sX9/OWQr2VdJiIhB6KXrUJ+SLPtTc/w=
X-Received: by 2002:a2e:be8d:0:b0:30c:317:f3ec with SMTP id
 38308e7fff4ca-3295b9e2b19mr25881171fa.17.1748292144402; Mon, 26 May 2025
 13:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com>
 <CANiq72nhNmLMdFTzpSQSxxMLanFA7Od6tBZ+3CrVERv9Spou5Q@mail.gmail.com>
In-Reply-To: <CANiq72nhNmLMdFTzpSQSxxMLanFA7Od6tBZ+3CrVERv9Spou5Q@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 16:41:48 -0400
X-Gm-Features: AX0GCFtRDT-ngLir-CN5e7tolI7SMct6WsZy2xxM7WLN6cJzwd9Ur8Y0NvGqQWU
Message-ID: <CAJ-ks9=8QXn9wQSX8frRqN0p7=nL+eUwLC6UV8HdQyY13=wx-w@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: retitle "Example" section as "Examples"
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Patrick Miller <paddymills@proton.me>, Hridesh MG <hridesh699@gmail.com>, 
 Michal Rostecki <vadorovsky@protonmail.com>,
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

On Mon, May 26, 2025 at 12:15=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, May 24, 2025 at 10:33=E2=80=AFPM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> >
> > This title is consistent with all other macros' documentation,
> > regardless of the number of examples contained in their "Examples"
> > sections.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> I was going to say that I could take this one independently, but we
> already had #1 of:
>
>     https://lore.kernel.org/rust-for-linux/20240906164448.2268368-1-paddy=
mills@proton.me/
>
> I will take that one (which given the `checkpatch.pl` one got stalled,
> I should have taken it separately as I mentioned at some point).

Sounds good. I'll drop this one.
