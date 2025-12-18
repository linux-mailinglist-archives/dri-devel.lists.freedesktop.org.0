Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B2CCBFED
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D0C10E69D;
	Thu, 18 Dec 2025 13:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nrXBWqa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EC110E69D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:27:51 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4776079ada3so5189535e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766064470; x=1766669270;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jK28JFeXstDuyy0FEYnFWM4ECthU7/SRvZ+Uc2K8TMM=;
 b=nrXBWqa4Vpjc9jd/vs4Ba69UGKjDnROPEnet7ZPiM13xmH7QbBkmVDV+0qfHO61npy
 65/wEbHwbyzVQD5++L4NztG95CFOPB4UUColz4QN3s0yGegbJV4uZNSWMRymklIj1ZyN
 Zu5j8y+zBZXJo4nWdWv+GIjta320dUdGWN5h9GoIPe8oQwa08Y/CDjGXWlzq9VhZYM7F
 IbN+xnJWj/97rDwbtuMcHHNi5+8x93geL/qAdZ70bJDj9uK2bfDLWqCg+S5VrQToutkn
 bmOtpbahwVlYgodub+htBoD78jRzLXnpTBRWdW4KTinaBip86T3dOBfBSBgfnw7mfrZg
 GXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766064470; x=1766669270;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jK28JFeXstDuyy0FEYnFWM4ECthU7/SRvZ+Uc2K8TMM=;
 b=iKmKSlr/N2ipfX022MZ2CezRk9G+1nyhwZX4JWi9sOROcbF0LFH8Efyn+Ov7gDzUYt
 D9yCVxN8OuGrAUOJy4AaI9tTRvS7PG+cs43OrpyQvBUaCR492ky5TXaJCo3urCUCATb4
 yOxyrYmJmEMcW2DUrTU578HMa6GbioWVmQn+ixWMPj7rkGCErfQywgspPUqApJma3H50
 gWAG3awuQd3SgXLChbu4f/omxYMrNY/C/udz+zMHEc+AtzIhXNQ4AGcYP1i7nln1hf97
 bkObSODofK4/Dj+hSNkS6F6dipW7D1Cnzs2gkqgvuTkGycbHsFh6BbFANzyIYUQ2lIWK
 hudw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9k/z5r32FqMd9yCZys1yMN/rVYkYFyEk9x87240OspSQxkVnNgILu7/JAj3vIEw/ttthIdYtGyA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhdGxgNokNjnAdeTUICcykvSPAwGZtGhsp10T4fGFnAK7RTE5O
 dkVb9R6WVSlOruOzax1V4vdhl4qAe7DY6hJ2zxuZpUEm+wv7uzVayHJKA7SCcoRLqD+dGnjIs/F
 MGk29yt8CGAJF01heLg==
X-Google-Smtp-Source: AGHT+IE3mV0hHlOMpYVWIjAwdmvo5jE0L9sBOpWL6XsbMzQezjxagjqpMFllYAiylsVjD8lLgu0n6vRFRAWYICM=
X-Received: from wmgp21.prod.google.com ([2002:a05:600c:2055:b0:477:afa:d217])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3104:b0:477:fcb:2256 with SMTP id
 5b1f17b1804b1-47a8f906dd3mr228600355e9.17.1766064470141; 
 Thu, 18 Dec 2025 05:27:50 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:40 +0000
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Mime-Version: 1.0
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=GfyAuLsrs0QXvlLECZS+Ag8ZW62Fz2Y2rspmoop5J3s=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFSGE9hInQJ93qtSDZ6USDztanUVRXYt7zuZ
 u/M3OKN66SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBUgAKCRAEWL7uWMY5
 RpjnEACSGceY2rPEdAJ9IM0nAQ/WAryJFpSfxt+WLrj3iN4p5BmgrDdLtUBRaFYTYqcli8hAS05
 YJwMVlfRAd6iFo4DaO3eqnrvZQRPSaBmxegr8FhHpfv8XSaez94scQlMk6FrcSlvrA6Ee4Gtlwp
 l+ilXpbYOyAubw6GpjlWswSHxKOg0QwnWCzW2KwjpbXJnfLQ5fH4lcncuzMfaAkPvCFV4t1y2KV
 kaWXQIWrkEvVGzZJssbmxCb1PvSE6oyjcy3TzBBSM/E1t9jJSdXBS+NfHM5gMDUErPaSO224COW
 ei9hJ+Rb2IfKuZtQ9gud09brWgGvjaOVaiC9LM5c3bNNygut/rL2sqBDf0eUnTjZZ4hl4T7zj9w
 q/VO+QeTNdEDV8AfXeYCZs11q9X+mpJK3MYCF7ZLQsBZFOiaSgTwrF5Q7PSXXxL860gZaGED9so
 hqtSPCzOrli9/mHqIoHfLoSPuUaf2bxTBaNboLD+d8kdD2+h9FLLvMhgGVhXYhEUmOsBKZC9MlN
 DwpN5R2dUuDE7iXXAi9r6a3YRd7J5IHGfhXALODtLYLu7bdkcna8Ggb35wgjrid9IfeQf9eEdVQ
 9zkYMJevx5Tf5DKTw7VxZGkTJHxKfsL+G8+CcVjptxDvHWl4UkCa+/HLohudluaxij+Yf/xnesA
 vfDaSFT0gn04/pQ==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-1-e48b2e2f1eac@google.com>
Subject: [PATCH v3 1/3] rust: clk: implement Send and Sync
From: Alice Ryhl <aliceryhl@google.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 "=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

These traits are required for drivers to embed the Clk type in their own
data structures because driver data structures are usually required to
be Send. Since the Clk type is thread-safe, implement the relevant
traits.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/clk.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index c1cfaeaa36a22be2e3180b1e9142bb608ab276ea..d192fbd97861212d738d24510eebcd99c9177f2c 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -129,6 +129,13 @@ mod common_clk {
     #[repr(transparent)]
     pub struct Clk(*mut bindings::clk);
 
+    // SAFETY: It is safe to call `clk_put` on another thread than where `clk_get` was called.
+    unsafe impl Send for Clk {}
+
+    // SAFETY: It is safe to call any combination of the `&self` methods in parallel, as the
+    // methods are synchronized internally.
+    unsafe impl Sync for Clk {}
+
     impl Clk {
         /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
         ///

-- 
2.52.0.351.gbe84eed79e-goog

