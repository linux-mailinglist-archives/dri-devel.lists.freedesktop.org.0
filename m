Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A168CFA2D0
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 19:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485BA10E4DB;
	Tue,  6 Jan 2026 18:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TL8be2bi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988D410E3DE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 13:00:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso4527035e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 05:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767704447; x=1768309247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nbo9CTKl9iI9p+wpU++4dDR3MBazactVN245YZgjtV0=;
 b=TL8be2bi2AlgsDgU/idXWLQEPa3BBdrWebSOVNuy4RYSVqoiA91f53NQ9Y0PWvZcqH
 zeRGyHlaw550mBEQmYEOvVVng43nca2gm0XXqzsEPjeXFy9WDmKO6L8RX1+D/l7Dh+K2
 AjXGAClKgQXiIgUU+59Nz6pqsFhctgwYwezFuNkR2qm32LIyie9y/1V9t8SyDQ+8yUdC
 iHXeFtA47TLmeZFSptzmtHXzJIsvkEF/CXc9IyZWljdcrQmhotONvQJUv4HYqssDN4DP
 pKszHLWHU1Rw4NZOGNFDbaL8glqSpvCABMDyh8kcmR3kAWr8R4VW0VXOIn0nNomEySg6
 76gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767704447; x=1768309247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nbo9CTKl9iI9p+wpU++4dDR3MBazactVN245YZgjtV0=;
 b=PTzBPPfmpjkFpZrjgYZO8giFtgwmtxy5ZeLwehIpAGwKg9V3FtbPEDAOhw4Bsq0fK6
 beFWXXodsRV4NTvi9GFM+9PsoZDYPEDngW5vXNN/JaiPs34L9EBoBTS9CR+1NX3oPw8p
 d9HUqECyCFg8XnbcnHLddG0zQCdShdK83QdTpTm9ovG2dLsyDmwoQ8x+yLIoh1E49xN+
 o6leJZShhoPMow70YeyFaCQVJPZQKWKwLqlQpMrAogqeB1Gmfab+D2HRE7Osw3IJspZA
 Qm/ysOg3ArqlWeK4hZg8dY6/idlQ47q8vUjSw2NdQ2wWkjniMzLjcu1qIQRJnOoR56wf
 fPUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHCifxj3b0m5kUGYDSrKutWMkfvvDHxqouNf00C4RoRrXkd1+QlJezC4s07kAFV2hIXxBbUbbDPw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8msr0v9oU5SI0gv9oDmmUFwNnY8gub+qCA7oq7A+2NPtSvvgT
 /hRYQGPixM6Ak2edJyg91eU4/f6QvCQiMD94LQy12L5Uks4omdHz8dbo
X-Gm-Gg: AY/fxX4V/k628uKRzrCYLFjO3v1SF7NoE9W2g5iIxuFGAOgsEp7bDm8FK6B3MFDEf+E
 JBk/XLEjUsjrQ/4xodM74AKThFRtJiMrqk//FmelJpDou3hdqMCObucNxljLuNlf1+2jug6mt3l
 3m7EkUpEYV7qOA5SXNs4osB0kSn0Td2QmXNLH1n9lZtiDxD87TjD0pawkWDRVFbwO/AdvMygXDu
 MeXYCEDrb3e9lpGHxLfXwW43lwBoGk5IWzpKz8xUjQ3H2qZsKKc8dzpdizr+1Q3uwl6Acqbj3is
 bR6nnCHPg+xgP/CbZE5ooUIsG9h/rxYZUtc0CuAT31A3YF1YekUZnLkGtXtDZXNsoYoU774z2LX
 mOgmF43baaudwT14jYs5nWim0sdaz9SV6fbzqP5vNYk6lp19ivNBi8iUr3hwtErUuBE0cZkXewd
 S5cTySBSqJZskFJSAhdMDFJ8nM5wTCxvLpm9IOppc=
X-Google-Smtp-Source: AGHT+IHhEw9eqkK1KQJPCzdybojiNr+2Qye8Rob2jwtE95qwCczcNJiecqF6pkxIxbyLsgpc1DZoEA==
X-Received: by 2002:a05:600c:4704:b0:477:b0b9:312a with SMTP id
 5b1f17b1804b1-47d7f066c43mr26446565e9.7.1767704446642; 
 Tue, 06 Jan 2026 05:00:46 -0800 (PST)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f69dsm42684065e9.1.2026.01.06.05.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 05:00:46 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Ionut Nechita <ionut_n2001@yahoo.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Tue,  6 Jan 2026 14:59:30 +0200
Message-ID: <20260106125929.25214-3-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Jan 2026 18:32:23 +0000
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

From: Ionut Nechita <ionut_n2001@yahoo.com>

Hi,

This patch addresses critical TLB flush failures that occur during
hibernation resume on AMD GPUs, particularly affecting ROCm workloads.

Problem:
--------
After resuming from hibernation (S4), the amdgpu driver consistently
fails TLB invalidation operations with these errors:

  amdgpu: TLB flush failed for PASID xxxxx
  amdgpu: failed to write reg 28b4 wait reg 28c6
  amdgpu: failed to write reg 1a6f4 wait reg 1a706

These failures cause compute workloads to malfunction or crash, making
hibernation unreliable for systems running ROCm/OpenCL applications.

Root Cause:
-----------
During resume, the KIQ (Kernel Interface Queue) ring is marked as ready
(ring.sched.ready = true) before the GPU hardware has fully initialized.
When TLB invalidation attempts to use KIQ for register access during
this window, the commands fail because the GPU is not yet stable.

Solution:
---------
This patch introduces a resume_gpu_stable flag that:
- Starts as false during resume
- Forces TLB invalidation to use the reliable MMIO path initially
- Gets set to true after ring tests pass in gfx_v9_0_cp_resume()
- Allows switching to the faster KIQ path once GPU is confirmed stable

This ensures TLB flushes work correctly during early resume while still
benefiting from KIQ-based invalidation after the GPU is fully operational.

Testing:
--------
Tested on AMD Cezanne (Renoir) with ROCm workloads across multiple
hibernation cycles. The patch eliminates all TLB flush failures and
restores reliable hibernation support for compute workloads.

Impact:
-------
Affects all AMD GPUs using KIQ for TLB invalidation, particularly
visible on systems with active compute workloads (ROCm, OpenCL).

Ionut Nechita (1):
  drm/amdgpu: Fix TLB flush failures after hibernation resume

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  9 +++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  6 +++++-
 5 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.52.0

