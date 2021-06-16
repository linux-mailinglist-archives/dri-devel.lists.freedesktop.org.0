Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72693AADD3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 09:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003AC6E88E;
	Thu, 17 Jun 2021 07:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jun 2021 22:58:00 UTC
Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA286E846
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 22:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1623884281; x=1655420281;
 h=mime-version:from:date:message-id:subject:to;
 bh=rlua6TfeeN2sXJkC8s+D5ALLnhCcNCnD/0D2Hh1jRcE=;
 b=W/xOvHlpJNCZwiOlPrznn9UTDmEBP+4H0JTIE1eHtwXyjELMRay4hoiD
 XPtIfonF/Mb0zPmthx/KMhzsuYin7lC6po596fHw0EVWQwS1hK0vzReM5
 eIJ8QnvO621zbk5tbPhgH18na36Jz35RQFBBUR7Ax1/bUZTpSHQGjX4Di
 jPrS+Pi4stmiDymuugx9gE7SDsahCnwhimkOTXavraJym+Gwe8Y/d6yw7
 4HzSg+87BEW49Ocra7MtoKEde/d2UFdZW+cayaytDv45FzZG1rTMHFhVq
 BXydFO1/qdJiKkrKRlGpcbgjFBJU1dHBrI5k4JYToHXC1VwTDJxPV4+Iz g==;
IronPort-SDR: 63eYUgg771qSXDmd24wjKJtCBFdVGkt88YqNFd3E7XyApeXIV49LcU+1jBeFgxu0ryN4iE1Dfk
 hKyAQXuietj+j4tIEVAUsANopF44Q+Be+DOuAOJBXpASaPz1oGFketaBNZ5yMNUayYwmny0n7s
 5lA8w5KkhHTwcFQDSagREb1jV3QycjnbJ4MpG5QGy3gNLHZkviFfh5P3wX7/5x3lSSHiydl1Kd
 4LunY1QbLSFZ+72M7Ljb3YJIIHkv6/hO+jQpQZrYED+226ZF+g+BVrF9E4x2knYjBYEHkhVxyx
 k2U=
X-IPAS-Result: =?us-ascii?q?A2GDAgA+f8pgf0XYVdFagQmBV4N4bIRIlSkBmCWBfAIJA?=
 =?us-ascii?q?QEBD0EEAQGHPQIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBAQEBAQEFBAEBAhABA?=
 =?us-ascii?q?W6FL0aCOCkBhAURBHgPAiYCJBIBBQEiARIihVcFmFOBBD2LMn8zgQGIFQEJD?=
 =?us-ascii?q?YFiEn4qhwmCZ4QhgimBS4I3dIdbgmQEgxwBehODdgEBAZAsjg6cZAEGAoMEH?=
 =?us-ascii?q?J15K6VrAS2VKaRTECOBMYIVMxolfwZngUtQGQ6dDSQvOAIGCgEBAwmJUQEB?=
IronPort-PHdr: A9a23:TGojQRYYrvYt4ttd1q2bnTH/LTGz0IqcDmcuAnoPtbtCf+yZ8oj4O
 wSHvLMx1Q6PBt+KoKMUw8Pt8InYEVQa5piAtH1QOLdtbDQizfssogo7HcSeAlf6JvO5JwYzH
 cBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBBr/KRB1JuPoEYLOksi7ze+/94DXbglSijexf7d/I
 BqyoAjSq8IbnZZsJqEtxxXTv3BGYf5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ
 7NYCi8mM30u683wqRbDVwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4
 rx1QxH0ligIKz858HnWisNuiqJbvAmhrAF7z4LNfY2ZKOZycqbbcNgHR2ROQ9xRWjRODY28Y
 YUBDPcPM/hEoITmu1sCsQGzCRWwCO/zyDJFgGL9060g0+QmFAHLxA4vH9MPsXTUsdX1M7oZX
 uO1zKbSzDXIcvRb2Df86YjIaB8hoO2AUa5+fMfK1EkgCxnFgk+OpoP4IjOYz+IAuHWU4OR8T
 +ygkXInqx1vrTi1wMchkojEi4YIx13a+yt3zps4KMC4RkJlfNKoDp9duzybOoV5QM4vTH9kt
 SckxrACpZK2cjQGxZYpyRLCZfGKb4yF7xzlWe2MIjl4nGpodKyjixu260Stye3xWtOq3FpXr
 ydJiNjBu3QL2hfO8MaIUOF98V2k2TuX0gDT7fxLLl4smKrALp4h3qYwlp0OsUTfBiP2mFv5j
 KuRdkg8/+in8eXnYrH/qp+ENY94lxjyMqovl8G7G+g4PQ8OX2+U+eS4yrLv51H2QLJPjvEuk
 6nZto7VJdgDq6KnHwNY1pwv5hW/Aju8ztgUgHgKIEhEdR+Dl4TpPkvBIPH8DfexmVSslzJry
 ujGP7zgApXCNHnDnKv9cbtz8ENc1RY8zcpF651KF74BPer/WlXtu9zAEh85Lwu0zv76B9Vn1
 4MSQH+ADbGHMKzMtV+F/eYvI+iXZI8JozbxMfYl5+TwgnAnhFASY7Kp3ZgLaHC/BvRqOUKZY
 WDjgoRJLWBftBE9QePlk3WYXDJTbmr0VKU5onkXAZynAc/qR5qpgbHJiC66BJlXa2xuDlGKD
 GeudojSH78gYSSTL8sprDEYSbW7A9st3BevuQvSxbR4Ku6S8S1O8drvztkw6+DNmBUa8T1vE
 9/b3XuAQm15hWAUQCdw27pw5QR7zUqd3KFlq/hZDsBIof1TXwo2OIXf0+tiTdfoVUaJetaPV
 UbjQdi8Bzw1Zsw+zsVIYEtnHdimyBfZ0HmEGbgQwo2KFpwp9eru33Hwb5Js2XbP1fF51HE7S
 dEJOGG70P0svzPPDpLExh3K352hcr4RiWuUrD/r8A==
IronPort-HdrOrdr: A9a23:noPwJ6sIqus6jHUM6M+XZI637skDf9V00zEX/kB9WHVpm62j5q
 eTdZsgpHzJYVoqOE3I+urgBEDjewK/yXcd2+B4VotKNzOW3VdAQrsSibcKAAeMJ8Q9zIRgPG
 tbHJSWweedY2RHsQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="222916930"
Received: from mail-pj1-f69.google.com ([209.85.216.69])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2021 15:50:53 -0700
Received: by mail-pj1-f69.google.com with SMTP id
 o11-20020a17090a420bb029016eed2aa304so2455178pjg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 15:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W8sgVYgsWMdUE1wHeIEoHud9eQP11SIxXPuwjP87UZw=;
 b=leT0q9IYoi4VDovWArcvjTeGivPJ2x2TFsYnyPawSW0SX7YpDAUfUuP+40jiWHfW+U
 zlUtsi8iuhD0dl9NpkNDCuGPIPdZ7c7QOr3Rc9c3Y6CFtEWoiFg5HNJAHRUp5DS4xzib
 ywvGb42rhIcc6UQSxSo464ldSVIpeiURxDYmRa2yzs6oY+puBpxMK38DUjUkfIEf5Z09
 vBNK7VcbhYKz4r/3FI/lrEPvYdE0z1nTdilRmTqNxhLk4Q6Wjrh+0svQFujIimSa+n4S
 edJKDVjBH5vFfUbb/dvQodvxTzMKMktpDxMwiyATVr3gffw0nUprMKPH3pxEOrWIF40J
 6rfA==
X-Gm-Message-State: AOAM530eEvoP83Z/G04URFEoU552I13cUclZfENbKO7kpqoKzfxKsv8I
 ip3r0I5cawLnPgqZuKw7iMnBVi4SKLNKVieidfIcql4u2ehxiSNTbzOQsU6PlY3egZVuKUMqr4a
 LuUYA1IcGnt5ro4dxXQai07gM7VRgv8Xe0VDyBlkIN2oWig==
X-Received: by 2002:a17:90a:d516:: with SMTP id
 t22mr2289224pju.144.1623883852492; 
 Wed, 16 Jun 2021 15:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpBspB9QJdH+f58DOOAFndNmFeCe7X2gL2GM2hO1VVOXQa23XnJmXHTZeZxwy2XrHghuDEEc/1KtDqeJG9FZY=
X-Received: by 2002:a17:90a:d516:: with SMTP id
 t22mr2289201pju.144.1623883852186; 
 Wed, 16 Jun 2021 15:50:52 -0700 (PDT)
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Wed, 16 Jun 2021 15:50:41 -0700
Message-ID: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
Subject: [PATCH] drm/nouveau/core: fix the uninitialized use in
 nvkm_ioctl_map()
To: bskeggs@redhat.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Jun 2021 07:39:18 +0000
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

In function nvkm_ioctl_map(), the variable "type" could be
uninitialized if "nvkm_object_map()" returns error code,
however, it does not check the return value and directly
use the "type" in the if statement, which is potentially
unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index d777df5a64e6..7f2e8482f167 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
                ret = nvkm_object_map(object, data, size, &type,
                                      &args->v0.handle,
                                      &args->v0.length);
+               if (ret)
+                       return ret;
                if (type == NVKM_OBJECT_MAP_IO)
                        args->v0.type = NVIF_IOCTL_MAP_V0_IO;
                else
-- 
2.17.1
