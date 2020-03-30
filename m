Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1717198D19
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15596E598;
	Tue, 31 Mar 2020 07:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037906E160;
 Mon, 30 Mar 2020 16:08:33 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 23so8824989pfj.1;
 Mon, 30 Mar 2020 09:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=otJu+eX4lgoyY7c5aWHtihsc0UqeTjjXfeFh1YkhPAI=;
 b=Ir7pgl4XmClna7cUx96hBHuHNDzL1t4ysmX7aw+6S9+7Xo0GcLS3+DhjBYFPVucnWt
 4boW5Bdxy4K3zZUcy7DvwLQXL75/G0JMcMY684Ho8FGH5OqY4ZXDiavPlqBqShYl7fx6
 JWcbzdWijfmg8HOl3BKkhTu1JuU8WGBok/QCaJw38AwLAxu7pxVtXfqrNO3z4sbnO7Sq
 zMZ2a+wxV5kBOuhn3SHyUpZvmvv+/s3FuopQGuY9SJfbVPkAZQU70EFXIkgdDWMt8Uiw
 jrzO8XLCsRlO8fF5WcnKUJjEvvWK22J79VFXRgHTj6HYzH5OKzWOPBhfhTMgMH96KXaH
 U+/Q==
X-Gm-Message-State: ANhLgQ1mtEamoQbmuZlWOedgauErYYDIm4RiVfueNN/f7zHlOgF84W3Z
 skss5248O7SIBtuBR5LQ+tSMP1vX
X-Google-Smtp-Source: ADFU+vtUqHNgjuHOAKf/E0Ylxd0QWmsVaQoUTr55SFrii17iNHElhjHR64vWnr73zuWsBWm8rCVwLQ==
X-Received: by 2002:a65:6712:: with SMTP id u18mr13576601pgf.93.1585584513343; 
 Mon, 30 Mar 2020 09:08:33 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id z30sm10492071pfq.84.2020.03.30.09.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 09:08:32 -0700 (PDT)
Resent-From: Sultan Alsawaf <sultan@kerneltoast.com>
Resent-Date: Mon, 30 Mar 2020 09:08:29 -0700
Resent-Message-ID: <20200330160829.GA3400@sultan-box.localdomain>
Resent-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id y193sm8512447pgd.87.2020.03.29.20.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 20:31:06 -0700 (PDT)
From: Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To: stable@vger.kernel.org
Subject: [PATCH 0/2] A couple of important fixes for i915 on 5.4
Date: Sun, 29 Mar 2020 20:30:55 -0700
Message-Id: <20200330033057.2629052-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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
Cc: Sultan Alsawaf <sultan@kerneltoast.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sultan Alsawaf <sultan@kerneltoast.com>

Hi,

This patchset contains fixes for two pesky i915 bugs that exist in 5.4.

The first bug, fixed by
"drm/i915/gt: Schedule request retirement when timeline idles" upstream, is very
high power consumption by i915 hardware due to an old commit that broke the RC6
power state for the iGPU on Skylake+. On my laptop, a Dell Precision 5540 with
an i9-9880H, the idle power consumption of my laptop with this commit goes down
from 10 W to 2 W, saving a massive 8 W of power. On other Skylake+ laptops I
tested, this commit reduced idle power consumption by at least a few watts. The
difference in power consumption can be observed by running `powertop` while
disconnected from the charger, or by using the intel-undervolt tool [1] and
running `intel-undervolt measure` which doesn't require being disconnected from
the charger. The psys measurement from intel-undervolt is the one of interest.

Backporting this commit was not trivial due to i915's high rate of churn, but
the backport didn't require changing any code from the original commit; it only
required moving code around and not altering some #includes.

The second bug causes severe graphical corruption and flickering on laptops
which support an esoteric power-saving mechanism called Panel Self Refresh
(PSR). Enabled by default in 5.0, PSR causes graphical corruption to the point
of unusability on many Dell laptops made within the past few years, since they
typically support PSR. A bug was filed with Intel a while ago for this with more
information [2]. I suspect most the community hasn't been affected by this bug
because ThinkPads and many other laptops I checked didn't support PSR. As of
writing, the issues I observed with PSR are fixed in Intel's drm-tip branch, but
i915 suffers from so much churn that backporting the individual PSR fixes is
infeasible (and an Intel engineer attested to this, saying that the PSR fixes in
drm-tip wouldn't be backported [3]). Disabling PSR by default brings us back to
pre-5.0 behavior, and from my tests with functional PSR in the drm-tip kernel,
I didn't observe any reduction in power consumption with PSR enabled, so there
isn't much lost from turning it off. Also, Ubuntu now ships with PSR disabled by
default in its affected kernels, so there is distro support behind this change.

Thanks,
Sultan

[1] https://github.com/kitsunyan/intel-undervolt
[2] https://gitlab.freedesktop.org/drm/intel/issues/425
[3] https://gitlab.freedesktop.org/drm/intel/issues/425#note_416130

Chris Wilson (1):
  drm/i915/gt: Schedule request retirement when timeline idles

Sultan Alsawaf (1):
  drm/i915: Disable Panel Self Refresh (PSR) by default

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  8 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  8 ++
 drivers/gpu/drm/i915/gt/intel_timeline.c      |  1 +
 .../gpu/drm/i915/gt/intel_timeline_types.h    |  3 +
 drivers/gpu/drm/i915/i915_params.c            |  3 +-
 drivers/gpu/drm/i915/i915_params.h            |  2 +-
 drivers/gpu/drm/i915/i915_request.c           | 73 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_request.h           |  4 +
 9 files changed, 101 insertions(+), 3 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
