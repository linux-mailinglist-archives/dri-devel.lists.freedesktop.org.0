Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27715AD3E52
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 18:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3399010E300;
	Tue, 10 Jun 2025 16:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="isk4YMqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31C810E300
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:07:52 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-234ae2bf851so7873955ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749571672; x=1750176472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1BITlzur69yftGlPfm6ex930CZl9IBW3CAWbDhhnEo=;
 b=isk4YMqIolwMFnLpygiHwkjfWYYUs73nUKRoW7jhOYIsNLXSCFLbEvcmkWn1qdYwh0
 g2FVxvGJDC87Uhc0t5vU2IImU6cHXSI8Pyijh8VWRJ6OKmcrxsXtwq3r51cgzL7gYyQh
 jWANvixoc4wJcJpxdZU5s+x4q8ehjmAQhADbO3zMVRDDQtWLhaMLH0L4RM42rtB+LJZk
 wt0nxtMWqVAFQYonz+xfdJ7NNM+gjJt6CXu9N5eTUlTfdcG8vt7D3h5dQUquMzSvFfjZ
 Z6i3GaTQqtQEgF3t+tbfTr0DwM+Houph9ghaGWAsbjuCMAcdYBGrq8EdZWtQ/G8imQFR
 bQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749571672; x=1750176472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1BITlzur69yftGlPfm6ex930CZl9IBW3CAWbDhhnEo=;
 b=WlO3t65QWq9+T4QfPLrxhXEjyRk4QAVzAxFs7XTezl6X4yEJs4RMzczQYjnEwMQkW6
 TiRbJe26rBRLgZnxzT0kTtNYbMEM2YrwUpUiVZgdXb1xekPOhOTLRqFUvm7auvFoK/j3
 Sdp2+0o+Ku/9/C4IyFRWGYK5jD2KaYMQsottEYZBG4ZWcsyYAbL05OcZ34XheT1INRHe
 VBfq5/LVs0ljUYwY3rbU0W0bViBgeiyDY6fOX4d54cbEnsniHzbOoe6msCH9OFqb93/h
 nLk7GMXgJdewa6tg72IjvZE2lqVWVEtNm+iIrMJ0jHtA4lF+MvRz/XrgQ2M6eihkhrTO
 JaRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuH5lbQKaVqC1/iOrrxIsS3Ze5guL1LX1NIOqHHiJR6ruUyL8Mo4uG9HoFyT3IClS/6+hf3RBuhaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3/fLhsSq+A+5Jj0XFNj18cY1TNUAqu09h/v4KwXOzDVhSIbln
 sJzHDPVZH3X+wdNDyKhMrgR0O+Pni6hWVUkmY09X8sxiSn6PT0yHU1JBuTLFiOiCrXhqG3AJMn3
 9T8Wg9yoB1cFgb7EK/05R70ZvxomKktA=
X-Gm-Gg: ASbGncttHZGgLLVEKbp0dbUtF+8biSuugri8FaAM37Z8matxLinacahUhP4P2AsxRJQ
 Zot/J4h3bttfnHi01pQwF7ZTL/Vnl9iI01LmNUkVeFY0+SDFvygn9gVLoq1iKLCJcmiXkG70Ycx
 TPFzTQs5HVQ7dT3yzTwnKzIeK7kPhcp8RKSjX4K+rcPSg=
X-Google-Smtp-Source: AGHT+IEkveDPapEYWYF5Lme4xzYT3aU2PAb3RMnK2FhgBqYClnpHcHMaaMDanexVO7MdhtPZZBHJv9udTG6GaKIHKaY=
X-Received: by 2002:a17:903:1a67:b0:234:bfe3:c4a3 with SMTP id
 d9443c01a7336-23603fce7aemr92246085ad.0.1749571672166; Tue, 10 Jun 2025
 09:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
 <20250418-ptr-as-ptr-v10-4-3d63d27907aa@gmail.com>
 <CANiq72kWtEsXDuoXpbTNRLiZ=c==Ne=v4igxCWMwWFj0LOC-Yw@mail.gmail.com>
 <CAJ-ks9ny_VNvKM-w04kkk4Yw=UpYEt82TyFZZuXEFK=DxfwcgQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9ny_VNvKM-w04kkk4Yw=UpYEt82TyFZZuXEFK=DxfwcgQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 18:07:38 +0200
X-Gm-Features: AX0GCFt25dqMhp8iaQDA-26WJJC7gjowsiCCK-_ghe8BM57dzBLtofxE1fBcZ34
Message-ID: <CANiq72k6MkVGtdgkSuy392T_xxO-5kTJuN7kh41N=UBc0SeFLw@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] rust: enable `clippy::as_underscore` lint
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
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
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
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

On Tue, Jun 10, 2025 at 4:14=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Yeah, I think these are good calls - I'll fix it in v11. When would
> you like me to send it?

Since -rc1 is out, please feel free to send it already if you can. It
would be nice to see if we can apply it all soon in the cycle, but we
will see if everyone is OK with the changes in their files.

Worst case, we can apply as much as possible, and leave the actual
lint enablement for a final round, like we did in other cases for
things like this.

Thanks!

Cheers,
Miguel
