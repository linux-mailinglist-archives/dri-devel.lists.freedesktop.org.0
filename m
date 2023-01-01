Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03D65AA0A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 13:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C276A10E2B7;
	Sun,  1 Jan 2023 12:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3055710E2B7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 12:57:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t15so15150043wro.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 04:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/WjNoY5IEvjPDMwxYOjVr5XNJFzUvkwo/1gPfAgJB4E=;
 b=DrgbVEQWkHJ03XjgEctC2zPckZT+MASF608kCD+Vp1xLbX2ED4+fcuAk+FfvqcuRYX
 nC6bmfBnM1IZgrsHkt9Nb0L0htIxO49GpsG13w9tcbjXYocCwsf9indzKDZC6a1DfDc/
 Wcqv7szwb2FOk/im0eVEUxhWPCf6lv573+rbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WjNoY5IEvjPDMwxYOjVr5XNJFzUvkwo/1gPfAgJB4E=;
 b=UJjGNDBj/fEPFxBqqNO26CfQ+9dXrkz/1O/+VCeN1yewbD5VHmv5731N+fembJJgrz
 Oq8e3mgDnCRCZpNGnRnQJjMO8B7hFw6blnHj7kRkl+JtVVlawY/aKDczZOGkMW7+SiQy
 j3bo/vz4eVSDpvjRhncrJZcqqTNSwCjyuZ7haRIN0zZmvueCwClXMjCQtQKJzs+oNeYH
 MDbf++xqxN21NLo6ufNY0XRq8dTk56J1KIHpfNn2zkm43YEOh7SHUPphpS/cwIvY0oq1
 CeEF0tP6EspBPlF/pLBWrs9un6BKKYWkO2YuKbn1nqrBwTorRL3FCKUo96JzxqXLDqt9
 XsIw==
X-Gm-Message-State: AFqh2koxQ42D1ngXQNKT7STNWwZBo+VyjUKmUllMEiyQYLZBwkUxaiCL
 Y8laYSQeN1s5lxxjFMJdjWpLnQ==
X-Google-Smtp-Source: AMrXdXt1E3ETMbDctbRzRx440fhfbrWCKkb7RItk0UiOw+sLyqbmBqJ7Nh/P50kfa6iIzKQuaNHopA==
X-Received: by 2002:a5d:624d:0:b0:242:4d70:7882 with SMTP id
 m13-20020a5d624d000000b002424d707882mr23439872wrv.15.1672577829594; 
 Sun, 01 Jan 2023 04:57:09 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f8-20020adff8c8000000b00282194eaf7bsm15732516wrq.71.2023.01.01.04.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 04:57:08 -0800 (PST)
Date: Sun, 1 Jan 2023 13:57:06 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes for -rc2 if I'm not too late :-)
Message-ID: <Y7GDIi18rJ/YgbYn@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

I'm just back from the mountains, and Dave is out at the beach and should
be back in a week again. Just i915 fixes and since Rodrigo bothered to
make the pull last week I figured I should warm up gpg and forward this in
a nice signed tag as a new years present! Hopefully still in time for
-rc2.

I'm expecting there will be more for -rc3 when I do the usual -fixes pull
on Fri or so.

Happy new year!
-Daniel

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-01

for you to fetch changes up to a9f5a752e86f1897c3b377b6b861576a4c1a2ff0:

  Merge tag 'drm-intel-fixes-2022-12-30' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-01-01 11:52:11 +0100)

----------------------------------------------------------------
drm-fixes for 6.2-rc2

- i915 fixes for newer platforms
- i915 locking rework to not give up in vm eviction fallback path too
  early

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915: fix TLB invalidation for Gen12.50 video and compute engines

Daniel Vetter (1):
      Merge tag 'drm-intel-fixes-2022-12-30' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Jani Nikula (2):
      drm/i915/dsi: add support for ICL+ native MIPI GPIO sequence
      drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index

John Harrison (1):
      drm/i915/uc: Fix two issues with over-size firmware files

Lucas De Marchi (1):
      drm/i915: Remove __maybe_unused from mtl_info

Matthew Auld (1):
      drm/i915: improve the catch-all evict to handle lock contention

 drivers/gpu/drm/i915/display/intel_dsi_vbt.c    | 94 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c  | 59 +++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c              |  8 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c        | 42 +++++++----
 drivers/gpu/drm/i915/i915_gem_evict.c           | 37 +++++++---
 drivers/gpu/drm/i915/i915_gem_evict.h           |  4 +-
 drivers/gpu/drm/i915/i915_irq.c                 |  3 +
 drivers/gpu/drm/i915/i915_pci.c                 |  1 -
 drivers/gpu/drm/i915/i915_reg.h                 |  1 +
 drivers/gpu/drm/i915/i915_vma.c                 |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c |  4 +-
 12 files changed, 212 insertions(+), 45 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
