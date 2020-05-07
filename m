Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006711C93E8
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4CE6E9F7;
	Thu,  7 May 2020 15:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5958B6E9F5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:10:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so6830201wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5BlvfrtpldkvQmdW3fVAGTvkfENqt85ZyirQ2LO5Dg=;
 b=c8liRpPWaFDIkdpo5vS6uLPrO3Pu3paOU0UkwLZ2PywBUNYbTzzESjERCC4Bf5orRQ
 Ml2amOpvu4i4L6QHM33iwHjlQknIJD3MSuAkHoKsrwzPk4UF1lXQHPWZCic8fw939b+C
 OIVyyw3Mm1AbZrfI57sQeC3qhOJHvcVEFrK+eZ/xfcOVkGKGNnNz8p25FrJ3mLBjnuT9
 AVn+SmMp6dHnqUfsqQbfzQwX5VyrBfd2XtkjUo3scG2XutNZzrOlTkNKQQP42ld4nZsg
 cG9UNG5KMhogr3onoJQIojKSGRdNsol60J0gGWrRJTcDocXiGm3kgye6n0ft/9UlCXxo
 rxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5BlvfrtpldkvQmdW3fVAGTvkfENqt85ZyirQ2LO5Dg=;
 b=qTlCI6I2QF78duBbmGgTRwNCXESsOexQbAvz3pstAhM8nEqrqstXbX3oricKaTagS8
 TDAMgO8aeLMj2I3A3RG3R9QeDvSV++Q8t44H5cv9Al6cL3O3fNfhm3djbt4YDWDf8Erq
 PNqE5wtS1nYhMH5DsJ11++nIX3sGWrkIsszPc1sautbbMgHnHAxwwOTBBuZon+F4parL
 jPotJC79aKa9ekIuFQBH4E+wgwLsRklkRHqyvwtWh1lT4EaPFoyOnId6XWr2z1R6o8II
 cSpyBZ4a73yxm9+PAfCDEIIgGVRJAX8VWJ15p9T/dZ5waZgFNXR2Vhwbx0HYz7rn93HB
 yRsQ==
X-Gm-Message-State: AGi0PuaUJp7MOJlF5h34Hh4lTsDWbWiJcH2bJJ+4TqBx/VgqD+sftq59
 RgfL//lG26f3KJZrnAP+BAHKmIEr
X-Google-Smtp-Source: APiQypKaWK4WIp+J/6DRqDkkew4cBhhYIIHzmaUriVuGtRYK9tAvpU6a9MdwWm/Yi+CrQRM5592zmw==
X-Received: by 2002:a5d:4702:: with SMTP id y2mr12320207wrq.136.1588864254695; 
 Thu, 07 May 2020 08:10:54 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:54 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/36] drm/todo: mention i915 in the struct_mutex section
Date: Thu,  7 May 2020 16:07:49 +0100
Message-Id: <20200507150822.114464-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
i915 uses the _unlocked version of the grm_gem_object API. Yet makes an
extensive use of the struct_mutex.

Did not check how exactly it all work though.
---
 Documentation/gpu/todo.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 658b52f7ffc6..2ce52c5917f8 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -157,8 +157,8 @@ private lock. The tricky part is the BO free functions, since those can't
 reliably take that lock any more. Instead state needs to be protected with
 suitable subordinate locks or some cleanup work pushed to a worker thread. For
 performance-critical drivers it might also be better to go with a more
-fine-grained per-buffer object and per-context lockings scheme. Currently only the
-``msm`` driver still use ``struct_mutex``.
+fine-grained per-buffer object and per-context lockings scheme. Currently only
+the ``msm`` and `i915` drivers use ``struct_mutex``.
 
 Contact: Daniel Vetter, respective driver maintainers
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
