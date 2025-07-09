Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11AAFF249
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E3F10E848;
	Wed,  9 Jul 2025 20:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ic5Jaa5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547A10E848;
 Wed,  9 Jul 2025 20:00:29 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4a44b9b2af8so2020231cf.3; 
 Wed, 09 Jul 2025 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091228; x=1752696028; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t/DcNjK+ad89tRBvsQX+S6zpol8aKve5l6g7f8vctP0=;
 b=ic5Jaa5/fgmds97L4/Q/32maupgFmpLyLaBy0UG5gnYCuWpsqCjqWQ27ePtzwkycFv
 39Pgo4CQ+iAZcF6sJoAvo9kgnq5Vmn14Sd8+JNTqUD0Ac8QjaesEUHrS2mHjlAnc2lL9
 kt7OhC0/CUcHeC2Tw4OymNFZCZMPfC179OQPtL250w3cEA0vbR1h7cc0YqfS23jo5YK7
 QRDtxouT6+P1RnUjCA8q3y6rWl9JPiE64OvLL4BgL7cZTXpfVgS+OU9GpwBXTvcCrmes
 l6f750TEsAGsWaKwvdBtlaFTViT90qwr/pHUc4F9mbNC0guIk2CG0REC1NscdpL/WDGf
 hhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091228; x=1752696028;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/DcNjK+ad89tRBvsQX+S6zpol8aKve5l6g7f8vctP0=;
 b=xT1pZqg0x0awYIEupzYWYUETP+NYpZNxAfcge9RqoxACbGrEjWKmLHEtF4tAi/W3Xv
 wPz0T6TSP/GvDmR1osAqIdt3mmosP2hhixNA8X4/0u49/F1Flca8Px1U7xnXgBFGE6Yd
 hqK6dbxnsljRKH+0F9D4NUjT5lsJ1TiD3Tnl61Hvb0JoXkGZ5x1IVOrHNTSG4Dl2iptd
 xg3PcRJdW+otf7Qc/IW2nfdB+VFHBhyGzAa/5RVdJ/Na+DrL3ncRcgP1AVq+oCJus72N
 4FFLIVKp0NVIGKOYjpiJl4/X2DdgZ0/NajyC1N56c7lF+G2f11MGirDG8j3hm+nEMsrN
 T/rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH3jeBv4II8gyGi7exrjIV6Vn9+nsegqC0fmQTIUN8pRhuyWAhY7sQL39zWhrlShGLrx+f+rjAC1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLlcTyDaC509YciNSZOx9Hhs+z6gICcljQ12nBUjdPYGimdjlM
 bBgVfd/CHwtrUvMEg9mKR6yXPFUIa71U49uSIPDEQbWwmd02yKc9ZMV/
X-Gm-Gg: ASbGncvZkl3c9EDRHqKdywxCjvi0gBek/YMmsx/VlD+AdYA2M69X95FMj4u9OdmtRKA
 c7ANPtil7eMqN2r7BABCFDkzDmHwSD12vYxBAYwuM6XeuzFB2iAVVhs0Pijbr52Z95QM/ksmNFo
 6isIQjUG2RlCLG0VTc9EQS38z4t20SZ+kVeZdx1QONpwgTe+sBIgCE/RWjQkf3kkfoeFh1nrb7r
 a1iLQUw9bJOh360CKEUrDOL7DDmj1+eQhkCvbLjP969aW7aWaNkd0i78M1uiNLqIjQ6gC6EOD3p
 6Vqetp2+DLYHpsEggORcKEtV8Iym8Tx705/pdm5EhPNaVs6kFoPjH+PF1B2xV+tXwjYM79m6/vf
 XfvuyT/BaLtvM0ohJX/WpV1enqwwHltoj9M7TIYKPns4PZOq4dpRDKT6KyA==
X-Google-Smtp-Source: AGHT+IGDPYWz+E3dnMDl2IGcpOC6d+1Nh292sF9LOImxi5N/DxYBIIqZq2RWfnk0uSSfN7WXQL9XKg==
X-Received: by 2002:ac8:5713:0:b0:4a5:a96d:606d with SMTP id
 d75a77b69052e-4a9ded52558mr52943921cf.46.1752091225141; 
 Wed, 09 Jul 2025 13:00:25 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:24 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:08 -0400
Subject: [PATCH 9/9] rust: sync: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-9-64308e7203fc@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
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
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091204; l=915;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=6Oa3cXehoAzpEzhSDCacIqKa9qd81pBdJbPezrggmQs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKYLyzXzfoucuo4J/QNdzaRaKqUYTTxwz+z6ySMVetanHNnBRutB6OmGm/FR1SsxfYNVnaPWV3g
 F0cQtdEM7Tgs=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/sync/arc.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index c7af0aa48a0a..b366260f56b3 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -18,14 +18,13 @@
 
 use crate::{
     alloc::{AllocError, Flags, KBox},
-    bindings,
+    bindings, fmt,
     init::InPlaceInit,
     try_init,
     types::{ForeignOwnable, Opaque},
 };
 use core::{
     alloc::Layout,
-    fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},

-- 
2.50.0

