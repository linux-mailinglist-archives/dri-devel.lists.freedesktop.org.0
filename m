Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB7A90A15
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D3910E988;
	Wed, 16 Apr 2025 17:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Le0Wq1s0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E79810E980
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:36:28 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6f0ad74483fso73962546d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744824987; x=1745429787; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sORjvcO0tUIMjXvZbPyesA3RS3F2BYfcBEs3dz3VH8Y=;
 b=Le0Wq1s0kr0xYCZP7DwQ5Yq8INq4xOXP+KBsZxF5YVLG9IiN10196m2JIXKLaA/Pqi
 1QiEVKTR0NeZ73TYfK2RvZxmhZuqeGBO1JlTXt3+5gmeYxOMu0QM+hpIA9Yk5aOdyqL7
 kQWHzIjeylWyAwF3a5ckWKo0twrt2VGrTb+7OEd4a7f9FCNtHZ4Mah6PxaBqchcrFuVo
 J9GkDWhkMfa+nrMtYxgtG8QEkuhOIBiUFNyNZkT37i01GUehPi6pyXJXwc+KEsWGmZRn
 lW2z0rW5ZfN32BitO7hdz8g4b+q/JitvBQrP/8Fi0EVyuBxFnqr4aPlutSia342uYdVn
 Xl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744824987; x=1745429787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sORjvcO0tUIMjXvZbPyesA3RS3F2BYfcBEs3dz3VH8Y=;
 b=JTntbqHd7NnWeSN/59VS/RriZWKM3mFKan+Ee7SFt8MdrVxoTUqBKeRbCHXsKc0T+/
 RrRHL80CEe4ZTPHr9HyG6NqAeiC8SYpNadS/0prlhM5+y8RIGii0pG3tKp0/dYjGPEZh
 hfER4eSX0ZmxAgzxXMK2QSlBB9Lr4pv6AFk7AGrbRIZXwXk/XoA2VUhKmwUOotcTelZi
 6Y6Fs6BgWviZZUK7ZpcP5hui8gOZnRcZECgeD3VGNVLDIWM5+ntn8oWdKlJbTaZbc26B
 6+/6yn4MSh5ZtwONM8xKqxRncpl6L+eC1wzZOiFAH24ya/5MX/PM8trxAnGSzL+QOjKB
 TLaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkRd+y36PtD3zMtaD9hXEU2GASC9WGlJWYPaK/T7V7KzEJgCi6RCWqmlHpINFRJRaHd3Z88k8eeMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKCkK3roU9c3F8JCuC1XPDmH3ejNEnxanzTv01O17SXsHFbFBq
 kPDuXhiUhXN6EXHLaqE5y0Wzm9QqlK7BFHazm+j09ZoeSsSvzEhX
X-Gm-Gg: ASbGncvFHv3lzmrGWv7jUSIxLt3h5VdugYgGvL9TmU65XLxKJ1WM9+sz8OcvYNRGv86
 vOlZeK+2aVbJmGYB9exQHtnvsKmnMpRLnWO3FEZBkbX8g7riwV3P2yfBCg7Nzo38ILCKfUtNS/t
 vbcJRNkGgzrfRlRFJ9TVsxgWMRd3oHBf7ZbgesnTKGc0cFWfiakL4Wfu8zbCmgPVrEPXP7bEAqx
 9gef1sIv7k9DVznHGNIE3ZIFLPuhkMMDhT3J2LSRSRvmfOGzxfl8wO0utWatxwDfwE3Rdj5lP2m
 4kaTqS1hqDx25A3ktPtowIL8Wqo2tF8BH/s8UyV479PJ7aAInNsMFrNZlDhxqtsDHzd9gmRrHf7
 Dmz5Y4c0+VIlP7WHg8XpBeXA5k3rEFH3RLJeFfOAYaoXK
X-Google-Smtp-Source: AGHT+IEdGY2wFQqajLYK8mKt0U3F/fNAP2mW/+4VwbP2os6RpAAcUYU2SqjB20jtKZ0BY8vcuLVuMA==
X-Received: by 2002:a05:6214:3008:b0:6e6:61f1:458a with SMTP id
 6a1803df08f44-6f2b2f429a0mr34380666d6.14.1744824986976; 
 Wed, 16 Apr 2025 10:36:26 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:a61d]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f0dea07c50sm118289886d6.77.2025.04.16.10.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 10:36:26 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:36:07 -0400
Subject: [PATCH v9 3/6] rust: enable `clippy::as_ptr_cast_mut` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-ptr-as-ptr-v9-3-18ec29b1b1f3@gmail.com>
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
In-Reply-To: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

In Rust 1.66.0, Clippy introduced the `as_ptr_cast_mut` lint [1]:

> Since `as_ptr` takes a `&self`, the pointer won’t have write
> permissions unless interior mutability is used, making it unlikely
> that having it as a mutable pointer is correct.

There is only one affected callsite, and the change amounts to replacing
`as _` with `.cast_mut().cast()`. This doesn't change the semantics, but
is more descriptive of what's going on.

Apply this change and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_ptr_cast_mut [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile              | 1 +
 rust/kernel/devres.rs | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7b85b2a8d371..04a5246171f9 100644
--- a/Makefile
+++ b/Makefile
@@ -474,6 +474,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wrust_2018_idioms \
 			    -Wunreachable_pub \
 			    -Wclippy::all \
+			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 9e649d70716a..f7e8f5f53622 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -143,7 +143,7 @@ fn remove_action(this: &Arc<Self>) {
             bindings::devm_remove_action_nowarn(
                 this.dev.as_raw(),
                 Some(this.callback),
-                this.as_ptr() as _,
+                this.as_ptr().cast_mut().cast(),
             )
         };
 

-- 
2.49.0

