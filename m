Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6BD34836E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 22:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FE16E364;
	Wed, 24 Mar 2021 21:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4311B6E364
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 21:10:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so1984825wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pjm3lSEUkPFnvj4h3fBO00NgJVgVJDDTyTJdMOuNubc=;
 b=ESYUM2o75ZyedJVyltWn9GPRZKHp2ty46wRJVNV8BH1S8HOwY5RhvzDWqVJmWAvuJY
 8GbXJ6ouueJ76Tv4dymgqaF5DhFVs9g/uh+ozI8xQyEL8s2mVmOFt1R5VWHnz2leMVit
 aw2LGfaKUS0YAXT3wEm/DnHmEs1X9CLy4D7zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pjm3lSEUkPFnvj4h3fBO00NgJVgVJDDTyTJdMOuNubc=;
 b=XMTUUAsFJcI8D90Yfp9r2tTC/1Ce0owbcVEdp1fyqqEHD4d7J8tgs6E+/F3c+lcupZ
 CL4VVVzPKdPEPLHc/0dxQQzEWdXT4xlHJ9NqYEYGLhuAlzRZovmV5GjM0XI5L4L6lO83
 EwwLJQf7KzcnGA+tuGgyWOKQdh7l2VcODvVfzqKTPs3nkwiC6xojX7udyqm1tIHdvj9q
 8l1fn3PHAZkMa6dkaGRdPFRCVr5easBA0KLg4UgDxtFu4Koy5r6Ye4+7g7iM8EH9Q3bf
 nf56SG1pXB3EmRseG0aIkdu/87H9Xo3yhvhzdR8+PoZcxDE66NFPUaW+HOjQJtauQdwZ
 ltrg==
X-Gm-Message-State: AOAM531D+gpjAP7W6kcztM/R6ezeLG01YpKhgev8NR6occM2kKy4fy0j
 baBZrCdXI9xe18QS1kiSWaOhA4WcW5DhRp70
X-Google-Smtp-Source: ABdhPJxR5joVKHRVShY0qhPx4p+Je9dDIF87SBRD5PyxhcUcGXNUN+xHEO7YiUMtfyq3uA/J2M9bKQ==
X-Received: by 2002:a7b:c087:: with SMTP id r7mr4727280wmh.110.1616620246956; 
 Wed, 24 Mar 2021 14:10:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k4sm5343736wrd.9.2021.03.24.14.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 14:10:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915: add gem/gt TODO
Date: Wed, 24 Mar 2021 22:10:40 +0100
Message-Id: <20210324211041.1354941-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've discussed a bit how to get the gem/gt team better integrated
and collaborate more with the wider community and agreed to the
following:

- all gem/gt patches are reviewed on dri-devel for now. That's
  overkill, but in the past there was definitely too little of that.

- i915-gem folks are encouraged to cross review core patches from
  other teams

- big features (especially uapi changes) need to be discussed in an
  rfc patch that documents the interface and big picture design,
  before we get lost in the details of the code

- Also a rough TODO (can be refined as we go ofc) to get gem/gt back
  on track, like we've e.g. done with DAL/DC to get that in shape.

v2:
- add dma_fence annotations (Dave)
- tasklet helpers (Jani on irc)

There was also a discussion about moving these into gitlab issues, or
gitlab issues as additional discussion place at least. For now it's
just the TODO file

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@redhat.com>
Acked-by: Dave Airlie <airlied@redhat.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/TODO.txt | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/TODO.txt

diff --git a/drivers/gpu/drm/i915/TODO.txt b/drivers/gpu/drm/i915/TODO.txt
new file mode 100644
index 000000000000..81a82c9c203f
--- /dev/null
+++ b/drivers/gpu/drm/i915/TODO.txt
@@ -0,0 +1,41 @@
+gem/gt TODO items
+-----------------
+
+- For discrete memory manager, merge enough dg1 to be able to refactor it to
+  TTM. Then land pci ids (just in case that turns up an uapi problem). TTM has
+  improved a lot the past 2 years, there's no reason anymore not to use it.
+
+- Come up with a plan what to do with drm/scheduler and how to get there.
+
+- Roll out dma_fence critical section annotations.
+
+- There's a lot of complexity added past few years to make relocations faster.
+  That doesn't make sense given hw and gpu apis moved away from this model years
+  ago:
+  1. Land a modern pre-bound uapi like VM_BIND
+  2. Any complexity added in this area past few years which can't be justified
+  with VM_BIND using userspace should be removed. Looking at amdgpu dma_resv on
+  the bo and vm, plus some lru locks is all that needed. No complex rcu,
+  refcounts, caching, ... on everything.
+  This is the matching task on the vm side compared to ttm/dma_resv on the
+  backing storage side.
+
+- i915_sw_fence seems to be the main structure for the i915-gem dma_fence model.
+  How-to-dma_fence is core and drivers really shouldn't build their own world
+  here, treating everything else as a fixed platform. i915_sw_fence concepts
+  should be moved to dma_fence, drm/scheduler or atomic commit helpers. Or
+  removed if dri-devel consensus is that it's not a good idea. Once that's done
+  maybe even remove it if there's nothing left.
+
+Smaller things:
+- i915_utils.h needs to be moved to the right places.
+
+- dma_fence_work should be in drivers/dma-buf
+
+- i915_mm.c should be moved to the right places. Some of the helpers also look a
+  bit fishy:
+
+  https://lore.kernel.org/linux-mm/20210301083320.943079-1-hch@lst.de/
+
+- tasklet helpers in i915_gem.h also look a bit misplaced and should
+  probably be moved to tasklet headers.
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
