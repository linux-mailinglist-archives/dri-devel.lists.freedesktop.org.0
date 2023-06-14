Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD172F5FD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E5010E407;
	Wed, 14 Jun 2023 07:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1572B10E3FC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 02:27:41 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QgpyP4H04zBJL9x
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 10:19:09 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1686709149; x=1689301150; bh=+bZIMx7NjUairCzhV4yQ6x1V7oV
 wZZngMN1eFmk00jI=; b=EKUbHYNPDGx3udiEz3qTS3JOB9WSB/x8unwPK3kCOav
 /AKVmW4bqqZ09iI0P51CYUTF+MGSEVaQZnnJeUyk8wsOV5mEnqNARDShWEQJylEc
 rzYhZnTAvL2myUBJINnIxKaQRguw8guQQ1wr//RC0PEIh73mhPDUVBD4Joowzt2H
 cPJsUftYu0aAUchVmDwbIu8PTs5N79NTLGMDw71vvGctb7dx+vi3ErOwkyFYQ1BR
 l5m348D7X8kuWP9PWGYwfy8BJe1Hn/pm7I/LAV4uTjhFHHD+nB5b4ezj3MHcZwcI
 PEpnux4nxBLsB6FUAwqd/jVEwN/vJvdX1aBlXJ80Nbg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p779xYHEnG-W for <dri-devel@lists.freedesktop.org>;
 Wed, 14 Jun 2023 10:19:09 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QgpyP0gFczBJL9m;
 Wed, 14 Jun 2023 10:19:09 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 10:19:08 +0800
From: baomingtong001@208suo.com
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com
Subject: [PATCH] drm/amd/pm: remove unneeded variable
In-Reply-To: <20230614021546.39168-1-luojianhong@cdjrlc.com>
References: <20230614021546.39168-1-luojianhong@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <bfca99db848b8d29d0399566e579bc21@208suo.com>
X-Sender: baomingtong001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 14 Jun 2023 07:20:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fix the following coccicheck warning:

drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1657:14-18: Unneeded 
variable: "size".

Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
---
  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c 
b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 275f708db636..c94d825a871b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -1654,7 +1654,7 @@ static int navi10_force_clk_levels(struct 
smu_context *smu,
                     enum smu_clk_type clk_type, uint32_t mask)
  {

-    int ret = 0, size = 0;
+    int ret = 0;
      uint32_t soft_min_level = 0, soft_max_level = 0, min_freq = 0, 
max_freq = 0;

      soft_min_level = mask ? (ffs(mask) - 1) : 0;
@@ -1675,15 +1675,15 @@ static int navi10_force_clk_levels(struct 
smu_context *smu,

          ret = smu_v11_0_get_dpm_freq_by_index(smu, clk_type, 
soft_min_level, &min_freq);
          if (ret)
-            return size;
+            return 0;

          ret = smu_v11_0_get_dpm_freq_by_index(smu, clk_type, 
soft_max_level, &max_freq);
          if (ret)
-            return size;
+            return 0;

          ret = smu_v11_0_set_soft_freq_limited_range(smu, clk_type, 
min_freq, max_freq);
          if (ret)
-            return size;
+            return 0;
          break;
      case SMU_DCEFCLK:
          dev_info(smu->adev->dev,"Setting DCEFCLK min/max dpm level is 
not supported!\n");
@@ -1693,7 +1693,7 @@ static int navi10_force_clk_levels(struct 
smu_context *smu,
          break;
      }

-    return size;
+    return 0;
  }

  static int navi10_populate_umd_state_clk(struct smu_context *smu)
