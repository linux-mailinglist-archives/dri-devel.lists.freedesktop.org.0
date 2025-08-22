Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF141B31304
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 11:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209F010EAA9;
	Fri, 22 Aug 2025 09:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EktH4+C+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270E10E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:28:48 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45a1b0b46bbso8986155e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755854927; x=1756459727;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tdZspPlKaSzIHZ+2SN/TDgYtX3ulzfnLR3chwiPSwtY=;
 b=EktH4+C+TVOjSQbcmOHFSdhTrZG5cSzW8Dhf0iwopUmNYn00FX8o7WuI3ndIryFQc5
 1rgdxs1DzfS/gUBoNhSGs/GU+RUqLbiZIp2x74L32KPiU6ZAtdr4p7EhClvHNJkSEwtZ
 itJoWwwDuN3U8m7OxEy2sAFFGIo8DLmcwlWDqA3O9D7/KAtaqDPNIoPG5kuq0RzpOY5G
 gJk5QDA2YVktvcppWR1xnxSB/RhShIBWAR9N8Gq3ZMaSI4Thxrpt1QFE1DkIruvbjm3C
 wz2Ra5X0OTxrJ90UQqwLJerz2U3dog2RBjXh6IG0QjlcraT6QD0XWT8rN97kWQLjzRaT
 EyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854927; x=1756459727;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tdZspPlKaSzIHZ+2SN/TDgYtX3ulzfnLR3chwiPSwtY=;
 b=C3EGnzIfotUcet5nRo8VVXJMaXhZucZPZCv4UN1pt6g56yHIaF2qk8czUyCq+Rk+fE
 BvU7A7m07sqnJcN1oX856Ma7r1iZs8BHxDqlFnbeDee04RQ42sjH4KJkZhrtQdIBmQMH
 ZmSmbhjcHHFnOKlJPG9VDjvyq9rvo+UfZCTnb801ixrM48GZZV7PQXaNUJMf8WA+GDfD
 E515XXX6cumUt1NjkdakpnNwjJaT1jnPHCcVreYu5Utg1hHsUZYUA+m3N5F31m/BHWEt
 c6XBMBunCjKocKd2ZKiP++OaO0PoXFL+PO+uhYMii8tmFdx4cO0dcJWqGcxUkpQ21cfU
 4MIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnh7PM2MXkBJ6JS9waUNLBpJKF5ZRW0LOh4wX3k0fCzFDRy9cEOqoDnz9XISbI3MRz4LZgVriG/48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuKNAg/etV9yg7uQcWLklub2bn1NonP5Cs/1mD1bGSOOb3YhPJ
 Ga5t1lyQUb7B26JMjtTxaF12N/ygipn5yOceWSWXrcfBPQl/r+/aZpNUeZp2zgqjZ6+vXpZwC3n
 wX5910wDD+Qiy4yoEYQ==
X-Google-Smtp-Source: AGHT+IFR6iebHf+8m9CthwrSpnbKhlvbWxtJ/c0VWjlsjpaPAyeik2NIhpLjJuZj3UbyEmu0IRZMKxiqKzeCS3M=
X-Received: from wmby11-n1.prod.google.com
 ([2002:a05:600c:c04b:10b0:459:d6d6:554d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1548:b0:459:d709:e5b0 with SMTP id
 5b1f17b1804b1-45b5178e893mr20589265e9.5.1755854927367; 
 Fri, 22 Aug 2025 02:28:47 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:28:23 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADg4qGgC/32NSw6DMAxEr4K8rquEv7rqPSoWAUyw1BCUQESFc
 vemHKDLN5p5c4Inx+ThkZ3gKLBnuyTIbxkMs1o0IY+JIRd5JVpZol73oNDsGx3IC2oyqGrRqr4
 oSqokpOHqaOLjkr66xDP7zbrP9RHkL/2rCxIFUmoM/UT12DRPba1+032wBroY4xc4q3GTtQAAA A==
X-Change-Id: 20250814-gpuva-mutex-in-gem-a608ab334e51
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=IbLEAjuHyqoZRTWTQ1Get3JTdLxmKfmmH4b9vD9fY7Y=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoqDhI7cJ5PRI/lSv1X75CC6AIfMHgMPZS1RZIN
 g5Lt7w1VqmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaKg4SAAKCRAEWL7uWMY5
 RlcaD/9/NlLC8uUEjxawJfxBiv/2EsetL0ASiMNHOOfB3U8qD816yL7nN3UvHwlvTrXHzhT7A22
 Vgbq/nU0Be2ft9I0TEzz8MIFc5iG66Q2TM3txaBp96519MrHNj6eZT1WBRC/ceFcOZYEWqlRDUL
 8K6QrGpO0DA3R2/xwFLBiTyNlZ/fmx4m/ZG48Et1sB5RpCSyu1aMGx8JallE79LUd3wlLYaJW8f
 bBa7iWaB5rLaPls3w9i1RorovONa2VUt9nqc/Jzh8TVuueKvcPOfS/01zeDnZXgexESZQQejF1q
 Z73usLjZ09gSfOg/TMwTjzj77iQ5vZnJnecgDaMNcKucZ1d9+NM/aOwjr1RUUXsUfqHQs09bspJ
 aHwKl1p6fQdDv83GK9qRKAXKuH53SmCIb3YufjTQhpoB1q/KctdRAA9sBhHNFUUrB/j8pyPeaLj
 ynhWmNIW8OXGFykqExurrsnJw0wq9lU1cnXy2G3+N2CpoxE4gweveYIUQFYUDZPknZas1nng3zS
 S/+z6oRE13mtKcNv8ECUK2LVceNOifVVZVIhxLUGY8/inWuPJv+qc8b/Dbx1yQnl2qpLNcbnVlf
 C6RvPM7HvcXdPvCrWTttwRJswy87NqMqXMuoSck5WftFq3XiwuvhEBbc9jPqQfAcWaPuN3fb00T
 ExxdTky9MUx9uVw==
X-Mailer: b4 0.14.2
Message-ID: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
Subject: [PATCH v2 0/3] Add mutex to drm_gem_object.gpuva list
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
 drivers/gpu/drm/drm_gpuvm.c           | 30 +++++++++++++--------------
 drivers/gpu/drm/panthor/panthor_gem.c |  3 ---
 drivers/gpu/drm/panthor/panthor_gem.h | 12 -----------
 drivers/gpu/drm/panthor/panthor_mmu.c | 21 ++++++++++---------
 include/drm/drm_gem.h                 | 39 ++++++++++++++---------------------
 include/drm/drm_gpuvm.h               | 30 ++++++++++++++++++++++++---
 7 files changed, 70 insertions(+), 67 deletions(-)
---
base-commit: 3f13bcc886fc034113cb75cb32b8d9db1216b846
change-id: 20250814-gpuva-mutex-in-gem-a608ab334e51

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

