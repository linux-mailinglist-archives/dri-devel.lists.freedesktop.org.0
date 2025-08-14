Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90903B26814
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 15:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5110E1B6;
	Thu, 14 Aug 2025 13:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v8QWYd7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AE410E1B6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 13:53:27 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45a15f10f31so10657105e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755179606; x=1755784406;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VeEzkQgYmIMtzyp7xMy2bVRBv2zDb/Ov8v16nUBQdMU=;
 b=v8QWYd7YVcsR0VykRVltN0nUhuWx883CH/Z/Wv4dqVaq5yTVTgLmXqZmHdf1vk9JAT
 UDxWRIAlGMgKekOx70LerFMAW6TSaJ6wErFFU51Br1VqdPGnJsKAnFkLOEQaVbFKEBeB
 fBXUyLeoaUGZLlO2yBZ8MMPOn1X0Su8j44Bl1O54tl3VCiKMsQ/b5HHTWmLZRHl7pZ3E
 SYUhNsjM+IgODp24MOTflWAXS6iDFj8lhCylgRxi6KgpE3XXJsH392IaDlK/si9BBZD0
 GweejFLa3Coi8tQuFjFOgTjc0OFj2OM6SCFkM8EI8gpA2Qhn+I2n3nVKa/gSAiLidt0I
 TnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755179606; x=1755784406;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VeEzkQgYmIMtzyp7xMy2bVRBv2zDb/Ov8v16nUBQdMU=;
 b=Exd2wgM3IgASMyRAE8Qcy3hxrpV63cvBYznqj9A+wZZz6p6dUlSZRV0EkY+75MBfgW
 VGYiRmtdhr9BeNbsjFtPUCObzlMQw+5qPbF9Hk1KLnJfTMCjKU1XEEsm+qH7kUfP9CT5
 mpmoKYZowst7qces7r0TdY3+dXM7NSNV9yVP7Xk7/pFHeNPJ4Jg0Wq4bxOZ3A/1Q3DaO
 LRjKMa5GCWYhe9Aq5MNejYw9mgGmmiQu62tIwfjZotY3gE/W9I5mS/fj5is0Fjw6bnEe
 DuLUOhyM9rxE68gnKNyK3cPumdqRp44Tk2YsJ6T+06/fU6KTTQlbpfDWhwGSnr8XczRt
 W84g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ZzZ+YZ9Yjour2AU2pkxEtVDmzwQw5wwYPG5fz8xlDgGYvIYimExjg3WucWlLYmlK4fshrg+UKRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGi/pBJNu6ATS05VBRzh445z6M3t10d2GiNl2InktQV+uKe9tF
 BESnWi6+0Hh4Avl21CPVT3R4Fiel+x68HqLNOIPaTYUNOWocXs63v/d3tyzLXnba2uEbNf5hPUI
 0zPA9zJYOrHXm+o/13A==
X-Google-Smtp-Source: AGHT+IESfdeJeKr09jw5WbnVm2g2GYGGRoae20RO82NBmgfW5Xq4wFMtQ8ks4BUMu22uttfxn9AvnmK+x6a4z2c=
X-Received: from wmqa18.prod.google.com ([2002:a05:600c:3492:b0:459:dc99:51e4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1907:b0:456:2139:456a with SMTP id
 5b1f17b1804b1-45a1b7bf046mr24221705e9.15.1755179605642; 
 Thu, 14 Aug 2025 06:53:25 -0700 (PDT)
Date: Thu, 14 Aug 2025 13:53:13 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEnqnWgC/x3MQQqAIBBA0avErBvQrJCuEi2sJpuFFloiRHdPW
 r7F/w9ECkwRhuqBQIkjH75A1hUsu/GWkNdiaETTCS1btOedDLr7oozs0ZJD0wttZqVa6iSU8Ay
 0cf6n4/S+H59RtYRkAAAA
X-Change-Id: 20250814-gpuva-mutex-in-gem-a608ab334e51
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=727; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=abS007O1u+hwW9gFpKL4+LBBc2SxxpNq5FxcSBGjtYw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBonepM08eUWZmldgb0RLPzTFzkATvv5oCAc12Q/
 f71nkR2gpKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaJ3qTAAKCRAEWL7uWMY5
 RnTAEACTN/BeQv66T5iOnfFiSziogfTb6vockzGSNafTl2E43jlEbAw5YvB1WPhAKmRJeF49A5X
 4v7d8lkN0XTbAWpyO0w3fP6Z1GKmPqcVMyGNXf6+/KnipfQ+lTpDgsqg/x4T9FKfUYt0y8MyJ/P
 bUCDQA/A1Luu00AgK5xn2Q19D5EVrMUfYjtKCF8ZuQ9t7Czzk7A+c9ngKeurnOeOXmHHejDXfka
 imnHWZLc3orir0I/UpeJWxAPbvocBj7zOY5VhuLQkST534a/9w0FcEzhQ15QGpoLo5VvVapclnb
 V7MCIXSyVPHkQhchZ4LsMlOth333nUy6WOrHwZ0AlUfsKDlldf0gM7Kn/oF98EYo8OX5RiUayGz
 osju1k6YX80i0+llYWrvOKBPwk2wYE8DBVKi3GGsNqrkmAA+2kWkCkvTCkSDp0q/NeKXpbUq49d
 eUqhGpYT/VYFfcFpM52D3FAcXPJ4PeeJinrN1vOLnyoHqd3Rtr7l6ak81fHf9MJ/Yn5/JFWDBG3
 BKN/fsRTCupANwL5AWQwIUO4m3ou9/Pp0PuwyXj0Wkk5rO3LYcWdZYTxwVTsKklD0xABeb9RmfF
 8kpRpBF2SvfItVhpng8d9n0EVInxqduT0KafbkArhdZOH8EvLvi0wBaQmgM3iH8eL1j6SJMQXQw
 zP6j5xbOkjx39vQ==
X-Mailer: b4 0.14.2
Message-ID: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
Subject: [PATCH 0/2] Add mutex to drm_gem_object.gpuva list
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
Alice Ryhl (2):
      drm_gem: add mutex to drm_gem_object.gpuva
      panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock

 drivers/gpu/drm/drm_gem.c             |  2 ++
 drivers/gpu/drm/panthor/panthor_gem.c |  4 +---
 drivers/gpu/drm/panthor/panthor_gem.h | 12 ------------
 drivers/gpu/drm/panthor/panthor_mmu.c | 16 ++++++++--------
 include/drm/drm_gem.h                 |  4 +++-
 5 files changed, 14 insertions(+), 24 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250814-gpuva-mutex-in-gem-a608ab334e51

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

