Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23A8B0B242
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D8610E0DB;
	Sat, 19 Jul 2025 22:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WoLwGTDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DD710E0DB;
 Sat, 19 Jul 2025 22:42:09 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7dfdcded923so358550785a.1; 
 Sat, 19 Jul 2025 15:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964929; x=1753569729; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zFFgiza+Dl5GdaqwlbzwLTdeCZ/jp+2BcZVRLKHMbXE=;
 b=WoLwGTDC7qFs3BRQNkPHhBJ9jc0iZwmLzrLDXerdpF8gZ5MCAsQya9h/xny6iKFHgX
 eLxA5S4cHCzJcUEYU+GoVS44LMavRrG0M+wdr26UStouc24cR7mEBeaDZYLRKWdhGCGM
 uwkQEVBzr36q9BGFHVNXuo81d5WXtHQoljql8763xbkzaAcu2I6GZaHkLGOmvwIb1i22
 HGlRb9EMxILdK9vJdaYgnt7FgDKEEg2BthXpgYNw4aqIJAwH79WwJJ/eZvldTSVaiIc+
 +p9Vz+13iHfW+i2qow6C85+TzrlRcRCYT4x00F5+z0yUxjnuNbY3bG1+IBhep9tfz/38
 Pykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964929; x=1753569729;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFFgiza+Dl5GdaqwlbzwLTdeCZ/jp+2BcZVRLKHMbXE=;
 b=plcHQE6nfFMLLTrQI8tkiMHmgovr1YBgPF8Essa3ZKddAiyOzKdKTsOz2wzI6wT6Zc
 6JZchPA88//V7M2MMPWMcSqWrnFwZmEbMPgVBC38huZytdDZ7U98kOGIw/53+gP6IM1b
 +4+DOVl7BLPBAGGzQ9XEFJbd5cECKYYQ+aP5aoAXGqwXA6Kv+OIEXiOQGT5SUgl9jkFa
 7npzLDUS8hqQiBoMZV7cWIKbENbKZVuG6+o8CKCczv/FwXwW1Sc1sYBPv6ek9hisO3KX
 nP1fltUsFX1IM+CcBcjCrduND8GL+dJeu1R6xod6bnEb67+GgFrVw+xR0Lp0RinrTCWb
 3kaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCLMdguoA/tR/2HlsOUVH1hbYHP3sDEdUPv74qPqY7ghizjTvnwdCd89kJ8grK0ftF6Mwj65H1Zv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFXoiLc/vbcT7MNu3Ls1I+FmTL6zDVAttykzgYX5Ak3QxPVsEz
 RLLa5D/RG3JWQJAWHI3/uyEEUCk8qIgoK7eQ5xFtowSzGS2jh1cTJ8TL
X-Gm-Gg: ASbGncsg22iRpbzTnKYZBcbPf4lpvhTL39LH2uo8sa3O9gJ5z7x+euOzPjOaIeqmuvH
 IN4aOFYgnQE7XoCsqxi9fV9J9hg1dHu61bqeOG1E452/wwaSu54NAb1nZW0a9DaId8NU1roviSD
 sZvb/LAfnh8iWBatrWEzvZJr8Jvkv8/ECzseIA960prM5oTed4cu8RMcgHajhOJhJnBmPYyb9BR
 nl2zN161Ex1Sgj+mdP5SvPF85C9TSEhlGxS9LTNgKYxxzdFQriy6pEmM4KeYwyRonFZ2hMhQNU9
 OJ3FO+xNXEfKoz7n2liH2BsG196easEvXw9vhaaOgSYHa4+nsBZe/pfT9p/8cZbbQE4RXpxSUq4
 X6WOOAGusEmh+b+ef6BBiIs98pxlNGkvae3YSweLRMDkNph07202/Nvw2TGm9I5pjTpKUTO6Nb1
 yxvjzIwSTnchUdkWDOfYoZMqnakbT+
X-Google-Smtp-Source: AGHT+IGidME1gL5I/0fPjfeSylawYS4pDe10fawmQtGosH0orgzM7W+Vd2E9cgU88UEhGWwteFt0yg==
X-Received: by 2002:a05:620a:f0b:b0:7e0:e2d7:e03 with SMTP id
 af79cd13be357-7e34d11a7e5mr1856621385a.7.1752964928659; 
 Sat, 19 Jul 2025 15:42:08 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:50 -0400
Subject: [PATCH v2 1/8] gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-1-1ab5ba189c6e@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964923; l=2160;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=iDkIB5rvX8tJR4OLhXYS4HL4jEYmtSfHiux6Jv9xhWk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCEQK33g2u0Gt1gVO/tbX+OT6Hyrjr11/cEuKmthxY1k5d8m0r0rWBWJTpdLTKfL3Hd05d1yLgf
 tmc3AOoa3WAQ=
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/nova-core/gpu.rs         | 3 +--
 drivers/gpu/nova-core/regs/macros.rs | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 60b86f370284..f1d72da7fddd 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,12 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
+use kernel::{device, devres::Devres, error::code::*, fmt, pci, prelude::*};
 
 use crate::driver::Bar0;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::regs;
 use crate::util;
-use core::fmt;
 
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 6851af8b5885..759773a19480 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -106,10 +106,10 @@ macro_rules! register {
 
         // TODO: display the raw hex value, then the value of all the fields. This requires
         // matching the fields, which will complexify the syntax considerably...
-        impl ::core::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
                 f.debug_tuple(stringify!($name))
-                    .field(&format_args!("0x{0:x}", &self.0))
+                    .field(&::kernel::prelude::fmt!("0x{0:x}", &self.0))
                     .finish()
             }
         }

-- 
2.50.1

