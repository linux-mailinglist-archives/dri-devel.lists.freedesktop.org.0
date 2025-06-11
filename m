Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652ACAD518F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE64F10E26C;
	Wed, 11 Jun 2025 10:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qv/qZYFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A062B10E60A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:23:43 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4a44b0ed780so84900581cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 03:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749637423; x=1750242223; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BwuzOkwr2WXLbNIqZ4PjxHxYIhjL5EaV2fkU8tqfaYg=;
 b=Qv/qZYFcL0sHcUrRLoOr//YnYGN19Ns/42ppgcwp5r9yz3+p8YJ839cAthzsH+YtfE
 vYalpW5CVInmmCwb4QLZC8oStuyH/Hs22xF5z4W7OY3AocpSyPvkJLDYeTIVrJS2D+JX
 qgLesAAIkZovOOmaKe9lU4sgBM0FyNce+cHgVhqHCHxv8svJaIY7PAswn0DshreGUDjQ
 yZ1syyf4zqhWoi59wpvCIktCyxhMBzzg3OABWMgWtvXeDAhT/QoWd9BcysNs2SlEYTN8
 nfHIHv2egXPDdciTFp219ofK0GzsWqB4y1loA/QqjFeK5Q2+uTW+l7iQDf+u4V3jQBEq
 f19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749637423; x=1750242223;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwuzOkwr2WXLbNIqZ4PjxHxYIhjL5EaV2fkU8tqfaYg=;
 b=PRPSB263M4QIFAovu12T3gkFnTSik6fAVF5F9+KOsu2jolG/HxhVrXKeptANZkSfd1
 Ym3ooPrAojZrLnrjj97fjhf7DNPgQo+65QZC0jp9ZXZL83/5tMmt42ds3mHnm5sIixcE
 2zpjfQ/sjsKZh0F7G9PxhdEUweobL7PJ0N3WErIxNBoSfYRyu/Z5yIOuwLe+xl7exwmu
 gPDSo/g8j4NSb7L9yKqjb8u3rQTrlWNKbwV/RDa2y9xLDSA/deRcwG0kaayew2hu/Dy+
 kPyMmYxiIjo9K+lCm4Uuqvnxvh+JWd2BKVNnL5FH45nSHjEvLJMXtel+9+5Ont1koJ+d
 4Szw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxigAjy5AbrEQUpoE8eV60pl5Pjr8m0GID1ZxwKZk99Vqp3Rf0Xeh65xRwrljXFzw/bVgxzBD7IcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw46s6lE2BooaE4rOiLskOCWTgCuP2QY7eJrstpHkfpGM99m21n
 aMPoaZUD3H7L6P1wWgpaaBUbaNcj2spn6vOxlkE+69mlCRHZglfafVkg
X-Gm-Gg: ASbGnctqJp0EjQuhk9xo1pbbHDsEH0EqLxmPNLurEBT+ZjNVwfN4KY4LASnnwvp1jLR
 itskdCrz755+6TNcaFxu76HF/XG4Qc/iAeipbbI45ie2FAAC7qhveyel4o1+0Wd+32/IiJpR34Q
 d/wgMPfseHdkRt1Hi+LjmXxrCG92g9kwnans/C77W0vSAhjOxGxgK4xgbXq1VdmSPF7PtcUmaCW
 CemT8ZzoYtBjkdCCJIRtjNPOORt0+4xyq3xeqCwh5W80uyZ9Zu/kuGqDcoiObTVLewS5iToVTNN
 8RolTyy4DoIq63vqV1PSSuVtwInwwbjyvAhLLEXTnCrpHCaNEuyjNJxULOIz0bfgh7rJfsbt2Vx
 W+w==
X-Google-Smtp-Source: AGHT+IHtIidebIfTt2jkkrOO6cFXeDxcrBR6iqFW0QLdbmEyB32yNlITHUCKNzRDp0DfY2l6KJd6Hg==
X-Received: by 2002:a05:622a:1b29:b0:4a6:f774:dec5 with SMTP id
 d75a77b69052e-4a714bd9ceemr41400951cf.31.1749637422582; 
 Wed, 11 Jun 2025 03:23:42 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.208])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a61114ff18sm85664341cf.6.2025.06.11.03.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 03:23:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 11 Jun 2025 06:23:27 -0400
Subject: [PATCH v11 3/6] rust: enable `clippy::as_ptr_cast_mut` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-ptr-as-ptr-v11-3-ce5b41c6e9c6@gmail.com>
References: <20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com>
In-Reply-To: <20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>
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
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile              | 1 +
 rust/kernel/devres.rs | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5eeddfbf5900..bb33023f87c3 100644
--- a/Makefile
+++ b/Makefile
@@ -479,6 +479,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wrust_2018_idioms \
 			    -Wunreachable_pub \
 			    -Wclippy::all \
+			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index e5475ff62da3..237182446db3 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -140,7 +140,7 @@ fn remove_action(this: &Arc<Self>) {
             bindings::devm_remove_action_nowarn(
                 this.dev.as_raw(),
                 Some(this.callback),
-                this.as_ptr() as _,
+                this.as_ptr().cast_mut().cast(),
             )
         };
 

-- 
2.49.0

