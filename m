Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06D75EA36
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 05:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBAD10E270;
	Mon, 24 Jul 2023 03:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BBD10E270
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 03:44:59 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8Qyx2ZQQzBRYmS
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 11:44:57 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690170297; x=1692762298; bh=oL5acEfGsFlngl49HUHQFfFGsTM
 P1vCTZkBz9qSCsgY=; b=m+Xbz7a7XQTLcRbDOpqCkZbCy8jFeiQkoqm5PLPfV26
 xhUJLAdsKt1to4pr7oKYKeuROeIPaTif3w6lblH08p5Jb/UQ1F7I9Z1d/8dtrRB/
 ve8SWE06hjuuAH8banfCOHIfiDsOicbgsQl0xqYNrdw0IYPbRXgMG7g4vjVdfsLE
 +MZ+xV8Pj0VM6EVsS7d49gV79yZbsj5sgpKSUHwQM/F2LSbN+foSARRM/xDQJRJw
 wLVcvMCY46HY5AoUCshbb+gfdP9p5RcxTsDHKOeN6p/q/wGW8b0yP+8NLIRP01Qi
 QP10L4/8sAL7s+qQJ8L/MYRYJ9jmRcBz2Vespy/Abzw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JKOBdqdAarW1 for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 11:44:57 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8Qyx0JfLzBJTF7;
 Mon, 24 Jul 2023 11:44:57 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 11:44:56 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: Move assignment outside if condition
In-Reply-To: <20230724034415.8257-1-xujianghui@cdjrlc.com>
References: <20230724034415.8257-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <304e90636af5cb6843ae603cd973680f@208suo.com>
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

Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/radeon_legacy_tv.c | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_legacy_tv.c 
b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
index 12e180b119ac..7883e9ec0bae 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_tv.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
@@ -724,12 +724,14 @@ void radeon_legacy_tv_mode_set(struct drm_encoder 
*encoder,
  	}

  	for (i = 0; i < MAX_H_CODE_TIMING_LEN; i++) {
-		if ((tv_dac->tv.h_code_timing[i] = hor_timing[i]) == 0)
+		tv_dac->tv.h_code_timing[i] = hor_timing[i];
+		if (tv_dac->tv.h_code_timing[i] == 0)
  			break;
  	}

  	for (i = 0; i < MAX_V_CODE_TIMING_LEN; i++) {
-		if ((tv_dac->tv.v_code_timing[i] = vert_timing[i]) == 0)
+		tv_dac->tv.v_code_timing[i] = vert_timing[i];
+		if (tv_dac->tv.v_code_timing[i] == 0)
  			break;
  	}
