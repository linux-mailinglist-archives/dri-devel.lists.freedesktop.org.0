Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F7203556
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 13:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A8B6E351;
	Mon, 22 Jun 2020 11:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E969D6E328
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 11:07:09 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id h95so8454253pje.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 04:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MV6PktgzrB4iRaCAlEY4nZtzBn4RvAQS9ZywaAjB7n8=;
 b=VOfe+Y7ChzK9Hae3UfS3VlrCiV2R/KHaGRHTLJr/5szVGhj7TrcsfoxBc9Umjy9War
 ovsVaObIhd/WOl/0V0cG0CzSYGAuarAwrNYOHAwmGI2QGEjQdATQG96u6q+vBuZ/uMga
 0EKvNMzGlwdb6UzgItYCDis6hEscPRCa2WH+PimmuWz02TJFb1i12EHvC/tmx1p5r5fH
 Tq3DFsehmBUsmjvi9oe0bmKYRl0M+jGFfcxLjJXALGAb/1O/GLQaFkqcSFxtx7vEsQ6d
 7K8tNKwyPKuY5KpBtUJku6+tu5oCKYIEUfJcFey14zU3Mvt1PNAPWfikFS37/+U/+yin
 uFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MV6PktgzrB4iRaCAlEY4nZtzBn4RvAQS9ZywaAjB7n8=;
 b=NJTCNjCekQVSh7y0wArHzErTe8gYC+nZiOYqtHzG+j3SRRJ+1J6pZh4nCphoL3wTkx
 yeEc/1x18cE79JJhJhpumeymPQIIBfvZ00/n5jXfMv/3aCD4VbKrlmo9uT3L493RBpwg
 RdeT4F9azyhTbOnQBhOJCbRCBHdyeMQxc/exEKtgZZe4o+LIQJnxoBVRCkimJxZjy76g
 0Uoe19iJyUv6ub4n809IEuCVQleF55JmayqfJCZTE/JEoX/OZYJWtBaTQ6/gD3N513Bx
 WKfYwHcuo0D5+ZE6n8/Ft0CxabM82d8sq3sdzbqCwqZfiIlKgZhd3iUcBcpLwS1Hm+vQ
 jdUQ==
X-Gm-Message-State: AOAM532DoLEGH95lNMWvaBVugD7htK1y8nbRoeLJNgHCi/J0O8/WTLNC
 HmzQi7boA+thxP6YX+EbAOg=
X-Google-Smtp-Source: ABdhPJzNjlHWq+TWNdqX3llNuMrQ81CUpnATGIvbw1KvCn/8BegMf5XOHgtikAC50KiGw6hcVd6LSA==
X-Received: by 2002:a17:90a:7c07:: with SMTP id
 v7mr17331347pjf.38.1592824029587; 
 Mon, 22 Jun 2020 04:07:09 -0700 (PDT)
Received: from arch.hsd1.wa.comcast.net ([2601:600:9500:4390::d3ee])
 by smtp.gmail.com with ESMTPSA id j10sm6284217pgh.28.2020.06.22.04.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:07:09 -0700 (PDT)
From: Deepak Rawat <drawat.floss@gmail.com>
To: linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] DRM driver for hyper-v synthetic video device
Date: Mon, 22 Jun 2020 04:06:21 -0700
Message-Id: <20200622110623.113546-1-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Wei Hu <weh@microsoft.com>,
 K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

First draft of DRM driver for hyper-v synthetic video device. This synthetic
device is already supported by hyper-v and a corresponding framebuffer driver
exist at drivers/video/fbdev/hyperv_fb.c. With this patch, just reworked the
framebuffer driver into DRM, in doing so got mode-setting support. The code is
similar to cirrus DRM driver, using simple display pipe and shmem backed
GEM objects.

The device support more features like hardware cursor, EDID, multiple dirty
regions, etc, which were not supported with framebuffer driver. The plan is to
add support for those in future iteration. Wanted to get initial feedback and
discuss cursor support with simple kms helper. Is there any value to add cursor
support to drm_simple_kms_helper.c so that others can use it, or should I just
add cursor plane as device private? I believe we can still keep this driver
in drm/tiny?

For testing, ran GNOME and Weston with current changes in a Linux VM on
Windows 10 with hyper-v enabled.

Thanks,
Deepak

Deepak Rawat (2):
  drm/hyperv: Add DRM driver for hyperv synthetic video device
  MAINTAINERS: Add maintainer for hyperv video device

 MAINTAINERS                       |    8 +
 drivers/gpu/drm/tiny/Kconfig      |    9 +
 drivers/gpu/drm/tiny/Makefile     |    1 +
 drivers/gpu/drm/tiny/hyperv_drm.c | 1007 +++++++++++++++++++++++++++++
 4 files changed, 1025 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/hyperv_drm.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
