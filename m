Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DBEBED5E9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E316310E126;
	Sat, 18 Oct 2025 17:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hPqfI6Wv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DE310E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:36 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-87c167c0389so46792086d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809536; x=1761414336; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fmofoJkHkMxsaLhdlprPrmfRRb4k8Y1fAGmfllLm4kw=;
 b=hPqfI6WvNKUMEt9E5h27oVmWvKtrWL3rZ4wIZ6fFFuskJ4VFAFCNlCwH5FHc9yI9iJ
 /nyCcNXyuoIt0PYX5sFDHy8KiqJCsxKQ5/XmjB6ElMXsYg5tg3fKmpc4UpkPrhqSkApV
 MdspfU71gZIcf54OhKPXuGS3fYE7PH3EPVja+/XAEOQP26pTllAwZxVQ/GKQaMFzjUGd
 h8GWONnnuzL1SWoK7H/dRp8/28JSgful1JYnMLAQl/sox147qn7jSBHNlGnDVwwwgflW
 Wqrk0KhDIm6B/LOhIbvMAYsPEem/KlAZGXznnS6p0cSkHpsv6iRyo+jAEtk4XW+yLMbu
 I23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809536; x=1761414336;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmofoJkHkMxsaLhdlprPrmfRRb4k8Y1fAGmfllLm4kw=;
 b=FqJa7gqrlgw39bxZiZnDbl0UieJvraawPI2RTU+v8yFjnsf+qlvuUAhcZWTk8motSf
 YGcE+6opL7oOwpqHSNZGdXz42cZDpP4h+2I0ZWxS0pJSfDoiFYP9rhA+JvOht9Q0X9T9
 u/6Nn6k9D8BuiA4CBTc4CTF//cAI0S04a60OzL8E2o3ufZgkeRhFx1sIra0j5yenbnw5
 Mn0f6sLri3GEM0BdKfr861AnucJeaMKI/fgNdYvrQ5ZMx7p33xVcI0yercWEGxwA9pug
 GuY4HLhiB1Xs51UmGTE/6Pisiwx35+7/mXZOUJ+z15AEEYNSQLh4Zyv2UlRJPV2CM692
 ksRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnCpMCCEHpfCszcTtRufEAT6IZ0XNSBar8ZtVuJ/kiLvp/N0L1Dn2BsEo72a/J0ybktbtufm6eriE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIGER/ZZXms7u4iL1rvOXLQp7UYSOVL1MitzHqo86CnIIMp3P5
 UfZorVzCkQZExdFiBjmsxCeehnGMGq+3GudC8VocWLh+Ue1APM5oDkJY
X-Gm-Gg: ASbGnctVdeqIKnhX3/83n1ZcS6c5qDyL94XfbLhEl4i8aELViWQFR3HQTv0A5p6H6aU
 czJox5z8312W/3SKwUD+ihGWgr3phFxmywPqrYvKSfFcq1EOCGRaS8nlqv3IlYjo2K520ZsJQ6h
 p9X0019DWnhjkl0SJzgn7uZf2fM769J1hIX9IFS9Wa3CCDuTozhmyQic9V4o9oQEYCsn+G+R1mh
 vJxgKsLYkA2PxXc/NM8d2bZeBzqCBDrYTmVNjpBvqdh//Iw/e8kqYH7Yk72tpgmyVNOSrJpb6BS
 GLAVShchajaWsosPL/eMTNfyC4y76gVy/HK9wpbsQ2ZlirDP6eo78NJnEgmmiHerOLKQYD65IPg
 vPYUChq5TnPD4ZkDf+oe3Mr8jHrGnNbS7/wJBLl+hcdFoJTIBIwbKfbbPx2RE9Z+GwcSxnK4jil
 hE+oQ9JGgQDX6thI0joamyec4HKWomUgwjRJOfygZ+QktKQrHJ6sK54xrAlA5igHlXBClIGJyVQ
 qAxH5BNyzD5JbyspfXkfiH4i1BOsg6MmfpUQLCKy2U3WswBEAZI
X-Google-Smtp-Source: AGHT+IHGPyNylAC+NcjKR3LVCwruQ+XagK91t9ZK/AgOi9yexcJC3Bdqjt9T2UkkZHJl14b1ky8RWg==
X-Received: by 2002:a05:622a:10:b0:4e8:a664:2cfa with SMTP id
 d75a77b69052e-4e8a66467efmr59406621cf.34.1760809535454; 
 Sat, 18 Oct 2025 10:45:35 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:34 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:12 -0400
Subject: [PATCH v18 01/16] samples: rust: platform: remove trailing commas
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-1-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=1642;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=5IzviSKzcg5QXxBA9uZe2s664KTsV8Tne2rtRwo/bww=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDwRhntvVCGUiRlEkiv1zZeGhdA6rD6SNhGZH3QI1C43PlBagNvzfDvivxfFTU380ObMT25PMu4
 pe9SrdQ8j/g4=
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

This prepares for a later commit in which we introduce a custom
formatting macro; that macro doesn't handle trailing commas so just
remove them.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_platform.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 6473baf4f120..8a82e251820f 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -146,7 +146,7 @@ fn properties_parse(dev: &device::Device) -> Result {
 
         let name = c_str!("test,u32-optional-prop");
         let prop = fwnode.property_read::<u32>(name).or(0x12);
-        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n",);
+        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n");
 
         // A missing required property will print an error. Discard the error to
         // prevent properties_parse from failing in that case.
@@ -161,7 +161,7 @@ fn properties_parse(dev: &device::Device) -> Result {
         let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
         let len = fwnode.property_count_elem::<u16>(name)?;
-        dev_info!(dev, "'{name}' length is {len}\n",);
+        dev_info!(dev, "'{name}' length is {len}\n");
 
         let name = c_str!("test,i16-array");
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;

-- 
2.51.1

