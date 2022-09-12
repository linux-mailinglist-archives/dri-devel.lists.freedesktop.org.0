Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E45B5365
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B1810E0A6;
	Mon, 12 Sep 2022 05:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98D310E091;
 Mon, 12 Sep 2022 05:29:05 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id y15so3995821ilq.4;
 Sun, 11 Sep 2022 22:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=qg9to7hIZo/tNgDGQnKxNsyMgfHTsJfmQeKWAWjBM3Y=;
 b=fwweiZkkxgOj9IkckstUmzr3+NSlljXdQmamHEHFjSjjln6iHltmY3l7o+HzWFaYEG
 Lb5aJYHZeN3aVoSi0wv3JIexy4kqaX0r9ZoBwqGwD5QLF3qY0rqLGqYOQyH3nVTiw+jF
 Be9qUsrDDXn1SiWxtQzMbaXkRHkJz3b/oTcbxzPQl6uSFoqPbb+tuxVlAhaVwUhrf6qK
 ObYNR0eEdla8tydXUacWQ5EkvI7UvdcDElX3vsKx7xKZJyG7qZ4snHR4GxLhd2RkzRR9
 K8H7GHVGPDwTyMox6Wzdb9p2n5WnKC6KpDb4FIQ/leaQbmFI7jFryPR65ncRBxpm5S5I
 eGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=qg9to7hIZo/tNgDGQnKxNsyMgfHTsJfmQeKWAWjBM3Y=;
 b=S8Pc1WiV2TKEcIOyOZJfLYBOuQ3sdKiCv1qrt1Qmo3cpLVDTr2nTFnBN0Y41LLJnaC
 V7X8F95tXClqhAJINtbg7If3ikrR/E79b8Azk1jye+wWLLqWrPqePMcxEVUziT6CmM4Y
 w6fJp1qyJUUkU+hP7XWdMgI0eluLkxDEw6u8PVwSmaBtXYEoy+C38lehh5+ex0CGC9G2
 xtbJJ0TGQvTb+0ZlEeKLDnP6rD53dogDaZLIUOqCkr1OoxuyLqkDIZGSpW0wkJhipDrC
 iuT+aRZwJna8Tl9qBsyfn4qGIbUxVBof1QB9wU8aqd5YeOhqnzTymiu96+hYR15PFa3X
 AJsQ==
X-Gm-Message-State: ACgBeo3yxdnRf5fiyR8brTONyIIr80AUaXNdljQNt9QsB0984iDZBte/
 5FiyXwgGEQxZrLPhqPOqQvI=
X-Google-Smtp-Source: AA6agR6PqOG3cAeMUhS/dA7RYLxwnEszf0aSW5+mVVBkyci+q1M/IQ4stFHaBuDia3OjYj44LDJH6A==
X-Received: by 2002:a05:6e02:168e:b0:2f3:33d5:19bd with SMTP id
 f14-20020a056e02168e00b002f333d519bdmr8684638ila.112.1662960545031; 
 Sun, 11 Sep 2022 22:29:05 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/9] dyndbg: drm.debug adaptation
Date: Sun, 11 Sep 2022 23:28:43 -0600
Message-Id: <20220912052852.1123868-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Greg, Dan, Jason, DRM-folk,

heres follow-up to V6:
  rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
  rework drm_debug_enabled{_raw,_instrumented,} per Dan.

It excludes:
  nouveau parts (immature)
  tracefs parts (I missed --to=Steve on v6)
  split _ddebug_site and de-duplicate experiment (way unready)

IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.

If these are good to apply, I'll rebase and repost the rest separately.

These are also available at:
https://github.com/jimc/linux/releases/tag/dyndbg%2Fdd-drm-class-911

RFC:

DECLARE_DYNDBG_CLASSMAP's interface can be improved: class-names are
currently strings, like "DRM_UT_CORE", which must have corresponding
ENUM symbols defined.  It would be better to just pass DRM_UT_CORE,
etc, and stringify the va-args inside the macro while initializing
classnames member.  But how ?


Jim Cromie (9):
  drm_print: condense enum drm_debug_category
  drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.
  drm_print: interpose drm_*dbg with forwarding macros
  drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
  drm-print.h: include dyndbg header
  drm-print: add drm_dbg_driver to improve namespace symmetry
  drm_print: optimize drm_debug_enabled for jump-label
  drm_print: prefer bare printk KERN_DEBUG on generic fn
  drm_print: add _ddebug descriptor to drm_*dbg prototypes

 drivers/gpu/drm/Kconfig                 | 12 ++++
 drivers/gpu/drm/Makefile                |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 +++++
 drivers/gpu/drm/display/drm_dp_helper.c | 13 +++++
 drivers/gpu/drm/drm_crtc_helper.c       | 13 +++++
 drivers/gpu/drm/drm_print.c             | 48 +++++++++++----
 drivers/gpu/drm/i915/i915_params.c      | 12 ++++
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 +++++
 include/drm/drm_print.h                 | 78 +++++++++++++++++++------
 9 files changed, 174 insertions(+), 31 deletions(-)

-- 
2.37.3

