Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0266AFF226
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3743A10E836;
	Wed,  9 Jul 2025 19:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cPSNUrWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0194110E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:04 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a44b0ed780so3278711cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091143; x=1752695943; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a5mRJS9jwBBQiiJK8S6oQ+6p6RP2uXIAQ2P9j2lYyYA=;
 b=cPSNUrWQ2uzD1tBPaUNoLtmo2IjfoQAWyZ/u/NXetLILgJaSRutuhk6MvdAftx9xa9
 h73J7hbwHmDQ/5CJWqLxO0UTUa1/p0Fm9mdCpzUdbk0HX5R/DBcOiwxk0qIhoDSnDW2h
 AxH446mxGSbBMFpR/JqiFRutQAU9MD6rBNkTIaqudwK1ieloATlULBxW0fM9kZrIyQbh
 +VZT+TP1ptn1ShH8cyqVMRoHfG3DrA/NQC1rxr7MaZ3PTlSl7dBEuOklmTIZK/IZ96tU
 jRDiSCjF4AuCJodvwrd8JqyNGNcSNNAOiLPL0wzx1DbZlbkj4kH8OykSIIeC3+cuCOoF
 1dPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091143; x=1752695943;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5mRJS9jwBBQiiJK8S6oQ+6p6RP2uXIAQ2P9j2lYyYA=;
 b=vcZo/LQ8i4krT2Guc6me3MPZ9CCYGrCPgQm/RojBjlnmaHp7IeHMGvE0nHRolEuWZk
 kQFkBn8SP1AhuHRm9bOHa/pYYLXEzwspsHwnNekDziJLCpOikbL6Y4988tTO8uDP5MMC
 hXdRySjWOByf4iBit33yKGqcUnmltHNRIqS3EQIGyqAAXtPd+72AXYMEHjYfD9fIi0Jo
 4PqaOvvUB/xwcLzEJBQ6vsDrukyR7Ppn5Y2o8Mh+D5ZvVqIz8Vz4cbKyeloAXBhXxCO5
 oVEh4HNgCpIjE7UdkixFaGYzC0lmpdIAxSAj84D6BgpqFDOpJc9HDCMu7arB41MqE8Sc
 LRnQ==
X-Gm-Message-State: AOJu0YwqY6PZQtGDeH9TORpj9ZbUvU69jrJ857GKBU7VV6XcFL9awA8x
 9oP7gods8bNUUpslYs8AiYuznkMCiV0bsz1LEQkTZUpCci/3BrOan8h7QEi6yhz5hZivFA==
X-Gm-Gg: ASbGncs4Ms6YoXmclik0ixooVH4QBuaTW2RwyMw6Mk7PAE6a89h8TUPVdx5ZfwhiY9B
 vDfk27wK5xq4v41waCYrR/4uCwPAV1ve23mAjYpIBQZS6qSUaCXYa88Y67Th4XAZ69/1PIXKb4M
 QHzhPssxJJSV6dJtmEzn52z4rhGoAYImquBjHeHV57bR93adoP6VuT+UzgMKQD311Y8blCYN8WR
 luaRW8wg9rNCClQWOZLuCh1xP9BRF1zpFpKP5ql0/bOkBIL6jCWyWTThrQVcigN1LTYMfd9ZAO0
 lP5NvSthqioC2sa96E3oPL1jwC9qt8uje4HZ/hxD4CAx+lMHCQ2bUFBr1eMaH74xLJBvh8IFq1K
 rh1oxBIpndegiFfsmi7ZOlZATVW03oU2vGaHZL10L4PQ+n1fOl+Ji2bY96Q==
X-Google-Smtp-Source: AGHT+IHPG0BkuA4fRyqkWvUFt+fQGBTJDG5YObg5b61MjaAceFFFgjhYzSJ2Y03ODsdmoANPGTG2oQ==
X-Received: by 2002:ac8:584b:0:b0:4a8:182f:d7cc with SMTP id
 d75a77b69052e-4a9e9456737mr16555181cf.44.1752091142850; 
 Wed, 09 Jul 2025 12:59:02 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:54 -0400
Subject: [PATCH 04/10] rust: cpufreq: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-4-fd793b3e58a2@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=950;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=8SLUJN0pArh2Xs+AQVqqPE8Jc5PoXiouAMCuU/gx6NM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCSBBvB/Qdo7Tabh6D/Y/ufMXylmO/k7x1977vxiUWt55E2/ikWfKj7Ba3FEfs+ERIT0lcS7Wu4
 2oBqr5ncIsAI=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/cpufreq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index e8d231971276..71d601f7c261 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -1018,7 +1018,7 @@ impl<T: Driver> Registration<T> {
     };
 
     const fn copy_name(name: &'static CStr) -> [c_char; CPUFREQ_NAME_LEN] {
-        let src = name.as_bytes_with_nul();
+        let src = name.to_bytes_with_nul();
         let mut dst = [0; CPUFREQ_NAME_LEN];
 
         build_assert!(src.len() <= CPUFREQ_NAME_LEN);

-- 
2.50.0

