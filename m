Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C243C19B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 06:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29750890E4;
	Wed, 27 Oct 2021 04:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86F26E520;
 Wed, 27 Oct 2021 04:37:19 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id j6so1648096ila.1;
 Tue, 26 Oct 2021 21:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
 b=Z/MaaooGp7lzUsGLHzuh2gY0APQLsFpOF8gA2aeDSPAaRs9W7u7HuQM7JpCUorWKYs
 L9owXMrWUAQ9tUulXc81Do4d+/ZkiFmNLxHm3palrm9RVy3bIAdX8HZ014oLzTAIinZa
 2Iv2r0dH3Ch2WIP0V6PgsEp43lMxfWwTIHI9/bnSdIgKUKGopiIqjMz+Iro8XN6O1opC
 jvtkCkDoBpFKjlUqXZIyH4d6FsPmLEleinkbnbwSupZgZchrCKnb2Ie+VWqPg2G+WA/a
 rofPic+6gng8QebgbST0YhM5fRKtPEstfpscWEA/I8Mz0SqBqXaHrs9SgoTKQJiPhml/
 E3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
 b=OGKohC6PJID/suc4qvn1o7stcrvU+4SHZ/0on9C/iPRvjVLzCykcQKuJlrEVnRnufs
 Gw0CNwz0b0K9fD7PIUtYjUXEK34/DZkqV05WfnfbHTjJw0KcBtOyARePnw+rpjoKqQVP
 Coc3gVbSiv1KSqNLv315eIHWyg6gF1WhBT0eYsjZAxavRC+WpJI+egUvUlrqqFNDPEwa
 dS1t6SS7BBUWJ7k1ZPp9BOu/q5BHgGL8okh6pcrumaVqq7w38FAFicqBfpo6JX470WJv
 /sSv+GRLeK59Bu8yB7EmtuoXAGMd6YezAZmyFwn+OhDjnSUNFpi/CZO3fkwZZeHdeY+K
 6Elg==
X-Gm-Message-State: AOAM5336X4Oz27nqsfp+m48tJGwG9xsacQGxYETdq2x+2LHnosgnoWDm
 qlOHu7/FVMUKfp4XZnfg77U=
X-Google-Smtp-Source: ABdhPJzCjWJBO6TwyGKAzlLbv9h8AD95jezLmysBiRrJ7HXztnBlPBjVYeiF2M8DYLy9h9ZbJ7F8zA==
X-Received: by 2002:a92:ad0c:: with SMTP id w12mr16778504ilh.20.1635309439031; 
 Tue, 26 Oct 2021 21:37:19 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a15sm2030404ilj.81.2021.10.26.21.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:37:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 02/10] drm: fix doc grammar
Date: Tue, 26 Oct 2021 22:36:37 -0600
Message-Id: <20211027043645.153133-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027043645.153133-1-jim.cromie@gmail.com>
References: <20211027043645.153133-1-jim.cromie@gmail.com>
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

allocates and initializes ...

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf5..4b29261c4537 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -486,7 +486,7 @@ void *__devm_drm_dev_alloc(struct device *parent,
  * @type: the type of the struct which contains struct &drm_device
  * @member: the name of the &drm_device within @type.
  *
- * This allocates and initialize a new DRM device. No device registration is done.
+ * This allocates and initializes a new DRM device. No device registration is done.
  * Call drm_dev_register() to advertice the device to user space and register it
  * with other core subsystems. This should be done last in the device
  * initialization sequence to make sure userspace can't access an inconsistent
-- 
2.31.1

