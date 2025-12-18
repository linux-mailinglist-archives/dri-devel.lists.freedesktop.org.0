Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAACCBFEA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ED610E282;
	Thu, 18 Dec 2025 13:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ww0GXFII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885CA10E282
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:27:49 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-64b42cb60baso759219a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766064468; x=1766669268;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Qi+diNh9H3fqHmnH6Hx1SnRjbjw/DBqYuPovI/jASd0=;
 b=ww0GXFIIzHv1cCbn3QeN845cDqTHi1D6qmpmzdWrVrcmzYy7+Vm/T2p6Gxm4pNeudW
 ovofxYNDC8XMr3QaWUEc7BRCYvAWHYFiv8n7Rz17e9L+ipehZca78zsDK7mq83aqXZZO
 SxDSKNTYFIglCdRImIK/dgrFLzMsulgnFMmFTm5U7eQ6g4JuwrnTDyu9NdRheYVPriTA
 auo7IWWzRRkeIr3jUfqHqeUEiDgBJkKUMI3Z9cvQ3CZfUzT36uZXbbBZg3+vVxGZUAil
 EAsIo3Fnuq2qpfwUcrpeBD9QnpkxZbCHzx1jdZQfFYa2XyTLVyfXeTDDAWvcHipJTDbz
 4ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766064468; x=1766669268;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qi+diNh9H3fqHmnH6Hx1SnRjbjw/DBqYuPovI/jASd0=;
 b=FwPhI4MwQclkLLvPErtUf3K39tueJyPy6oLWPc2WPZrUGoKKCGAOoQkqzzB+NeQHvr
 gY9Y1HyaIS2J0NLXqXCpB0KZQGzqZ5M6zngD9cQPYlrPMoN1B7p3LRCvqFwsA6nqBDCw
 tVDm6DCkrZ/IbLzNPuQd1164s0LXyePLEjDqbB+HVu+BD7Ku71G1VKrrQ7DiJ3HoBiWy
 k0ZS37v1JkGflGBqx9EJiKkyruftBVaP2np48eaBPrvjZuR4QQkI8ig5Hy4/OQXg2t6q
 It3Egm70gBh/JQsSQoM0fVVvHdVP7oxXZynIG5aWgcDRndXCVT5F8vklBEIb5L62FSpX
 prWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTzPPkV2YjYuGpEp7gOf1bMG/3coF8IXgJWWIin5pd3yJi/iHa6BMwde+bSFL4/5FEDCvxqx8wi+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL+/07Oj+tTsVr+gWh1XhYz5eAnzLa1D9YvmKu6VgO0YXzjYIF
 +g4cjK4BR0c6aH93Qq+4B2UdxhG5fRQpBConv++s1oLw7cIoRT3BlHbXgq7h39vhtPXKuwr+bpD
 GtWdkND5eeT4ENSHl9w==
X-Google-Smtp-Source: AGHT+IEJ9HLtb50XHuIEDIn2I5dEKRfpXNrH3igp0u5gga3J4+yG7DZI2Q0fi7gmDBfxIdYoUF2j/d9U4mcuUv4=
X-Received: from edbin13-n2.prod.google.com
 ([2002:a05:6402:208d:20b0:641:9bdd:d74f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:557:b0:649:ab53:f11c with SMTP id
 4fb4d7f45d1cf-649ab53f181mr13887194a12.23.1766064467917; 
 Thu, 18 Dec 2025 05:27:47 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:39 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEsBRGkC/3WMQQrCMBAAv1JydmWzSbF68h/iIU23bbA2kkiwl
 P7dtAdBweMMzMwicnAcxamYReDkovNjBrUrhO3N2DG4JrMgpBKPqMEON4g8NhCn0YKyrTm0mqV
 lErl5BG7da/tdrpl7F58+TNs+ydX+OyUJEnTVIClFyHV17rzvBt5bfxfrKtEnl0j4mxMgaG3qU
 inDWOmvfFmWN6cYRdHqAAAA
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=TNCoBCaC1De+GuiDPz38rW09O9saXkMK3Ckv9akyQNA=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFNFVzmcQ2qN1p0BMkwj9qfGdczHhAq4h4h8
 brc4EWRh+iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBTQAKCRAEWL7uWMY5
 RsZdD/9D8QHTjLTOthce0e12XPB+tRv7yTYfTigi7v76k7nrub0lKoKFh5YWCFnp/HL8DRywxKb
 oxs4TkZ46IOOOzwErax+03oga+ud4RA5ABn2ckO9+qT8fUPy3GhuUXscu70HfPiUymY65J5HtKS
 x1v/qKELfXqmLSu+t4/CfIGxtLVN6znV8WnqApVX89X3sYG8OJFT1Lrqv3H83yFlfcW/aaKlxe/
 UTOgL6htm/yH98HfawS0BAuPXG8f8J7T7geAiZ2LhiEJoivaWalj9qcuNxa05izSy+54u3NwoXQ
 /cCACpUNeOZnAGatJra0dJW4pPehjlM0X3TtI1bgq/Z6TL08AoZa7wmJaxv3kYvoACDSg6uQnoz
 0pzCePqB0kse0Fz5H8nxVc7Z0VWBAkc9Ij4s5Fh+S3l0CDIIxk/cr9PNYBUxtcF2Qqb75cMiueP
 mvNcZp5DsU99p93dsNst594/1XVkYTPcpurKSTtmOvxTImC2AL+0RCI+BY9CsuOpYiqnGVMTe7N
 mGTNbC5b8FDZe9TtKb2nhVBwrMt9OrVGLqj7gT2yMGUiKesa6kTrkd1YllkFpEDiLJJW6fUsWJQ
 zt1Psk8ettsFrj2CWt2WZdymF9Bz/KV8ycv/6A3TMtQuvymfQHZnQ83QUyLw3a/GekISTmoqW2B
 Nc412T9BlsDc0+A==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Subject: [PATCH v3 0/3] Implement Send and Sync for clk
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

The Clk type is thread-safe, so let's mark it as thread-safe in the type
system. This lets us get rid of hacks in drivers.

For Stephen's clk tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
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

