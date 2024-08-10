Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583994DC88
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 13:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D25B10E0A4;
	Sat, 10 Aug 2024 11:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHwr7EN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DF610E027
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 11:29:53 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7106cf5771bso2431875b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723289393; x=1723894193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wiCIA4Of57lbaaf813bkQDb7E0Z5QglAPM/HOXvdF3w=;
 b=iHwr7EN4pYfb6DWt5RRqiB0wvHg//uCcum0MU/eDH6iNrVk0s9CAf/koW+eJSNMven
 oUZM+2DpZxdwxlaxL3yONehrL7ZO+n1rOx33mOTbcoBy4zPus0kOcl0z1911N625qEFg
 77O6MVPZLrzqhvPaSiXvoIDOT6tobfj/stw6Useo9iWKGTqEhMgOpYvc1WH5SIcqn4Th
 PVwj3I3H75jejwzjqN89u/fb7DMkdtksXSZZlFMmyHsBmwv5vojvz24/9JOzhQKt9lar
 SyPFj17dfItQ8E0xfRim3GRu/wn6dbw7sWoc4BIdHKNp3pwlZ418UxS+J4+196Zi0d4I
 gycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723289393; x=1723894193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiCIA4Of57lbaaf813bkQDb7E0Z5QglAPM/HOXvdF3w=;
 b=d0eIZ0PFJpeobx9X0NM4ekn2q07chqazmgqiUotJsvwDXX1lcn/nMbrr1U2ECWNh/8
 YXky0w5sYdAluQetIYYTW1Bq7iDAismWKO5WdMYjDC6UGwAOCWVbOHLFc82gT6WUNGwl
 z7D8sLgeaVAO8JutgPcGpwESCdHf3JZqqPDCpiltz1op3UEOuXkm/W7MajNhEMe6deco
 sKrTc67WogbjkClMxzCfJnuBqhSBR+U/JmmZ7VOmWiPfCPQ2CeHTxvHh7CEvyLPvuIdK
 P97SI0PriIpLTt4TTd7EQMk9cxHlRxNAWgg4+kWlJFIFv/aPTfm0OPYco9yscqLCAs00
 0OCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU70idAYi70KWjkPZXBMv3JrtTP0fzNEKrZhrHnG3ATsS5Y7RnRSurlPI5azDkhjl32nMgtkcnxLMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz26/88lVUtIKrVU5PYhkNABw+X1CyuOny8jYtVawuQe0AJzs2I
 otNJFfEWlQSM+l3l4HGsFZ0ux/E64DMR1JUpCrD/8ZtP52QyeSc49gm5G+l3
X-Google-Smtp-Source: AGHT+IFFLrXSV9+JbJQlHWg5e69i45Y3QUEbOy1TCpPeglReO8eR90wNrfIufmfrxRocT06DW1dWZw==
X-Received: by 2002:a05:6a00:130d:b0:704:32dc:c4e4 with SMTP id
 d2e1a72fcca58-710dc627001mr4463972b3a.1.1723289392469; 
 Sat, 10 Aug 2024 04:29:52 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.255])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5ac6c6dsm1098003b3a.194.2024.08.10.04.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 04:29:52 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: robdclark@gmail.com,
	ean@poorly.run,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: Dipendra Khadka <kdipendra88@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Fix warning: Using plain integer as NULL pointer in
 msm_ringbuffer.c
Date: Sat, 10 Aug 2024 11:29:42 +0000
Message-ID: <20240810112944.175509-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 10 Aug 2024 11:37:09 +0000
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

sparse reported following warning:

'''
drivers/gpu/drm/msm/msm_ringbuffer.c:34:31: warning: Using plain integer as NULL pointer
'''

This fix changes integer 0 to NULL.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index e397c44cc011..5c73b8577945 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -31,7 +31,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-		ring->start = 0;
+		ring->start = NULL;
 		goto fail;
 	}
 
-- 
2.43.0

