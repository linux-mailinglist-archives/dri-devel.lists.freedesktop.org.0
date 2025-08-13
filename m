Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4EB24E82
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 18:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4DB10E773;
	Wed, 13 Aug 2025 16:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DAWqTHb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700B410E76D;
 Wed, 13 Aug 2025 16:00:02 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4b109c4af9eso199891cf.3; 
 Wed, 13 Aug 2025 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100801; x=1755705601; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W/OjcvLjUPzFCyg8jVNcHhnvtjPK+Ol7GWEqlUb/j7Q=;
 b=DAWqTHb0QzsE0DwFNgLen3fMsRtH3Ad2Y3WD4NSHYh+dZ+B3+jkBO6+bidYzDL8op9
 uRN7CpRr/vooaPb2YlvplVBsen/o4xNlx3tpPxwtc9V/Dsh8td1/GvkQdWLq5LBDTKNk
 cABWC+sSOeUdJHLg23PvFCDzHwigXtK44DJQ3hOYenfii3U3XYnRC6Wr7ol5Ym2qui2y
 VOpqVopts/ny1aJ8liAlqYWeS43uboh30VZZmhB3TiAhuDefWAAEIA5D5IHIahuGoZJr
 gcjscsFgTUdPCe5seaet08v0zq4n066/xnYTWs/ZdJ92TtfpM7nMSTJMjG8/7jnqUs7k
 xu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100801; x=1755705601;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/OjcvLjUPzFCyg8jVNcHhnvtjPK+Ol7GWEqlUb/j7Q=;
 b=d9vuwZFeq+W1MycMeNV2TAFCHBYxiDNuUlfRUdBOJ9tjuoj5xqXCBNf23rjdK3dGnD
 ll/Zd9OS39U+Wpyn7tZXavjC/1rSvUbYpusHTP1bU3wPhfdSlT/TyPyxBBMn0CB4ERsv
 +oHNtZ7cXE8TZk5S0OTstdMMeP+81+hKgG7fEnC4yd6yz3I3DVjp2zaSIZ/zmfD1CD/a
 Xy9Jl36iO8Pksitsnk8/1+y82PQtvsRmPFnuEybU+pfkAu13vZm5YZdnotfD2j4ppqb5
 3vXsJwBRgLGZ6Z9o0K5KI/t2bWsAGud/HYPWm+pZnpalapgcSmNhO6mk7G3egwBp5+86
 032Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSfnv73i7puZMahp3QChPtOTBuWJxxXuHxCZYV6Xpn0kInkRE3MohNVX9/wYSJ2eNc3uPtZdgPoPs=@lists.freedesktop.org,
 AJvYcCXW2C/SjKPDb8yZiYIkPkB62Df8yMK7CCYeKqxIsA/IYvvdX4Ts2QpKBdrKOlOpClK+CFmaEOHWAg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4U2cOzDhMBsvuYtwM3ZwnAKT0jIp6go35lfsslh+ZVeyH++xX
 tqa34jGbg88NVkyxcDsiezJmfyI5busMAneDIiEZONA4+3Hx+5V+PKBM
X-Gm-Gg: ASbGncvHw1zAXeSsIlNFeV0qxcrjqQQcCOW7V0L4YECd/bg1gcyCybZ5HDfa7SM6YW/
 mFqo0iWBaO9pQqiRaV7+d1g0dzGV2omu/IC8iltShLfbg9oW3tSbo7mh/KgmqZO5ef7txJNwJxG
 BVxM3PWa6Njfhfc2KdiryOrhXhHQKG45/8R7v0DTVj3zCQznnJMnVJaHy4oECn7+d2HywZDOnrF
 gIv/VacTuXpThhJnb22UiCiY8XFM1HXQBZYCWfd6fHxMb4mg/hLtTqHg3RJQ5TbNPZA92GcAp1I
 t1Ge0WHTFP+2WGx6vC9wk44hbvGH1ImLahDWpm1ezUjlytnnvkMpTzhudd4esEG5UeWRThoOteC
 nR5rkn+Yqf8RPfvpZoeY2ufd+Fnlwd5vpeGM+MY/OkgxKVuhqlrAyvA0NWcFPJA+xot609xmh4b
 XNFY1XQAsB3bUUyFNLZQO5KJMxbCbpUd2/Y/+F4aCQehLTowFmtA==
X-Google-Smtp-Source: AGHT+IES7vk4zB0ZC/D3qMs7OTSn5Dxg3UcQGWucgQyc/Iq4csLIB9eF9yDnaBryVWkEjj/KjEl1iw==
X-Received: by 2002:a05:622a:4d9b:b0:4b0:670b:f21a with SMTP id
 d75a77b69052e-4b0fc6ee628mr48601731cf.5.1755100801145; 
 Wed, 13 Aug 2025 09:00:01 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 09:00:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:22 -0400
Subject: [PATCH v2 12/19] rust: net: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-12-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=1712;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=FCC+E1xmBS2zbIJe2GHcKx3NU/Npdnpc3auNCZaC3ZM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHkm7OAhkqupu/r01/ORPl+xGRNBHMTZfNmyT7G+V9MYSoET0dRfxK8dFo7H47XEnCgLYL8iqa1
 2FXZUDQ0x/AI=
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
2.50.1

