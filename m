Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21F43F1D9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 23:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354E6E836;
	Thu, 28 Oct 2021 21:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9455C6E836
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 21:35:00 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so8940276pji.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqI/lK0/+nv667iQ42QlVQxYmVIHW2RitZk9kek30AE=;
 b=l4vKiF7oW8x+6zxU07VImJ0SRa2J2BnrH9B3YMiwxzmM+VYncbqeyKV5y0UMRziQhp
 YQTsLoo70o9aOmmOfrfoE9RgqfBIlCi8WT5BIH0HVsgS1MetRLGBEGOewMyc5Jjii0yN
 rHMw7uztmZVn9M81SXRVTwtGaLfH+MfonkaYcbEe4gBavYJSCq6lWZ3yDt0Xnrp1fji9
 tkKzkwqZZw3FwuAtH1TwAQd1LaLG3q7aWVEOqtqEZDZSMlFfjvljm/Hc00hiYxUHWLgI
 7LwOHCkR5q3nuuJttZ8aAK42PBI1VDOKupN1hhqkUO4GLUGSuZqM4cTMD/xC/1Tp9BEr
 Jg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqI/lK0/+nv667iQ42QlVQxYmVIHW2RitZk9kek30AE=;
 b=wGwUYvm/gpX579ztIFAxSk3LdMhYC2Vesi+Qj7FzMmvxW2LHhue8+wus+SvTvmL1B5
 u/QMlHeF4oVJm1Q2USnrkPh7C1tJC9/miYcKdUoZOMXTCT/QndzAD0ITEQ4a11i6C6Fs
 cqZojtKczRIbjDFk7yGksnSz10hs4AHYzB9iiXkRLFYuWcuRgwY98z3+Y68svrP4knDb
 M8LtcwaoIge8l1pOer1g8HDHWuCMSZLoF2ZpPPnocFU/y2Rc0B6HBy32i9uqoWNZbPma
 KJJVqvTsA1oX5/CuRE4fCYVyNY2a131vwqOm1NwS/Lh+vERqc586Oem+P/T+ARGA2g7U
 JmJw==
X-Gm-Message-State: AOAM530Po4MMKqMjszA1C/BkLtQjprkjc+LkTzrOB2OUQmBExJmBFu4V
 mc3/z+jTl8Jqa0jCYopF0ge/GqferLk=
X-Google-Smtp-Source: ABdhPJw9Qaz57UJbjwgG3p/y74KCak/5klrwismOfCUDckmJ2bu0gPXpaX2QHCK0Bkc74RXWa1Gx3w==
X-Received: by 2002:a17:90a:650:: with SMTP id
 q16mr15570362pje.72.1635456899792; 
 Thu, 28 Oct 2021 14:34:59 -0700 (PDT)
Received: from olv-glaptop3.lan (c-76-103-101-107.hsd1.ca.comcast.net.
 [76.103.101.107])
 by smtp.gmail.com with ESMTPSA id f21sm5313364pfc.89.2021.10.28.14.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:34:59 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] MAINTAINERS: add reviewers for virtio-gpu
Date: Thu, 28 Oct 2021 14:34:46 -0700
Message-Id: <20211028213446.955338-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Gurchetan Singh and me as reviewers for virtio-gpu.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Acked-by: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b79fd441dde..5474a0a708a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19894,6 +19894,8 @@ F:	include/uapi/linux/virtio_gpio.h
 VIRTIO GPU DRIVER
 M:	David Airlie <airlied@linux.ie>
 M:	Gerd Hoffmann <kraxel@redhat.com>
+R:	Gurchetan Singh <gurchetansingh@chromium.org>
+R:	Chia-I Wu <olvaffe@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
-- 
2.33.0.1079.g6e70778dc9-goog

