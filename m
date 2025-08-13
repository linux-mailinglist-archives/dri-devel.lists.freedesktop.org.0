Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB02B24E86
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 18:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F52010E775;
	Wed, 13 Aug 2025 16:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a+CkxRC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD2010E776;
 Wed, 13 Aug 2025 16:00:12 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4b109ad6411so343331cf.1; 
 Wed, 13 Aug 2025 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100812; x=1755705612; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dIkNXnCZ3MkK2KcZGD39lF3QssIupNbx0seswPTYcjs=;
 b=a+CkxRC57+mIAojPvol9BrQdi8k8bJxBuLRglQVSrTHRqptAjWD7dXWUC89cxGWSjz
 fd2CSkBV6P+MZONV1a8qgLoMn16AOsMklNbm+WeTkHf28LHE8+l70/eu82Buaqs7WI0+
 hsysqsT/xUmmznLpU/WBOeqy0Y2qbbt5XJdYfkzq6TxY3atnGGHTdRDOCZvzpCCoHnmM
 UzGoRkTSeiASZVOwZ5d21BQ+CyaWPg5cpPwdAJRoieOxam0lIpOOnSIq+FMnT/82hc2n
 7OaWoSKGYqISZ95T64BIa0S3WXZTxYX4yQDH3jX8b8VplmLgUEPl+vQ4i2whs/DMi66Q
 NrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100812; x=1755705612;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dIkNXnCZ3MkK2KcZGD39lF3QssIupNbx0seswPTYcjs=;
 b=f+FBJaoLNhTOjZ35ljS8AxZR0E3FNdaUP5NwAS/4c+1sY8M9EfEVzr0KvWDSbjpuqF
 VIny46oHrAu1z80gugmaBrUw9DmHNL81sYQz0AWJ9JDcYzb/5KYZOvRF5kWanfuGtoie
 uZDFMuL1YiVoQaFnuNF+ODNxoQxepD1E4ZQMD62B0DUfSE7i0/+NfmlI/u+YxV/X+hUH
 KZxkaINHQ16E1rBC3FCHNpIXdXnBETlsh6yYmwC9sKgzxqg8sESt7OJUN35GD0IZ7CX3
 kbFYjnXR+nDx6R/ps9VCvUEj2FLo0q4hq2PpvM3uz/5x+5veGl2kBUKYK+8qzYNZ005j
 6q9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXUOzCM54jmXQSYfSZ2pThDELWcR+4lg0ubqcnljTFfMlALlZyIRwgp8dKVAByojIFrW3LRV6EBw==@lists.freedesktop.org,
 AJvYcCWfvzsnMPDMGzBSjk0alCmPpwNfW1b3j6KzEflSomJE73X2rC7z/D4+S4dPzjxbQyRezfaPoyRuTfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywga2MRL1wvmu0KtGFiDPy1q34q2AVCkpEbwX5PromXiUSlkZ6h
 JKGdn7dh9ph4ZrvLOa2+HAN68xFnkh9nf8fdAeJPTacCw5+UQgIDYJ0D
X-Gm-Gg: ASbGncvAVdIG2vTdFSWGIRfDofvg87VQH6QBzvaWU1W+/NtmjtDex5uapFfuHp/A2gy
 Ixbe6M218qCq4M1ukqGiFPosWF3CY+CnIWr1RKyWVqw7LLBDMUAWeilBN5BfPMcQClsPH1MYHDb
 5kWHvkJKfEYKIvMpOFLrRLeB4u8pfcTZSpxpoD0yxWX8U8XJvi2fCgZtoDovyKRb3A8Wqdp+/9T
 LkgVeKzrE/qAY8++T44R/wMw0NFwyOQcgyYteV0NAhs8hP5JV+XeWDWZG6i4Tm0qrbX5uSi9CZL
 2Olp9mDNtqtdyaEt6ILttZYRXRLsi8tw3d8buGKXWvR5OaPY0b3UcHYM4BvjDZoeY7zv+KhIEXc
 Aqm7BtvV8++F+vrWW3HLfsb5ULArUf0Yy8kkLzJ4B2M3TUTkLnnXOjusf4NWYM+lFx2xJ1jE/zH
 8KhKYIfXBt9mkbUdKeq6R0rDAWRcfW6DzYFrcBub0=
X-Google-Smtp-Source: AGHT+IGB9luC8u+YHIYmHP0t2yteUQeoqnZL6RrlgDzQaKsQEO65H9dR+1IZpvQ5QqTEsI36AknLxw==
X-Received: by 2002:a05:622a:120f:b0:4ab:66d1:dcdd with SMTP id
 d75a77b69052e-4b0fc81b73emr47127731cf.39.1755100811571; 
 Wed, 13 Aug 2025 09:00:11 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.09.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 09:00:10 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:25 -0400
Subject: [PATCH v2 15/19] rust: seq_file: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-15-00be80fc541b@gmail.com>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=1328;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=bPLaN+gqrTPMFDwtsZirXHerPZbjjybhbgw7exIeXKw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGCU707SG1NbzTSxJCLbczm9uIyWPFy4Tb7N0AGhHUZZY73xh+gbylKW2yVpu6ZFFDVhAcw2yEz
 pJfQCnF7rkQo=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/seq_file.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 855e533813a6..518265558d66 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
+use crate::{bindings, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -36,7 +36,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
         unsafe {
             bindings::seq_printf(
                 self.inner.get(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
             );
         }

-- 
2.50.1

