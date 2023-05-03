Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58626F5660
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 12:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9610E257;
	Wed,  3 May 2023 10:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072E10E258
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 10:41:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so3118602f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 03:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683110492; x=1685702492;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xHsnWChYQT1z+NaKAydFHIQbH8RXi8T5lYad1K4Txs0=;
 b=lGacC+qgxPocSkx1r674MI1CUDVr3KX2qyaKs/LsCsd9gQ/L9HAOC+KCgMpeAGwHgx
 XZ7GUfebWa4+59RX0Ga72c/xyzbT/7EpW4EaKXD8u97PwnF+mqnxGct/Yuh5MYQhKB2N
 U85TB8Ry2jIg/2qRWK+vm+tFOYJ82rfE84Uitj9E022wxbJqqugwo1jKuRfhU5WkEVpB
 JipQvWyKi3FFssIeYhpixXB1I9av0BbZ25sXKym5f9NV5gLDdlnvLrp2VALBlza0CP8q
 ZCOkrxihaH8Buw+PR4dgL19xmNf69WlnX4KUV4GpQ1IWgcilZzznXZIkWu5qQha0zI3A
 8//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683110492; x=1685702492;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xHsnWChYQT1z+NaKAydFHIQbH8RXi8T5lYad1K4Txs0=;
 b=kgNhlQA4TAr4IFiCWAcZNVPcj2A9Q5+we6+Yb53Z7VDiHfGDlNIfPDWcQoECpKknxu
 9CG4L0nAirDpdBmf0pSnJfzCWvVvAwp2J6cywIAR/oxl16m8s7HUcbpkBA8/JJPaEnGP
 i31bUph2sbM1F+p6WnIWiAtS3Nru5ZuOErp7mPlcp8mfUaewRmy5oAMSfWbQQdg3Ip/0
 zOR0S65m3wWgFuJqZoW2j9Gb4RjqwEPRc9UMPZLJpZfRgJEVNu4PKY7e1/oDAIexCLx8
 1fhLj/1gzGKyupE0GWTsEvHHe8mdWo/kGIJrLnv/Eiw4S5Nj+WnchQyvLfUdVGz+c8Sp
 jgrQ==
X-Gm-Message-State: AC+VfDzbhCA4dxxpdcmITQx+gSn1ZhDuAlot3DnnkNtDC1b3MfbNAtlj
 6ENSlzdgjTLPvc9PKxEKNdhCDVCgJsIu9Zl9wo8=
X-Google-Smtp-Source: ACHHUZ4ALCcCvovKE4Kn+I+8rCSPqIU/QyVEb0IdNAZcF87Q/sIr8B4EDuni8XCKFY2XzWxIzm9ksw==
X-Received: by 2002:adf:ec04:0:b0:2f9:a798:602c with SMTP id
 x4-20020adfec04000000b002f9a798602cmr14969737wrn.12.1683110491914; 
 Wed, 03 May 2023 03:41:31 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q11-20020a5d574b000000b003049d7b9f4csm19417469wrw.32.2023.05.03.03.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 03:41:30 -0700 (PDT)
Date: Wed, 3 May 2023 13:41:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: silence some uninitialized variable warnings
Message-ID: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch complains that these are not initialized if get_cntl_version()
fails but we still print them in the debug message.  Not the end of
the world, but true enough.  Let's just initialize them to a dummy value
to make the checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index ff80eb571729..e10e8b603e37 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -263,7 +263,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct qaic_device *qdev;
-	u16 major, minor;
+	u16 major = -1, minor = -1;
 	int ret;
 
 	/*
-- 
2.39.2

