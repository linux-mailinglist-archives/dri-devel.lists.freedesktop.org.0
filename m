Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B582BED622
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0E910E149;
	Sat, 18 Oct 2025 17:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bp+ZynlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D0B10E182
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:46:07 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-88f2b29b651so438465385a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809567; x=1761414367; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sKB2rh6EiQ7umDMD4HQ+ERdIpZM9C4N3KJVnDXEYlQU=;
 b=Bp+ZynlEMEldQyojNmFHMeoSWnq2scR/m7CBFRKNsagbNitCj5Z3D7+5wfb9co4lrC
 M7jZlsnQl9enQwPYAM6oawZybRdwyllnJ50sD+CPksJv+YwsvLDFzEeNKYVizNEAQYyO
 1ytVnpIsbnaVA4TBRAvAkEVZ1r0RqPIItg3OTn738RX9ygBW9y2xJaL8lsO7CaLuQepG
 5wmISZU4+hhinpjIApD2SSIiLDUB9ksBS3ALvLjNmQmapsPpPC3qBsZHWjw+M2MbFWIk
 Q5PHm9AblWTu978udqbsTyWNK5o0M0U7wTa3NzbI86dqmYXRdI86iH6K0G8oHMxrpYAz
 B0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809567; x=1761414367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKB2rh6EiQ7umDMD4HQ+ERdIpZM9C4N3KJVnDXEYlQU=;
 b=GSAGm9kMVnwJ7gHZY+RGpsS7Ytf+bSlq97Sf94bhc5imRMRPEANPzBavh3mVkwnI0y
 khhEIlHQEj062LKaqLfO20PMoRBco69NanRoF46hNsUzVh7tRIRC4g2Zg5piC8AZHRqt
 qSDP2wX13SMVrtgxwMTgIxaQx2RM4aOeCWRxk0PFTbzn4QkUCBXmS0j0VIVcNEki8DHS
 OWOf6/K1n2mEOUTBO03pKbP819WNVFbKOeJc/fhQu5iwaMLo4+rR++B2NARivMdoNjgU
 phdBBn+t28xFoZbWqgYf284aXi+OS4bq2e+8IsoxShzW/Iw62cVBOUA7NkfjLVt3n7Sr
 w4YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrNY1iXtArcCDTrXMJj0asv/fwCcdjL1AHj1K8neAOPNSQrrbSsgEFJ0zjbpRr9Ux5hjzmDzQXKjw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPRJFZ1GVqRHSUhdoHyiZTj6Mz4qIllZR7rFfWXNVpjcWu1kLn
 0wxbevohCteR1kn46J9fXEACURpw4vE6BL8paZGwK9iwp7IWpA/Zx+51
X-Gm-Gg: ASbGncvRBtUN8XsFAj1TVAHzuinUuo+En2C7K99eUmbiCcPwdSbpPOkL0gPtFgnI3+y
 ijo4EVG5byGNY/cjQLHdgWJTOdDWr1IwpYV18pgmarTfuY3SAlIzgreOGS+AX8COGgpsUVpnKcb
 0KrH+y3tqWkIhEskJtNSPld8Qy5UElOwGBtIPqAgqEG0SKz0G55QmLDRGyAf+cLnzE8l29Hq3LW
 gpIUs8pYUJyZgbMIs/MbERwMU0wLzHo3IOHlQ9J0i0t+43Y3pNPG+6tLIg+LjhG4AtHuN6pshpC
 fEePsssFJCyMJz+aUlhH2dXBmoqXy/yj6M3BH3C10vXe5S8KDvArcaXFTaZQTHVwS8TfLuNjeyG
 UrujYKug56ppmeLU8P7Wdr2CYsKZ7rFxi4on9aC+E52+OOlTlPPw36kd+u1rQD3jJxGp0OqPzWf
 ta9kpQmki89PH0EoLru+QaVh0MpVo7EFgUHiaCQyIxd1R5L6dCU0p26brwI3bvjzTmSLcuzJX6N
 MP3JuJ4oEZCSrUKm3bmnYlQvOlWNeOYVr7j4Q7Oh5HbhgcV2+CoSCyO2EC4KXg=
X-Google-Smtp-Source: AGHT+IEi+T9/sjZ3+qvtuzBCO8Ryg37IjVdgJ7+/CPsrCZub5GHtmSQZv61we6wEcfm1jaszdnCtzA==
X-Received: by 2002:ac8:5908:0:b0:4e8:8e75:1875 with SMTP id
 d75a77b69052e-4e89d283973mr96538081cf.23.1760809566774; 
 Sat, 18 Oct 2025 10:46:06 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:46:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:21 -0400
Subject: [PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=1431;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=W0kd+lIKrES9E6f3i/NvYS4ZToF7HAzoNGFG8gcpmao=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEAqWyd54iXxQf1W7agZsuXCPqrg/zEyTWXe5pjUlem4d91+xriJLoSF0e5Up8mkLDTG1Mc0sF9
 CNvCQrLokrQ8=
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

Replace the use of `as_ptr` which works through `<CStr as
Deref<Target=&[u8]>::deref()` in preparation for replacing
`kernel::str::CStr` with `core::ffi::CStr` as the latter does not
implement `Deref<Target=&[u8]>`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/opp.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 2c763fa9276d..9d6c58178a6f 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -13,7 +13,7 @@
     cpumask::{Cpumask, CpumaskVar},
     device::Device,
     error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
-    ffi::c_ulong,
+    ffi::{c_char, c_ulong},
     prelude::*,
     str::CString,
     sync::aref::{ARef, AlwaysRefCounted},
@@ -88,12 +88,12 @@ fn drop(&mut self) {
 use macros::vtable;
 
 /// Creates a null-terminated slice of pointers to [`Cstring`]s.
-fn to_c_str_array(names: &[CString]) -> Result<KVec<*const u8>> {
+fn to_c_str_array(names: &[CString]) -> Result<KVec<*const c_char>> {
     // Allocated a null-terminated vector of pointers.
     let mut list = KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;
 
     for name in names.iter() {
-        list.push(name.as_ptr().cast(), GFP_KERNEL)?;
+        list.push(name.as_char_ptr(), GFP_KERNEL)?;
     }
 
     list.push(ptr::null(), GFP_KERNEL)?;

-- 
2.51.1

