Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5672432B84C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E216E985;
	Wed,  3 Mar 2021 13:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510766E988
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b18so17254757wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZJKNhLRXc9aoEUlg60mpCU3bbdn2u+HfyOeJ90k/g4=;
 b=IwKQ0n8S1aPrrgbMmJrQkxt9jO0zGLong8mRdLUcm4bLTCRQCscWGXmbesP2pAaCj1
 KVQvWMt7U2Bh4XLHxlmDHJdRw510PtfXw1U0vG3Js+p2DL0DRvmm8YKtfVuQS5Us/3v+
 Id6LAkTfKW7yFddEx3M0+VzuBlePAZ0t+pzxJb/fRVoewrv5/U7PzFAwW4vBzmlsFU/V
 KZW8MFmUxaJ8fVujnwvdDa/2ht6IQ5yvOcXqYsljYx1sV1tKc9pKecEr5Chw8INcqHi5
 LBvh9ixQF6gSYz0Qxw/b1aCqym2pCLWTi68wISXhKkqlXr2+hgcyf0bFjPuPVOs8G03E
 6FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZJKNhLRXc9aoEUlg60mpCU3bbdn2u+HfyOeJ90k/g4=;
 b=JQACXmiZewts5ZPH/JDEqUTfNLqgxskEUdMRY3RimD/vZxoDbNnrs+5DQzxhqlhg8Z
 kl27qmcmMNOqlC0PBqJiHnyXZw8rMSkq2KHL3aNqZXPFVXRDFIw0UIryplySsVi2lP9X
 aclvA6DcZHOTvJDOYMjwHna6xzxSOqp4sL+YFvANEY8yJpbAQiv7FQVXjw4j9S+TNbzD
 H/t5bpSygP6fxJbhvJxZBkYql77oMFAuaSFndqXsJOdsIgRnCEId8g1zIf9s2v8khpbz
 1E4vnxXJdy06VWqx570NNVHbW4vSNNu4PMWjGApf6xqU2N6eOXmNCjLLb68oqEO9BveD
 +n6Q==
X-Gm-Message-State: AOAM5326HZ0j8qvtiXyDE/erKw1bVEpE7yxAR/Yhsoyr8J1VyI1HqgZ/
 zZvN5rJK62IpparDj6RQuIXiig==
X-Google-Smtp-Source: ABdhPJwNpTbE4CpOl/WCCXL4tCN0hvpax+mSVBRm8rrn8WDuO4RzuyWynCmDiMQT7zoV4BLcbGV9+g==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr27653085wrv.209.1614779069069; 
 Wed, 03 Mar 2021 05:44:29 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 52/53] drm/vmwgfx/vmwgfx_thp: Add description for
 'vmw_thp_manager's member 'manager'
Date: Wed,  3 Mar 2021 13:43:18 +0000
Message-Id: <20210303134319.3160762-53-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c:21: warning: Function parameter or member 'manager' not described in 'vmw_thp_manager'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-11-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index e8e79de255cf7..eb63cbe64909d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -11,6 +11,7 @@
 /**
  * struct vmw_thp_manager - Range manager implementing huge page alignment
  *
+ * @manager: TTM resource manager.
  * @mm: The underlying range manager. Protected by @lock.
  * @lock: Manager lock.
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
