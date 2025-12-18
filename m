Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED9CCBFF3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD0010E9DD;
	Thu, 18 Dec 2025 13:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="E0dRVWUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com
 [209.85.208.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D259810E9DD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:27:53 +0000 (UTC)
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-64b45c2c84bso742019a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766064472; x=1766669272;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uPptdLMQzSRoeYj6Hrjl7dIAj/bZbKtg9ZgsU3qRcP4=;
 b=E0dRVWUSHiyJ1Ig7OhaALoTIvEy77zv6L/7vY+BbyGR/t2mxNE8FRcEXTsyAwVGVQQ
 uIqhZq1XChpJ94m4BvXu4p+m7uB6uOEFfJ05fqsSSqNmT+q7dnbIGl5d1ICFBRpp4424
 ++S8xQV3le8j2vGnOspDqAiWmetMcIq8De5D8L/roey2z42ZAnQjorVSab8e1For8qSt
 jwMSpMwIFEcO9jqw0+HEs1o8ApSbOZ2gzM1hFDZsc3krgFS7RlyWhbTEMKyVS4WH4xwn
 drPWRp8NdYikyqjP+ppMdWI+CGAEkV8PJnTZo7usAP9SwIQiSxWkU+FfB28ubyniT52K
 KnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766064472; x=1766669272;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPptdLMQzSRoeYj6Hrjl7dIAj/bZbKtg9ZgsU3qRcP4=;
 b=MQMH9rumYczqwcLPqsUQf52sFi2gBulahnRoFtmYsFeLyQxy5QuSb/poNE7RfaG2dI
 zk2Hxa3wZpLlsIEeBt01Ec2Vf/0+lXyzIY/iy0LbzwnN0h/cNFai+ez1Qgy6NmPerxGm
 4p3J6H3ADcplhq50K6ia81BiGYo7VqRwTxxAqrKRUjJ6CDE+HWIT+CMMOFPiwzAlHBhy
 AASTqEyZtPi65rMq7EC4PTtoEWCX3EOuGZK/SRupet4Wp5yFFi+9zZOQfILsUUJMDPlo
 /cHpqnZnkNJ7Ax7vIWIYfcl73ok8hr9tT2o4Zc+D2TSI+jUZhK4Z1NvHn2V1hbo9xfNp
 ojBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGM5SJgqdnWEwQDk1miUD2blSPxbbzcj063UGts1S87CbT9KmP3O4aLmoU+tWfr7ZaAL3bwtvqogc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp9HIEaF5cSffSNT1nE+X2/+i0RofjecG3XcDHjFpJ8fWbqL70
 qBbxfXdvJdtJcEIr3cXsbnCIC5gkL1UyqZpgUxLEGn6dIv0Ekt7unFI8fO7K3HZEIRTOq+3x40R
 rT5r3bNEBYyHd+LaVxw==
X-Google-Smtp-Source: AGHT+IEqPOft361pJTlpzbo4r1Az15cTuwMQEfh5KrGil6c5DKT9dTPisXdo2WdHWgmo3QB8gCSt51uaXvkVnKs=
X-Received: from edtb2.prod.google.com ([2002:aa7:c902:0:b0:64b:3f32:3786])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:510c:b0:649:aa2b:d34e with SMTP id
 4fb4d7f45d1cf-649aa2bd4d5mr19796028a12.34.1766064472249; 
 Thu, 18 Dec 2025 05:27:52 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:41 +0000
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Mime-Version: 1.0
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=F1lcAFNww32YALWPOxbeZmA3ejiotHsR5mfwB5toNyY=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFSWSny77iwIsGzKsSzrxHbWYGRidi4wKUj+
 ky0LI75Ss2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBUgAKCRAEWL7uWMY5
 RvgbD/0e4oYtNdP81rAHg3z94FA3jXour1f/plwNgEk/ZamK57EcpX33mAyVLYHcizYsBAXobj8
 am8MyWvLYn6vpr7tx2LS7NZKRpaDdKtU8hLtv4kiTrUqlXTHc2gdDX+4bUPvbHaucO/SaM0cwhH
 YmdiCosFbFZKnHVwGbfbiOK0e/NfqRfDUckj/cxh4YB5cCtDV8FFyJ3kkDdAxM0dGs4OLipgI4h
 i5CMx4B1rrv2P9G/QlL/fSDjJ43XH4475E9YOsLEvPEhAYlLIYUzo/rE/Kaeu6PICY8hh1yy6Fv
 STETnhmW/mMc1h/YSnBddXnFklCoCMHGWZzwUNVhbINFR9wXTZ9dORQQEC/kQKrz3HB9mCUHavC
 AKTMK8M518WNFW/KmcpCQuCUV/QMzh53S1dqxnOGrFXOkyTT1J8DV7ILO1B1djcUFyYWghNR8Ip
 ghgLFaoKreKay09TC/pz6aQe6oegcfGdVHZeCwrF783LbaefHkCwnQxgq93CoWD4SaDxVdptyiU
 c3VFdxgQUkPGbHHH9zk5ct26cnzGalmVDInhx915An/XkyBHna1HZl1I7dkY5je4cJxn8iXJi9n
 ezwBfnj1zNVzI053FQL7sgbp13dOehoXQV30MffCZQ21N9huXxaq2USl3CSpqC1SP89Y7AVazfB
 RhbcohkXt0oVDGw==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-2-e48b2e2f1eac@google.com>
Subject: [PATCH v3 2/3] tyr: remove impl Send/Sync for TyrData
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
implement these traits for TyrData. Thus remove the implementations.

The comment also mentions the regulator. However, the regulator had the
traits added in commit 9a200cbdb543 ("rust: regulator: implement Send
and Sync for Regulator<T>"), which is already in mainline.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
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
2.52.0.351.gbe84eed79e-goog

