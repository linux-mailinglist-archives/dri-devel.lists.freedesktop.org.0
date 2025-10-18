Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA4BED607
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9A910E12E;
	Sat, 18 Oct 2025 17:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J709AQHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CDA10E12E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:51 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-7ea50f94045so61396296d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809550; x=1761414350; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g6x4i2Nx/KcrVad3Kw/MMDkaM+hSW8mJw3uIz+XsVU4=;
 b=J709AQHljQC701YWqcXAzzNpwd4Yk5HMtMKLWT2VZIvErGRjN9TxtmUbslRlrOdJm7
 Fz0+/SmJP5rbB+F4ttoNxmxz5CnnJYhjK3jIdyHrrkinbzGS2E+53SWVInR1VJ1nfR+E
 bTKNfmV0SVtVRVxn4eWOu0/wKrWsu/krwpnTW38f4XL+V67x8dtuIObV2iH9Xha28O5I
 ILfpo+WYz4teKCabGSgN2ZD1WydRmZ86owW9CcBprBPRlEyd1AM5U44dk+nNswGon9Wi
 2l37sPk0m3ATpCGf/vNHqnWDke68maDYq55BS5g71TWwYIpq1RBfiPondLcpxhK5RnSV
 DZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809550; x=1761414350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g6x4i2Nx/KcrVad3Kw/MMDkaM+hSW8mJw3uIz+XsVU4=;
 b=tYugFTiiqB+Ey3mWgaWzJWXSej4WgzgLffCL2jlgXLZWzWxFCch8foy2lOiiugMGUr
 ZvJnnMFmC7KNxSTnp6oaq70WQiSEkspff8sQ8bNTcInMd4SUGxeLXLMpjtiGoSj36aYK
 ChGWz6SVXSEvGEGqm4qeEDr/3Ihv3SnCHI+kWsg0BxExS4RdGanLujlNDy32mwJTSpHk
 f75/E00NomHckj1Xx3izEq7kZaZE6//0wZi53WPx1iFRT7lBBS/ez3+cgWbjuSqdh2uD
 VkUW0uud8G5njkzXYQKWNDQpxPYt2ZZXTVluC2UceH3hMggjfo2ErCb2q029ysNFoliJ
 J6+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5+u1OLdhYn4gr3Ax2HORNZyN8hGlScBEfoE5ayivgV2I9m/nGd3Lhqw55QGu4/pdLpL0Wli1Z6G4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5BhnPKlz7hM2S+/FCRbFlwLNdVXvP1z/4J+/WVWdSmq3e626r
 aPJknBAzQC93EuEB3r/+7YKsgVXvRJpjLwpuljCFOEcYe6B2+6i+/8Le
X-Gm-Gg: ASbGncuZ3VfD8qf9h8XsSaLELTVUh/tcabLp2Pd4FueIPMH+LNhORgtq9onawzhK20e
 R+cEugZtj//M+PZ3sHdFKOkj6yQHebw1VXALQyElrEFlxiaO3eIuRAc1/xcr7TEh/QEkDH9gWcy
 IHdssW2O0CscFiQfxqu3FNnqUmWMt/4l0G18kgzY2xSNAjRTjj7NkK+MO7SsMUbTBH77ECDSbCx
 bUI6k/6p3wel+gLT0GJDFvRtZE48A1bcfTRrk8Nprax54k7e/nNXEFtZybK1rHegOzztKdQaNqP
 lNr+GFccyx+9YIaOucBDTUe9nTIHgE5PXaTHTID37vEsSNLiRWu83YSoWMJe3YT4XDc/Mqs/yH8
 wFwsso4eylUwsW4bZWbKE3CfEsxWw51OrptUUUOZ/GHSyvFWtil/bQQruRudP+tAf3KL19/OmQY
 h7E/qDv6OZJ4ZDRRgiPQK4p1lu8u2XXJHlPO+mswK6l8jXS8Gy2Cqg+PjwaYp1W0CaY+/j1JSrb
 htmKZTs1Cb/BN/Tz8FxdH0xV7GYjVQa8xcN7C74O53pb2ilNpsC
X-Google-Smtp-Source: AGHT+IFp9Vyr6DTgU7wMi5TzpEwlGd9IqV/k5vFAlka/PSHuVo2bkmg6CmRBEzK7leqOE/jg7Hax7Q==
X-Received: by 2002:a05:622a:609:b0:4d1:c31e:1cc8 with SMTP id
 d75a77b69052e-4e89cf24499mr98131111cf.22.1760809550121; 
 Sat, 18 Oct 2025 10:45:50 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:49 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:16 -0400
Subject: [PATCH v18 05/16] rnull: use `kernel::fmt`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-5-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=1568;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/cgHz1cX/7pqPCiwokdGYY23t2YMKDX7WgaCRbImZEk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFUyC4lRe8XY0+2gwbmqCYLMq7haRexJVvoEh9TOXoK7TJHzmAqN9kHMrHdHUQpbaYKcy+kW0rr
 jQd4qaEURmQ0=
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

This backslid in commit d969d504bc13 ("rnull: enable configuration via
`configfs`") and commit 34585dc649fb ("rnull: add soft-irq completion
support").

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/block/rnull/configfs.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 8498e9bae6fd..6713a6d92391 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::{NullBlkDevice, THIS_MODULE};
-use core::fmt::{Display, Write};
 use kernel::{
     block::mq::gen_disk::{GenDisk, GenDiskBuilder},
     c_str,
     configfs::{self, AttributeOperations},
-    configfs_attrs, new_mutex,
+    configfs_attrs,
+    fmt::{self, Write as _},
+    new_mutex,
     page::PAGE_SIZE,
     prelude::*,
     str::{kstrtobool_bytes, CString},
@@ -99,8 +100,8 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-impl Display for IRQMode {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Display for IRQMode {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             Self::None => f.write_str("0")?,
             Self::Soft => f.write_str("1")?,

-- 
2.51.1

