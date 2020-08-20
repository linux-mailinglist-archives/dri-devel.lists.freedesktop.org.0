Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB124CEA7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD506EAA8;
	Fri, 21 Aug 2020 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED626E9A3;
 Thu, 20 Aug 2020 17:58:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so2937956wrc.7;
 Thu, 20 Aug 2020 10:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFwgKY8M1YvMdF6A1MZQr5OX450yZVwCd9DoRqj8Oac=;
 b=gEdI/VorowmVYUmYIAgIJvT3GOEKZl+dMBWPHxFGafXrGNuusg1aHNcprr/9GpKUfb
 iAwi3wzEXEL5V+isGkdNfHkBwsZB87GNq52EY8vm1ICS84jMS+66QIttaB13wrHGyXTi
 vGPDVdiHXnESt3QYl3SQ3XOhoj7yd4EFtQkXSeUJmYlINRtnjSIWrnX4hiat3SbG6JYL
 V4TRAydcp5SQazAhY1kBahWw9dC3Y+QcW3cOlC/4iAr7w6rU2Pu51mgg6gRpHN8hdxJv
 7i3UVNDVp7tGOiXbW0lYqqqujYbpuwGLUyQ8dklG0mEfklFVpGjg7tDWzEcB0eWCtUYp
 MqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFwgKY8M1YvMdF6A1MZQr5OX450yZVwCd9DoRqj8Oac=;
 b=RU8MGP7JTkowsDloemXNuomuhssJwqACz4U031fUCfiNQpgYHTrIojV0MrnqpwC2J8
 kPcaGUkxHouXgqBF2a0F74MzOz6RpufDbPPyVvvo5T3m1pmn+IzO8dXSSba0QyYVVSdY
 yV000seUtjTImFubNY6fxm/m4gqcBCOXvTN9LW4UfIO8aLVtv7AfGgyEFXisJn7VL1qK
 xInjQuC+BzSioPm6fhOPDDDKmgFzUgpOlk1RWo1fEjOlsxNfHSUB/9v49JK78qLdTjjX
 D38mxnDHrVCMA6dEMiDab31lifDLNvVUoDdWOLqBeTqrunQxPN/P0eo33KQiKmP9KTmV
 G78w==
X-Gm-Message-State: AOAM532WzsUXab1feNWF7vjSaXgEg4TQeDcKZZPLnXMyJmREFOvg+KrW
 vrq8Lac5lWWGB6gejKY6/Bf670nbNZ2XsGxX
X-Google-Smtp-Source: ABdhPJyXW1lTfOHjnE0/ltL1g8SVD1FVRSMs7m5WVolWWiwAdcucLZtfJ4XvHtosDOlMEyjYgHbdQA==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr4183128wrq.131.1597946325161; 
 Thu, 20 Aug 2020 10:58:45 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id g8sm5513496wme.13.2020.08.20.10.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 10:58:44 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Alex Dewar <alex.dewar90@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/pm: Remove unnecessary cast
Date: Thu, 20 Aug 2020 18:58:06 +0100
Message-Id: <20200820175809.841479-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In init_powerplay_table_information() the value returned from kmalloc()
is cast unnecessarily. Remove cast.

Issue identified with Coccinelle.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
index 195d8539fbb4..740e2fc7a034 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
@@ -252,7 +252,7 @@ static int init_powerplay_table_information(
 	phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_max, powerplay_table->PowerSavingClockMax, ATOM_VEGA12_PPCLOCK_COUNT);
 	phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_min, powerplay_table->PowerSavingClockMin, ATOM_VEGA12_PPCLOCK_COUNT);
 
-	pptable_information->smc_pptable = (PPTable_t *)kmalloc(sizeof(PPTable_t), GFP_KERNEL);
+	pptable_information->smc_pptable = kmalloc(sizeof(PPTable_t), GFP_KERNEL);
 	if (pptable_information->smc_pptable == NULL)
 		return -ENOMEM;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
