Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76E187A37
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 08:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A586E52D;
	Tue, 17 Mar 2020 07:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2561F6E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 07:15:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z12so11476729wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 00:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MFz/fOJixvWzcvSU4go/rFHGmxjYPGKF/Ch+nsy/6+A=;
 b=LM4/ISszOBUpkchVKZxUKcKxPDaf5/m4Dl5b4wiHzO82d/D9d4+nUiQ6z9VY3uYUuI
 PN4xZI8u/KohR+5cUA1tPX95LVGypE1HZVY5ff0vAw9R0qH77EOdFyHKY+A8noP5dpwU
 G/bY7gkrq6QYKrLNTmPicsPFOhkbbdpODFKCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MFz/fOJixvWzcvSU4go/rFHGmxjYPGKF/Ch+nsy/6+A=;
 b=N5Ouv6GUwOdMA8xxaWZ/PvmfaUbgflsVvxKxWZojdMsEee9Z9vEJ2iFWaWcs3cW7Rg
 cj35shL6/3soMJfV1dgl9+zIw+8OGC2D69zW+qwgKsRCE+QmnReFb8uPtt0BTRKHXSPc
 S82TGh4n+YAJCPtkx7cWu2nsK3TOGIoLeav5DFVAMlefF9MrSsDm67XEjKrdl8oMh4sB
 Ca1sekd3DsnRVgWrYJDFQBH+pAjgkuiwLgII0hZFdxBGGcWZY318BiV2YY0L7naBslJT
 d1IpSQT20+7Dhrub49ndq2rcLmFXFZqFJEaShlmILY9YdJmvkIfiSgPaZ8Q1gowh0F6A
 M39g==
X-Gm-Message-State: ANhLgQ0F1nyBRn01aQCAqG1PLN6zKQWrcF18Y9dmQXKtc7zBabdi5JVk
 GV72M1TtAhat6rlBsg4ZZup7gw==
X-Google-Smtp-Source: ADFU+vshR5dL7XEFTVt5fsXsNS9srnBWqq1zc+uhfogGkq31eM9oA0HMTXTh3QU5dIxWcXYALTZGrQ==
X-Received: by 2002:a05:600c:2250:: with SMTP id
 a16mr3486950wmm.57.1584429353745; 
 Tue, 17 Mar 2020 00:15:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 9sm2707769wmx.32.2020.03.17.00.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 00:15:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
Date: Tue, 17 Mar 2020 08:15:47 +0100
Message-Id: <20200317071547.1008622-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Joe Perches <joe@perches.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're getting some random other stuff that we're not relly interested
in, so match only word boundaries. Also avoid the capture group while
at it.

Suggested by Joe Perches.

Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Joe Perches <joe@perches.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3005be638c2c..fc5d5aa53147 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5025,7 +5025,7 @@ F:	include/linux/dma-buf*
 F:	include/linux/reservation.h
 F:	include/linux/*fence.h
 F:	Documentation/driver-api/dma-buf.rst
-K:	dma_(buf|fence|resv)
+K:	'\bdma_(?:buf|fence|resv)\b'
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DMA-BUF HEAPS FRAMEWORK
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
