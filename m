Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF70B006B9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687AB10E904;
	Thu, 10 Jul 2025 15:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dRI5biqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB3A10E904;
 Thu, 10 Jul 2025 15:31:40 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6fd0a3cd326so11896836d6.1; 
 Thu, 10 Jul 2025 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161500; x=1752766300; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UIoKeX/8IwobjRqJguvSB5N8fT59ta6ahFnyjlyNQrY=;
 b=dRI5biqOkKYTve6nltvibDrKBmVjd6KFVb/X4vLRxBn7LP87UIB4p+B888fTiu6QiT
 t4GeGBUp4UGWzqrLF4M83d5oUNKsYPQIF56h7f4bx1PTeC2qRENfYDSJUTwD8hFTvZ+E
 IkrYUcO5h745xjdRJWaFXlqsIdizRiczxxmTYvfvQaho3/8cBc+FdF3/YSp7KnO32zUE
 CqCZWWtcpIncA/tlhVgLbikr4fEeMHAcgpKbPFEdYraTc793erIwAqHc4w44EFQhbNpy
 e+giO7RwxOXIKczXooPBRXGJIgvd0iifHCPmqDB4lnst2XUwi1Js99kLQ+DcKNidtdce
 OagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161500; x=1752766300;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UIoKeX/8IwobjRqJguvSB5N8fT59ta6ahFnyjlyNQrY=;
 b=C9wNxpF+wWWPrwNOLz2twG1Qkn86NyeREf7J5j0JqktC3EwL62YnOsjQVuA4N/XUAk
 T23bSE04BMJ5IbRgTEWBTN5n5fHXXVSfuh7PJUzZaH3l4ZX2ktaCD+Qv6u7gCjdL6Ko1
 ZUHg6BMeuCXlHoOWtXAq80bL5ItEggV3KRZjhGlC6bi9qe7n6yCVtzXBp8IFd3XIN7Ey
 O610vZ04ar6Am7jL7+DK6IKe6iTc5prwQ1Cz2spAs/l/CFM9rTLRnfVzjJI8zTLUhu0O
 +6Bc02idWiBbEvQBQ9eb4qBLMvKwa5k0fZkUGHNkM2T5Ey9su90wdMnuMEKJfSlKnVAR
 Kb9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWTsgN8/DghmkC8dqlhxL4DNPBlWOXRYdu8IKhl95UnfSvHjOzGswBBYKpyObTQBcv6gLJpUCBR3Q=@lists.freedesktop.org,
 AJvYcCWlO3ZvLddX7t8fsjrOOgm7v+vn9/xwBg5a+b77GtzXeYxNe+0/q43kYTYUxnIGuVqxFwenBS+dJQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzm2howyL/N3sp0B9xDnCRESZyAoyIgrD/k3VUzMQqgUYwMQ4w
 HU9Gj1hI0rDAzPFdMdExNguaniU/zytWvA0rB2zgtJjfrQR4bWth83c5
X-Gm-Gg: ASbGncshl//u7XuLInwiK1hfH90/V0EuKdYkSy+24eZgaCik3HokxzjjGqTTJa1yYAs
 GS8ZRNi4pfB6ByTWAh8tCxOBMhXZhtf6yvHpEhKTKwQ8SBasE422ntCwTdHxOftdnmOmB5ku8Ek
 MmQE4AffLVI6RWJ6YUcDJy6PviTBkm4dOFSAwTuDDBIAzuJb0AcsFmfHiHf/bLV5Ufuni97Cd9V
 DRJ5ugSWEA7ZNr4sHoRZLbUwGVe2g8cKvcUWUuousFeHJmFeQPM1ZZhK9HeOncI0Ihmp9sijchu
 NuNNNDuA9VdcYI5+rR5k/IA8qVZ5GgwngAxp4wVTn0Vl0jkJPnuD+E5SUwuiacXJw0WKZ8AxrXZ
 9d3PFWfZIb0TtyjnsjaNgzIEYfQtSFvNZryugQLwdIQKMtC1/uDE+91WySg==
X-Google-Smtp-Source: AGHT+IF8oHr5nLMMLgFUIh+26Oo3vEZrp2qQehIs/0HytXc2xoqaUlO0ptkhMM21EW8ipxSnApet4w==
X-Received: by 2002:a05:6214:240e:b0:6fd:ace:4cfb with SMTP id
 6a1803df08f44-704981132ffmr46767636d6.27.1752161499734; 
 Thu, 10 Jul 2025 08:31:39 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:39 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:06 -0400
Subject: [PATCH 03/17] rust: auxiliary: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-3-027420ea799e@gmail.com>
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
In-Reply-To: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
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
 Jens Axboe <axboe@kernel.dk>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161489; l=1183;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=az5NNitfUcds9iE19O7xLtIu231XHyJdqG76dw04NVo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI42baxaWQWxeOM7ZaAjjbblr9vFQZMLvDIIk3qF0FUq544A2sQ7lOWi1QLUpn5SnbV431+3dBC
 JpBmPn2X7GwM=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index f2a820683fc3..7c916eb11b64 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -5,13 +5,13 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    auxiliary, bindings, c_str, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
+    auxiliary, bindings, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
 };
 
 use pin_init::PinInit;
 
 const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-const AUXILIARY_NAME: &CStr = c_str!("auxiliary");
+const AUXILIARY_NAME: &CStr = c"auxiliary";
 
 struct AuxiliaryDriver;
 

-- 
2.50.0

