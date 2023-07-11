Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C174E695
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 07:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B73110E2FB;
	Tue, 11 Jul 2023 05:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F4C10E2FB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 05:54:59 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0VSv4jgXzBHXhk
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:54:55 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689054895; x=1691646896; bh=aOK/vrvHGfxYdmaAFZxDnwb5Czx
 72k5Aa/iRkuEQeqU=; b=iTEWhZ6tMGIEqDb4mhgQ29Lun6USjSVBcIOwBvbgExI
 WvhUHZTQThMy1zg3m69nCieYDRJoRr0nyYvi0liW/gxApwjhhidQ7y/UMgybYiJ4
 vHqIYWA2HmDm/XzxqdQLRgBvJJOzrHH+I8WujuVurblPT7FiqioNE0TD0GPhGB78
 r68MkmmEswb9oErbwnxooA9B8fr1RHEGQLPZwfhkxZB66696Ik1rHeoOTrBTL8gR
 cFrAoPZVRvplcIkX7KM5bqDPRohUtWcPmBZNdH7teLy/S5SY0uvi9RXsRHkaaWlt
 IE68cihlAti/VaGVhHxcHoZgiQqx4onSeMEQSrcuJ1w==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id G7bPEsMh-TKN for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 13:54:55 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0VSv1lnQzBHXgj;
 Tue, 11 Jul 2023 13:54:55 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 13:54:55 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/flcn/cmdq: Move assignment outside if condition
In-Reply-To: <20230711055304.79441-1-xujianghui@cdjrlc.com>
References: <20230711055304.79441-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <f5b217c2420c2948bd402e8e36e391a3@208suo.com>
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

Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c 
b/drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c
index 211ebe7afac6..a8beb55097a6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c
@@ -203,7 +203,8 @@ nvkm_falcon_cmdq_new(struct nvkm_falcon_qmgr *qmgr, 
const char *name,
  {
      struct nvkm_falcon_cmdq *cmdq = *pcmdq;

-    if (!(cmdq = *pcmdq = kzalloc(sizeof(*cmdq), GFP_KERNEL)))
+    cmdq = *pcmdq = kzalloc(sizeof(*cmdq), GFP_KERNEL);
+    if (!cmdq)
          return -ENOMEM;

      cmdq->qmgr = qmgr;
