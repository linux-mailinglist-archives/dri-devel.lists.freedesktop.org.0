Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FBAD147C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FEB10E67C;
	Sun,  8 Jun 2025 21:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WViAVAkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B314410E5E8
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 21:16:13 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-31306794b30so699030a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749417373; x=1750022173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROMnbxB2A/F6Fvu/BM6R9kuzlo9+xJJX8W2nDVs24Gc=;
 b=WViAVAkI7E20VzO6r497FPtqg9Zlig696UMIJVgx8YT9d9dBRXqUpH0tooFMrzafqt
 604T9+5ZL6m8OFTIdsitEcSWvBtsqAEFutPk0sxUW6fntBBp37Hdv5dHoUh7EBFmLT5D
 DZ7LphNcPGfI15+0Y1BNzw2EFrUqqkdsJL9mPf+15DFdXPoEbld9g9bLOi+oEJoS+lbD
 94zX5f/ZTZCf+A+n+SjXZWQMXLEtLqG5nVXW/aeHKwOH/so1x2ckYcBR5x6R3mvVLoDt
 yPiH9g/0GiSXNUTD2rbIIcj8iOndCaC4Fpe3izpccpCMWqG4wdW0BBc6SFVVf1/Li8Gi
 oY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749417373; x=1750022173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROMnbxB2A/F6Fvu/BM6R9kuzlo9+xJJX8W2nDVs24Gc=;
 b=AiV4Wlfa/46CSqyv8/qbWoZUqy2YPOtkNsPU1rFTWnXlTBU6v7Lqdk0GD9I1OAOb+W
 fkRwOywzwLVK27fMZrIe6hBVvxHhxUiZbqjoZbUjhwITOQCFrrtYK5oJWJHUjdvaUd89
 A7YxQS14c6RSAurWVd1dL+S6iZ3GTx/FwH/0D87h7l3DNybcuGHhCejeTkHtEzmWMBvz
 joxtOoob5cJzVAUI7clvYAw1v3LpOXljwlZBZZFQROQG44MDHt8K3f/0CtTAElj1Q1vf
 gAMR+U79ddQqkEGMlA8c68QNYCPUg4kZk7ygCtYyyqL8sD7adsbYzItwNnEVn8U7DQre
 NE5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhEk3El2pZu/zkHfQneqpT2G6DvfEe+jxV43J65inJrB/W8QvzC9eWRMNLyGGlNrYCYBtzzQpNFrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6Nmlmp34xbJGX3Nktu3j/Lejfy/4HHfXPI9wpXh+TrMARALK6
 VUVzc1RR81+EI9IcEhXOaoLMMRRcHRPQrE/tKwu4Z67c/Ppuo/lvyK6rqBLeBd/WZltq0tyNOcp
 ba87nT4tNJrPLVnBH7Zjp/ufA389MWf0=
X-Gm-Gg: ASbGncs7fOl5cVT8cFQhpRdnhn0+keFAmywYaKsaD6N1GzdvyOAhFa1Qt/nlvTMvzOK
 mXOl4FNcgTQZ1p9cI/ZmtLrcUJnEMVjlItQn1+r6eGTaVRGELEvQOEDT+n/qtvfcByBXTpNC/8K
 sFqQ+3n2ezpN3TTCi1rhI13w68v4/O4AT+X6MCfsFTNOs=
X-Google-Smtp-Source: AGHT+IHcnKxE4P/cFhuEWZW0D4lMoOaOrfEZtsoCHwxA4JPSsZt+wbEk5r3gKugcA90wbKi32QwaTUF3LYa15AmI+uM=
X-Received: by 2002:a17:90b:3c89:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-31347506b75mr5866067a91.3.1749417372649; Sun, 08 Jun 2025
 14:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
In-Reply-To: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Jun 2025 23:15:58 +0200
X-Gm-Features: AX0GCFu7kEGuuhs8xaCtkzWNC6Znk5oSHyCpfKw_qD8poEL7ZBxhU_Wo9Kw_iYo
Message-ID: <CANiq72km=RmQcVAkTcs3UoZzSUXKthW0ru8UH4r0KFFmUSjwgQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] rust: reduce `as` casts, enable related lints
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

On Fri, Apr 18, 2025 at 5:37=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This started with a patch that enabled `clippy::ptr_as_ptr`. Benno
> Lossin suggested I also look into `clippy::ptr_cast_constness` and I
> discovered `clippy::as_ptr_cast_mut`. This series now enables all 3
> lints. It also enables `clippy::as_underscore` which ensures other
> pointer casts weren't missed.
>
> As a later addition, `clippy::cast_lossless` and `clippy::ref_as_ptr`
> are also enabled.
>
> This series depends on "rust: retain pointer mut-ness in
> `container_of!`"[1].
>
> Link: https://lore.kernel.org/all/20250409-container-of-mutness-v1-1-64f4=
72b94534@gmail.com/ [1]
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Now that -rc1 is out, could you please spin a v11? There are some new
ones in configfs, drm/device, cpufreq, nova-core and mm/virt.

(Please also see my comments in the underscore one).

Thanks!

Cheers,
Miguel
