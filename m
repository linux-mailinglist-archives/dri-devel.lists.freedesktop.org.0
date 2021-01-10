Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9EC2F077C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jan 2021 15:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6903889DD5;
	Sun, 10 Jan 2021 14:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BF189DD5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 14:01:42 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id j13so8845073pjz.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 06:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=lJZqOpZ8UmCzUAN84FCZjD7qVTQcxVbeporibxTdXVM=;
 b=KsYf+NIcLqDud3idfANJiGiW3dr0eOUA5X61g98JKJX1nQuzl9t7ciwbc9+xAArjYw
 dE38MzkzEAYejz3yVXkN6qgRulIz0Kw3wusq2BxChOScKonWrFmEpzOGIlaTpZv29Egx
 B3x0Ujc4B1CTa0r32tyCToUU1PD7Ma/cD9xkdvA/oOtYZTBV9vg9uewjiZLwhwSBqvvd
 YE5evSUCn3ipel+4R8MtakmJu+SGFjMQjYJ4QbiBH/f1VSGEXMMLZK4tnUoViGymd+mK
 fpYHT/7sNPUqPPRTQE+EftPk26gZyjAOb77IJZMgX/syDabuAevSl3mr2pvPb9kmmCrb
 pCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=lJZqOpZ8UmCzUAN84FCZjD7qVTQcxVbeporibxTdXVM=;
 b=oR17CaNapJPMVhQfSRA6sVb9YcspQwWmGfnRtjUdpPngnbvQPxxzwzt7tT6Rmi7wOI
 QEAMrmYZt3oD5YHPpDLdC2KrTqOZRkytbmdt2KNAvqISdr/aUV4xOwkG3mPvPuXaIKLj
 n4r/l0XuUxV3UUTxhQy9i4bap+j5FgD/NJWrdtQBKwUuoJTIJIiT9ANUjHAmGPRtsGnR
 udyqBS/JOOyKlUCrQbV9qIzGHcr4t59kh92fz9tALQm2xBmgwPhsJwEY4OnjoDkbwRVK
 KZWXYfESgImi5+wiuaA/uvt4arVIBou9C7fw1YxxjhAYdzlTCSYJzy9bfEGTlEvHB12o
 ou+A==
X-Gm-Message-State: AOAM530rQlMkOcKOzf3Y9PKDfheOBXXwCnHYQKtfYNnDVyFDPFoyDfzQ
 RXOAgVUuLM+KIOAtMCFsb7s=
X-Google-Smtp-Source: ABdhPJz5QGHT3Ab3PLEPEulwl2eWVQ3TxQm9G05D49mmkSNLO1MstUyYCQCnhPhwaQkAIFIag19JOQ==
X-Received: by 2002:a17:90b:107:: with SMTP id
 p7mr13350779pjz.216.1610287301979; 
 Sun, 10 Jan 2021 06:01:41 -0800 (PST)
Received: from adolin ([49.207.199.194])
 by smtp.gmail.com with ESMTPSA id h12sm16662199pgs.7.2021.01.10.06.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 06:01:41 -0800 (PST)
Date: Sun, 10 Jan 2021 19:31:36 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V4 0/3] Decouple config data for configfs
Message-ID: <cover.1610200411.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset aims to lay down some prep work before configfs can be
implemented for the vkms driver. The first patch in the series adds a
new type vkms_config to track device configuration. The second and third
patch add module testing support for writeback operations.

The first patch is developed by Daniel Vetter.

Daniel Vetter (1):
  drm/vkms: Add vkms_config type

Sumera Priyadarsini (3):
  drm/vkms: Add vkms_config type
  drm/vkms: Add support for writeback module
  drm/vkms: Add information about module options

 Documentation/gpu/vkms.rst         | 10 +++++++
 drivers/gpu/drm/vkms/vkms_drv.c    | 45 ++++++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.h    | 13 +++++++--
 drivers/gpu/drm/vkms/vkms_output.c | 13 +++++----
 4 files changed, 66 insertions(+), 15 deletions(-)

---
Changes in v2:
 - add Co-developed-by tag
 
Changes in v3:
 - correct usage of Co-developed by tag(Melissa)
 - add enable_writeback_feature(Melissa)
 - modify commit message(Melissa)

Changes in v4:
 - split previous patch into patchset(Melissa)
 - fix checkpatch issue(Melissa)
 - update docs(Daniel)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
