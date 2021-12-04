Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059D46936F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F9B73F03;
	Mon,  6 Dec 2021 10:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F196E8A0;
 Sat,  4 Dec 2021 10:55:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bi37so12861991lfb.5;
 Sat, 04 Dec 2021 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCkCzyCkQsr6lD8NR06VdRlHwx59JsbS+9tz0//jskM=;
 b=J8+qxK9EdGdyapFivPTb/MszsVmYUxohS5F9uvi1Ju40hDEsymJubYkiJcww+/2mXJ
 dFk4d52mcpjL8ZkkJQCOBnupJ8E3CUIVUtR3g8DLhn4mM0CnI1QA9CIvrxVbVbhEQ8X/
 URSzKnSKgbpl0bishq9Sz8qvcRDFeAsbgFZTjZygcoAxicVI5Tq1Vzch1OqbrDr7JwUO
 yKgcd7QVmtiZBsqFQGAv+YxYLAVyufoPz9Dw3+OwMndCcwdTjxXoJklJEm3kh+ZdNi3O
 xFQCFHwiSapg1zeKL8wPTCEzuXnD9N74jQlqfvqyVJaNIv8q0dB5NcMkHsq54OUo0N+1
 vavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCkCzyCkQsr6lD8NR06VdRlHwx59JsbS+9tz0//jskM=;
 b=AOnbHnt+f+rE6TU3f5WsE7PLwepjA1Bi4or3vCtXlJSvMLnxgTwpM3zCPuyFGAfaVk
 5kjVyi59U7N4na5g6QDwOOQQg0xRt2JmLNnT+6xwn9SMv305rg7LjsNjuhuWEos/1dNp
 mHW8QVrKqrjBWtjF8XZa00sqES6xpgpNFtRC7rXoZyw2fs6gmR+xvolgPobquJM6Cwrw
 FTwDhm1DgIE9lFQf3E+xlR3ALeFOX6Q9ylhiU+4zryKd1XPpuUNzudMqbKA3FGyfYKrG
 59sHAp/robcKzP81xcOB+azx1GR9d4V+mAFk5qGuj5Jxww+RMVf2VHrwQImyBElc4XMj
 jwug==
X-Gm-Message-State: AOAM531/7nDswZnYBcKaJL4jzv/U2IGOuekmweOd6RVA6xJYo7UypkIZ
 7AdbS9OKuQ39z+zAeHR1oiA=
X-Google-Smtp-Source: ABdhPJwnAJQyUH//9HfN3vFABTOSGXTkJU5rsHVw8lsbp9mJMIIesfzVjE0MCDKbHa3t2bmmeND6Wg==
X-Received: by 2002:ac2:4e61:: with SMTP id y1mr24147055lfs.459.1638615334878; 
 Sat, 04 Dec 2021 02:55:34 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:34 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/9] drm/i915/gvt: Constify static structs
Date: Sat,  4 Dec 2021 11:55:18 +0100
Message-Id: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Constify a number of static structs that are never modified to allow the
compiler to put them in read-only memory. In order to do this, constify a
number of local variables and pointers in structs.

This is most important for structs that contain function pointers, and
the patches for those structs are placed first in the series.

Rikard Falkeborn (9):
  drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
  drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
  drm/i915/gvt: Constify intel_gvt_irq_ops
  drm/i915/gvt: Constify intel_gvt_sched_policy_ops
  drm/i915/gvt: Constify gvt_mmio_block
  drm/i915/gvt: Constify cmd_interrupt_events
  drm/i915/gvt: Constify formats
  drm/i915/gvt: Constify gtt_type_table_entry
  drm/i915/gvt: Constify vgpu_types

 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c   | 24 ++++-----
 drivers/gpu/drm/i915/gvt/gtt.c          | 68 ++++++++++++-------------
 drivers/gpu/drm/i915/gvt/gtt.h          |  4 +-
 drivers/gpu/drm/i915/gvt/gvt.h          |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c     | 12 ++---
 drivers/gpu/drm/i915/gvt/interrupt.c    | 10 ++--
 drivers/gpu/drm/i915/gvt/interrupt.h    |  2 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.h    |  2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c         |  4 +-
 11 files changed, 66 insertions(+), 66 deletions(-)

-- 
2.34.1

