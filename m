Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B050D16E94
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 07:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F8F10E286;
	Tue, 13 Jan 2026 06:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lywfU171";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A08210E286
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:54:16 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2a12ebe4b74so69223865ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 22:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768287255; x=1768892055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VRJ6lsAItfikKn1MBzTEmRqrNF0cYsS87q/1cN7JBMU=;
 b=lywfU171tcbVWGUPZue3dFCgy/y3c4FVmIbUb3Tdz2/N+jzdKlAorxWsMGGGQUYBTD
 bJncDf3loNukfHREHg+ZRtfjyisoN4yITDnv+1xN0DHKA2/yGVRfvdSRLpfSaqOI+tEZ
 K46ozV/vl8zdMPFeYt60wuz4Xk4XcuL/NK2QEhCFxInE5P/4C1HN2FXzdaYvkv91jYrE
 GOJJBWzuSPFbxRyYNXhKAwZWnqI5AfWP/mdSjaIjPxcdFNo4NQuQ+Tit9Gxn71agPoyd
 IiBlqJwFHCPz3KS6KJpWMuV5EWgDHd806JZKeT1WTJUI21cWxkFa+khbvwFI3onP8+lV
 j4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768287255; x=1768892055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRJ6lsAItfikKn1MBzTEmRqrNF0cYsS87q/1cN7JBMU=;
 b=TaeXB8hWw7BJhDdvlyqMFKvnBT/yggamc+tkfg6NrXTmexQvLTXlYZGj34qhEuPRf5
 8oY/CBg6mdE0K/kugoE/BhnBSm5FM6i3o0nDLNMpiFucxFOZUdxGj45GV5G3bI1R6+NF
 I1a1Q6eKZqteMb0F5H1l4WKy8dE3m8VPsOsurstHhJDUZdHd58CEISKXrsY3FOCKvjpu
 O/sNp98EeX/SmlfZm0bHfh5IKfKtHLzbZ46IVeXypj/BnF/2fnMBELcfgeYF5SahrXCo
 lKIr0Df9VhisWKqhhR4OQDp4A9EVxMx1vpHcFKzxZ6vkDWX4zGygovGm1H1zd2acJ9bp
 8QoA==
X-Gm-Message-State: AOJu0Yz5MqfYDDD+LPuW94CufJ+WLI50Ymp/qwplC/JoyjyyYuFeoU+H
 frlNPfQ7NfsFzfjiN0tVoXRDm2/EOX65j/jlPA4zxeDSToOqR5sryT4DcyPsLSK5Jo3rUg==
X-Gm-Gg: AY/fxX4zzaNtWhwLOQ5hQs7euXs2SzCoBZc0D4/ykjNWbqkka3k4FUc9tvID29kmYQG
 WzzbfjGpyWsfVAVwUdgNlS9wA3WtBkkOwdRh7jchHQWednzWDpm+F+NwPpVlsnpkUDgkNh0O644
 kJ1c1ioRwB0p/2Le9zl1wQlwnF1XU8wmq3lnYgSoaoGEHlT0HMpbGWPDavbaa0PkYhRqPm1IQqL
 +rSkQhXMtfYqmbYIfUSBZjSLvCtFJdTqH12two68OW82b2VQ7ALMIZdAUK7i0FV19PKe+b7ggtf
 1M5el+EaqWLenm2qpheJ7YDNP4b3a82pgwC5nBE/1fZRtAtyTk2Dei8Zlb9jGwuZ1BZLrh4WweC
 vkc0wchDo5jYBQzqDXM1bc29+FXUQEkadwvZNczwAANRoOM0qY36rsAhIkEHyGVpLPL6t7Dw2n/
 ajUvFZAyiE1MIs1SPtinVCG0A=
X-Google-Smtp-Source: AGHT+IEl8mWcf14R+R1N1r18r3ZYNbSVCi3ZGQ2zfLCdVzn4cVwqUz9XkTjq8OOXiVwcvCsPgML89A==
X-Received: by 2002:a17:903:1acc:b0:295:592f:94a3 with SMTP id
 d9443c01a7336-2a3ee49b5camr221652125ad.48.1768287255527; 
 Mon, 12 Jan 2026 22:54:15 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a311sm195102635ad.19.2026.01.12.22.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 22:54:15 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v3] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Tue, 13 Jan 2026 14:54:09 +0800
Message-Id: <20260113065409.32171-1-xjdeng@buaa.edu.cn>
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
unexpected/incorrect memory permission configuration

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

---

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.

v2:
- Add Fixes: and Cc: stable tags.

Link: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
Link: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
 drivers/misc/fastrpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index fb3b54e05928..cbb12db110b3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err) {
+				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+					res.start, resource_size(&res), err);
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1

