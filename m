Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A74135FD7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08146E94F;
	Thu,  9 Jan 2020 17:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F966E3C1;
 Thu,  9 Jan 2020 09:06:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j42so6437021wrj.12;
 Thu, 09 Jan 2020 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zvs7upA5ST9iH9y58rIMpyEvi1MZi0JpLUdAR1ZZjv4=;
 b=J04EU7N5mB/4+pCmu7qYm5pyqbOHuRKiLdWEthWFky5yKEOMLnmWn3UChdYUOEj0+z
 +g5LVegzXsgMDQTHClEXeKTk+396cD1vzA3Q3ntLIzhmItD2uTHYRU/x6CP4RH18qtsw
 aNJlgOamXNGXtGtRb09LPzu/evodvs+4+1KYdWXItxbMIFc6h7uGsyRHsUynx9aOiruO
 jAhJj9/U6jGn999SULhsKPwUkDh1NF3qULIaCi+ggBYef4WkKaPhWCzP/2DVowTN35ms
 Ws2xU16k5ju8010Cri/2yN4WAT6YZb1QMi0f435m7h6K06c0iiQlozEhzl7/ayX/JOdc
 Tylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zvs7upA5ST9iH9y58rIMpyEvi1MZi0JpLUdAR1ZZjv4=;
 b=GPJ/l+/069y2f+jMOTBFI6Znh5B/cqWTWINhJ5riydnowGy4ok0Gnzk0A+tQjmKP57
 QC0PWvYnUleWUHq2YMgxInSGoMlEf6Nmw5cGaagQ6CMAewChCWXp3irxxxK5tSsyBjwB
 LlhEVz1O/1miFcIbiDpSqpVwAHucN1wYQF7Mh0LjL5E8QyToaod+LPANVdvLJpMQw+Ge
 zb9DKkqgWulkzslOFW52AbhAvXjcplmxM8NB5VDsijCeY8KH2yCGZDCc0MCIFsIGGKLW
 1gORVUl0GxT/2QO2CDuwBq+dybfO6zRWDdjzoZAR3XVftoj8SHJ0XG3eT+tx6YzsJNdU
 xv/g==
X-Gm-Message-State: APjAAAVRX0E0o7UKC4kmAM7T58OHTZ0BIOZk+11u3QlBzhGSoiqpnxXl
 QW4c9RMaHMVv9YCuhaJ8Cmo=
X-Google-Smtp-Source: APXvYqzFnRY1rdg3WglfybykLqtsi2X6MMl6GIUxKs/xV7llS00WQXe95gPzHvQ0TQlzZnEP3hqQ3g==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr9342456wro.51.1578560811960;
 Thu, 09 Jan 2020 01:06:51 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i8sm8004734wro.47.2020.01.09.01.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 01:06:51 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/5] Use new logging macros in drm/i915
Date: Thu,  9 Jan 2020 12:06:41 +0300
Message-Id: <cover.1578560355.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset continues the conversion to using the new struct
drm_device based logging macros in drm/i915.

Wambui Karuga (5):
  drm/i915: conversion to new logging macros in i915/i915_vgpu.c
  drm/i915: conversion to new logging macros in i915/intel_csr.c
  drm/i915: conversion to new logging macros in i915/intel_device_info.c
  drm/i915: convert to new logging macros in i915/intel_gvt.c
  drm/i915: convert to new logging macros in i915/intel_memory_region.c

 drivers/gpu/drm/i915/i915_vgpu.c           | 41 +++++++++++++---------
 drivers/gpu/drm/i915/intel_csr.c           | 24 +++++++------
 drivers/gpu/drm/i915/intel_device_info.c   | 25 +++++++------
 drivers/gpu/drm/i915/intel_gvt.c           | 13 ++++---
 drivers/gpu/drm/i915/intel_memory_region.c |  4 ++-
 5 files changed, 64 insertions(+), 43 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
