Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA92479842
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 03:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559B10E341;
	Sat, 18 Dec 2021 02:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-lax3-3.ucr.edu (mx-lax3-3.ucr.edu [169.235.156.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B428010E341
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 02:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1639796200; x=1671332200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vhh2Wojmk5xxnlKfiyWrawrHKzGyzr84ZKM1o8pV+po=;
 b=NNGLZT+rBZ9d0KqaNnaO+XjQx08S53IZaM7SSQOuR6CUwfAiKWFdY6dT
 XXDybCEAdprqeWfrFsk7mMmc35Fq9OpLVIj/3RpOsVARJLvnPTV3+SeDj
 IRYtDm3FOkFizPFoz9hl1tmagjgWudem9uwem69KgWJ1B5QtgkhfAnGm0
 ilcQJpPQZCQsW7w2jIKMhVWV+0rVKvyCGK4MB9Jb0TP1OKQJ9TylHczFh
 2itbQdxJJcZD1Of/N/O3nceUlgT3qWTkhj0wBJ5HVSfV0MlaZYl4kNhrV
 tDcCc2lYXCOoalSBlt/s1ATIU3Vo5+WZA5zp7iNULZIWdcHrXonCwHfbY g==;
IronPort-SDR: Vyn+0YvkRW7OOUZ5r7mXHgikbVlaNoIv4r9xmFUYsqSx5kik7+/h919PSCBMzz5+fGj47mDDwt
 yiEpRL1wPcYvsTyCArGSjSPhpWTDnNbcoVNBw89btnIP/Wn6Op7Sl1I+yy1Bsxa7IZ7jvu6YGS
 zCo7Ev40LBxLYmF3Apb/37GiFkLCB2swAJ5mmd+t0NBdoKSu3IFsr4oG8XwF/AlKQMxOdCtTbA
 wD+/yXK8Nf1WKGJGewKzOvFR06/MrNb6bLBWyreTW6q45ONU06/IsL0ixod6g1ftdayvch2/r7
 VZ3fUxaB4UQdXzsf12JPwjWu
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="95150633"
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Dec 2021 18:56:39 -0800
Received: by mail-qt1-f199.google.com with SMTP id
 b7-20020ac85bc7000000b002b65aee118bso4206102qtb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 18:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/oW4xcGaHD/Q9q+L8wKlfwu0bwPMu3EEaXJ1rCZ7r8=;
 b=Q1p+R3mC+VX9kDcyIZHntGkxKhbBd1chuPJ73wN16OAQ/DfnmvLJpQcHRIU2WoU7Zq
 tMDLlXWxqTIUo1WvrzD36E0gfnySwXT6rY6UQs9nb+9GXnekte7W8LvZLG6zEtyWu/Al
 FsP2C5hPSiTsbWEQBzH3/3CSPKY18FDzVtEgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/oW4xcGaHD/Q9q+L8wKlfwu0bwPMu3EEaXJ1rCZ7r8=;
 b=klKYvGERlSvKsUj2/jPaQq2xqAvzgi4O2qvPHihMUBVT7l57pBZdeUeIDD+4utT3/C
 yJE7YjgapPBt4XO0eKac6ctp+P5vNf5arh5HyEupn962HORa1TLi/wm4B7/+Lu0FsiS9
 KeT6qa6JMcIJnrWklYI/MdKqlxLBr/9Bboj7f4JTzmIwZdhTToyqn5A9LDWgDTjJ1WsQ
 mTwpDyMU9OgUvkBq3OeHFUuxBvaUXUb2zAdon69rz2C//1RW7aMKOzrcD300o2GhGVym
 k+5mOHj2Efw2SagLweIbPEQGY2/HVTbJQxseFjYQvNHw9XdN0yvz94RE1WXM3aLQNocM
 0bVA==
X-Gm-Message-State: AOAM532xRw3QHS2qcIvJrUgg9iSouEAMOuJPhDDQvKCo14bSDgGNPi1w
 aMXabhQ7A0k3RfNUU+For2HqUaBmUOx3YLNc6oMm7DsAD8c1AODKpxWX2P44y2y4+Wb24z8XqIR
 S3tbMiKpUevuyXOpdMCK8ZTyWXE0nUQ==
X-Received: by 2002:ad4:594e:: with SMTP id eo14mr5090068qvb.99.1639796198002; 
 Fri, 17 Dec 2021 18:56:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNSeR5+Y93fUCIc7POaHKnPLRzL0hlcG5CdAYxVV5YFjohfuBdG0RQ94oMtIxeknO4m2da8g==
X-Received: by 2002:ad4:594e:: with SMTP id eo14mr5090057qvb.99.1639796197839; 
 Fri, 17 Dec 2021 18:56:37 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id m1sm8455617qtk.34.2021.12.17.18.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 18:56:37 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH] drm/nouveau/core/object: Fix the uninitialized use of "type"
Date: Fri, 17 Dec 2021 18:56:30 -0800
Message-Id: <20211218025632.2514288-1-yzhai003@ucr.edu>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Yizhuo Zhai <yzhai003@ucr.edu>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function nvkm_ioctl_map(), the variable "type" could be
uninitialized if "nvkm_object_map()" returns error code, however,
it does not check the return value and directly use the "type" in
the if statement, which is potentially unsafe.

Cc: stable@vger.kernel.org
Fixes: 01326050391c ("drm/nouveau/core/object: allow arguments to be passed to map function")
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

