Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5C07025E9
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE410E140;
	Mon, 15 May 2023 07:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C8E10E0C2;
 Fri, 12 May 2023 19:26:21 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-52c30fa5271so5450870a12.0; 
 Fri, 12 May 2023 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683919581; x=1686511581;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yz4DYKSNmBeEVN5VVceILj1aZ1bLp7+YNm7+Yoele00=;
 b=GdGO7tJ4IIUXweKlz+dCEQNC4Jf9giqrZ6IQWsiG1yctoFoJUmWBZf1pDY+NSPN5EF
 8QHk5X08ZDhLvo1aTU9OeDLX7TNJt7TYJiZn3Ddz38fWq//zCdSzINTj/mdDUd0ryo43
 kpyAnVNpeI6uFrEAFnQkIrmNluVRMi8FDSTuho8UK8nD02zBM1GLG78rAVDqdqzhvlBj
 TTlB554DoFhi6MzAJYNLUUDhY9H6/IoYnPKa1GwkYcZteDq0Ae0iVRqpkkyOLY2cYk1c
 hjH8FdKRI9UuLEhJPsWUzT/CmUi0ThL8rox40SCNkRv4N87OV8bbNKARNFVU0A3Mb77a
 lllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683919581; x=1686511581;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yz4DYKSNmBeEVN5VVceILj1aZ1bLp7+YNm7+Yoele00=;
 b=aeQxa2rhLCi0MeilFmzS22KVBxSvpfhXC01Zl0kBeKdFpwpT+a5vl3YVE+eHjhCbm4
 ZZ/3fEd1KsQa3fC+g09HDWKd0VXTFA1bxstR5MUkQJ13jEBoIIhg2v8KzD1wkGEnb91T
 Yg9EMXdSrM4zzBK0LreEtA0gKo4Ed3TCMHuA14jaYSlooZAtZTRA4YqNHhecp1qdiTcI
 7OIBg/AKUb4QuyBTDWx0COVLXK0oFte+yzx9dz8G7z1470lMOm16uYjfXdmnE87yyTQQ
 6u7gTF6LetIe5TDTlbuL6zfqiSjVSPToEmJ4Pjav3+vwLnEtCK7DcZVmNStRkm06VwN2
 QnhQ==
X-Gm-Message-State: AC+VfDyPxqJGMP3SloeXuDPFLBr4IKnLkJBkYfA3FZfYK1XK0xYFKmvs
 SB8XTfR5x5zyPuFzQ3XJKkY=
X-Google-Smtp-Source: ACHHUZ4oAT/GxHasWc1+hnu5yWxpHeEJ05uQYZwgtlcpevP5ZF9ks5XZ87fIDTRvaTXgidAuos4Pww==
X-Received: by 2002:a17:902:e54b:b0:1ac:712d:2032 with SMTP id
 n11-20020a170902e54b00b001ac712d2032mr25367398plf.50.1683919580676; 
 Fri, 12 May 2023 12:26:20 -0700 (PDT)
Received: from yoga ([2400:1f00:13:5d8c:29b4:3ace:81ca:10f])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a63f701000000b0051b8172fa68sm7171336pgh.38.2023.05.12.12.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 12:26:20 -0700 (PDT)
Date: Sat, 13 May 2023 00:56:13 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: nouveau: nvkm: engine: gr: Remove Unneeded semicolon
Message-ID: <ZF6S1bg2AzuBjhxW@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 15 May 2023 07:18:38 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the extra semicolon at end. Issue identified using
semicolon.cocci Coccinelle semantic patch.
Warning:
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:423:31-32: Unneeded semicolon

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..204516891ece 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
 			return ret;
 	} else {
 		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb,
-				      &args, sizeof(args));;
+				      &args, sizeof(args));
 		if (ret)
 			return ret;
 	}
-- 
2.34.1

