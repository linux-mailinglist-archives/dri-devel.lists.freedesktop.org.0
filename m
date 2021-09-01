Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E83FD4D1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 10:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603496E183;
	Wed,  1 Sep 2021 08:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE56E150
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 08:00:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q14so3098704wrp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcSqfOj8EBPHLcGbishITi026XRxSLqVwlGG1swfS50=;
 b=cBugGB2WrfrtovoKFypGKfWjyWowNi6B1Dk7p352tKDXQBQbB8Zw7Ml2PL5RL3O0Fo
 jPJls4PnepV4XhcHN26BsN/Je8f3CXAmJX960KQT0lBp9ie9GfGa2EXuwvhJUkKIkD56
 NI1ZiUW2hgZCEbQJy0Al3VHrXqUHPdM8KOdQb9nZoudruFBSiXka0v+1DTRDkFaSj9n7
 og16kc4l5dfOk/DPzlD+AdrUIC4v0mi0BDcNfpJG64LT1hB2dND2VHGC1SJmo9hEVhEN
 SzxpjfQh+uvCHv7PUtP0fI0E3yHF1B9BnOM5Bae7NRP7RM1yBPa/kWK36ljdSpF/khk0
 /nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcSqfOj8EBPHLcGbishITi026XRxSLqVwlGG1swfS50=;
 b=gS4sdGD5tz8LWheL2kbpSMLReDOO7Hz75HcJdKvUdr0IjmVre6DwrfL+D0vRvjYp1E
 6+bD731iMMW3+FTl9hUTmaPRjxgZmFptqYEVD82Akb97OZ0O+TE/rzYncHjSnbqntCyq
 5NuA3IYMKoYAHilWEdVXEF48aoZFmpegPrP+HMuTOklQUDWy+ZkUCA/1s1HBLACa5eGg
 egfPGq7FUO5G1ay7vJfjlPMlwXY2MMn5YmaIme0HESiJdRyUyGojpuoNObTu9/X1FbSW
 B+/yv1YFxz77xtqG0jekS5/0+igUs61myc0+G8hm7tpwKztbu1eKWQDluHr/4T/Gwu8R
 Fe/A==
X-Gm-Message-State: AOAM531FY+ASngj2u/3E9jGXQJty/sqg1BGcEbVI+mJcuvlG0nNdoKd+
 E0Z4SlVuokFvaRRsPp5Tv9gezNUHW97dG5gY
X-Google-Smtp-Source: ABdhPJxu4hCjdxhJ4hOJq+NltalMhbjrcL9snhLDAExEKrFRFETrXN0YTOauvRFocESgCWbToF1Kzg==
X-Received: by 2002:a05:6000:1c4:: with SMTP id
 t4mr36013526wrx.414.1630483203928; 
 Wed, 01 Sep 2021 01:00:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h8sm4483816wmb.35.2021.09.01.01.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 01:00:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH] dma-buf: cleanup kerneldoc of removed component
Date: Wed,  1 Sep 2021 10:00:02 +0200
Message-Id: <20210901080002.5892-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The seqno-fence was removed, cleanup the kerneldoc include as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 992c238188a8 ("dma-buf: nuke seqno-fence")
---
 Documentation/driver-api/dma-buf.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index f5ac4c90b237..2cd7db82d9fe 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -176,12 +176,6 @@ DMA Fences Functions Reference
 .. kernel-doc:: include/linux/dma-fence.h
    :internal:
 
-Seqno Hardware Fences
-~~~~~~~~~~~~~~~~~~~~~
-
-.. kernel-doc:: include/linux/seqno-fence.h
-   :internal:
-
 DMA Fence Array
 ~~~~~~~~~~~~~~~
 
-- 
2.25.1

