Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E507AC42D2
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 18:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2BA10E159;
	Mon, 26 May 2025 16:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gWp9xuwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54110E159;
 Mon, 26 May 2025 16:15:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-30eccc61eacso149471a91.3; 
 Mon, 26 May 2025 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748276126; x=1748880926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqqBHeb+ye/Ia2+xZyQMqJHybQMTShtOHZU6XZo753Q=;
 b=gWp9xuwcnOo0tfg/tCFt1I5QLB6h6ITZOBEIC9f0KGHXIZzLswQkhHiL9RhQQE40Fa
 FmaXTgIuSGfTc5E5FJW2mzoajm45bWj0Faj9UYn5LypMVd9oIo13mCG3S6QrWbSTG+Iv
 TaFj0pLGM7pszZfx3L2CODbfJXyI+XxohroR9zb+Marm2oXrHNyEA47qp9lRk1hcvAA2
 VIEW6qa9MEPJI9fQ4xKPgQN0aIe55n1RBtMySK67McP8qSWtVJIuHiCGFH+NdQxJE7Bd
 pK7+Ujw4LbDgzlktPhrjBqs4EhzCG43Y+4Iv2S5zkodETdU0Qn0auX3ynbst0GLZExNy
 Z2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748276126; x=1748880926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqqBHeb+ye/Ia2+xZyQMqJHybQMTShtOHZU6XZo753Q=;
 b=TnPy4Zg4pT94QFrJU+sFSVQO2BR29ug6JuvGK+j7nzG1n49COljUCww901By5gKr9g
 mFRjGcDKq6WBVacdPdy1MOqHyuqihstzfzJhu4LVawzgGmioGRGUu3yTY2J7AcOsQSsY
 XmD0d14FkKW4cZFU5FmXUb0wuOZPsevrzRhLlF2CGU6fLGj6ZvLIUC56KUbR/Bz2pR/5
 Dtrj9BS5anfzlAHKbw3usZ0f/PwORUueHepl1FEqcV7W2CRJt/zndsk4lVumxjTJo8fI
 eMsRnL15RBSA4NHTnPx2B+HNmSZhjuLiqJX72mMfMrromHzLVl0QKyUU9yrIOYBtGh7K
 9lxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzkm9Kv7fnbNWFNzqCYOJIgDLgPSLG724qGRYAbfMBT9n6KB5j1WwXJH74Nr6nGXlxGTxC+CvWbQ==@lists.freedesktop.org,
 AJvYcCWYk/Lp3sF1+0fK590rmLbcIm7qa9UuRgYBDqsIRoQ7uj/HyNqxEx0jXMF4mFu+QEiIsucnBP9YZ3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRuYtQYMeacUvsAqfSWLwbaRDUAu9da7cZCuP+DQE8ijcoA5Ax
 XzAluEaCx74/+90c56WQCosHcoyJlj6jQiz6ovgp92fj7Kq5n/k4rXY8ZzEeOuZdoi3LAUGvD2w
 omHk7GA5pL4h5G/2qXruzepXTx6yXxJE=
X-Gm-Gg: ASbGncsBDJ3V2fDKTiDGgmBGgbC3gIgtKDhPM2mRbFYmhUQix7wxXl3TxaBY9hBTyUb
 udK/pYaTu1b8vH692nIvwsfA/PLwMN18fVZL1OHm3pm+s8hbybudV9QmFq3+SXo6bwiUDrTtyCJ
 RT5caeqTVFKVXDoVflZCvyN8mMGv7e/kx7
X-Google-Smtp-Source: AGHT+IGHSiBqTNM5XKVporfsZuIAk8+0k1ziYJ6wqAO1b1FVW8Ifoco0RVgiuBOzn9y42qT5ODX8sdvF5WeB8wXqxCo=
X-Received: by 2002:a17:90b:4b06:b0:2ff:7b67:2358 with SMTP id
 98e67ed59e1d1-3110f0be892mr5688853a91.2.1748276125761; Mon, 26 May 2025
 09:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com>
In-Reply-To: <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 May 2025 18:15:12 +0200
X-Gm-Features: AX0GCFs4zlXhbhwkFm69GRcSGgMcjMarvAu4nWr6-nQj7bz2FlpzmLVkBB1QzB0
Message-ID: <CANiq72nhNmLMdFTzpSQSxxMLanFA7Od6tBZ+3CrVERv9Spou5Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: retitle "Example" section as "Examples"
To: Tamir Duberstein <tamird@gmail.com>, Patrick Miller <paddymills@proton.me>,
 Hridesh MG <hridesh699@gmail.com>
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

On Sat, May 24, 2025 at 10:33=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> This title is consistent with all other macros' documentation,
> regardless of the number of examples contained in their "Examples"
> sections.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

I was going to say that I could take this one independently, but we
already had #1 of:

    https://lore.kernel.org/rust-for-linux/20240906164448.2268368-1-paddymi=
lls@proton.me/

I will take that one (which given the `checkpatch.pl` one got stalled,
I should have taken it separately as I mentioned at some point).

Patrick/Hridesh: there are new cases arriving (i.e. singular section
names), so it would be great if the `checkpatch.pl` patch discussion
could be restarted to see if we can land it, i.e. there is now even
more justification behind it just after some months. Thanks!

Cheers,
Miguel
