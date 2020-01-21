Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB4144D62
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B106F3E8;
	Wed, 22 Jan 2020 08:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73786ECF3;
 Tue, 21 Jan 2020 13:46:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so3197508wrl.13;
 Tue, 21 Jan 2020 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=EMbfMg7Qo+Hm2kXhOfYTm1cW5XDCu6N6YPWoxa4vcrQ=;
 b=lKigIhFYQBVG/pdUJCj+7qUUfX9MHCRFSnlqqHaEd7yU68V1H3o4aV5fjP99tonI1+
 tNbvwZFeaSo6JYpiUP+hX4sukDafouLwtP9prxyOX3hSc4tZzsQltUCDTJfLXRc2EhYP
 yDDQRVqigKk095qrWBPEjXLi8K+AypvaPfb/JdHN6IHZzIctxYOZxkEfNx5MiTssDUnd
 mS7zydpozb/CGAtewQ6iFLQ0tr33ICu1hTGpIMsLLNbc/3k1lq/fETso6VjRdgrabL82
 eLYs3Wqr8h53wRjV9zXFunpzwdejCnFINNoVFnKZxPppKD4xOriJjqIXGi1KLtQsNFnJ
 D8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=EMbfMg7Qo+Hm2kXhOfYTm1cW5XDCu6N6YPWoxa4vcrQ=;
 b=n2TtWT6e4Y9wb3kg31xmu9yKhfNgkdGavmUk7dK/iBpHsgHPjwTRQq4CC1NFVkZkOV
 RIDuYRBHfHOTwvCgvNCvASONE3aZpG+yQHPyW82s/SVB9MEY03NIudMRpHkPF1jGIW+S
 siWTsws42AIP04fIQOZ+UjS3tT2nmIvINJIgDg1h8F82H33RR73tatUHafRO39pE2FMk
 NbiMc0rZ4b7xHw/OQVUJXnefcQIkif0ugQwNGsrj0XukVcvE7/g1VwecRVQmIsx0GIdJ
 gEHDP2m9p3X4sII95Mbyqsvw9Vpp6d44J+rCBzarjti38dwpOfuLh1jaFBz8pjQB+EWE
 fXGQ==
X-Gm-Message-State: APjAAAVRHZpEZhh6WIfGb12vXFJhaOZ23GZQMWnrpYN3reWFlqbJZqCn
 pbAQ+Vsleo+2xY1cFUymEYg=
X-Google-Smtp-Source: APXvYqzIYhwGUf9A1lMDd1M8zINx+5WO5H2iFAMczr+QRR6CGgNF4gs3NgEIj9ip8LOBQoNDXJ0y1A==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr5447495wrn.5.1579614366426;
 Tue, 21 Jan 2020 05:46:06 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id x17sm51590093wrt.74.2020.01.21.05.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:46:05 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/i915: conversion to new drm logging macros.
Date: Tue, 21 Jan 2020 16:45:54 +0300
Message-Id: <20200121134559.17355-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series continues the conversion to the new struct drm_device based
logging macros in various files in drm/i915. These patches were
achieved both using coccinelle and manually.

v2: rebase patches onto drm-tip to fix merge conflict in v1 series.

Wambui Karuga (5):
  drm/i915/atomic: use struct drm_device logging macros for debug
  drm/i915/bios: convert to struct drm_device based logging macros.
  drm/i915/audio: convert to new struct drm_device logging macros.
  drm/i915/bw: convert to new drm_device based logging macros.
  drm/i915/cdclk: use new struct drm_device logging macros.

 .../gpu/drm/i915/display/intel_atomic_plane.c |   9 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  73 ++--
 drivers/gpu/drm/i915/display/intel_bios.c     | 357 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_bw.c       |  29 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 109 +++---
 5 files changed, 339 insertions(+), 238 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
