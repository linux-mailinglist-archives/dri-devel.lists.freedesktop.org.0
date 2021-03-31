Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7734FD14
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC24689E1B;
	Wed, 31 Mar 2021 09:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C0989BCD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:38:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j9so17253502wrx.12
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MS4CaVmMtbIPp7cqdgSUMxa1bsD/Nbt1AW9VPn+S2aU=;
 b=EKBQyr4Dvxz1bKTd6WAdcei0ZWr+lZ+PnE4V7XzYmlC3N3FND1X5j4jHx4NzdxaCx4
 OMuqOJaeuxtfTmA/RFy9cawQC1o3kuGTh39qKCU01XxL6RaoTt/yxbDnrGXq7psavGWB
 7RnFf/Vd5OyldZTkvqabGz1HyOlgEfp+0e2TMDzzPykVIIwSzcSyrBLcRzzq1B6QUXBF
 p/sAOMDadckEzGpIAiHTJSkGVRkhce4xbgR6r3/5qgr79k6DVsmw3jCPaB/StzzLxjI3
 h82rHk+3T2DWC8X6NFh5tu47p8i9erabfEjUwDMjG4R1on8GqgF8FrBO67UeFJJe4rm/
 cBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MS4CaVmMtbIPp7cqdgSUMxa1bsD/Nbt1AW9VPn+S2aU=;
 b=Di7yrI9PrBRdDPUocno0cCpi033aLAeQwU/1i9K5YBSOAbUHtYkOS5WLu+CDfKG1L6
 EFQvCTws1az9kqFq21+Gekqkv5orajpJSd5pLDA0RaEnXEp8o2gUHaWm9fuNCAkTIyVc
 l1KNipRUde57pO4mPYXO4WLfFrguFlZyqKd2kkhKD0UQtwUQ0XNLpaRsoQs/gzid8iqu
 lu+izWVbLVNxWF5MvFgxfbXNLeVy208U0fexepeYzaBez9b0idKlPWOaMGpZ45+qnCez
 Psn/FsMAVbGfOx7jgTi8E8pva+HSJpIH7TZ8jxt8mAX9p8ShktSeE2DNZYFc1Y4mbm9o
 EAOQ==
X-Gm-Message-State: AOAM532BTdN5job6jsdFo5i2onv6nV2rFkwkTZ6HmIISCLvB22YhnFU1
 PUs6vUrJjHWqQPzPrBllCrk=
X-Google-Smtp-Source: ABdhPJwdTeJ6ogIW47OEWn/TQt/izToKtttxYt6HIpd/SM54sZTmgifRBGXXDB537+8YlJIsCOKbeg==
X-Received: by 2002:a5d:468e:: with SMTP id u14mr2595415wrq.359.1617183511292; 
 Wed, 31 Mar 2021 02:38:31 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id n8sm3037594wrm.70.2021.03.31.02.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:38:30 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v1 0/1] Fixes 30e2ae943c26 "drm/bridge: Introduce LT8912B DSI
 to HDMI
Date: Wed, 31 Mar 2021 11:38:21 +0200
Message-Id: <20210331093822.251839-1-adrien.grassein@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch fixes issues found by a static checker.

Thanks,

Adrien Grassein (1):
  drm/bridge: lt8912b: Fix issues found during static analysis

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
