Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C84BB3A9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 08:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E62C10EA95;
	Fri, 18 Feb 2022 07:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE91310EA95
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 07:57:54 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 t12-20020a17090a448c00b001b9cbac9c43so4987173pjg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 23:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=pzssXhX8riGRjAd4+3metqANF5chmN7DhU3KIG19plk=;
 b=BXYHGO/apr1trZ7ANJF1Lt6pYKglG4Ybyk1oIZRHZKKVSqoKSXgrBXlJ+1OM+32L9t
 MU8n7K+r76s0oXflCxISCV1ICc0UvMWkHQwSTytgu8Evx0a2e982roAPsTJGWM6fb62G
 4xiTSYukPeiMTehnCZ8Ef6urhW9UdAhyCH8qBQH/Z3umLv0xdGv2JPdSLHgNuZnc3YDQ
 m26WTBm81XDNmFpY/glb5MBqUkdfdOBU4PUPqt6iZ2jAhWr3J7itrrkNCi44IwFV8KeU
 S94sCD0t8mfXDphKvuDMvw2otQeqJUpd7l5aT+oeKWADzDv5u6Czmms69AvfX5QGDeUK
 NAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=pzssXhX8riGRjAd4+3metqANF5chmN7DhU3KIG19plk=;
 b=oTI2ng9Tn/l95ghbnE/8tXuoZ5iiZXJhmk8mR+G01ngR4RBhr1gf2abxgve+b46Qm6
 ptX9N0WKXesZfwKTQGCIA56il1ZE3pB4HER6zAhFAzlqSMGK8KYZxl+WCA7D3O4PEQyU
 wgx4MIQBKWnmYE7kzg6ETP70NWRLmtoTxg3aVibmC/TIsc3RQi+waAS78eFoQlRIfncE
 scSmhHLU7X5V5uIroAS5EAkKf2QdYYVjhRkAIL67cYk9A/epB1w/7gLsCSCaMdqG0Xod
 SQ7f7YgDSsjx/vYxBH1T7gTkG7uZO9kXJBNbDO9Xh5wuiH1MoiIJK87GJswUR9DXRheB
 EQcg==
X-Gm-Message-State: AOAM531TBFCfJ2eDYsEl+TuSKiRHtshlln76HxvG93Gr4zCCreqcmJZC
 H8sl3AG16ERD6i4Sgjrwvq/I9QPIFXc9NQ==
X-Google-Smtp-Source: ABdhPJw0UMsgszZC5yB3naBv5jFWjYWF4uP6hg8QghCa4W6xT10Nwxg2nhu4SD1k1Vghgej18o9lOhbEem5LzA==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90a:a50f:b0:1b8:e6ad:f63c with SMTP
 id a15-20020a17090aa50f00b001b8e6adf63cmr333880pjq.1.1645171074073; Thu, 17
 Feb 2022 23:57:54 -0800 (PST)
Date: Fri, 18 Feb 2022 15:57:23 +0800
Message-Id: <20220218075727.2737623-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH 0/4] kunit,um: Fix kunit.py build --alltests
From: David Gow <davidgow@google.com>
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Gow <davidgow@google.com>, linux-rdma@vger.kernel.org,
 felix.kuehling@amd.com, x86@kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kunit_tool's --alltests option uses UML and make allyesconfig to produce
a configuration which enables as many tests as possible. However, make
ARCH=um allyesconfig is broken for a number of reasons.

Fix a few different UML build breakages, and disable a few config
options in kunit_tool in order to get this kernel compiling again.

Note that the resulting kernel still doesn't run, but having it compile
is the first step to fixing that.

David Gow (3):
  drm/amdgpu: Make smu7_hwmgr build on UML
  IB/qib: Compile under User-Mode Linux
  kunit: tool: Disable broken options for --alltests

Randy Dunlap (1):
  drm/amdgpu: Fix compilation under UML

 drivers/gpu/drm/amd/amdkfd/kfd_crat.c               | 6 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c           | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c | 2 +-
 drivers/infiniband/hw/qib/qib_wc_x86_64.c           | 4 ++++
 tools/testing/kunit/configs/broken_on_uml.config    | 5 +++++
 5 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.35.1.265.g69c8d7142f-goog

