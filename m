Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29134D38EE3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 15:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6AA10E02D;
	Sat, 17 Jan 2026 14:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T2nuxYLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEBE10E02D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 14:03:59 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-81f3c14027cso1647845b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768658639; x=1769263439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yvSd70I0U5DyZJZE/7/GpNsYtzxrPkdLztxfXI10Q04=;
 b=T2nuxYLcshDVWt7SOoG4Ytc33yjnigGVryfbmT0R0W7vwfdvJ4curOgwYvr5St0WYs
 LZvmefThLh0kylqN7od8mGfKnD5i+dD21bXdabbNHD4nRvLIrZ3bwjZxyd5kWrOrMWjZ
 XwC06hkt9suYw3Ixj3EvHuLulYl+RVyOZc+7tCG8jQzbZE8Csk+4yQCa2zQZCaDJK8Qv
 qfzoJzuBL6ObzYsH4dLvTEISSRD6pzMQ/sOBnyXsD3RQ70u35cFibSJKxMNQrl8V9JYU
 xJDKiid4MA9RXkp/l5/sp2GlzbFAUVDlaa11m3K+vno3xAsZ+QAMdunj6SFNIQJP4O8W
 0Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768658639; x=1769263439;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvSd70I0U5DyZJZE/7/GpNsYtzxrPkdLztxfXI10Q04=;
 b=OcuyMXVkC7hvE30RgmtZsWe/2siqWZRXZw75C19CohqGEZ8aBIkBjE/nihSve5+vqI
 ytbY8Rhu0vKKRqxnbccVf4YS36BUrnei3bMd3bQ4w7TWMKh5NYamV2YZm6/keaMhnFuP
 qYt5JwsR3oVwM1ov+F4+vBR3uJm6j4KrciN+3kLdxMegKBWzdnBx/f01cYeN65esXJ3i
 ie2+CeOmKdqS28JCdPRmoZ7gKzT8VRhL/Ks2RtZQ1m+UF8wUL9/bdpBMSt/wJ7LkX6nY
 lk6tEIEygasGll4uyLtHzO3JyNRzo3Rxfrao6p8BQzy3N7Z4fKCcqJk0ZG2ZkWFoq6Wb
 YFTQ==
X-Gm-Message-State: AOJu0Yy+xsh5pugSFMNCrs9nyJP6a3nwdG0BX3sh0j3Fp3pUAg7dkjBW
 JH6+B1dPXgqp6et+tykzU1q2O5fFdkMYGW7ObsFQT7+6VdIic7A+vxYM
X-Gm-Gg: AY/fxX4G80FrM6XfovkxxgZkQkUW2ZL5rs1j6CVThj2RS4cPsaV5+Bjgm2ASo3Sq2oD
 pN9yG+AhvvX9JIRCJVfCGyECP0u2pyXqZgRTPiySbttDGY0zhmEgF8yCV8UfM9CTzReapT2Rble
 DnQWA/Nb54ris+N0s4C86QLwmdsVaaKmDqq5NAxG5DTcx6t8zW0dd09y2+rXnCMQG1bbD+XEOUP
 vXFlE86fcS94cedEWr0NwBOeShOFh5/rPZxGRZs6eiVYnGS5O2ULTY5bT2Fd7jqt6Pw+VY3Z/L6
 FRdBYcEF5wCXkRoThwPlezX1Pax6oowH3UGTcSgJbqB9kQNBz5RqKptnlQju8IfOaIHCTSHxmUU
 NrA28YDT9ZpV2MuqvlyaVkMl7OpIrCLDodVep9jUo3pIsitBHVqi819GR/kuGZ3Ll9zX9G5F/RP
 4wNzXchtQO21CsKwbAIolN
X-Received: by 2002:a05:6a00:3e1c:b0:7e8:3fcb:9b03 with SMTP id
 d2e1a72fcca58-81f8f151940mr8455685b3a.25.1768658638797; 
 Sat, 17 Jan 2026 06:03:58 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa10efc6bsm4213580b3a.29.2026.01.17.06.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jan 2026 06:03:58 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Sat, 17 Jan 2026 22:03:51 +0800
Message-Id: <20260117140351.875511-1-xjdeng@buaa.edu.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not
checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration.

The file has passed the check of checkpatch.

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v5:
- Squash the functional change and indentation fix into a single patch.
- Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t

v4:
- Format the indentation
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t

v2:
- Add Fixes: and Cc: stable tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
---
 drivers/misc/fastrpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index fb3b54e05928..d9650efa443f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
-				    data->vmperms, data->vmcount);
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+					data->vmperms, data->vmcount);
+			if (err) {
+				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+				    res.start, resource_size(&res), err);
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1

