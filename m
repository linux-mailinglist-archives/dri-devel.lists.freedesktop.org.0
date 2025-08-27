Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F30EB383C7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A910E81D;
	Wed, 27 Aug 2025 13:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3w6R72vi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EBF10E81D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:38:48 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3c380aa1ac0so2652358f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756301927; x=1756906727;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ReergRz91VYiD0psPGfUqTceP1iKvfFRvJIV10khnlI=;
 b=3w6R72viLym2q2XL+ml/cNcPp5wADsr8/5Z/LqXIv2TB3kF6ADNbixKDB+V4yPNX6i
 OI58qf7Ui4Lydu4X6lPz4Tols6ko32se32Jq4dSsveu3Xc0X3r9NiOpa2Tpzd9onhc/p
 p9M7/ashiCR+soIrv3egkRj5melUSBfnYEx8C5eArS+eI5TQxyV84huT/Z92+LIBahJe
 tvIQ6+cjsRyLfJbRh20Sr5wZQmCLwvq99lvtbNCnDM3i0uVElvPVb1reLfsiDYWY6++6
 4lwv8q1eNDU0qVB2PE5Ys6jofUdmFv29+3WMwx/Mn8R2MGPPiNZo9Ikuj0JtaZmpZdbg
 iN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756301927; x=1756906727;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ReergRz91VYiD0psPGfUqTceP1iKvfFRvJIV10khnlI=;
 b=VKqxODb2Ys3v6U3BuvUMVGudc+4EcRIcK31i40tkBt7bhW8fGpvY3zaoRANjU6N8V2
 xYCgOghPPo9fOSOBy4Jfv4NNzaREmgor8j3iGDD8UyF39D2BwysyzI3nNMPI6swuSSnU
 GyEUeaopQHwjSKtIusGdTM4MoX/2L1AHugfUhJWwJKHMzAT8vyQ68iK7WPeU+UH3w9VI
 SyRFs3OxuMcy/6MZXrXcM1O/aS6WbD07DYw2mVdoj2QKTrR5F1zyvx9S8BcG0EeDb8v3
 fKXf7j175keg5aMY1DgxQdkO70lAf5zhFY6XRcLWuG2rYkJ6gRuzjTvKauGgyfuTEu2Y
 GHwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe3adH4VKL5p5aoe14zcCsDnvv1jPE0ojzhKhr4ggKxeqhckBkpxLx69WzXng3ymUT9FQL/KUPkY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKlj1UraaNHVkzA+NHgIneKx50JC+BlMuBjGEPi2F19+nj1Bqu
 gpaNUJr9EjdaXFvMqYOYkY/DIEubJXjj2lbLhLPjU5xmezaAzpfWr0XrEpFZRtmaCJd9x/htHy3
 IXMf2Ay6xqllU/XiIbQ==
X-Google-Smtp-Source: AGHT+IGDR/KKmo+S77dpLzFH/5ksImWOImV2ATqsae8Vpzppb4G/We+eedfsA/IVYVa1fkU/sTJDsVbNv2iumkE=
X-Received: from wmbdt7.prod.google.com ([2002:a05:600c:6307:b0:459:df20:248e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420d:b0:3c8:e9d3:c380 with SMTP id
 ffacd0b85a97d-3c8e9d3d035mr9768151f8f.0.1756301926661; 
 Wed, 27 Aug 2025 06:38:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 13:38:36 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFwKr2gC/33NSw6CMBCA4auQrh3TBy9deQ/jorRDaSKUtNBgC
 He3sNLEuPwnM9+sJKC3GMg1W4nHaIN1Qwpxyojq5GAQrE5NOOUFrVkOZpyjhH6ecAE7gMEeZEl
 r2QiRY8FIOhw9tnY50PsjdWfD5Pzr+BHZPv3LRQYUMG2opsVSV9XNOGeeeFauJ7sX+YfB+U+DJ
 0PlTDKqmRbN5cvYtu0No2drIfkAAAA=
X-Change-Id: 20250814-gpuva-mutex-in-gem-a608ab334e51
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=T4Kk9hg7k6nwC121hIRmflX4axzXFxAKRAccn6Kat2w=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBorwpfI6fZ1Q+VznBKbZhsynvbCV9QJCFz4ab1e
 we4fTxdqyGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaK8KXwAKCRAEWL7uWMY5
 RqI0D/9lXu1uJWu6+0Enpnp9JmQ1MzDX/FOFXYDJEa+jdrDhWIQj5H91zbkjIrhcpmO2eKoIgjR
 OUxOX0st5kQXKD21DCKJXUWh0lyn7DT/6yiWRC1xjLro7xiUd2RXDWu6TlbIoVIkYAfXMhaNyOf
 E3T3u3WbsW14M++h1pEl0IGOvPm7/24F4KwUlgEMUUbl6EdJLKQzf0vQenjwVSw8sTVuJ5SjupH
 R5YnOoZWC+rUTDAiqdeQ4534INCopUh8Sg7BdugkVGuITub4UncURL1R60cIsjWckoYou9L7L2j
 rTZw3BzldQ2crlaOEeiXmugYudWxsMez+JVEK/SUS1TFPP2sZuVjLLHSnkhU0g4KagwleTClrNY
 pM0zeqkb6lZcPkOKAvehAMtZc+YFqNn8nDC/qzpoW5TP2Pd3XY9K/ub1B2gbgMMQHSmGhMbJTqs
 p9L+swwuntKUVc9o7zn4ds+cSl1h7bqzxaAK9suEIaJDkHJOxvPErLK3+f20EjjRC79yJ//U18F
 yYiLzydHoE1YSR4gWVmvxxC8P/fUv2U69VZ+5ckSxwDzvSj1T4mQILaNgXWzbEAOKBaLNOkIGVY
 6X7k5/lxwVBofFI7HEpsyVaydIR+UOhRLlILIR5rKrF8e0XKK30dEW8ZshYMW4rRUoswZr5q4Lm
 moY/XiZMetGkcoA==
X-Mailer: b4 0.14.2
Message-ID: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
Subject: [PATCH v3 0/3] Add mutex to drm_gem_object.gpuva list
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

See the first patch for motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Documentation improvements in patch 1 and 3. 
- No code changes.
- Link to v2: https://lore.kernel.org/r/20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com

Changes in v2:
- Move the mutex_destroy() call to drm_gem_private_object_fini()
- Add a third patch to get rid of the lockdep map.
- Link to v1: https://lore.kernel.org/r/20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com

---
Alice Ryhl (3):
      drm_gem: add mutex to drm_gem_object.gpuva
      panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock
      gpuvm: remove gem.gpuva.lock_dep_map

 drivers/gpu/drm/drm_gem.c             |  2 ++
 drivers/gpu/drm/drm_gpuvm.c           | 30 ++++++++++-----------
 drivers/gpu/drm/panthor/panthor_gem.c |  3 ---
 drivers/gpu/drm/panthor/panthor_gem.h | 12 ---------
 drivers/gpu/drm/panthor/panthor_mmu.c | 21 ++++++++-------
 include/drm/drm_gem.h                 | 51 ++++++++++++++++++-----------------
 include/drm/drm_gpuvm.h               | 30 ++++++++++++++++++---
 7 files changed, 80 insertions(+), 69 deletions(-)
---
base-commit: 3f13bcc886fc034113cb75cb32b8d9db1216b846
change-id: 20250814-gpuva-mutex-in-gem-a608ab334e51

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

