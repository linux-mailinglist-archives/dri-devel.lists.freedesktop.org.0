Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918476169D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 13:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E4610E00F;
	Tue, 25 Jul 2023 11:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE89910E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 11:40:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso4135909f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690285239; x=1690890039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oIwK4vNakYsmHhWk3gPu9jeD67klp1zgcobWm0hLfMM=;
 b=qzWmo+ENoePc/UCYjokwm8n28ajtGiHJ8cBotYdjFTxBLJ3ZyGwp4fhCr1uKAe0qgg
 eCHqn/SNWsBHo1OO75pdizfTIc4oGRcS2hA1Nmc4UeW+MqGByA5PCewlnvGbjn89sxLs
 1028IIY0p9O+5piV+G92YSigAUjgbbkKvVLoImuT+mIcTACzEL1rPKR+Mb2bREQ5VSno
 pprqhzm8/IkUTHEitJwsR9QKc9aiSzDX6ADuw2GNbIaHLlNlgJIVRBcD4L+h8EnEHT1v
 gFYo9UVtuoKT7YI2Yd9nHXrcBo3xrf0gpd701I0UozteYywqEJuyggJI07Dod8VFivHi
 lOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690285239; x=1690890039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIwK4vNakYsmHhWk3gPu9jeD67klp1zgcobWm0hLfMM=;
 b=jaPilWwL4CrISv8zqZsxgOiNao2kx1xISeFnxZcUKxAOJG2JP3vjALrSddnsY5oAR8
 uQTpDm0gKYw/S8JSbj+8iCAT6rLOKRnkO8D5ATg0VuOZu9B/S6Yuhz657BGbK6XtsgSK
 diDb3pFRSzgg8IO+OITVjmHPlA4JHg/pSMg0gPhyS/VDGcOLmRpcKSFTh26/LKQV1HpQ
 VmsbDKY/pUEGQO8xTPRNjmz2xyQ88wNyamkXeehbn4EbW1HG/NvKmG6nUiB83MEIg88N
 08H09SYG1/WoUtzttqiLIyQno6IQemLciPErSk59na5Bdko1/SHpltRNmGB1He29uvm4
 8kSw==
X-Gm-Message-State: ABy/qLbebfPOtP0x7jZm7PBMqcMrCNT83PONJibKhUXfdXPzbH3UIqfo
 nOkM0rqTZ6dwZwEjFVr/A2c=
X-Google-Smtp-Source: APBJJlEHMeV1GT0gHESC09Zjy+axUc4imX5ZHprKSvGpdZB+jCUtQ1yHI/p8VsPGTg9IdOvMJtAw0g==
X-Received: by 2002:a05:6000:4c:b0:313:e456:e64a with SMTP id
 k12-20020a056000004c00b00313e456e64amr8961163wrx.21.1690285238976; 
 Tue, 25 Jul 2023 04:40:38 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q3-20020adfea03000000b0031435c2600esm16177847wrm.79.2023.07.25.04.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 04:40:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] accel/qaic: remove redundant assignment to pointer pexec
Date: Tue, 25 Jul 2023 12:40:37 +0100
Message-Id: <20230725114037.36806-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer pexec is being assigned a value however it is never read. The
assignment is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/qaic/qaic_data.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index e9a1cb779b30..8a6cb14f490e 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1320,7 +1320,6 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	user_data = u64_to_user_ptr(args->data);
 
 	exec = kcalloc(args->hdr.count, size, GFP_KERNEL);
-	pexec = (struct qaic_partial_execute_entry *)exec;
 	if (!exec)
 		return -ENOMEM;
 
-- 
2.39.2

