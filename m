Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE7B188FE2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 21:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB9C6E0C6;
	Tue, 17 Mar 2020 20:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3866E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 20:56:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a132so850774wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E11XKxa+99XAxvsaAYOAf6rfWCpejdmI/dGXHU0ftc4=;
 b=LtZPNzC6b/uYz7/iUpiw4siGA1/q7YWPE+zfz3twoBvPQpx87qtHSALZBiZeL12ZLB
 Imh6HbyxUGSl9PaF8mzSd8TqKqBVGmyAsUnwY4seGnW1QDV+7QM1PLV4RnQPyIevWQms
 vOdKcRPlc295M1IIdcx2FS6vWg5JFGnE5Ynt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E11XKxa+99XAxvsaAYOAf6rfWCpejdmI/dGXHU0ftc4=;
 b=D9p1phWl+IlXclxFIFQ/TVOjm+FvMGcUi0vl4dr6a2twrtiYBAWt4JEzBF6Vs9X7sM
 9DPrxasqWq0iCfYG1uelRQ4FlU088YA/4AlojlmeFNdIjoWZ99vjBBTXRVelxW1uvDZH
 8wdGlKFiFONW+RxpdT/7+Gbvlfd9F4Xa1mkxKm4R1nqq92SFvnJGUdi3hWjOZC7cKPgS
 /Pi7TbIWSdCjhHr3YTZKFUpMwzJHHN/MBAhzseeNvA0LSjasomMGsULycW9Gr7+tPRRy
 2KuefnRzjfIhf583Es92/09O80W3nmwvNYvaHEJN02cyMXr4PJHbvqxeoyJzI3Qt9p95
 TpNw==
X-Gm-Message-State: ANhLgQ2u2qP3uTBG4XIYRywbtKlCUW2RwaYkqSwY2kT12FwqfPCDNbBB
 GZplwpZu1nrpX2zXk+GgBcSBng==
X-Google-Smtp-Source: ADFU+vuxLqsX9OOC+HCC5UGSBRT3kQGp9W/anxdsF8DdeGYqstJOLR7/CQB+Sbpa2yhBPeKJsCDERA==
X-Received: by 2002:a05:600c:14d5:: with SMTP id
 i21mr894439wmh.82.1584478609782; 
 Tue, 17 Mar 2020 13:56:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a73sm703837wme.47.2020.03.17.13.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 13:56:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
Date: Tue, 17 Mar 2020 21:56:43 +0100
Message-Id: <20200317205643.1028398-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're getting some random other stuff that we're not really interested
in, so match only word boundaries. Also avoid the capture group while
at it.

Suggested by Joe Perches.

Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Joe Perches <joe@perches.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
v2: No single quotes in MAINTAINERS (Joe)
v3: Fix typo in commit message (Sam)
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3005be638c2c..ed6088a01bfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5025,7 +5025,7 @@ F:	include/linux/dma-buf*
 F:	include/linux/reservation.h
 F:	include/linux/*fence.h
 F:	Documentation/driver-api/dma-buf.rst
-K:	dma_(buf|fence|resv)
+K:	\bdma_(?:buf|fence|resv)\b
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DMA-BUF HEAPS FRAMEWORK
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
