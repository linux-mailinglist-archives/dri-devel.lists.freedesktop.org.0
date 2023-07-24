Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D675EDB8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2C10E287;
	Mon, 24 Jul 2023 08:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CA510E286
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:34:46 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8YPH6P7PzBRx5M
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 16:34:43 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690187683; x=1692779684; bh=xivezc9+8JHiL00mjjAuXmu9/dh
 6CnD4VSummcQwwCI=; b=oWaxq45Ozhy0XRIkwsph6ljsedBLPbXkY+NRRSkVFKn
 pGajiMAgayA4DV00tcw6V5clYeTsa3Ykd6DTbajnm1UDDxRRABwdk0D2ScUnVas5
 y5iFjuQcf0Xt3SUBardnqmDWZLfgpWg2EGGpmojPmBkeet8l1dJL7aoo6iY2tcr0
 DJsE8ofwcGrSIs+DcrsfSJ40ktsvCR55NPFblEg2PCRvsd8CDzTS6RDWNpwNBxxd
 RYOHO4qykFKSyEc/9Qo/inAvqSUvWBJ4/wuOSsysNznk9wkg/HDp/ZjAX5qugYcp
 SisL4sERndhJxlskaCvk3DCO2mIa6FibhYW+6kx896A==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HH4lrdkF6aJW for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 16:34:43 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8YPH40vFzBR1P0;
 Mon, 24 Jul 2023 16:34:43 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 16:34:43 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in
 smu11_driver_if_sienna_cichlid.h
In-Reply-To: <20230724083344.9285-1-xujianghui@cdjrlc.com>
References: <20230724083344.9285-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <8e6eda082855e1b928253669fbb49316@208suo.com>
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
