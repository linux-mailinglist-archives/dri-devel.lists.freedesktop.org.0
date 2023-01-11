Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28466665A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0EB10E16F;
	Wed, 11 Jan 2023 22:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68210E143
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:46:04 +0000 (UTC)
Received: from localhost.localdomain ([174.232.190.8]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N0G1n-1os0J83ap5-00xKQV; Wed, 11 Jan 2023 23:45:59 +0100
From: Kevin Brace <kevinbrace@gmx.com>
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] DRM commit e3c92eb causes OpenChrome DRM to crash during
 boot
Date: Wed, 11 Jan 2023 16:45:43 -0600
Message-Id: <20230111224544.4837-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rxngWwhy6YRIy8yAV01qBWEGuEtrougIY83YiNW/X+obw6rLrXt
 Ipz0qPCHP6iLzuKn3NWie4a/e8XNrsigRp3Tym4twSl7+/LCBB6n9860PaxKJPb47oNzcpa
 swVSBZZKZsrXMCuzbHjx3T8dOEUscj3ZDX+K/DJ/oTVDGqGrQvrB5Bjm0XTuBhIKpyY1rYa
 y2xoTEMFEW6to8q9q8fhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a/yCgBxr/WM=;ujT9YkgYdoT9iLJySNiGcNdDVKq
 gpKf5yBqEzsQt2ukAiW3Ko4gjT7w/0RVporrf4axja0uYD+LcXxwmy/KJxayKMOmqSgtZEmnr
 XeSghV+q1BpXNZQQFAp+k6ahca/+bDZXoO0qZmBRPo3vSQ6xc1GeS/oSFoT8eQ+HqfUeImkC6
 3fcSC4j9YUhN+9xfPjhybC7FXh5EMATjFfnd5FFq6yb0IpYZ+pdAAm3gFoxYlLnTC8dcx25t3
 +6k2bm1LY3sh7lk5n9MPRR3/tLszufq0rXc5z/2Zew2Sj8uMpzn0nL5UbETtHU3MxgfiFEHh2
 7/SJo1tAqMoCSwZWfyjJN4iYeYqLbWu7vCnjcjQEu1sVy8Ud77RXUmzwsqDBwHfZCWLuFpek0
 Pc77WRJD8LjGPA55DuOFAgbhl2G3HPkiyJdJEvRXfENFAc+QHEO6VoLYA32M9G7IL3OF/yD/6
 F/dVJ4OIm4rep2EEUqmgHPYhAzUmm8BIrWrFAH+DxM1camEb45ZgZiaE7RKd6qeJemxPRUVHm
 rOfP+eGDrkZae+azJcMkcmZgwdkZ7hBod8w7t3kRETS07XA3W+1MB0fBLgW4++7UZx7gb4xLw
 FhzKz2B9nrXpZqEy1aFeKNfohuNPyIOMfeiWB06/r0iyrdkJp85McFNDN+qgWrgdqiUZ2K6EP
 A3d6F8vfwLQat9ah/TvResPPXsZ5glAUTsAhpvzdmGysgbwpCZT3Ecbq4spduHZ3aEvy+tcG0
 +Ap16P+JQG0u8aS5eyK+/6yrVdVU3jH39eVKgWtjKouCIBNtvkiiZnl5qxiqFYa/6nWMYJ01Z
 OFXbe3h7b2CT4wFky72Y+gFUAsD6dWDWZLHIa4VNmsB3OmgZZ6W3iO/U5Y9rsr7RH14pdpqb4
 7PSW580k8m/Ao8OqcjtIUe11npd+Ru6DJNU+Owm0uNTsF1UBYtc9QYD0ZLzcAe2nlJ0C/4c3I
 ub/469eIYli76hV6+Os+e/RgI00=
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Hi,

I work on an out of the kernel tree DRM module for VIA Technologies Chrome
integrated graphics (https://cgit.freedesktop.org/openchrome/drm-openchrome/),
and DRM commit e3c92eb4a84fb0f00442e6b5cabf4f11b0eaaf41 (drm/ttm: rework on
ttm_resource to use size_t type) definitely breaks my code.
The bug is 100% reproducible.
It took me about 2 1/2 weeks to track down the bad commit due to the general 
difficulty of debugging DRM code since it gets loaded by the OS way before
sysklogd service is even up and running to record a crash.
For this bug, bug check did not come on, so this made it very hard to track
down the bad commit.
After reversing many commits, I was able to see a difference in the behavior 
of the code if this particular commit was reversed.
I am including a patch that I think correctly fixes the erroneous code, and
OpenChrome DRM works correctly (i.e., OS now boots properly) if the patch is
applied. 
Please be more careful tinkering with TTM in the future since it tends to be
very fragile.

--
Kevin Brace (1):
  drm/ttm: Fix of rework on ttm_resource to use size_t type commit

 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.38.2

