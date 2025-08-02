Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C158B18FC5
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 21:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33E010E182;
	Sat,  2 Aug 2025 19:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="k/TLRxfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EC910E182
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 19:26:01 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3138b2f0249so2805405a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1754162760; x=1754767560;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jd8Da3JQX6Y4PSybA2tHWl8SitZx9sYR2KOlV5oLUG0=;
 b=k/TLRxfT3nmQ+Vcd5V7rBpKQj3y6sk9s5jjI5YwFWxdgouKAmzAbsI7KmiSEEhPRdF
 1bUixlrpcAn5SwGF8mVX8ep7cjMrhJ/B29/CeWzZiHtCEmvdJk50DfH0WZ3gprCJAt9v
 vGkD2yp0PHTXKaI0kZcJujEy+DD3OUgBgxI/8qkCW7NDmEvuoiDwwDjbkvs/T66KvVfc
 ttlLNHvYOlaLaxGwTa0nj0kEDqdsnoJJZq9d+WfMxA280ul4d3tfuima2DEkvkHL1bXl
 39orlEpALnu1KkUdGLNfu4fFeTWskXlkHGsgEzf8EoqR+pzlsXeXdCHrjOhIeAEyW2Mh
 5k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754162760; x=1754767560;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jd8Da3JQX6Y4PSybA2tHWl8SitZx9sYR2KOlV5oLUG0=;
 b=JyyFGEkC0jCYRm0Nnt5un0eicWqZvVGBuReGKSS1kkyI50n3nbO1gMHD57kWwOEYNq
 jRt/Lo/fDrjn5XxyZNIsYqQHaVHx5pLuHTc+M2oemvirQI5lEJLZkYO5UUWCMtz/odgl
 ZCgazxM9YqC9Pgs+Uxi3AvfJ1ind0cD6WKTpAWUDNHOMIn5Czxj8nJkRg8oQyRgCKQFQ
 flIP0a5yW62vMFHuscs/VUrAoHdBA9vxSJKs3h/33qTQKowcac82KOJr7o8USkrmTwC/
 j4E8cOY5tk0texDCYakrxjdonGnKT1lDu73GfcOJ0b7/oip8sn+9kyXO8FQpOF9yYHqJ
 x3+g==
X-Gm-Message-State: AOJu0YxPIeCbzvPpXCgwydPAzfBucZm2WemAxYgBEG8sTUMh1Rv5D64X
 +ONgLFlk7SurPg30JXuk7rT6SZ/HM4rXx8QWu6rMtQsM7GQIHlRZvqqo+MWvC2WeDxw=
X-Gm-Gg: ASbGncty8oit6d1hZvzxlz+p//lINICfkvDt4wzRzLq5ubYihfkjvMhe6/RgwsL7oAm
 /O1d8U2mnnj2Ntm+/0skqPccBitCrdPsEy1OSXbg7anqoAa1I9chEcNefNCiPanntA5kMN5Hkvd
 ndkmy/T9lKgjwCFUaPJIvbpXLNCu1LZDSEWt4lVJKC7UoeSTLasKjDZf5wNV+dXOQFYyKqx+BvO
 wwSDoeEEu/LngOivp+BEbdXyEYLDN2j+rl/k5tT19vzBuEf7EFxPegdI6tr8T3ba912zNVRXlfK
 s4MA0sSlKPgiSS/q13PhvdTUIJfNUVb3iP2G4kBBWTRi4FhWTIT/meb0ltPhEZRRuJ/mYeo4+4S
 BrW87YtFemP3NJdqywYvWggT+ev/aqmYfFOk=
X-Google-Smtp-Source: AGHT+IHO/dHbjA7eIboeg3fI24euyvdKdfkdQISMXRwMVcyEDVOqzT7XWdU+bvEG1Xrt7oOpsscNCQ==
X-Received: by 2002:a17:90b:3947:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-321162dd19cmr6357739a91.26.1754162760525; 
 Sat, 02 Aug 2025 12:26:00 -0700 (PDT)
Received: from mystery-machine.local ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eba6bb8sm7887583a91.4.2025.08.02.12.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 12:25:59 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 0/2] accel/rocket: Fix build errors and sparse warning
Date: Sat, 02 Aug 2025 13:25:45 -0600
Message-Id: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADlmjmgC/x2MQQqAIBAAvxJ7bsGEyvpKdDDdcilMFCOI/p50H
 JiZBxJFpgRj9UCkixOfvkBTV2Cc9hsh28IghWyFEhJXvjGeZjeOA/qQccl8WDS6b4dFK6tFByU
 OkYr5j6f5fT8NmHveaAAAAA==
X-Change-ID: 20250802-fix-rockchip-npu-build-ca759ba8da06
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Brigham Campbell <me@brighamcampbell.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=me@brighamcampbell.com; 
 h=from:subject:message-id;
 bh=C1UaNTuACGrRkW2E3FhQG0DrBcJFu24wR9QIIxX6tno=; 
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ0Zfmtv7o5uupt5bnPdMjn/f526m5kVXn/6sVQpTOp96+
 PeaOuWgjlIWBjEuBlkxRRaVW7PUL062fnQwgn8CzBxWJpAhDFycAjCRwCmMDA/UMytqO5aUsglI
 KG23b5S6fGmhnm7l78kzPFQjDRn2yzAy7CmRdzylbH1S+l3i1E0JX9tXmZ0Nfqj0aUIgp63bdLs
 4RgA=
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449
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

Fix two build errors in rockchip NPU support code which were caused by
the integration of recent changes in the drm subsystem.

Fix a sparse warning regarding an undeclared const, rocket_pm_ops.

I tested these changes by enabling DRM_ACCEL_ROCKET and recompiling with
`make C=2`.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
Brigham Campbell (2):
      accel/rocket: Fix Rockchip NPU compilation
      accel/rocket: Fix undeclared const rocket_pm_ops

 drivers/accel/rocket/rocket_drv.h | 2 ++
 drivers/accel/rocket/rocket_job.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 01ac6e4e53b6351df42c97d217b0d2dbeef5c917
change-id: 20250802-fix-rockchip-npu-build-ca759ba8da06

Best regards,
-- 
Brigham Campbell <me@brighamcampbell.com>

