Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C2B40971
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272F910E1D6;
	Tue,  2 Sep 2025 15:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TvID21wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AEE10E1D6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:46:39 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45b8b2712d8so26118295e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756827998; x=1757432798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ehw/eR0F2M+6G/BFd9v/1nkHSYwDgsa32Hkiapct/js=;
 b=TvID21wxalyRIeaog0ASrA6+txFwJKhnjqOa+wx5ysAhwixLyGyS+8JaO3236lDPuE
 EwZTSsc/exb2KsW8AYvix3ZDSoRVDHtzikHeIrfub/rOgnigXcUXzQq+mrqCGUJDKzkB
 IU0vpgxt8Xqp7JF6SdCtchMTrFZr+pnlDhaNiusZx4WAbK7yd9ZjX1TJVls12aTRdu1+
 YKlRKWjsNGcq/MmdWZFfAK1t55sHYIGwSxNaF2PPYyw4mYtm4+SkWTCb0IlyrZi5w2VX
 CMNu9OXQnktEz8ub6dhck/46+PLYmRRJR0e5WiIZAOA3bLHx/noB4CNtw4DCrducTxsI
 Fhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827998; x=1757432798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ehw/eR0F2M+6G/BFd9v/1nkHSYwDgsa32Hkiapct/js=;
 b=e8QXFt6NPcrPR4aWtHYd/26elAQv6zE30Yia2ymLdHXJMJ5LbH3jssb2uVPY0CGdnU
 3izqoAY92z/X6wLiGgOQwysqEofl633E1PLmZ1KyVnYfB+t+1xzpOghUExLCf8wNfyhg
 Kt2kKZqRU7ovaUZdHTiLH0NDz1LY90AdSCDxTdCy0c2ZtgQtxK3PU/6R39n9ipVcGxGf
 SJ9YyAosoPgn/3wAinA/PXS0NBE1UUYqG32egL11GfM94zb8Ka2a9ttRSZ1ZXstlJQD9
 DQvhpT7texb1iK98ShkzFawN+yf3YSulTJjobVDF6pvtUW2P3uJ9nGBKiyxgRL0E7O8K
 fU6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHOIGPqzaZk02D4RVwyVO17z3JwRowx0fsbW54UTxYjf98zpF9s9tk1371WHr+H4sXY1DdUrOi2iA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD6IVh/DDtFtuKvGATsCaqkpBC9u7i2uQ8Mq9kcQnQqG9CPkeM
 setEU/wH/qvNAE8pqDyDhFmG7yWJaOySFrRpuN8XlLLDz/2l/a1EQnqj
X-Gm-Gg: ASbGncs3Gjc21re6LmvuYuR7+Ln3R7FJQskwoYOFGKBJvOsdz65hugExzPHRPlTKQ0j
 MNWgeTC1EqTDdLAKRvrII/V3zsZovOzNDkycL3k0My/dPldhs8dnAcoiRX9JvrcQcqECM4cLfHQ
 ii4c0gE5JhbUs55rmnpjm3VnYQ/xfXu8af2+h4i2mfHiOIsfPIYb+jl8f8w3geOAQXz3p/Wb2Iv
 sNEksnytlPm+dIIfbvwL7Gt5z0FqrMFmn8nq+Fl5zZzOUny9UqVGRG4jatbpAUKu8lk+tMMUni/
 1tdzJDK/y48qV+/VkgEVkaTl4ak9QtKwXx1BVafDMt1HRa8raEXu5ywiUYplqahPfwaucn9CBRx
 DdBQXdKEHrgak/9FuwvwYl04fLiY8QJZCs/upbMPeQBd0ew7HmRFGurCeccpuVDYT74s7WmK1F1
 qmZu81M8jsqYhFsQ==
X-Google-Smtp-Source: AGHT+IFWiFaPK/3SzCCDMU0eaVs82NQJjjs4OJMxCNhx+PRy+qfGvhLoB3urjp1BVbB0eezwx8zy/w==
X-Received: by 2002:a05:600c:8b33:b0:456:302:6dc3 with SMTP id
 5b1f17b1804b1-45b877be066mr95265895e9.26.1756827997621; 
 Tue, 02 Sep 2025 08:46:37 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cf33fb9d37sm20384921f8f.49.2025.09.02.08.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:46:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
Subject: [PATCH 0/9] dma-buf: heaps: Add Tegra VPR support
Date: Tue,  2 Sep 2025 17:46:20 +0200
Message-ID: <20250902154630.4032984-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <treding@nvidia.com>

Hi,

This series adds support for the video protection region (VPR) used on
Tegra SoC devices. It's a special region of memory that is protected
from accesses by the CPU and used to store DRM protected content (both
decrypted stream data as well as decoded video frames).

Patches 1 and 2 add DT binding documentation for the VPR and add the VPR
to the list of memory-region items for display and host1x.

Patch 3 introduces new APIs needed by the Tegra VPR implementation that
allow CMA areas to be dynamically created at runtime rather than using
the fixed, system-wide list. This is used in this driver specifically
because it can use an arbitrary number of these areas (though they are
currently limited to 4).

Patch 4 adds some infrastructure for DMA heap implementations to provide
information through debugfs.

The Tegra VPR implementation is added in patch 5. See its commit message
for more details about the specifics of this implementation.

Finally, patches 6-9 add the VPR placeholder node on Tegra234 and hook
it up to the host1x and GPU nodes so that they can make use of this
region.

Thierry

Thierry Reding (9):
  dt-bindings: reserved-memory: Document Tegra VPR
  dt-bindings: display: tegra: Document memory regions
  mm/cma: Allow dynamically creating CMA areas
  dma-buf: heaps: Add debugfs support
  dma-buf: heaps: Add support for Tegra VPR
  arm64: tegra: Add VPR placeholder node on Tegra234
  arm64: tegra: Add GPU node on Tegra234
  arm64: tegra: Hook up VPR to host1x
  arm64: tegra: Hook up VPR to the GPU

 .../display/tegra/nvidia,tegra186-dc.yaml     |  10 +
 .../display/tegra/nvidia,tegra20-dc.yaml      |  10 +-
 .../display/tegra/nvidia,tegra20-host1x.yaml  |   7 +
 .../nvidia,tegra-video-protection-region.yaml |  55 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  57 ++
 drivers/dma-buf/dma-heap.c                    |  56 ++
 drivers/dma-buf/heaps/Kconfig                 |   7 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/tegra-vpr.c             | 831 ++++++++++++++++++
 include/linux/cma.h                           |  16 +
 include/linux/dma-heap.h                      |   2 +
 include/trace/events/tegra_vpr.h              |  57 ++
 mm/cma.c                                      |  89 +-
 13 files changed, 1175 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
 create mode 100644 drivers/dma-buf/heaps/tegra-vpr.c
 create mode 100644 include/trace/events/tegra_vpr.h

-- 
2.50.0

