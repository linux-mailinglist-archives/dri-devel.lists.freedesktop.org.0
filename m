Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D8B9FB39
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0588110E941;
	Thu, 25 Sep 2025 13:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8NpW7Vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050EE10E941
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:31 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-84827ef386aso62932385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808530; x=1759413330; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ovaMuoVhmWcLonjnTl4MFtKaHR9pluhUoUKBZs6ASUY=;
 b=h8NpW7VyVjQieP7hfa0kDj6N4MTYWQ9zb9QkRpg0X69/RxTUBghzkwubTXLl04qGwF
 Q3en5a3DA34y7DFknmaoOJqE/kO6TuDSxW7m3wO1E9Z8MaJxFZoj5EdJRODPETFKElib
 p1Lou8dsncdvFc7whM040OPw+GV0NQ/WD78trtyB348LJu2i3qYg39agArN7YIckFUxx
 LJDyR0RKlD6xXJFECKMy4LDubSXj+V3VRlxYIJe+h12LkPC7pqtqShnSw/8jGOI1iqdI
 2RBOAwNlC5R05zlQaj5L2Lgj3WyfujdjkbjQidad6c/3atUyYAQ4lQTempBtlXv/M4LK
 AlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808530; x=1759413330;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovaMuoVhmWcLonjnTl4MFtKaHR9pluhUoUKBZs6ASUY=;
 b=ZaDp5pfgZxbW+uHf4GdeT634gHrERpEKuuOzG9YHMZdQr3MHg+XpPHz/RbR2l74fBB
 dLuo/jvM3hFmMo61ps/YZBvcYtCUx3JgmANauRSMibxMcolJrkuSHmOGMcNBZz+Q0F4Q
 SdOGGK0nbKvVpJMScx0eddN9VtIH5eNxaCCVVrqtJYpXosmvUao+W0oTbbJL22VWc2wt
 sdpZgbG4+PdmaPhvA2YKFsaO7mN8B9yo0ZBDhMpSN4Crb1ACeRfRhbyKvt4a+I5Su6EP
 fHQWEbCRdYY80Bbp54/L+gUOiWszqndG8QvnUyGsBECbw812LUVybypm/TS13QNvdjuK
 YGug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuGQz9H2TLQy1F+rn5FRnBeSRXqHxbzgwWUm6oRxFtNqV7Jr+hrDTedyS0mXAQdC3wvGYhJEsOwKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTBYHKtfUjWIucrh8sxJLFx/7ISUmCY9PdmjKIheGvjV7Eke5k
 KSS42Jfp0eWBPkWwEzB1/TqhxlC0ikcN/rXaUY9oALyx5Q8937hOm/wE
X-Gm-Gg: ASbGncv04RpLVlD5Mwi4hv0wleMallnwA0HBt/U20SMcayVKTH2gaTP9usITm4jl812
 q6EBfYNutekvPbWAd+MFuOVRDdaNimFA6bkxZmbVaGUheaRlkQbr8XDsda/ynuISb7Jp3pmua63
 B6OGVUvFrv32wcIEqURTSSqdnmAml51lb229V2sFOQMnnroiV3g7a1/CSlqDb5KE8LW8kgmWZop
 xFxyBXUphtzP1PB1fUcHCAmlYxnlBXUMX3500XTtLbOc6IPqEexYSFjVNRydDjamooDXVd64lM0
 f7By8UM5m2Eiyu46xRTQiuLg+HDsPOzLZ6vvdlBmfXkA6BIPiYysGNp0BBvKLj/Pu0elF7egoJJ
 7QZ8cU98PB+dDFBw7dzE+Mt1+BTG9czb3gl/RR7ylL+L4Ddyfaeb1kOUhmu4pZez0zoZg4Givlf
 6dVOJGEw811/habgF98E4LfxgBPHAhXc2kIbYQapuM+wbjA3i0ij3fWY2aRDLWE/PwxEpK
X-Google-Smtp-Source: AGHT+IHcH/Zjn6brKl+FzN0cM+iQubEhxUKmnAUgz27UdizV+uwHwEDx4WTup8nJvc6pXzFU23iTKQ==
X-Received: by 2002:ad4:5dca:0:b0:792:50bd:2fa8 with SMTP id
 6a1803df08f44-7fc30ae34e5mr50026206d6.30.1758808529557; 
 Thu, 25 Sep 2025 06:55:29 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:55:28 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:00 -0400
Subject: [PATCH v2 12/19] rust: net: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-12-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1712;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=D/F3RUnYNMNKrZc7ezIrEwfyGQmWHVwyjceS6shQSWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLl+bRXWnt5oagOInMjpq0Q6TsOND3CIu30DW9zld+zzKdTSHrUu641mOBVFK+TECUsf9QEq85h
 /zu5kdzwmPg0=
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
 rust/kernel/net/phy.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index be1027b7961b..9aeb2bd16b58 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -780,7 +780,6 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -799,7 +798,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 /// # }
@@ -808,7 +807,6 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -828,7 +826,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 ///

-- 
2.51.0

