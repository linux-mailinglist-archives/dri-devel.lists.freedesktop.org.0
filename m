Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC6ADF3AF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B5310E075;
	Wed, 18 Jun 2025 17:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsNohcIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE7510E075;
 Wed, 18 Jun 2025 17:27:44 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-313336f8438so1414780a91.0; 
 Wed, 18 Jun 2025 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750267664; x=1750872464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+q5GpQ2p91YPUwXGOT+L4Iu/3q5RIn50B6DUy0Q7so=;
 b=bsNohcIwrDKyEXrOrdPh8QJSeIp6wgRh5+6V2sbG/F7kItDKUEZu7opzP7H6RfuocK
 ROXaOo81hUfK6dPjNjldwdYF/49PFY4j0/ksLTKES114pn1+0ECo8Tn/p1ujRdRIjGiJ
 T6kTRsJUdJDrA6sIHi+n8ix8tH/7x3QRUvtSY19n7j5kMoLHarhC2IT3SsUR5nXrFPZG
 4qvv7Rg+pGg7uweeb7XyQno81q5qkrmWQ0kTNyBysIug8eKLwdxuG/eBIWt7ZtFY+/rA
 mzsWVpqHt0tkvnob5/zY/7Gu8TP0IymEXMD0HPQ520l23GFfb2oANB/Z7I/qdIZWmVUi
 7L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750267664; x=1750872464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+q5GpQ2p91YPUwXGOT+L4Iu/3q5RIn50B6DUy0Q7so=;
 b=un5pn5quSDfdUVoRQj3FWZEWsPpKZXv0YjeVvVYFocX+L7jotOJv0jnO8h7+LIgg23
 ydISA++zS9N7MdofhI+0BIUzgGfM+JgdcGS3IofSUQM8ULTzf9UxJvArECjpm2c8mzl6
 CzujOzFEDbUApepVu/ZMvrwBJGmsLQbkj6x2RvvYuCWzmyhF+26S7+eW8iFEiyRqypZl
 JqLBssTWUjZQdY59LEa7YXaQBd+mfksM+UIR16QPRrgnVmGWMvnTo9vBPboxur+swogv
 p6MzNZuDLtnxcrko+AHFXfSWyye9767QVnBzmVlsGmGAWPiT63P0iobg77tBDovvwT+F
 BIvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2ddhxZIU3NiyCZh196+HVESwZcif2IO6TWDvy9OqTQSZ2r7o2YQxQjTjjWdjuWVJ+4FUzAuoOMg==@lists.freedesktop.org,
 AJvYcCXCg3qE8O5SH2aQtyZ5tK06FWRjQZeGlO1VvERmPtcIFvaAAueJRnQEJZ8Q/3FwJwC3s8A0eWn0kZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz476KcxzAJ7rZSiZgyfQv1zM4VqC/Yzwf6Bl0x56kbxxmCGlC
 iEV4Ato7XHBS9+pwLPjRKePt3RF50PJbXawPUn9GFIZ7buksLT4/I0say256PQfintEB2qwxF5A
 pNkvGqm2iR+Rsd29KotFwVeOjSskzc1E=
X-Gm-Gg: ASbGncsAPeu5OmRPTp71OjGdl/GSXVOPAbL57c+75W0WqoM9/nOsORyjz12wUrc1ZbB
 pUP2i42fg0dPFQ/jgXjGDU/BsDmu0ifWvq1vsjkRo3/K1rXe+uzGoXBZSx2C9Newv5iHv3bFRF2
 DIeX1S9hPPLHkTyA6QF9vFkTBEUgaDMFW8cGI0/v3CoIg=
X-Google-Smtp-Source: AGHT+IHgojIF7ZtAWL01BJX9X9RDL/KOffVgqU2TBitLwLXw3+WIYaOCUYiiv/uPX3E3RPRNcpmmIUzrPPvpRfNOxow=
X-Received: by 2002:a17:90b:53ce:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-3158bfee2a1mr70211a91.6.1750267664414; Wed, 18 Jun 2025
 10:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-6-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-6-f43b024581e8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:27:32 +0200
X-Gm-Features: Ac12FXyjLr8F_PeGOXgNiD3lzcYVOjPw7Oy7KTgQZIrIWl7ZUXuM1dkxLpsBDQ8
Message-ID: <CANiq72nji33-=cLnEkpsXyovctshNZ5-pheBBxQdNscWdReO_A@mail.gmail.com>
Subject: Re: [PATCH v12 6/6] rust: enable `clippy::ref_as_ptr` lint
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
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
>  rust/kernel/configfs.rs  | 20 ++++++--------------
>  rust/kernel/device_id.rs |  2 +-
>  rust/kernel/fs/file.rs   |  2 +-

Andreas, Christian, Danilo, Greg: it would be nice to get Acked-by's
for your bits.

(This particular one can be tricky in other cases due to lifetime extension=
.)

Thanks!

Cheers,
Miguel
