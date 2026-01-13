Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF0D19C5E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B3110E318;
	Tue, 13 Jan 2026 15:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UddQaScr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3440D10E318
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:13:30 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4775e00b16fso59705225e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768317209; x=1768922009;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+856FUFrQ1uMLS1oGlG8WJLskHLLy9o2M4Kx5xq+7BM=;
 b=UddQaScrbgFEpZVmibQPCiMnhUHxaWfR/uluvSKqE7l01r1ugh3xeZLKWPcl6kwCqV
 5aLDvxxQsjzkJQum/UIuX4ylpn8dt1Xko577NnLOxCpDUhY2J098AzJELhPl83FqXA8I
 UTa++Ebp1qFyHEuZntfCuWarXxortbM7MySxMeJGNxvPzxDAX+LIcNDDiwWJSIaM2Q12
 U0VDNViXY6oIAwJLg8+iQ2NDba4SUeTrrJJ0IEXptZf7QEmZezwVXhZDtFwELOvS+Ppb
 EN01Feydxe0X890UL86s7gOoVyURIsZ7YAbEHZ/jFTPPbwzDDF9UX6niOf5oUBJxZ82a
 AxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317209; x=1768922009;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+856FUFrQ1uMLS1oGlG8WJLskHLLy9o2M4Kx5xq+7BM=;
 b=JPr04iYy56MhiQdrCqlWv/pB/x1mfyjhwU5gV6uAOr21O+FSMsv0DFW6ljgSS66xJy
 HwAnp4ezJwAG7YX29KKp0AcC+9L/99NiWWUullXgJVYgaT7PflvWilvko9PKz6MaSwD3
 mrWnyK3MQ5h4lqATAP3MPh9Fr0ESwZE+ZNaekB6I6pd7uRaDuFyLMvQYQavp0vHuvTPd
 49pOnwv8GRRhaoyC/pTmLMcaERz+qe0bfFbbNO9QlPZ/2pN1GARsdgaM+zIED4f5bTfl
 rqaOevRBBiwMonJiz+pzaxvt0nLMzGk26ryAUKkHg5maYvyMfRCOnboTi1/fjUZc1VpK
 Gocw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ngxAQr8XdSakF9ij+COd32+n+jlsAA0lDg2KH748VMTKNj17N5THNZtAbKZbCIcA9HrUkjYg+nE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+rDe3ncx4mS/N8PoK8fuR4X7xw7GaS+1owGoimGBD3NzGQoeN
 fTFrE0hzsgnwARwM23uOqx4LcifsxnrjgX09uaU6tbdOrMUVp4txvsttATfb1sRRrtbWYl924gI
 BW66Oq8p5Z57Yh/5uyA==
X-Google-Smtp-Source: AGHT+IGmHpal9o9kYRCqeudE5OGpHQsDJxQXH71nc/uK+vHzcbqRlM1R9M+yj/rHy+PL0q1Xd9tRxUhXRg/AaE8=
X-Received: from wmkn12.prod.google.com ([2002:a7b:c5cc:0:b0:47b:e2d9:2e56])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f8c:b0:477:7d94:5d0e with SMTP id
 5b1f17b1804b1-47d84b40955mr245818705e9.27.1768317208607; 
 Tue, 13 Jan 2026 07:13:28 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:37 +0000
In-Reply-To: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=gBgvzdGxsZJ9P+o4TYuYZOZRWaJW6R3le+1fCyVi18I=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmEQ3m0NLVAdMWPcGPUsnYIg3W5r/sNDHFFhx
 Dkr8r8Oc/GJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhEAAKCRAEWL7uWMY5
 RvfEEACjTscIGJhJynFAKM6GeR0pshAjNruRsL1XI2fjXIhSE+SSnT4iB2E59xTIcS3M+nwv0oR
 lptUt2zMowQ0JNWnWfMlhYHwaSgd7j+IBwQOVbs8KFtzuMLrLQD1PpJmYQYsx9aIlzyb5uPIF+p
 6I7+cnay5Xpoc6yv21NhJ1/WW77v+u3zgxTMoY6eyuF7ItHn0gI12TPn5TDUyqba8oE7XCAEiz5
 DY7lo6vCuKHJHY/ysoW1cIN/3CLRBTgof4w8crzoLDnO26t1/55uZ6xRyhgkVNrWfpuKTpOFW+R
 AES7YP3VLCq2TMXhF9XeJ/ZqiDJFo2sawCja+1APoWHLnZRPL7Yn4JhxuD0vg9JpdjyEEGQk1LJ
 eNCsvUE1AsYAHWajubBONw1i0Zp9grMM2d+rkKCESW7cmqCNVBTEMUekH/wzc8r4N4FJSRq5Gen
 a/jBA/914TYhFX3ld9WgYBN1nrvIur9CJdr3CwZZmc1y6cAwUw21Fnh77pJF5/CRK2VXR1UPL4Y
 epuqg2O56ZCBKBG24sLv0yZ2FylVV1jXkBGC0sPytS+Zw26BczE2hM1tgQ0JaDOKKFTGWLF2x6Z
 1h9mybuFKl/JaZmCCV/9SPM03m6WMzhmRV/Xnv6AGxM6KuU/VWAMbEPsCuoc0Po791vKHzbbfCd
 1qJ4UwkULxYnX9A==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-2-712bc7d94a79@google.com>
Subject: [PATCH v4 2/3] tyr: remove impl Send/Sync for TyrData
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

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for TyrData. Thus remove the implementations.

The comment also mentions the regulator. However, the regulator had the
traits added in commit 9a200cbdb543 ("rust: regulator: implement Send
and Sync for Regulator<T>"), which is already in mainline.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c0367522471ea78fcf72a6b58c4a3650..09711fb7fe0b1c83b72bffba06f5a76c53244f4d 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -53,18 +53,6 @@ pub(crate) struct TyrData {
     pub(crate) gpu_info: GpuInfo,
 }
 
-// Both `Clk` and `Regulator` do not implement `Send` or `Sync`, but they
-// should. There are patches on the mailing list to address this, but they have
-// not landed yet.
-//
-// For now, add this workaround so that this patch compiles with the promise
-// that it will be removed in a future patch.
-//
-// SAFETY: This will be removed in a future patch.
-unsafe impl Send for TyrData {}
-// SAFETY: This will be removed in a future patch.
-unsafe impl Sync for TyrData {}
-
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 

-- 
2.52.0.457.g6b5491de43-goog

