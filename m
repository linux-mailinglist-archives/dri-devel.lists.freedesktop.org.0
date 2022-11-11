Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D10626447
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C08110E1B2;
	Fri, 11 Nov 2022 22:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C659F10E1B2;
 Fri, 11 Nov 2022 22:17:21 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id 7so3149454ilg.11;
 Fri, 11 Nov 2022 14:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPOs7canY8wqG4KDShIXdJ4wyqX/yN9ym9g6Duzre1k=;
 b=BLsxlWp51LE68mNY1QtMJxd/5OLjpMI44pN5/FtWjIwjpz7LHmHfClHptIP71SlcFC
 p7L8ojwDEZFNI/MnALg5SnzDLD0o1tboINKncqZu8mXZ6AVEV+8OyI2jloiBrXTe0GVY
 N36VG9LIA4K3qCONQQmkHB7DtPPxspsHcjb52IbiIgy0M5Lg0aHwETOw2SzNoXYv2yi/
 vOsXPxUk8LY9ng5bWr+XeKL5bQMU6E2k9IJv2KN1S4Znxje0k3cD4MgwBgM1aLGWBwL7
 Y7UYVHLDYgTNw+hdmnqHbJvAYxLPJiY4YR+oo0+opXKrIeucUwoH5jpQCLzlS61eM/AF
 i/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XPOs7canY8wqG4KDShIXdJ4wyqX/yN9ym9g6Duzre1k=;
 b=YOcBdSQSrYO5XyDgKBGiXmLJYxafvvQtAd1j8ButhG8bLqSZLHf+qOl9TdQOWvkgMZ
 1prappIb1TOWdLdFqmtCAw9I9xK1K0sa984I1RTJ1jNSrvs1tFhM1WKnnC6maYcaRh97
 VU6bYbnAY0o+oT8KCGTOzqK1RAFGXu4N0wfCJ8VdCitwzY3KatnWS0owfQgNd9mwZBP9
 napl7+ujdlo5v7Ins3F9IpHmB1COWWP80RaWJ1LoqGspeSKCJ3nq3Hcri3pNtABwehUB
 +SbnMcocyRyBGsZlTYb9ZWDLXdRNuWRJBkbZkB/WhKhPxR6QMlSNzJV4v+JDh9siws3P
 amsw==
X-Gm-Message-State: ANoB5pkQ7TcpQ0ZoYl3fC8SjxRyW3JvUIuoXzdSw3wanCjA4nQimw1hm
 K65cHPA5TJ7lnjuLfhEPyRQ=
X-Google-Smtp-Source: AA0mqf7lBsqhkLm6RfCggnWUpU8zoWMTs3GVQb2sVJxvR44svzNa9Pkri6984fGQZVaiz+BEW3xFpw==
X-Received: by 2002:a05:6e02:663:b0:2ff:f77c:161f with SMTP id
 l3-20020a056e02066300b002fff77c161fmr2101888ilt.110.1668205040967; 
 Fri, 11 Nov 2022 14:17:20 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a928e05000000b002f611806ae9sm1113457ild.60.2022.11.11.14.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:17:20 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] DYNAMIC_DEBUG fixups for rc
Date: Fri, 11 Nov 2022 15:17:08 -0700
Message-Id: <20221111221715.563020-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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

hi Jason, Greg, DRM-folk,

drm.debug-on-dyndbg has a regression due to a chicken-&-egg problem;
drm.debug is applied to enable dyndbg callsites before the dependent
modules' callsites are available to be enabled.

My "fixes" are unready, so lets just mark it BROKEN for now.

Meanwhile, heres some other fixes, a comment tweak, a proof of
non-bug, an internal simplification, and a cleanup/improvement to the
main macro (API):

Split DECLARE_DYNDBG_CLASSMAP in 1/2; REFERENCE_DYNDBG_CLASSMAP now
refers to a classmap DECLARE'd just once.  I think this gives a path
away from the coordination-by-identical-classmaps "feature" that Jani
and others thought was "weird" (my term).


Jim Cromie (7):
  drm: mark drm.debug-on-dyndbg as BROKEN for now
  drm_print: fixup improve stale comment
  test-dyndbg: fixup CLASSMAP usage error
  test-dyndbg: show that DEBUG enables prdbgs at compiletime
  dyndbg: fix readback value on LEVEL_NAMES interfaces
  dyndbg: clone DECLARE_DYNDBG_CLASSMAP to REFERENCE_DYNDBG_CLASSMAP
  dyndbg: replace classmap list with a vector

 drivers/gpu/drm/Kconfig                 |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 +-
 drivers/gpu/drm/display/drm_dp_helper.c |  2 +-
 drivers/gpu/drm/drm_crtc_helper.c       |  2 +-
 drivers/gpu/drm/i915/i915_params.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  2 +-
 include/drm/drm_print.h                 |  5 +-
 include/linux/dynamic_debug.h           | 10 ++++
 lib/dynamic_debug.c                     | 63 +++++++++++++------------
 lib/test_dynamic_debug.c                |  4 +-
 10 files changed, 57 insertions(+), 36 deletions(-)

-- 
2.38.1

