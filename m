Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DC39BC47
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 17:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B1D6F61D;
	Fri,  4 Jun 2021 15:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF786F624
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 15:52:31 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cb9so11741274edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IeVQ/JL2MoNgBdSE7s2jBAuH6UR55nAw/9XvPWX2rUg=;
 b=ozQjGCMtX9vlPYE7whGrVNR8k+wCZepcgL+R0QqjnsnEhfvI6NWV6hSvOOTgC38hm3
 aa6sEP5BNJceE7z9QJC+C3CX3RVolM4PaWgGtFjkOIWZMEmC8r6FQek0FCcnRnGCocxe
 qhO2r3n3D3fspPXMEKNl/bCUP9T//oK7hPoaQt+3JGnVX3DkeUewt1slo+VR4gjw9ZYX
 srTFTN8J/NsHTRgQJ4tltbG8mpNOAimSxTsVhURUJ560/4ohzCk+KdIsE4vmwznx4WXS
 ZEeBcchSkfFbIQx4rjVsr8Q4DS1W5SzpXrW6Zac/e1MBRYpVuffHrORzlT8aN9HQR3IN
 fbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IeVQ/JL2MoNgBdSE7s2jBAuH6UR55nAw/9XvPWX2rUg=;
 b=Xrq/W4pIXSWcWROdmS5zXpOhN9G6pBxZR1cz6/4h29V66ahqoofEZGSuqWzH4yEm+I
 Hj0ej/JlMIah15v63gC2dj/yWGs8jly6g7Z+BItMKMxAUyCcklde4Za6LmjghFPIX4ax
 zE7N9R9J/eaXI8GFhvNeYax7sOxDXw0MxGfCrOLjVNMnu5UfxRZKv5QHzR/kPt64XVvu
 wXsdu8MQoxmOmo8QOKxVkvuYdq2n9KTzIRjR4pFY7wIPHELElki/WT2OkkCNJX1P7mQs
 O+3OmsyJieV2k5F1tWajVaH5Eslx71pUGUmuqzbahtCuuMbqzpqhDoVt1Dew3fCwVzoK
 Z9fw==
X-Gm-Message-State: AOAM5322vZCfUTj1g/4XFTdWRHGcaGdkT5IxW1dNRpHqwrNb0hDQaori
 1sIfKrv0ELV9JDT1l684Wf4=
X-Google-Smtp-Source: ABdhPJz3UJa8k+Xe3a2U7/BOwG2lYmX2OUCfKsW6ztYufSN09hceuPTvpawkxut3PojRcDcuJJillQ==
X-Received: by 2002:a05:6402:b82:: with SMTP id
 cf2mr5477651edb.351.1622821950162; 
 Fri, 04 Jun 2021 08:52:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4fbc:6ebf:9275:5757])
 by smtp.gmail.com with ESMTPSA id w14sm3405209edj.6.2021.06.04.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:52:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch
Subject: [PATCH] dma-buf: add missing EXPORT_SYMBOL
Date: Fri,  4 Jun 2021 17:52:28 +0200
Message-Id: <20210604155228.616679-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The newly added dma_resv_reset_shared_max() is used from an inline
function, so it can appear in drivers as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 3964df438505..6132ba631991 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -226,6 +226,7 @@ void dma_resv_reset_shared_max(struct dma_resv *obj)
 		fence->shared_max = fence->shared_count;
 	}
 }
+EXPORT_SYMBOL(dma_resv_reset_shared_max);
 #endif
 
 /**
-- 
2.25.1

