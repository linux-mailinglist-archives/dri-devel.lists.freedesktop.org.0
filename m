Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09A9ADF3D1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453C610E296;
	Wed, 18 Jun 2025 17:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bgf0sayH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FE610E296;
 Wed, 18 Jun 2025 17:31:40 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-235db423abdso6393695ad.1; 
 Wed, 18 Jun 2025 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750267900; x=1750872700; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=giEZC4CA1Gs2zQVVLh4SgqvtfIsCHKQ3JeTi6+ZWRSQ=;
 b=Bgf0sayHyUOOKomIKzNFEq5/oVcCwki72wCqV5BShpAdINpRHUjhI0ZWC513at1be2
 N1DMs6EcAFNQQtGxjRxwbMrVeUn2W4vr0ZqLjZTFBzaKazizFkGO8z+Z5IJatoNtVAsj
 rYcZdLJOUNvsLmM1MkVhInWN+KwTyDGKc7U6aAE13zagt1xIyWzF71zJIJvYufiv8SWc
 MWZRf4HM+U5Hxj5kOyUUMbfOrxqxpjgkgCkzpAqP9J/1jcAdelC+4MhRNdsc0cEyHFJG
 DZCnFQJKSVO42U3DF38YzReT6IcXCwr0UN+YDXo+LRemweSHJx4+LklCE4rDgthX70tW
 Or3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750267900; x=1750872700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=giEZC4CA1Gs2zQVVLh4SgqvtfIsCHKQ3JeTi6+ZWRSQ=;
 b=ZqpDDAq7N3oaFMgby0FKdVJMmOQpDgbUYMKFJYFSvU7rq2pxM3pg/C1vfZGd8MfbUJ
 X2NPR2DyUht4tctZG/LaFIBgZGkTHTtxd/qThiZmZVbUBFSHhgvRBwRI/6ZB1q+mGq11
 bvExaD4FRidHyD4MmEBDvoGKP+lLRw4zWMF6xAWPzl31b7f/KIEmGLbbwhJpuU2EYghZ
 jMBY1jV9JWgidWP9TFqGQiW4whCKSEttlOBY6GI8ywEvGTBcj9vFeEmwyiJl6wpKPLm5
 JQPSvjFestRnUo9wqH4VnKDOrnxv3UCEG1UmIVBNTeCcdk/2HP9Y9ltAcom8mMQ6oDE+
 i/UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtmB0M+WdUi0M2rbvxETwNoX2DFFw71XArQ2N629Bs1FSs+TJwRwYJ0nhn/HS7qlsJa4/j04VRBg==@lists.freedesktop.org,
 AJvYcCXIb97/jQUY+WYFfmio0RZRrEgPD6Fl06/YsLnFtTX2EUiFrn4W9wb31TIzCC3KAIfUyhXVtZ60Riw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4pGjTdEhWbXjZKzqVUrgQlX1DUipHb81KgvDp74cwFFtccxgi
 w+8pluzoR8MInTyPGy24d8/6r0GmhAuX6uAguej2z1FRqZlOCEm2iySyYAkLGYkCKLyFyMRi7Xl
 0y8Z8JAl4Gjw/ywExBykvPUO961UimEE=
X-Gm-Gg: ASbGncv5wGcUGi8bMH+dDe/ZcAT1GnacykU6+tZgGy7mkcsuRy0TZ2FT0sUsB80hwx1
 F9FUqd1HJkE5kgjX2p8/tuf05OvDkkvZ+ajU6gGcL0gVU/Q8x2ub1tQwSG6ewYufEOUIfluX78/
 t3fi0ei0CUHNEIohN2c6WCmWIr3fmLJvH9c2vEeaxC1aQ=
X-Google-Smtp-Source: AGHT+IElAYFQ7bmLDzGoK+LouyDOjrVrsskRPo8QHb8hQdYz3Xniksj2pUSBRZd+2TWCbtZwG0l3dCw6erP0uN8kpG4=
X-Received: by 2002:a17:903:11c9:b0:236:7333:f1a0 with SMTP id
 d9443c01a7336-2368ee1cc91mr46098835ad.14.1750267899755; Wed, 18 Jun 2025
 10:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-2-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-2-f43b024581e8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:31:26 +0200
X-Gm-Features: Ac12FXx7GupXW8Bt-WgcYO-htZmUwVX0jAEiTk6mVy23gMLCIJ6y3H_HjinHnSQ
Message-ID: <CANiq72m1vd65BtF0gn1E6SSq=Xp9JTznZn-Yawd0yMMQdjPRYw@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] rust: enable `clippy::ptr_cast_constness` lint
To: Tamir Duberstein <tamird@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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

On Sun, Jun 15, 2025 at 10:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
>  rust/kernel/drm/device.rs       | 4 ++--

Danilo: for completeness: if you don't want this, please shout. Thanks!

Cheers,
Miguel
