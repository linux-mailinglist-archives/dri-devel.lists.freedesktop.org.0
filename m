Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68924D19C5B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD13F10E4F3;
	Tue, 13 Jan 2026 15:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dTLpB3g4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35B10E318
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:13:28 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-431054c09e3so4532820f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768317207; x=1768922007;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=clahOJSyAVmCLVNVjHaJTlJ4hThwgbY6ylIwpTEN8h8=;
 b=dTLpB3g4QfZodPXhxDr78yKFCCmQF2sUPl3XyZoeoAPVePkvB60SRiCssgh6XIufR8
 nzwQhx59dvwOVjr+kSgq9k0B5rou7t4Uk+T1uo4/XEovL7xGcEi+gu3GM23LfZFd8JjB
 2oU5HghtnmZjHoi3XWtmwvwQ9c3Ri5zuNB/KDwQ7zzw/YG2Uj1bv+xC33Q+OAi/0rl8R
 hF5NLUWbEVOSGyMAzWrN+gAIH4ZbNvT48i2llliP9ueYz6VSMp5cSVmHzeIME2PQKmwR
 MY0OgF2vF0Lese/FUEidON/4fizaqdLJB56550Ul5V7W4EmPTIuEYWEzu1qsovY+XqlL
 325Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317207; x=1768922007;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=clahOJSyAVmCLVNVjHaJTlJ4hThwgbY6ylIwpTEN8h8=;
 b=Y/WLYNmz2hOG+JrLunnBjb3w4TtekBONT3MTl/JqVrtMEfemsYC1HW/BdFbmUa21lo
 141zabkFdOcKbgZKkdCZCrURJVtBfa8+RIfoXBEx/sBq7w6eNVhutom0fDhEOHC8jiQf
 IVmIvAVrh2OmIIlYTxUhHN/zgNbhBJu3FoutByV+wPicS+ZeHxEX5B/fExQ9aQvYtZYN
 40d9DQ96mD+FfOac9UGIDkEsEpc+24CnHOBV9NQ/1vvviNeKkX1d6yco87+T/gHPXKZh
 U2QlMzgNXe8XAEgkYjzQ49va6xUPDp/lJnFbBMvm+Di6NW7BdXJDQT5V77vNJBeiLKpk
 tHPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDKyu0f8VJ/QPOda3ZH8UoSh5lqi8+ou2Ig6H3NjgiH+Y3r4k6IdXBiZgvoCXBgb4A5OjLdrv8jVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAIhCKpsB60BzA3d7tMryMN6hR9NUPQ5aYs3k1QlzU+5SesGVj
 StYEmZkdBVyz7um6QEeO6sY5StYTfYQx3ddW9TpfcayAlBagvyrvhf60fxlYGR1AfSAK2iIbRBn
 tBE3V+litVlTaPJRl0A==
X-Google-Smtp-Source: AGHT+IFANjV4vLX5QPuJ5KpCs0Rj644PourkYIVXhMKZkYuRk0oEaR0gmzWWf8Xi/v74hg4ToVXO6AC9XE7qoTU=
X-Received: from wrbbs10.prod.google.com ([2002:a05:6000:70a:b0:430:a835:4ce8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8b:b0:432:84f9:95f4 with SMTP id
 ffacd0b85a97d-432c374f4a7mr27176145f8f.31.1768317206801; 
 Tue, 13 Jan 2026 07:13:26 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:36 +0000
In-Reply-To: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=5DE8fHUHNeug+88kGFo3S/QoXnkelD/PvswD8rGjIrM=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmEQNNwQvfw9jQxuDNt4fC2n5Cfx+vcwSjcWB
 EjbHAg9hU2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhEAAKCRAEWL7uWMY5
 RvRxEACuwFIesZvoHE5gK5RQaiufwGNORvDKEuP1GJmMebtB3qC4PmH2wFMguWvNpJTUKWU0D5d
 jdQ+ITMxKWDtDMpGzdoBMliByodTN5wwtvNZGIPaLLEUZ+uImdP1HlZ+5M03+eyQJOMs05GW7Zc
 TSlL6zpiv+54WAj40TJH1d5HPB0WLbITPscM6xHXaCvfaCMxSEcbqqDprp8VoDZ6zgZSeAIqc8v
 zVSXwizZxkbc9uGfqfyY6kGS2soNpo+IyeElYFqMNY4pR992VOqL1+37BbqF6BxAxLrtBwNoyBC
 KbUq7ZcC+1DqYAejPv1soQ+e+hcJK9X/dtfkBjW6GBe3B9P0Y6s7qEHIUqV7BSEvxOB/mIQ5UZ0
 rtRm3VEAOnA8v8E2oGTQazJ58ezoKWwB5L6muDTmHlSyEYQhVqNUNAVsxi61bWxCcuXPu9KmxgC
 LHI3zLNriAuors7Gzwlu7Ahzu/6yPgqwJ6ebzzMhWAwTKLvVRvIL7BbAMjEEfFofP9IEuyazi/l
 Up8zWnwYgaiqqLz/g9gxZdaF1h1dm0DWqMUCkAe0/o95w00/ZUtgyOkYMGdSqL8zyYHhS6K7/Qg
 NaPzd6f01DT77HGn2DEO6xOX2PbrAgvzU9PVSXxUEpt/0wR1I5PF2aS3brFDfpjwLpJ/0c2p8pf
 28UFVHEynEoLnxg==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-1-712bc7d94a79@google.com>
Subject: [PATCH v4 1/3] rust: clk: implement Send and Sync
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 "=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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
Reviewed-by: Gary Guo <gary@garyguo.net>
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
2.52.0.457.g6b5491de43-goog

