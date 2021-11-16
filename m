Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D1452B4D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3306E095;
	Tue, 16 Nov 2021 07:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx6.ucr.edu (mx.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809266E095
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1637046442; x=1668582442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VO2ps4lqNewVdq22Zvj/a2S0OmORg6rzuJt+A60klUs=;
 b=Xj5s8ElpCbqkAiHT64SVQJkOPdj+Uuq5xPld6F3CxB+NaYlwu4AKYTAL
 2sLooWDwcMqC6nWLcBajyspGLuile3sh4dZwJZT28uwtXprFZfFQWPF/F
 LbmRspruIKZvH0fSqlHUKiSqD3EcMJ5PQRN+NTvEQNHt7SSqh8PnnY/Vb
 xp/QwqxDmhL41dkyl1FQmhZvxw83jXlizT/c2UioNEelmI+fsAaTd8voz
 LRCXSJvb2FmFIWke6x1PKZfLzsJ98/4opI1WFX5phEfWo1YZRHV8r5DK4
 Qu6mRgP6r4TaD3oR52KcnfuQUqFMW8fVgRYgZkTByAZ901Y9v97bjoBbq A==;
IronPort-SDR: cPEOCyfH/bZqZ30lDbpllkpTB+U9opsgesqqzTfmLb6FzeWQMax1/JaSkvIJ6lgz/arqm8Ka2O
 DWs1tYjYiKPWXCCG7gF7s0WdTVfQETSMk8rPQKfydGVk/umVS/33JintQ0s4MjOQdQeWLO54l9
 vcWUzYw6Cm9Rt3fEXEvS2M1aSJlcwQP6pu21cTt8XMsfZRQQ2soRM8T+CGt4NFYyov8jzror4V
 QJHRO0/hLPR5Og0Uhijkd5/9THjjU9h24e7STwgFLhvpog/LOI5I87ZuCt8I8Vu4hFMpuNyPws
 hW3jnPyfnHJo3PPrCUq9v/d0
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="258788876"
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2021 23:07:22 -0800
Received: by mail-qk1-f199.google.com with SMTP id
 o19-20020a05620a22d300b0046754380e8aso12973433qki.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=f261Bw5lz3VrnlrV1z2mQHVATuwQH6Nv2Sn8mpGgv9cJwWqwounaC+e3aDrcj3xAUr
 HajLMQLzUyo4LmusHEW65YiMETuOWE6W64PHera/XO2cNYPf41Gb8NvTLyO35Vu902XT
 5oBdWzzt/izYc7pK1lt9bBhvSdVg+ygGGP82g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=A4WyxezHsER3a19/gHALgsDRLC6XE5qtGiIPL/qtDqyhimyTxRdTVa17ihycL3DYJz
 uzPFN4JeoaKN7vNXGmZ6sX/jvPOnacyoyKmD4RDL9sc3Ctgv9HwVLngI9VR5J/F92JaQ
 DXK1knqNTPnlnSdmgHFtmjOVBp8TPD2QTo+8J++MukFSbK2sp7zpG0pv5vptZPo7AN7k
 WbMymXZE/47uKUuZvwL8QBFaE3gkZqWKMgw8VGZts6SIfzlX39IOVLwPjCb39TTDwnwI
 xtB4lRfbvQL4XB/hxAQ8SyfwdbDmzhl51fw0tqVUHtMYrvvD1yftdx8DK+cFD9eZnCdv
 RZBw==
X-Gm-Message-State: AOAM533DlGIcjlVfm0wphoUKmKVSQnnP7eCGPGV7X381a/prxtz9stDA
 I8Q7j3feyYX71pzbFjVLdXeAO7D4Ekihj34NFegR0qwt5FBk9bProvMLBketkYNvawotZ0lux7Y
 +PZniq0Q5JuUWGhrrdftQdnVoO12gjA==
X-Received: by 2002:ac8:7dd5:: with SMTP id c21mr3298176qte.176.1637046440625; 
 Mon, 15 Nov 2021 23:07:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhPC/C2kELtqxHwiDBXwIfNPToSUuU8wpj8qVqVxKjt5Ut7Tn0HkLJ7k8XQtQn5Vfh9zODaQ==
X-Received: by 2002:ac8:7dd5:: with SMTP id c21mr3298153qte.176.1637046440389; 
 Mon, 15 Nov 2021 23:07:20 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id w10sm7205942qtj.37.2021.11.15.23.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 23:07:20 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH] In function nvkm_ioctl_map(),
 the variable "type" could be uninitialized if "nvkm_object_map()"
 returns error code, however,
 it does not check the return value and directly use the "type" in the if
 statement, which is potentially unsafe.
Date: Mon, 15 Nov 2021 23:07:04 -0800
Message-Id: <20211116070708.429432-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yizhuo Zhai <yzhai003@ucr.edu>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
be passed to map function")
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 735cb6816f10..4264d9d79783 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
 		ret = nvkm_object_map(object, data, size, &type,
 				      &args->v0.handle,
 				      &args->v0.length);
+		if (ret)
+			return ret;
 		if (type == NVKM_OBJECT_MAP_IO)
 			args->v0.type = NVIF_IOCTL_MAP_V0_IO;
 		else
-- 
2.25.1

