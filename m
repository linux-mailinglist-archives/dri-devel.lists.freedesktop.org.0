Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A116D50930D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 00:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A428C10E2CD;
	Wed, 20 Apr 2022 22:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2D210E2CD;
 Wed, 20 Apr 2022 22:41:28 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id e128so2371553qkd.7;
 Wed, 20 Apr 2022 15:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SwoMNkAayM1tGtIPzhdqe+GGGbTWcPc9hf6KXEvIQFI=;
 b=UChEwxvVmlgoXQ/dzIfmm8v8hKOVL5+jR55AcJURNhPlKL+BIsf/KSWCDjG/m1eXeZ
 6jjDAdazrGaycUznHOyxrC2wC/ZbfE+aZrdeX9QyQ2QYEghLpWG1riyww47UNcWr85yq
 ikujT3FmqgtzcOwQFmFyMUh8X/r9jQIEJFF4U6WvWXoG0cHbmEPcSQn/QxvHOSXIXlNc
 916QzdTupJB+aL4KVRo0D0qWyxHz/faPCVlUinXns/w+dyi8zZgM3rBdYrvsR2do36an
 BY93qO1qWMscBHcej3upnI3g42pFwfFuah9iLLmWSuzuApnuggGHz2EDLY4kztW3PjNN
 VVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwoMNkAayM1tGtIPzhdqe+GGGbTWcPc9hf6KXEvIQFI=;
 b=d67KZO16KADk2nxBtBfp7cxj03SWoyGhRV38ilzb2I9eeBfe37ldIdTmFnveIEjFhB
 TgS00AAW7fritKS6r/b+CeNSid1XyUJzuAkYMsKGle/+fvx3twjM4HAQbrphn9wDUE5g
 FRH5BPRr9OYQJH6XMTyBT5k/FSaO4r2ATOa8QhRo4kGBnIg/cBiufGAkoKbN9n36tKTw
 uMviTw38aQZuN5jAVn/4RWs7MSsiLnNkZ+223IjTh9fGVPBIcYMQznQ0kwnhjyxyIDB3
 k1E8P0fvyGChTzJJ18mvR0mMPQ14zxIEXAj5Lfu6XeDReFqRsLr4t6rB141t4MrM5MEq
 /HZg==
X-Gm-Message-State: AOAM533SeevN6mbmVK8IJT3Lr74OHwktFoY1FRKXLFzYryqf8psmk4l1
 aTSlaaJ7LqmHtYc4hWH1+oA=
X-Google-Smtp-Source: ABdhPJx+cJj+hjYtc8sD2VNJvWCriKrBX+gkOIJ7TIxfipQHy/mUJXbSZqqrI18/l4r0rk2iFvqyVg==
X-Received: by 2002:a05:620a:1a99:b0:680:f33c:dbd3 with SMTP id
 bl25-20020a05620a1a9900b00680f33cdbd3mr14008035qkb.17.1650494487360; 
 Wed, 20 Apr 2022 15:41:27 -0700 (PDT)
Received: from localhost ([2601:c4:c432:60a:7d5c:9c92:ea6c:f1c8])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a37630a000000b0069ecbe5dd32sm2119311qkb.130.2022.04.20.15.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:41:27 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Yury Norov <yury.norov@gmail.com>, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Chengming Gui <Jack.Gui@amd.com>,
 Darren Powell <darren.powell@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Xiaomeng Hou <Xiaomeng.Hou@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amd/pm: use bitmap_{from,to}_arr32 where appropriate
Date: Wed, 20 Apr 2022 15:41:28 -0700
Message-Id: <20220420224128.911759-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420222530.910125-1-yury.norov@gmail.com>
References: 
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

The smu_v1X_0_set_allowed_mask() uses bitmap_copy() to convert
bitmap to 32-bit array. This may be wrong due to endianness issues.
Fix it by switching to bitmap_{from,to}_arr32.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index b87f550af26b..5f8809f6990d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -781,7 +781,7 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
 		goto failed;
 	}
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					  feature_mask[1], NULL);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index cf09e30bdfe0..747430ce6394 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -730,7 +730,7 @@ int smu_v13_0_set_allowed_mask(struct smu_context *smu)
 	    feature->feature_num < 64)
 		return -EINVAL;
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					      feature_mask[1], NULL);
-- 
2.32.0

