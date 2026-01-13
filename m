Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C46BD19C61
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38D310E4F8;
	Tue, 13 Jan 2026 15:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AXsAmVQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA03810E4F1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:13:31 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47788165c97so43876875e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768317210; x=1768922010;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+gU9SYYpNNrQwCuq4FN+wHCGTlifJ/wCG0O0IkTkZkI=;
 b=AXsAmVQiyQxgaWVlKtDcrbyVDqU17S4QRSimig8iP06UQOPE5GrM0ByLv35/haOraE
 5zvEcq4olNeE2R+gSckfMy/iDFSVLh+Zfd8VERFY0B0qQLXtFzpc8PRkNY7QqqU9iutb
 Jur6itslU5ofQ0WSATz+KyGnUzl+JxctE9of2wVYiQnah6Mgxgca3zxYZC3i+SRc9bhG
 sfd/nT6CNvt964qEprc1JvtYIYTJ6WiXVWmo8khOJrLSDxBS9yMg6eHOIbBylnVDfZAI
 fqjkjML9EQnWhMegsrpR2uRoVOVbTiL515x1Jzq5erdCNbmMvryHVMIIne/89ynRhAF2
 3kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317210; x=1768922010;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+gU9SYYpNNrQwCuq4FN+wHCGTlifJ/wCG0O0IkTkZkI=;
 b=cmKwvxjoUGn1iIPEC85pUQ6t8LUf1B4JufkkdqopvI7Mk/YUKvUwfQ2dc9qxof1AwL
 PvQvE6C4MQ8kLv6rj7H0kIpb0zXrgjwGjopBGojhc9fodCwTM3Nfg+BCoGg1X6sTktG5
 4C06Rk/B/rHVmO2npG1Q7rF2Rij5cqfYJHmQB+wcFqiSBDhxdLlpemvjl4201XitdfsU
 kvqm8L5ACrk5c6Bn50IGMjmphsfwbaYpnt7yXqnJn8Fi/HKWtL1jLAr3PsZxrDGbRR/F
 tbtISrZKh/sGWERJMiLta3GxHnyY2+DYqnmCm58HMqt82lpjqqXsfv1ri4VhskTXCtZD
 6spw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX03w3lJ6tpNU3UompYMq6zpqcwqWhRy8zfxFznssEat8TGtBjIRHzIbzrz7SzL7LxOk6Hp/Y0dYEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgmePzPQAe1GMP00swOWc6z4rHqgQKCoHoGKXD4LgCRrqPE05Y
 PqSkfI1VPc++rxNaQw2kBqqJcYTdcNyu3Gl9y/+0UNzIzOU3XqvsmlplJ2bzKErEbzqAidoBM6b
 OS7uOFx2NcDlvBdivJA==
X-Google-Smtp-Source: AGHT+IHnuUTaCAWBbZD9W2h/OSSmDtQjxvZdpq6nNLyiRYLG1dj5BdsEl+mKz8Ozip0V1tf1O9hZfCnqvscWuD4=
X-Received: from wma11.prod.google.com ([2002:a05:600c:890b:b0:477:a4d4:607a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-47d84b26da4mr243374615e9.4.1768317210336; 
 Tue, 13 Jan 2026 07:13:30 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:38 +0000
In-Reply-To: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=vFWramkwrqwtJwgC1sH4LSgngbV/etS8iNI590sqCqw=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmEQEuN4uaDvBaM5TmqN9WnhJMSuME0tcTbvE
 YTkLG+hAaWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhEAAKCRAEWL7uWMY5
 Rl6hD/0auoTL/sGpImpn7/kPf/KAL2X3YoNiKIZzHThKN8uT1uxeAYone+3mo8qyaTcM9DDITr6
 5cq6SQN1VE2Upbba2oSwzLdXTkToZdNh+mu4Eq7ky7DhHdURd5KFsAFZz5bKVWAmFMxPGbXUWic
 zpbpxMTJ6QUnuHOIvfuu39nblQdZZj/6inRVCAcTQSmG5vF+0/DftaL6fp7SaUGj5FCNfgFRCmL
 YfTJ/wKsnbTffuMy8sp7BuWtqb4OBFXJPp5j+I8cTSmiyuKCVi2p3nkwxAr08fVpyFR5Jd0y50w
 otlpyfnNzzPJXkKkBzupe6ry4LS/qg/2JcnC5qdPiY6x05rKLHCxRz3ClDVzNNLp4vntSxuZQ7w
 9aVP+poXva8l8+v6nfWgIO8ciKcZUO1IAaVilhy0TPvkVEvV0b33l0ek0qo35T+BaWJ++Y+42sY
 fBHOMq5NlR5BNtcXrC6GJUruPQL6goEC6xqO8yv++luTB8ag+k81xfDQtXot3b+YVi7M5xPzdwd
 JuhPfPLk0Cs4EE/1l2ROvSfM+IWqM1pzSJLQxHJTr18UvcST4VAvFFyF8C7FGjeAdCeRgpm4/T6
 FzJIbAfWa+VuJMMWr7B1nkYoHdHqGCIR4tLS5Meh4HkFP2AGWG+8teZRq3kTzVMedKRt86fLJ5+
 5OXudD+J6HDSHOw==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
Subject: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
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
 linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
 linux-riscv@lists.infradead.org
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
implement these traits for Th1520PwmDriverData. Thus remove the
implementations.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: linux-riscv@lists.infradead.org
---
 drivers/pwm/pwm_th1520.rs | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index e3b7e77356fc2492077c519073e861beb3e44df9..043dc4dbc6232020195c7b73fad302bbb69652df 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -97,21 +97,6 @@ struct Th1520PwmDriverData {
     clk: Clk,
 }
 
-// This `unsafe` implementation is a temporary necessity because the underlying `kernel::clk::Clk`
-// type does not yet expose `Send` and `Sync` implementations. This block should be removed
-// as soon as the clock abstraction provides these guarantees directly.
-// TODO: Remove those unsafe impl's when Clk will support them itself.
-
-// SAFETY: The `devres` framework requires the driver's private data to be `Send` and `Sync`.
-// We can guarantee this because the PWM core synchronizes all callbacks, preventing concurrent
-// access to the contained `iomem` and `clk` resources.
-unsafe impl Send for Th1520PwmDriverData {}
-
-// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchronization
-// guarantees that it is safe for multiple threads to have shared access (`&self`)
-// to the driver data during callbacks.
-unsafe impl Sync for Th1520PwmDriverData {}
-
 impl pwm::PwmOps for Th1520PwmDriverData {
     type WfHw = Th1520WfHw;
 

-- 
2.52.0.457.g6b5491de43-goog

