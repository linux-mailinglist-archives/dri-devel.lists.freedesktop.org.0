Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD80D3C567
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC9010E5AF;
	Tue, 20 Jan 2026 10:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EoTwqOBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE69C10E5AD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:35:06 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-4359064a1daso277870f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768905305; x=1769510105;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t8zPX3QNCnb1hxlC+O269lFOl5dk4I2c8T66eA2u+oo=;
 b=EoTwqOBLTXq/hBKIzlMDc79xjJ/iFyY0XSCE52+aYGmwUzxLLcFv5Diy9p/+IKL40h
 H/VAa0pSpxn2b8IB+adxeOAV/2fUIpNReQ+jf+e7MYpNg/j1lJED/Fpiu87vvS6U8eXr
 NFnfCKjKYBo+4vGR8o1J5Voar9fvsDSg7xESa1xj48hvGXaxt8e1SfX1QOZnNAJOOogj
 7kf4pEdb8GwM7Yj2Z1frZ/QKCDWXuq1HFsQVvbvkUlZkCM+20zxMb1FOA0wxwBEP4vJ7
 Dla2dYjQZMZUAP+VAaRhJjTnpXTNoS1/c3HYQgybY5qxN/vbNkDizzgMRCeZnDK274a1
 XLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768905305; x=1769510105;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t8zPX3QNCnb1hxlC+O269lFOl5dk4I2c8T66eA2u+oo=;
 b=uwkXKtyR23LHuEHWc5/LTJQmQrOdiv/TUTJuZqXoWdwoz5ksmCxPIaRgmMd28oFt1v
 TFBsLcypMDhixgVdjakS+oqThPwG1Sqf3uuJTNKDAcEFjG6dMQBkBll+70J70AtOagZ3
 zI0t6XZsWuslAOX4spX95avsuirfdR+B+/qXfxRKqvD998KJnY+6yfSYaRKG5YjmzNTt
 r9PJiParxwit24YnBoUnT6nuU5ZMGTF6KYEguMQNV4h9w+aC5QkCgCBIdC2B19uAbIeY
 RU7Z9C1gDEpou4bOb7znDGyQqq0rYNJU+P9dr+u4XmMnyiY5D3Zl68laO7UZYnQ/P/8K
 F1pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHl+KRFEvW/jPT1VhMfU/6RSjDbdOYKFEPEiiCImbHtELfMxcaJFzRC+aIQJQiUJMwwPWZBp2b2Fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj1feOZbHPHSvaEq649dfETSqUsPeH2IWAaXFjJq4V7Ry8h+ke
 t2d3Zzb8NJcpMiccLajb4QgGmj/AD+q7rKPKKjkciOqtG7FO00rE0ckJcLOcG/KhmJgCjigCJ6h
 2pnyeOiJ1t4EewobHng==
X-Received: from wrpu11.prod.google.com ([2002:adf:f88b:0:b0:430:f5bb:5f60])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2502:b0:430:f3ab:56a1 with SMTP id
 ffacd0b85a97d-43569bcb6d7mr19546165f8f.42.1768905305346; 
 Tue, 20 Jan 2026 02:35:05 -0800 (PST)
Date: Tue, 20 Jan 2026 10:34:58 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFFab2kC/x3MMQqAMAxA0atIZgNpoQpeRRxKEzVLlVREEe9uc
 XzD/w8UMZUCQ/OAyalFt1zh2gbSGvMiqFwNnnxHzhMet+EemTBtq5jkdGNPzMGHXkLHUMPdZNb
 rn47T+36xCox8ZAAAAA==
X-Change-Id: 20260120-tyr-pad0-coherency-70dd5257e56d
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=7177AGAPMaAsse1GpOLDrh5z0fRmMiDVTyg+0N86qpI=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpb1pTdZHkPDO1zexExeex9rmm6zlMr1egCXquP
 NEYbKmkE8eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaW9aUwAKCRAEWL7uWMY5
 RkKHEACS0z5V0pJCYH4Oao4jlIyfX0Qe43IGGJKYVDlO/ypO91T6aeKcAyGgXWroP92hcBBlVpJ
 l5uVFzlS8j1AuruaqDWmMepdYtNmamkWGn9oYaj2MBT0aW/bJ9lOISl3ongSHzFhqAfjJkuPNM3
 31qCthossofk62JQctMZOv7Q9noMgRcjLh7loImUvlzxGaZM3b8bLQnk13CfJOB5UesjSdWZGjs
 bwzvoo9K/lPLpfEIBVLsbbmnI8N4b/DSvFtoQ73UYOLq6fx5wFkqR5GkpIYrzX8CazvuvkECH5Z
 Q65ROTehPnzQnMQfn+s6e6JZWaaRqa1l9KwsSZEhexqm4LG6amTh+DqYlfCjdGltsErZI9C96xu
 VVWym96oF5hHK0aVwSaSNNxz8NncM2KkIzGZ4/yEZpXMB0kO29mh+2IHX/TUbgPaSjXNRIeO6hE
 iPVU8OV5b9G07qkTzMPzx6J0nMVoW6LMb7biiZyymX6jB8iRhTi/A0s6P2I4LrqQHRr9VFW0sTA
 QPcf6ulLf2JssfG9vDrIATmYwj+SqeoFONfTr/vpR6u4zj8jfupE3FRrCobj5QzRgj8k9mjbe/m
 h5noI44ladav7ZWcVw8jm8IvVjTzYG3EgWAciEHPB3kp5y5Ptr7Vz26V2odDE+B0ZRSNG3aq59v
 FH4OgHqCp8W9TYw==
X-Mailer: b4 0.14.2
Message-ID: <20260120-tyr-pad0-coherency-v1-1-91f40e56c67a@google.com>
Subject: [PATCH] drm/tyr: rename pad0 to selected_coherency
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
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

This applies the uapi change in commit ea78ec982653 ("drm/panthor:
Expose the selected coherency protocol to the UMD") to the Tyr driver as
well.

Once this is merged with drm-rust-next, this kind of change to the uapi
struct is automatically reflected in the Tyr driver's GpuInfo. [1]

Link: https://lore.kernel.org/r/aW8-oH7dtp-OTAZC@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
For drm-misc rather than drm-rust.
---
 drivers/gpu/drm/tyr/gpu.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d93006ea0ba10f876a487b156e313..fb7ef714540218f7d9b742021af327e1467076f7 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -8,6 +8,7 @@
 use kernel::prelude::*;
 use kernel::time;
 use kernel::transmute::AsBytes;
+use kernel::uapi;
 
 use crate::driver::IoMem;
 use crate::regs;
@@ -34,7 +35,7 @@ pub(crate) struct GpuInfo {
     pub(crate) coherency_features: u32,
     pub(crate) texture_features: [u32; 4],
     pub(crate) as_present: u32,
-    pub(crate) pad0: u32,
+    pub(crate) selected_coherency: u32,
     pub(crate) shader_present: u64,
     pub(crate) l2_present: u64,
     pub(crate) tiler_present: u64,
@@ -89,7 +90,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
             // TODO: Add texture_features_{1,2,3}.
             texture_features: [texture_features, 0, 0, 0],
             as_present,
-            pad0: 0,
+            selected_coherency: uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE,
             shader_present,
             l2_present,
             tiler_present,

---
base-commit: d1c0978a7e7864fcaa7cdd562a8f938afcd2ad39
change-id: 20260120-tyr-pad0-coherency-70dd5257e56d

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

