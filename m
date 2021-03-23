Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9D3459FD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 09:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA60D6E0C8;
	Tue, 23 Mar 2021 08:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D026E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:45:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso4491053wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ctMAs2ck6qhQkBco0XwNML8tiYEOiG6Y+b8Y6p/AsQ=;
 b=k0G0WK9sV8PLOfVaSjiR0KLC4w9QmPmfQ3RJzQ2g06W4sdwvTypK/1z4zA7S2u0AoV
 gdcqFGbhtUl2HlbxOinofPHYfvT7CyqAlaYJx+7ZfURF67a9wvVwMruu2Acxo/0KEqlS
 g4zfVCe4Hy4hIaQ6ZTs/qUKfuxbWdP1dDCbFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ctMAs2ck6qhQkBco0XwNML8tiYEOiG6Y+b8Y6p/AsQ=;
 b=fM1pQVrdQ5Y9liBUslpxz6UJpeGQahklqX/knJXYGRG3h75ex3868Q8KNbIm6BG1qO
 2sCTON261SqNdeKoZsNTg3JIkZBNn20SIBFhM53iWRI0SreeWcw6inux8Eu/U6AHrc8p
 VqLjhv6uGydWa4ytvwCcH/sEp6jexNy56LUPkQiwuuSiIcYQzAeb3VOxXupg4Lyj43g1
 /p8fmEY/dFpJNQQ+ZYuDj5gv50BaE5YlM4HTMq1szGMvRp9cV8xWl/sEBO9p3F4N+JA5
 HsJJVNfbK/Mi9WCUeMW+rPwgfKdsfX0KxYqnsxwzi90JHyAaOu5CoZ1ViBWoGQSNDZOp
 0U7Q==
X-Gm-Message-State: AOAM5303MLQrfHzjhRBX2USMFweOW56cGLORiiAvF58oPE7IvqWXmOE+
 1JY4OgHAGBuPOMlvQ7EG42u2ee5oVmKwTXvT
X-Google-Smtp-Source: ABdhPJwQshgo2y6o1jYvCLDYmYmjLnx3OE40p+nYnx2V6Uu+7yXfI8YgW1III2M9Z2QzEPMN2R6+0g==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr2244841wml.147.1616489099002; 
 Tue, 23 Mar 2021 01:44:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g202sm1772835wme.20.2021.03.23.01.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 01:44:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915: add gem/gt TODO
Date: Tue, 23 Mar 2021 09:44:52 +0100
Message-Id: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
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

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/TODO.txt | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/TODO.txt

diff --git a/drivers/gpu/drm/i915/TODO.txt b/drivers/gpu/drm/i915/TODO.txt
new file mode 100644
index 000000000000..d2e5bbb6339d
--- /dev/null
+++ b/drivers/gpu/drm/i915/TODO.txt
@@ -0,0 +1,36 @@
+gem/gt TODO items
+-----------------
+
+- For discrete memory manager, merge enough dg1 to be able to refactor it to
+  TTM. Then land pci ids (just in case that turns up an uapi problem). TTM has
+  improved a lot the past 2 years, there's no reason anymore not to use it.
+
+- Come up with a plan what to do with drm/scheduler and how to get there.
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
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
