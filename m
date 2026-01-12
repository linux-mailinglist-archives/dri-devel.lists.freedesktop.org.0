Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A9D13E96
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A8A10E413;
	Mon, 12 Jan 2026 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z4wSELc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E5710E0DF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:32:57 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-81e9d0cd082so2074229b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768221176; x=1768825976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GmdD8KZWFllN0kxC+KJpu7oOwNYAIMDzyBObDdyGg+A=;
 b=Z4wSELc3I0utY7CLsF4UY5osaYuVAQTMwo/iUFW8dhKSEAt75uGNIGqD9u9a9etRkW
 vewPZmniuyxbzqFv/CoenSmY0PpwkTfXn4E5eEZB3wlN5zPzC+LMnLq5wFsrNYWwFK9O
 e6mPjhLiWzjqKaK7rHFqTq/idMLdbBgSMgBYLhEzaWZC3cUIMOmSnFP+eXDGW2rbLc01
 St7NkL6p+AJAtZ4juvDU8fhwQCeff3vCLkD6IyPam1+Dczuugx3C3kpfto7hnejIQY1J
 JKluoEtzJ1zMP5sMiWwEx/+Zqe/Cknku7JPjbidH7TQOF9sl6fNw0UDiUMIpt49TVkCb
 Mbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768221176; x=1768825976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmdD8KZWFllN0kxC+KJpu7oOwNYAIMDzyBObDdyGg+A=;
 b=FG3TBK5JB7vdDnWa+DPO2R2rOENeJSufOW/4+xeP6G7LFPQmDeAdugijZJWtwDxq5N
 UE4UBkyvQFSPp38ArNLaIA4pMoJqnL26xhnUvlvr22HlXIuAjm0sCR52v2a2oANRnNSh
 2C1iTkkEVNLbZniCKx8H3Mkhj7SLE/8BcSxk0r5ngU49kCP4QofywQf4sUTbKfvt8NZ4
 B3r+FCSG04DSWmHV9GIGfQkzLD0UAglJJw+lUcvPVGIdoy0LYBgtmuTbxuBaQ7nxM4x4
 EZdUY3DP4aXeHXQD06vHOZfHiMSytRtICiXkpKYvoHrcuQo3Tc3XXxhHQjIx29dA6hbh
 qEtg==
X-Gm-Message-State: AOJu0Yy3OJansxYVyRFmjvyPD5/vBZnurKQizYdSMgmBsrAUJ6AudLhT
 fodVp57WViz50bCnOQk2yn4beUBsAs3BveSIbRJzfxp4JgPZPOoT1NAF
X-Gm-Gg: AY/fxX6lnS3HwQY8VnKjoGeiuUFV2EHTaGGUUxYqW9yDXhH6ZybpgR/f+Sx6QSgyY6K
 FdMS5o8knuf4i3h8wQzuWh4T2Vf5KEnEG06dun56AeixS5vYw/+rvetMOFQXFzEJuJ5zH9RGQ/f
 9VU2gdyjXHr12Gf8e0zxVG79tB0Z6gb6JhxgBhprY2IMZtAtz0PPdhHHQoDEwRbpiOrVwm4jLnT
 NOpOejeViD/MfLFkLJ5lvUKI3pxCAniFGXDQTlE2Rv4DNMjXGzHDKQ11kjFVERWu84GF6ooeHwH
 rKv5CVig9MslHte5LPZWItRpUDZTG0kayeDKLJyrvCYZlduwDosReTsIB6H/0kPH183VToZgdPD
 RFxqXVeljJXjTiD9MyOLoG/zec+swTV5eWjNgX3kbhsev4y18KVc4L9XjFsERGnp73iNX6q5J/k
 kO5XtM6R0kKtGHsf5vCpJW+wA=
X-Google-Smtp-Source: AGHT+IG6oEHPvEC/onlSfhniFExueTjVWKGz+6vfBL+I0KYIrm1outw4HFM2YSLadev+0+rrQXITRA==
X-Received: by 2002:a05:6a00:4144:b0:81f:5037:a318 with SMTP id
 d2e1a72fcca58-81f5037a797mr2984858b3a.21.1768221176467; 
 Mon, 12 Jan 2026 04:32:56 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f32ccb4aesm6987379b3a.9.2026.01.12.04.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 04:32:56 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: [PATCH v2] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Mon, 12 Jan 2026 20:32:49 +0800
Message-Id: <20260112123249.3523369-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Jan 2026 16:13:39 +0000
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

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.
Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

v2 changes:
Add Fixes: and Cc: stable@vger.kernel.org.
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..fb3b54e05928 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	}
 err_map:
 	fastrpc_buf_free(fl->cctx->remote_heap);
+	fl->cctx->remote_heap = NULL;
 err_name:
 	kfree(name);
 err:
-- 
2.25.1

