Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8801A301E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEC46EB65;
	Thu,  9 Apr 2020 07:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AB76EB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 01:28:19 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id x66so2443761qkd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 18:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+2Y0Xi530M87fNTrtIwP1pMSm7GqwPkRfMOed11GCs=;
 b=N5VA5PzWygwcF51uf54k+ipqv7JgkBJdnFyoVNkSZM2Y5Bl7CGNj1MEyoXmsSDXGiV
 tGmSgTfxguxY7RCreRX1mU1o7GwN2vzb8xJIQgiHGtvLCgqt/fvNs71MJR6ZKjMHhA4R
 lt+IQNlGF0X/xUSNtXAXNNVICu97RIexts3lt+IaZLSfr5FtJjFlTi1gWyvJ/7b1k14k
 zgWwfyNLYfNfUiCDTFwhJoWNEyszdYTyWtjsMtTPvFJm2VL/IxwXxox+6hgRy02EQlRv
 sGfEuGn3eDWrOKwKq2r/XI4vPkjlB0p8ZdV7huJhorql6JWRl/I6WjMUdNgDnu9XFblg
 nwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+2Y0Xi530M87fNTrtIwP1pMSm7GqwPkRfMOed11GCs=;
 b=eurACGQngZjwgrElOKOqFxeHreH+VQA0LfDn9mEe8UYz0RUQ7LDSBbF4gANvQBzuls
 EvrLWy1Z+aIndiXjcT44a/NtUGkmUnBlUHqBYzPJThWNF9WARHwZYOMQBXyaEvebm1Y9
 CrdoFvUQe3mJv7fC9/4vsojhryDliacDXIl1ZdVs4+ax1XprlmDgTKr5WeQx7IeCiPOa
 5ncg2GnwaL/A9fG/KDocz/jYbcbFehNJnMSwVVhu4i3hzINiIt9PQMSiCXbXTOP/sCOE
 vWPfXWrVmGCVwUS9hEOQHhl/273vy/vPA376634R+3+tpl8Q1GHHp7L6DH4zVNy4aNed
 sIKA==
X-Gm-Message-State: AGi0Pua2ucQqw2Y0ay/oDkvL9KW+G1BH8DXlbNBCZP4zAje42MJf3RiD
 8HB5XWc+OfGY7O1LOKz5A2IKbQ==
X-Google-Smtp-Source: APiQypIcnFZuNeQsehdaKyuMo95ePmC43hl4IAy8auSxxePTv47MMvGLLjTgt/bXZQrCEEnI0SdLgA==
X-Received: by 2002:a05:620a:15d1:: with SMTP id
 o17mr10479294qkm.457.1586395698825; 
 Wed, 08 Apr 2020 18:28:18 -0700 (PDT)
Received: from localhost.localdomain (135-23-249-169.cpe.pppoe.ca.
 [135.23.249.169])
 by smtp.gmail.com with ESMTPSA id h13sm11710186qkj.21.2020.04.08.18.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 18:28:18 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
To: christian.koenig@amd.com, alexander.deucher@amd.com, David1.Zhou@amd.com
Subject: [PATCH v2 0/3] drm/amd/amdgpu: Add print format prefix
Date: Wed,  8 Apr 2020 21:28:12 -0400
Message-Id: <20200409012815.22309-1-mail@aurabindo.in>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2

* Add dev_fmt format prefix
* Removed hardcoded module names in pr_* and dev_* prints

Aurabindo Pillai (3):
  drm/amd/amdgpu: add prefix for pr_* prints
  drm/amd/amdgpu: add print prefix for dev_* variants
  drm/amd/amdgpu: remove hardcoded module name in prints

 drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            |  2 +-
 7 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
