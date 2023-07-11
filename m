Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2174E51B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 05:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F28710E2F0;
	Tue, 11 Jul 2023 03:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C087010E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 03:06:22 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0QkM2j3YzBHXhl
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:06:19 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689044779; x=1691636780; bh=QBdEWxSyVtId7m0paN26voaUrdc
 kwm/MDxNS7wzdr8U=; b=mdGdqFnPzD//6oTkoilVK3oKhtYb7KO2o7chsUkv3oU
 Mmk/j06z13AAGnJy/+nv0eARhht87DNulCqabGFew+KUX9lybDIm+9mRacgMJp5b
 H9XNLKqAdLX64EhS0Z27gSa1yOgkOq33EHvJ2BX8QWAN8Xp4S9OysI6E58e3BCdU
 yLL+QvCgN4b5FqsjYDQtd81xotfHVQmUI0WlhbyCz0XD0hn7uut1Y6yYDYygaPpt
 eBFSoqT06Xx1SNtZlkBxQC0dRzHpmxnb6rEf4pf3VLvXyovBTUTr49zFUS32qMfI
 wfr9b0+LNFI9i82vi2710CTLx/IeaUjkAr9W2ReWSug==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gWBFpblyHV_I for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 11:06:19 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0QkM07bCzBHXhc;
 Tue, 11 Jul 2023 11:06:18 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 11:06:18 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/clk: add missing spaces after ','
In-Reply-To: <20230711030447.78738-1-xujianghui@cdjrlc.com>
References: <20230711030447.78738-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <7d1d072719222e908323deb61cbbc25d@208suo.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing spaces to clear checkpatch errors.

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/clk/seq.h | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/seq.h 
b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/seq.h
index e4b362d3449b..67c7b3e495fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/seq.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/seq.h
@@ -3,13 +3,13 @@
  #define __NVKM_CLK_SEQ_H__
  #include <subdev/bus/hwsq.h>

-#define clk_init(s,p)       hwsq_init(&(s)->base, (p))
-#define clk_exec(s,e)       hwsq_exec(&(s)->base, (e))
-#define clk_have(s,r)       ((s)->r_##r.addr != 0x000000)
-#define clk_rd32(s,r)       hwsq_rd32(&(s)->base, &(s)->r_##r)
-#define clk_wr32(s,r,d)     hwsq_wr32(&(s)->base, &(s)->r_##r, (d))
-#define clk_mask(s,r,m,d)   hwsq_mask(&(s)->base, &(s)->r_##r, (m), 
(d))
-#define clk_setf(s,f,d)     hwsq_setf(&(s)->base, (f), (d))
-#define clk_wait(s,f,d)     hwsq_wait(&(s)->base, (f), (d))
-#define clk_nsec(s,n)       hwsq_nsec(&(s)->base, (n))
+#define clk_init(s, p)       hwsq_init(&(s)->base, (p))
+#define clk_exec(s, e)       hwsq_exec(&(s)->base, (e))
+#define clk_have(s, r)       ((s)->r_##r.addr != 0x000000)
+#define clk_rd32(s, r)       hwsq_rd32(&(s)->base, &(s)->r_##r)
+#define clk_wr32(s, r, d)     hwsq_wr32(&(s)->base, &(s)->r_##r, (d))
+#define clk_mask(s, r, m, d)   hwsq_mask(&(s)->base, &(s)->r_##r, (m), 
(d))
+#define clk_setf(s, f, d)     hwsq_setf(&(s)->base, (f), (d))
+#define clk_wait(s, f, d)     hwsq_wait(&(s)->base, (f), (d))
+#define clk_nsec(s, n)       hwsq_nsec(&(s)->base, (n))
  #endif
