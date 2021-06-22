Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4383B0AC2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382E76E7E5;
	Tue, 22 Jun 2021 16:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34C6E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id n7so24499158wri.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofnj3zZOb6lvNBLTmLvRZ/dI7B7Qizs2A5qFqSokZMs=;
 b=PlDcLOVGiA96xcwhvZHPQlAvGMEDcBg9O6ntIM3BCh41iUZ2TDSZtrlqYDU8AaH4SW
 VDIN57zvAe9n66JyTgIQ0zKjFdNj0fhCyqYu1iSpC/6rjhGX2IkMAmVssHzRiuldBTiR
 jhp1mZSCgGKNP26cKAT1jLdUgW5uFs/CRHA+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofnj3zZOb6lvNBLTmLvRZ/dI7B7Qizs2A5qFqSokZMs=;
 b=SooLwOt5yUE/dLqKpMWo94orJ87Wd12vBohW8q+I7OnJuo3RI7BeWJOEw2y0aO0EPx
 AvYJOQbdJiB0u9KYrU8FNrivFzmZkGSZg0E7jhXmIRXFqz/Daj4DSi7zRdiDftej6CFl
 m/AY+C7fi12GISSHEBDfztXJ4kNZKCVyyiALBPMIr/07OJYNFck2i3KNqmpwo9fhTof2
 YYdewTE6WBB7SCNa6kqYoxqTp3q2wd81xUKYdN9GuzbRjznwEGnqB1MKKtSyi/YhFtYL
 Kck1n5cYiM4ytm3QmVKiTPv5vkpSefqrgYsPV6CZvWcv4bgFcryHmUgQ+i2IpnpY9/84
 dp1g==
X-Gm-Message-State: AOAM53018Xi90PEwCkQ6TaWow3ZnxQg/8ftdn0pWC5IulLQ4b4JpZJ5i
 iTFC1mzKXyfcEGVxRz3EmQGfmriYXzFRzA==
X-Google-Smtp-Source: ABdhPJxbm3m5AxBLJ1sntMH1y3g3e+GjtyXkKAUUh9TQfj84Nt1Ek6DhdWavkN+hSBoePr5r0dEEoQ==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr5875974wrz.339.1624380918343; 
 Tue, 22 Jun 2021 09:55:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/15] dma-resv: Fix kerneldoc
Date: Tue, 22 Jun 2021 18:54:57 +0200
Message-Id: <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oversight from

commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
Author: Christian König <christian.koenig@amd.com>
Date:   Mon May 10 16:14:09 2021 +0200

    dma-buf: rename and cleanup dma_resv_get_excl v3

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/linux/dma-resv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 562b885cf9c3..e1ca2080a1ff 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 }
 
 /**
- * dma_resv_exclusive - return the object's exclusive fence
+ * dma_resv_excl_fence - return the object's exclusive fence
  * @obj: the reservation object
  *
  * Returns the exclusive fence (if any). Caller must either hold the objects
-- 
2.32.0.rc2

