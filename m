Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9E74D290
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 12:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A62910E253;
	Mon, 10 Jul 2023 10:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5597610E257
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 10:01:29 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzzzp2hFZzBHXhF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 18:01:26 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688983286; x=1691575287; bh=PyOOJASrvDlFlpTMrbZnhxWUxwu
 x8onceApx5EockGo=; b=erAgk2mFDIezBF+ARrjyQVU3ouCxKIfFIiChEU88QYf
 Kvx5taEKHPBLhYHe4bF6RfGlzavTrMiXHRV2RiBE67e1gRxTBu2YWS3Umwj5A6+0
 3JrTxDbF4rBwkZNeQA3cCGMFozfjG1X3i+Hdo46+1mkxF9ZiQsKvDh5L5T+JZPFy
 BX++ULdYv3YGFzrcG5YnCDX+dFQbX/+uf1DajfYYtCgydwjhCvbAB5ivAjzNgzVa
 3b3FfMFenBuEAaBc3b1Gj+tAyjWpVGmR0HxchPFcw7jjQarHYEnysqHmBXKJmywC
 EoNGK27XH3MRddWec17UCYlf5G8cKXRKIGqIsvbpEKQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id C4-pfWJoU4jf for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 18:01:26 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzzzp0lMvzBHXhC;
 Mon, 10 Jul 2023 18:01:26 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 18:01:26 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/iccsense: do not use assignment in if condition
In-Reply-To: <20230710095957.77430-1-xujianghui@cdjrlc.com>
References: <20230710095957.77430-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <7e2e8f69f6faf6a7bb8ecb65c8933f22@208suo.com>
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

checkpatch.pl does not like assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 8f0ccd3664eb..2428f3d6e477 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -322,7 +322,8 @@ int
  nvkm_iccsense_new_(struct nvkm_device *device, enum nvkm_subdev_type 
type, int inst,
             struct nvkm_iccsense **iccsense)
  {
-    if (!(*iccsense = kzalloc(sizeof(**iccsense), GFP_KERNEL)))
+    *iccsense = kzalloc(sizeof(**iccsense), GFP_KERNEL);
+    if (!*iccsense)
          return -ENOMEM;
      INIT_LIST_HEAD(&(*iccsense)->sensors);
      INIT_LIST_HEAD(&(*iccsense)->rails);
