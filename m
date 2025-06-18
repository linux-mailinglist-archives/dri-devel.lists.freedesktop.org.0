Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE359ADF51C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10ED10E05F;
	Wed, 18 Jun 2025 17:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="irZjxVv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFEB10E05F;
 Wed, 18 Jun 2025 17:56:46 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-32addf54a01so75586821fa.3; 
 Wed, 18 Jun 2025 10:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750269405; x=1750874205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFrhjba+jX00ww6cE0VuGNNBUQaISwhdA2R1o+tAwj8=;
 b=irZjxVv/a2ID6a5h8JsfVg2ZqHiX20uLph5zxWs7x6MdW3JZn0UrwBDY+S5GnlIF8t
 4IzFw8hfAPSX9EDRicG2BMQw0pTKjdSgxHN6NjckD7oP5rAngMpe1+ll5gfO8fhdYGv8
 UizvuooYaofmJhLbJZaHVQhMXZ1bz3tKrcpzOF9IXan1Khy/7Fz7XaetLlhm8xSvrlur
 4qQ38MTcsmIjq9v1EuQmp3iRqae0JaEIe+fS0LGA7yHqwHwVriFJyWQXBCRM/jG8OijA
 73XQNBixp6I6vxQKcVZ8HsNYqO+TWX8GRJijLeaCD/vB9jD6C5Gkvrk7qIaSBkgPtKed
 Zlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750269405; x=1750874205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFrhjba+jX00ww6cE0VuGNNBUQaISwhdA2R1o+tAwj8=;
 b=o6Ne453yuTrCRuwIShZEJPMuZjYqAAgSg/whEEhu7hDqHuafyA4+EhTFf5Dx4ZEI83
 0C6f882H0ECp1qxgQOa6kh7wLfenY7FN0OVsIitZbMvVpVD74GYcUxeOmbDVsCba0uUe
 /mho3mKtRKy7XSpih9v41A13egiaYY2me3+kp8X8C/bW7xOEvKognw3eafqWRpi+i6S6
 irmIpCwIN+/qe5f/gJAq33OZDLB9HoiRjmJ2PGTp22PYMm+gEN/3nOt0H0dDmRzRYwPz
 Ujm1pt6B5HHCHGN/Otsysv6T/RXeyO5TyTcdcSkLEdprYOarjVECZh4uTrhO4YmyquFS
 XIuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfztxGQBgQl/S665VlU5r5rV5qxPPuZDFICNaubgwefeGqvv6z7u0+m9ynq3YauCEP5hnsbAmmkg==@lists.freedesktop.org,
 AJvYcCX+rFpGNVPO3U7DQBiA+yzYYvgsa94jH+EIs0waUD0bD/PiHrvJppMg6xg2Rhi5abM+xcrApcHZ5u0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiKEetwL9OAHG/69jemMi6PVs7wImO0YPAdETUChBRlB6Q1t0F
 mfhMUS5FxjhHnHNFh511rDQ22cJf8RWp1OsYmxrz88hY6VHXXxrcCXWnpA71k6flV+2y+0i1pFU
 yOGzUvvDdpUYaDJ8N0aVXKbX5ldt91gQ=
X-Gm-Gg: ASbGncue1LtHERE44J4nz0O8KhyVo0sP0T5aXAWrqdC4hE447v7pZrTk1JvJ/YeCF+t
 YQTUo4yCD70ViZ8YJi7H0ggoVT2kCvrlYPYOKZ1aPGqPKNHBEH510H2vAnaPeRiEb+ggjLQXrSL
 w/qBgHTt837XSCJJx5QrzBuJEmKI+PqD1l3ilRRY1YYPTPWrmbq6CxuDjvMxdup+HV57353Q==
X-Google-Smtp-Source: AGHT+IFYpQNeIBg62gf2bJKGY02IKzd8mHZl9tpr1i/aaJGRezLkroXz7FNXVmmWP0ibkJJnM2113j3XPbjKe0XRBDs=
X-Received: by 2002:a2e:a7c1:0:b0:32b:53b1:c86a with SMTP id
 38308e7fff4ca-32b53b1ce9fmr41415971fa.24.1750269404558; Wed, 18 Jun 2025
 10:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-4-f43b024581e8@gmail.com>
 <de30bc80-3dc9-4fac-afe8-bf6b0df42ea9@kernel.org>
 <CANiq72mOHbxt3xOJw8f=j184TRYs9y3wvcopH-h6P2SLe4jVNQ@mail.gmail.com>
In-Reply-To: <CANiq72mOHbxt3xOJw8f=j184TRYs9y3wvcopH-h6P2SLe4jVNQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 18 Jun 2025 13:56:08 -0400
X-Gm-Features: AX0GCFtQa8QSLL1IyAtkspzHqh-LWDey5MUYh6_rGpgLIHwPpEpm3BqmaQGaU5c
Message-ID: <CAJ-ks9nnNjBfzCasOtFZGXBj=UKqZxuyh3-Emj3yFrz=9f8tmg@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] rust: enable `clippy::as_underscore` lint
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>,
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

On Wed, Jun 18, 2025 at 1:50=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jun 18, 2025 at 7:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > Shouldn't this be `c_long`?
>
> Yeah, agreed, it is clearer -- I mentioned that for similar ones in a
> previous version.

+1

Miguel, would you mind taking care of this on apply? Quite a big
series to send again.

Cheers.
Tamir
