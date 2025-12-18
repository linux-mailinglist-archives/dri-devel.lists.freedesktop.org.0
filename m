Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2DCCBFFA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BEB10E9EE;
	Thu, 18 Dec 2025 13:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BMYGulOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4587910E9DD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:27:55 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47a83800743so8294055e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766064474; x=1766669274;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qz+Ave0Rr+pYsqesYd5D1VozD7cgPG0dKKZRCf4yYNk=;
 b=BMYGulOPAPoCb+p3yW8QEiz3MRgNkeZ1OaQ1aA6g/hYK1/HCGoAxQHOw6379WXBQJo
 Iey497G4jMobj9v/4GJerK5KZc0Mr/jY8M2rkoGxfN3HiIQEdsDQMI3na+dCZVQVVHr4
 CZhMOnR/xglC4CrVPr2o7QNyU/D4STxqfd2T0poPQivdlQBAgQznof9TTWbpv3G6h9Iz
 023rd6XA0nShjixBrKi8SkvgDBt3TYUKMNK64ShSnIJU6kd9EFJ8ebd3tlc2kTTukh2x
 Dz28v0uyVP75ZI6v3chJ+cx+Dk3A8/MmnKiyAmbSteTLQNLLpauSBmoeV1cLNsvi8Cs6
 kg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766064474; x=1766669274;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qz+Ave0Rr+pYsqesYd5D1VozD7cgPG0dKKZRCf4yYNk=;
 b=SVBr5r7eCU/+Sso6TJfePDFOHrRYF4ELPLYd3rYZnwgZTQOogHzbYsIcWvB+z2oNpt
 2NfOVeCyOCesyZXPyBpCG7yT8Y1AaMaKR0pgM8V16yugNzdmArHRS53+kRdIFfXm7ZlE
 RU1BjHfsPeEfo2oO8lcKd/3qu/d3CKWnuOVZvKvmcEpMet4Vzsiz9+7MjMMCv5i69rwc
 J+vNjduxNi8XXZXXp0qiUL8sIFm2J8jYMC/FE17Lt2mxQgQvOAGu6LBSkxmsAw/H0t+Y
 iGVKe8dTSsGq7drTe8UNPXIZZVEO+DLmJ50zHxIb8IGSM1k4Jr1JXQvo1W3rjKn/CT4E
 7Lkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6zMHXNa9GDxKFPTOOLaTXzhnlY11Q2kXxwebq7HUIJTaOhsYORNK/s8su58JlCgtPTXE3MluWGI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMB6fTOJFSPc/kwYVUh77hIDoKlpzn1j4w4tV4Yu5z9oamKjF8
 TnR/DECVPOsDEhv4UPvpLyEiuqm5q4UTmHcrLC6NZRjrvuq75J/9++GqcRzUXk6WgcGF84BknFi
 umWenDf3m0rXnIu72OQ==
X-Google-Smtp-Source: AGHT+IGlOhSMahMSUEguAwn167F6Fbjkcu8ZrI+51vEqMqCJE+3S5hQDbdF4w5Iw7QzwlTk2wDuRew3DnOxTRuQ=
X-Received: from wmpc42.prod.google.com ([2002:a05:600c:4a2a:b0:477:40c1:3e61])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45cd:b0:46e:2815:8568 with SMTP id
 5b1f17b1804b1-47be29c60fdmr30005265e9.10.1766064473619; 
 Thu, 18 Dec 2025 05:27:53 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:42 +0000
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Mime-Version: 1.0
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=hJ1r8AWFe6vjamRRbSdgVoDTTorMAE8/5j325qhqRPo=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFSiykIxnKvVV7ampJwe+hiZPH4dlKVVfNC2
 bRMusCRGIiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBUgAKCRAEWL7uWMY5
 Rs5ND/9lBcHvvP1F2jrlMF7zlcbzolVf/Ik/QcXkh9CEtamti0oWtsfXPKvcrmdowiTh3qqTeOG
 d1pcYkv8At0D62DBbQJID40ZEj2jC53yyQTl+JbIxQgkPKYKW/7tiZ/YZ5l4Be6z2ypAJGa6jlu
 7P+IO8CGeyODkeDgL0U2tMGXuoKl6vJ9s93DzDVlYt3L2Dx6cpR55jWVWkBfziIoGS9Eei+zk7Z
 4ylYtbeoBKVsKs4Ix3y89qYWygDe/wXz0aRIGoDHBiJpBl2ppjbCEhP0PWGQra7A3KUayfL2KYF
 zmZLGvVKljUBMKcuQTuQUJN31zFt6WU2+ASxRD7tU+8u2vwrGOoiHDCS5fwLhJ12/F3DBE2H4eL
 vVgQ+jd6O8L4xD7oC1Z77SciJgITmTJCFM/W1W4jBGkk9AFU6+XIyzMnWryfADATfwgdGytDQIu
 F8KCpPdYrWW3vo38v9f5rhole5bvAC9Eh3vo2PyGcGLpjIqimDbqTsLCSvJmm/yQa0TbMqIXp5a
 ya9OwwArkL66kUK/YcdhJDrrJZXsHnkTxjYNekN0UfUNnAkWUl7AO9hiAu/V0GLq7YAfVjeSoGl
 4Gq54cB6CKjvPxv7GEqVbzEqyOnzjEJ8wCcU96VlVrvDrX57llCh1ppRHSozowXpxgScpJ/166f
 Mej0UG+6YnuMTlQ==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-3-e48b2e2f1eac@google.com>
Subject: [PATCH v3 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
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

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for Th1520PwmDriverData. Thus remove the
implementations.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
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
2.52.0.351.gbe84eed79e-goog

