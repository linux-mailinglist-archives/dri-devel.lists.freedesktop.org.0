Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0CD19C58
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264EF10E4F0;
	Tue, 13 Jan 2026 15:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RrQgcmA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D811310E303
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:13:25 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47ee1fe7b24so675395e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768317204; x=1768922004;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6N1TEsiPesyo6Bt0PZvnhVY3O3p5gV/3E/K/p2dHoxc=;
 b=RrQgcmA5dx5ff9r3oXbNjxE4zfdt8AL3iV9mZ8C82YC0QkXx4WFT26WDsc/RTwbJpo
 7edw6BVJPEWzrDVGnEDMGda4dhNIMFCh+0B5PEeNjcxZ4qk/pNmjhZcGJaEzAUbEqy71
 Yf//MYnTyrlmTbTmBpd4OTkRiwteoOHQEXZSo/fpE5LTUx/IULOVKvIlRfMAY7CprxIx
 nmWtijzge5Ey+tFHeMASAJKEN4hZHdAO5SCyfxF8GjXIr32SyrB6472sAyaiHb759PlQ
 9cXLvTaRX4c8xn0OcVHAE1XY0qyaZDm/tw28flImGGMDfWBoEieVpnz9CYt7lmutqqwh
 pMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317204; x=1768922004;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6N1TEsiPesyo6Bt0PZvnhVY3O3p5gV/3E/K/p2dHoxc=;
 b=BpVhfFpecGPPMUOvB8LtVtXnrtH/LwY2HKW+HHuX1z/rKDBxbSLnJ/Gmns676zDVoT
 STEU1AYvqetfG+blVdKm/5x3mF+P0gk8v/fPC7siPt5xjRk9EbeTZsZwK3SliqPQ+59H
 jGJWfot1iyBPSfSCv8rs8+ugDv+aQMkWSXa0liWpusXYfrGG1NRaEPjVpugDqOttckx5
 HA345aSYAXmiRaYkSINU9wQZUMLsj52JEUuzy51orjLLHCPxEhhVDpNTQLIjp1uOQ3BV
 Z6e1EEihTIw7KuKprocCKAWFHQ/3aVK82C3Z0G9KY0bAuvLdXRUXDOoJ5gF7uJhaWYBL
 He4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHgpmKeCxoEI+96KRhuJZVgYfh1B0Ov8JtRhDgeqbRYWoEgpBTQ4QRiSVgsV9IUYVN22XYubtF9Wo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzye4cWtKsL5JltnjO0lvzXSMe9V8HkEgaxxGvqrHnMhG3g39xk
 bL8ym+nKOmxXkH/7ggWSEtbnqBIhNzhKTfWXFGgZStNo8snxaAx4A3iuM3WwPxixHGmz79BPzon
 59kJdMpIya3RzNWNiXQ==
X-Google-Smtp-Source: AGHT+IHoXaO70n2FJmZP8Rd2OF/hvQHQN06mNSOik2NmPij5NQxkTvgCkvgal1N4XDc5+fSDkHKcsHUBNt57n8A=
X-Received: from wmim12.prod.google.com ([2002:a7b:cb8c:0:b0:47a:9f70:c329])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8119:b0:477:b0b9:3129 with SMTP id
 5b1f17b1804b1-47d84b0a8dfmr237085685e9.3.1768317204383; 
 Tue, 13 Jan 2026 07:13:24 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:35 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAORgZmkC/3XMQQ6CMBCF4auYrh0znZZYXXkP46KUARqRGmqIh
 HB3CwuNGJfvJd8/isid5yiOm1F03PvoQ5uG3m6Eq21bMfgibUFIGR5Qg2uuELktIA6tA+VKuy8
 1S8ckkrl3XPrn0jtf0q59fIRuWPK9nN9/pV6CBG0KJKUIOTenKoSq4Z0LNzGnenpziYRrToCgt
 c0zpSyj0T9cfThJs+YqcdYmJ6ZSsnVffJqmF9R+xfwpAQAA
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=uKkVhBaphq3Yv4o1VV/s1jKOfUDc6KdF7Ew3LDTjeJI=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmELFbghZxWZ7vaaZvAKoZIouMjeMx/D5VtYF
 y/dj/EnouKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhCwAKCRAEWL7uWMY5
 RkUiD/9LHMHZPK8MfjH8P7x1+RzDmIXcOknAAS7n4m+VzrOjWzYSNqifU29O+VSt/W2ByxeTzYT
 aS1g2+Knt0WvtdmrmjV9Oi8vVsvlvJBWxBDtYFz8JW0c1m9w9+PUR2prE63e9bhpaF9ZK4jtN9F
 LMiiOZoqtCep7C+0aLHtunxvrUdJg39W8HXc0/RMJXv0iv9KImXAeuk0Gk/WV9npuZxU1AWMVV8
 W2zKm7ZD2cAB8V5JVSrh0LHN8lpMGSWU38mzd4N/0c662gulPBXsY47rbyj+ieUCU1e7Xb4rq5B
 XIC8Mu1AgLO0cM5Yr6G1Z1v09A1OECpW2F76vg16IFCNsCP5LNcYx2QE9SJh/dszq6riDB7N58q
 tZkOXDELeZ4++DyyRgnTGh+f07jh89dg9v77g/B+USWQm/jZ9P1VRFHJfhkdjjKmSCZuidXUx0U
 aHVaDuZcRBdGpZz0lGsO6868mSmdNYqR+PMcjDTiFqa2n2HRQCvdJybEcQoQGCmTgkxNLaicwR+
 0UDy8ZXpzI/D8WLlV/EyKHrvutrSXsAv1f3SEOvqzrq8WgsKNhrKiH+GHnyuGjAnCz1JmMumvTf
 0KM745KlQEWD2wlcWYm6yXD7EPEXhU+/gLRvZKu7c5b9rnjPGb90UJbYFFOb2UmYeVz9Imn43fN
 yqmFT6fOTRmLMfg==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Subject: [PATCH v4 0/3] Implement Send and Sync for clk
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

The Clk type is thread-safe, so let's mark it as thread-safe in the type
system. This lets us get rid of hacks in drivers.

For Stephen's clk tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Pick up Reviewed-by tags.
- Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com

Changes in v3:
- Rebase on v6.19-rc1.
- Pick up tags.
- Add fix for pwm driver as well.
- Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.com

Changes in v2:
- Rebase on v6.18-rc1.
- Add patch to tyr driver.
- Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com

---
Alice Ryhl (3):
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData
      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData

 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 drivers/pwm/pwm_th1520.rs     | 15 ---------------
 rust/kernel/clk.rs            |  7 +++++++
 3 files changed, 7 insertions(+), 27 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250904-clk-send-sync-3cfa7f4e1ce2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

