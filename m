Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35575EE8B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4F10E128;
	Mon, 24 Jul 2023 08:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3BC10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:57:25 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8YvR3SXgzBRx5T
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 16:57:23 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690189043; x=1692781044; bh=xivezc9+8JHiL00mjjAuXmu9/dh
 6CnD4VSummcQwwCI=; b=Ya+vjcJtXItCFpr45KLzkeaU+9IEOl4dqQIscZkT2BN
 IOeCP3LYrQMCJKAIWx8oW5VBQ7v1lvsgK1fnQiGuWiBzGXKeQUqQciq4VVN6DYfi
 56XEvCmQzECasKhXPbSl81WFItw0MDq5e3n3y12FlFxfqxDn7PrTqX4Kh8qnZJTz
 I3xxYrU+lJzo6TpVfOaQhpMasLmbJ+EDJNYCpcSdfFM42wkSMCFUXZU95QUWWdbA
 JZ76S4ZkA8+d/k3fJpTW9wAig3OHSwnVtbcQ9nUwbHmWy6OAYPt/vHmTkAZw9GKF
 t+860evOWu8dTk5Ev3sXra3I8zmpD/OTM6UgcVskbLA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EAD5tF3fj7Ma for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 16:57:23 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8YvR182NzBKnld;
 Mon, 24 Jul 2023 16:57:23 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 16:57:23 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_1_pmfw.h
In-Reply-To: <20230724083344.9285-1-xujianghui@cdjrlc.com>
References: <20230724083344.9285-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <7e638628f942fe7989fe2da3da537c28@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: trailing whitespace

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h 
b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
index c5e26d619bf0..8ec588248aac 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
@@ -30,7 +30,7 @@

  #define ENABLE_DEBUG_FEATURES

-// Firmware features
+// Firmware features
  // Feature Control Defines
  #define FEATURE_CCLK_DPM_BIT                 0
  #define FEATURE_FAN_CONTROLLER_BIT           1
@@ -92,7 +92,7 @@
  #define FEATURE_ZSTATES_ECO_BIT             57
  #define FEATURE_CC6_BIT                     58
  #define FEATURE_DS_UMCCLK_BIT               59
-#define FEATURE_DS_HSPCLK_BIT               60
+#define FEATURE_DS_HSPCLK_BIT               60
  #define NUM_FEATURES                        61

  typedef struct {
