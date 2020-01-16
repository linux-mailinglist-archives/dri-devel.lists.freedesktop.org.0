Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2269B1404F3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A556F400;
	Fri, 17 Jan 2020 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49766ECF4;
 Thu, 16 Jan 2020 13:09:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t2so19112210wrr.1;
 Thu, 16 Jan 2020 05:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gcItPdhL/JalFkp3Ip4EGe5eqFJ7VNZbWjNyuI8ScQE=;
 b=Otmr07/+6j7fwW5MD+CXlBdMdARhRZ+vKYvPzbw0bOy8BUk0nSylWpd2+cFFhlLXEH
 6vRL1BQ6KiBaLAptxCDTk8hgQ/KHELi0+Sqv5IoCZdBAx2ScSKmdti7JXftm3Cp9XAgb
 tKrKyyvF5lDhDpFpE8F1LDSwcIkj0o9eYwl1BlXAXx9xKyLU2TSqnvgAje2USTbciiYZ
 o6vX2t/4Q4p+5F9aU4Ow7PVeDtHyoyDp8fdG92ZiPbFr7upBK1eNI0xjYCF11/TjvDdC
 mClokLZKNGPmjIkbmUR8iVf219lzz47t0tGiXThWs+OEwKnIj093sWyiT/Czn4Hmn+u/
 RFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gcItPdhL/JalFkp3Ip4EGe5eqFJ7VNZbWjNyuI8ScQE=;
 b=A6WCGZ/eG9i6vYYAsfxXB51PzIjD1i6hZS6SFF79/X3IIPn86KGlhcu+h+bPi5qqCr
 SGagiwQLHnQW2Z40Mh0v0ObgoYs3kVdLpYq8XMBtK5c1aJ0ZaASJJ0zc3nvsyjdeaESA
 3N9QMkxxcIQCTR5SfyhBwJUEg15uPB5+NckAbyEChPknjiri5Rcbp/eVwuf4Pn+m3eV6
 tLuqoxP16yhWbgYB7AUTVDT2EfVWzApLYhf7XuBe2M5ZbA9CcFRsSRbZIiF3PWxX9OeV
 RO6dolIvJmgtJNc6lj0WOzMS1LBboE6rhJ+M4fZdL5jKimj27g4NarDrZca4cdSBjKwt
 A3Vw==
X-Gm-Message-State: APjAAAVGGTgYd6xO82E+3oB+aQq3yfvEW+yJq2ui0ia0xWLGh+RFfNHi
 +5aLG9+E/EBTn8PQHUBoYyE=
X-Google-Smtp-Source: APXvYqyd+bmwbAfoi5v6f3Yv/PNCpEEqYXePUaVWryA2IIiJiVtUQVptXyPFwD2bK55zj/zuGGdjcw==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr3358657wrw.246.1579180194422; 
 Thu, 16 Jan 2020 05:09:54 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id k8sm29087196wrl.3.2020.01.16.05.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:09:53 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/4] drm/i915/display: conversion to new logging macros.
Date: Thu, 16 Jan 2020 16:09:43 +0300
Message-Id: <20200116130947.15464-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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

This series converts the printk based logging macros in
drm/i915/display/intel_display.c to the new struct drm_device based
logging macros. This change was split into four for manageability and
due to the size of drm/i915/display/intel_display.c.

Wambui Karuga (4):
  drm/i915/display: conversion to new logging macros part 1
  drm/i915/display: conversion to new logging macros part 2
  drm/i915/display: conversion to new logging macros part 3
  drm/i915/display: convert to new logging macros part 4.

 drivers/gpu/drm/i915/display/intel_display.c | 1021 ++++++++++--------
 1 file changed, 596 insertions(+), 425 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
