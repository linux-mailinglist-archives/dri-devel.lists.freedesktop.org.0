Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7877532CB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B10510E7D7;
	Fri, 14 Jul 2023 07:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4D810E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:32:36 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2H9F432bzBRSVq
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:32:33 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689305553; x=1691897554; bh=AuYDgHFbLdSKDR3AAWF4AJBZRCt
 ktO5bYp21CycLwUE=; b=McsvLIXk3Bq/oQFGBcT9NxaV4fR5oNcfADN/MOcZkf/
 7jpZKdjDofruNkcpeo92d+oQXZ7Eqh+ne6aO2bHucugCK7iFs22Ht0l/nYXpjq6A
 ZsT2PHkcBSQjDtn/38q1M912cIvvZcAzBHQn7tJcDMPtau0I2ibpnrNlf5qSV5dS
 K6gH7cfK5IKmWSj2Otq3ChNYX8YBUBdhqKQxjgpcgohP1knRP7tXFkwPh7LL4OlA
 CwNOHQf+ENhj4wtDL2ezdM9Gk2qWM155lk/fbAFjkDOfAJHUTLHhLHxvMWGdeYUQ
 QouhNLwLPdouWJD9KyE/FiYmd8JeSm1RAAp06ste8qQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id s31Krnf1wb4h for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 11:32:33 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2H9D5yklzBHXhS;
 Fri, 14 Jul 2023 11:32:32 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 11:32:32 +0800
From: shijie001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH] drm/radeon: ERROR: spaces required around that '+=' (ctx:VxV)
In-Reply-To: <tencent_90453D41C9A3FB57DCCA60655D9218D1870A@qq.com>
References: <tencent_90453D41C9A3FB57DCCA60655D9218D1870A@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <97d2ba38071e5c650894c01a56a2533a@208suo.com>
X-Sender: shijie001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 14 Jul 2023 07:14:54 +0000
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

Fix two occurrences of the checkpatch.pl error:
ERROR: spaces required around that '+=' (ctx:VxV)

Signed-off-by: Jie Shi <shijie001@208suo.com>
---
  drivers/gpu/drm/radeon/r100.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r100.c 
b/drivers/gpu/drm/radeon/r100.c
index affa9e0309b2..2f0470f927f1 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -1327,7 +1327,7 @@ int r100_packet3_load_vbpntr(struct 
radeon_cs_parser *p,
          return -EINVAL;
      }
      track->num_arrays = c;
-    for (i = 0; i < (c - 1); i+=2, idx+=3) {
+    for (i = 0; i < (c - 1); i += 2, idx += 3) {
          r = radeon_cs_packet_next_reloc(p, &reloc, 0);
          if (r) {
              DRM_ERROR("No reloc for packet3 %d\n",
