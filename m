Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F944731138
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284BF10E491;
	Thu, 15 Jun 2023 07:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0F510E425
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:41:46 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QgzRp33dRzBQJZS
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 16:41:42 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1686732102; x=1689324103; bh=h+SpAy2nuTWlCvtX2/0Ll4CB5fW
 +IZqeULGpgLetKiY=; b=YPl3IUT3c8A9pD7JjJZRLaCPkv8lYszY6faKW+FkZ+g
 ms5Ugg2d1JtqRgms5GLDz78j02fjR71+ffUdkMOg5ViBvcufuWE8UnE4Hux+xp/G
 UvaUCMbqvtGeeqVlIUdoBnm5dv+a4iWYOYT2IoF7PEECnfWYqmjRqYZ1l5ZkS4tZ
 AQlDW8/YIb1GaL4hfcTTnZVIy06/Z/PIK++DeGdo2xkFGtr4L+uub05RW8iBUycK
 H8zHXwobqTF3FBNjoOcm2sQUpEXD1356ujKasAPtUNNVfsOSUEvTOatw9lgBXZ5+
 36rI+xIG1OBlFC82JI2isD6Lzno2gYDxOD+/xvJzlNw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NhHK4OBPld7E for <dri-devel@lists.freedesktop.org>;
 Wed, 14 Jun 2023 16:41:42 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QgzRn71C3zBJJCt;
 Wed, 14 Jun 2023 16:41:41 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 16:41:41 +0800
From: baomingtong001@208suo.com
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/nvkm/engine/gr/gf100: Remove unneeded semicolon
In-Reply-To: <20230614083928.30151-1-luojianhong@cdjrlc.com>
References: <20230614083928.30151-1-luojianhong@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <a43c84a95c83eb9b049c1d99a092aed3@208suo.com>
X-Sender: baomingtong001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 15 Jun 2023 07:46:51 +0000
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:423:31-32: Unneeded 
semicolon

Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c 
b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..204516891ece 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct 
nvkm_fifo_chan *fifoch,
              return ret;
      } else {
          ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, 
chan->attrib_cb,
-                      &args, sizeof(args));;
+                      &args, sizeof(args));
          if (ret)
              return ret;
      }
