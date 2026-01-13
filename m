Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E6D197E8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 15:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C9A10E1F0;
	Tue, 13 Jan 2026 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fvxAx4YC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4133610E193
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:34:55 +0000 (UTC)
Received: by mail-dl1-f67.google.com with SMTP id
 a92af1059eb24-12056277571so9050789c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768314894; x=1768919694; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zco7EFUTNtZlgUYwabK6K3z7XvpUMikF8ohw5sUN8wk=;
 b=fvxAx4YCryeiG8FV/4cXb3SlkI5kPOxAjW2tyVQxSCF4yYzDr5B8qvJW8br1M4M8Fk
 aE/fmu7aXxPjmixs4QHoNY6eI5UFL3SAZaZZJC3Ozc0TNd7eUQ2v99wc99ozrGjNDYdW
 6o8ZkdMALEMHPrc43izoVwq3u2nwf8OgYQHQzMsSPAtXNd+oOC5ax5uwpjE39gt/OTW/
 xwhTqVHEjqZt8H9+agqPxvMDaSQLRo+mAT0RWljSty4SFiCbr0wYRUt8Wp8PInX9ktfz
 aG+867EN07yEFsPL34TJqgIcMV5SoHqzqaGaaIyJMLnSfPSQ1nKK4zwU33zFXhbZI3kS
 eplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768314894; x=1768919694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zco7EFUTNtZlgUYwabK6K3z7XvpUMikF8ohw5sUN8wk=;
 b=D6Bb63oT1ph8ngrZqYy1J2QXXiVvn2So9CowpyPVFwErCeG9fvWQtJKWcIOgzPeNrn
 X5jiDdAPTjeln64dRectAQcZlQY8ugDAu6FJ+bYeeDZTW+0/dLBQc4Q1+PMBu0vxg7g5
 cQoJi9JkS2o95vqOWYBqsoEJNJ+aRe3ObQaUUM4I6Kga+godiTf9fHOIuzsN0kWax5S8
 R8txBr2QvSgUtk9s16a7E5Du7i3AJdH015g4dU5QphitG8QadufewdPxnBwvvHbVI1Eu
 ktPKMK3SzU3pz+/twjEs+ogcq+9crnPjT1L5jcdhx0Sotj2lrkycphQzHDxMv03SB103
 NxXw==
X-Gm-Message-State: AOJu0YyVGqhxvWXhjvqDd5HypehSduWcGe9BvbdWAcTsKAX0chbNiYF8
 kNSIJQqLtGYquNRya4mFG1zmaDirpiJDgIpKelLSv671yfXeBqhdpMfX
X-Gm-Gg: AY/fxX6YqNKVnpZj9oCcDmS/Qjl/949IfS7rh2FDyBFMZFi1A8MT/x1eYEyckC8S+Ox
 xQ9gYLSdMenSiQA9ePv1jKwRl7Zlrs+tMkY+lMwbbQ5h/XrLb2Sl21wmW4g4BO7Pxeoh0k+t588
 xOT0r/hT1yF2YwzhcgR4yy0h4wJ636RQg1mHNa4p/6NVSR8ZcoHK5lRtfIpHPy3dsDlC8WT4zws
 RahkxFPH4CDofZZ9MCvQPO7KKvf8aq4hCIf5BLkVnFKTvqh6IeT4jM/Q9ytpzhR6OYpIs30PD1G
 TqMRvuNc/rRDSJA+ly1pGLZ0H8XgMwaUsjVXgcpc3NLdOjDnUThCPdIq//2sLtOeilIjT9BD12E
 GfUYIJSDUPnYbP9ON+RudF6b/lkIk4pmm6nCM8TZOoBozYSSUMSdGpiEAFMn6BCBOUlnjsNg05F
 vk10zSW3yRuTJBZFNVQg4G
X-Google-Smtp-Source: AGHT+IE6eqficxeF/oTartYDjBh3+Z6jmQslJHwouLzBiZA7Qxp1OVpE8sFLB0l1i1KCqcJgNMf5pg==
X-Received: by 2002:a05:7022:4390:b0:119:e56b:98ab with SMTP id
 a92af1059eb24-121f8b0e125mr22306128c88.18.1768314893939; 
 Tue, 13 Jan 2026 06:34:53 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b1707b21dasm19672434eec.27.2026.01.13.06.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 06:34:53 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v4] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Tue, 13 Jan 2026 22:34:45 +0800
Message-Id: <20260113143445.889031-1-xjdeng@buaa.edu.cn>
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

Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index cbb12db110b3..9c41b51d80ee 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2339,10 +2339,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
 			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
-				    data->vmperms, data->vmcount);
+				    				data->vmperms, data->vmcount);
 			if (err) {
 				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
-					res.start, resource_size(&res), err);
+						res.start, resource_size(&res), err);
 				goto err_free_data;
 			}
 		}
-- 
2.25.1

