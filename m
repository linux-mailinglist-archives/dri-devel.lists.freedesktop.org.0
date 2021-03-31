Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A813034F71C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 05:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560E86E9CD;
	Wed, 31 Mar 2021 03:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDC86E9CD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:06:03 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q10so1961556pgj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 20:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7IZPrYnPkidjfkwOd95npa8XUYpnaw/oHRnVzmbq1aY=;
 b=F+f6y0/3BlkhyuHDYfJfPdxpx/7rP5+f7mEribYnja+kgWL8OfuZ7zaafwnBW9N2fm
 l2ju4kj9Xb22kIYf0uM0iNefKb/SMxTLiBXu/gknw46mV4oZpTUNeA/DZlgXxva4jc5f
 T9WISUDA4DyZHpKZib+K3RSXNVX+R1km5cgTJJrhDQEKQRCsu/O6PXZNAMm9G+bBDghp
 vs48gbPQvRy91fdBkfGLcWdDot7dQ0C4VOeIGtVlFfv9kqZqwZ1g8XA9L2+kwyFVueWN
 4dClyMpFrGR4TFnN2KWnB/frjta8Dzy7f5Ka0Ihid6yoF8PC83NDnxa0bzma+l7Ox4nH
 Ov4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7IZPrYnPkidjfkwOd95npa8XUYpnaw/oHRnVzmbq1aY=;
 b=FSwiqMI8ORd4EdUyw+gQKagjVp5ZXQZfs6Y5qgsZ7lSR1ZFNDb1W7nfs76KXyLGWdt
 QWupeSBt5qTAz1upgEELaPkC53P+82SHYdk6Y8YKs3qNT4Wy6k08cYmDtgtxswDCZOOe
 g+IHtF0ExVsNCBvpcI2uFfV9MeA13e0UeejVCdwEj6AMn9sGjqJsXwvyJeggCXnWScF5
 sUt3t/Wi4GIVbbt/r2JXlvGFA32+JVQF1mnXZR3H349zRKTI2JMZ+GCWTw0g+d/y7Qcl
 qOyVHek2br05qsIbPF2bQqFGai21QbH5U6KSlMBN4mR3tLwjFXwmMeOYBZpAR9d2Ux9x
 g3hQ==
X-Gm-Message-State: AOAM5334MGslErjkKNiHDy0sISGhz2QTy9IvAdBRKTvko0eRW8WEZIVP
 82cDm/RiTJmraQcCm8Ms2aM=
X-Google-Smtp-Source: ABdhPJzR3p/VuEwkIaS7e9O0f5ShH/3oUMeC6mvL9qRrkJ7j6anwyFNzHSLGiSPd5JZc9f3552HU8A==
X-Received: by 2002:a63:f014:: with SMTP id k20mr1127406pgh.323.1617159963467; 
 Tue, 30 Mar 2021 20:06:03 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id k21sm375376pfi.28.2021.03.30.20.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 20:06:02 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, zhangxuezhi1@yulong.com,
 robh+dt@kernel.org
Subject: [PATCH v4 0/2] add support for Waveshare 2inch LCD module
Date: Wed, 31 Mar 2021 03:05:48 +0000
Message-Id: <20210331030550.119493-1-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tzimmermann@suse.de,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

This patch add support for Waveshare 2inch LCD module.

Xuezhi Zhang (2):
  drm/tiny: add support for Waveshare 2inch LCD module
  dt-bindings: display: sitronix,st7789v-dbi: Add Waveshare 2inch LCD
    module

 .../display/sitronix,st7789v-dbi.yaml         |  72 +++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/tiny/Kconfig                  |  14 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/st7789v.c                | 269 ++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
 create mode 100644 drivers/gpu/drm/tiny/st7789v.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
