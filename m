Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D037D1645D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 03:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801FF10E2E3;
	Tue, 13 Jan 2026 02:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Aud3a8rr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B784710E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 02:26:30 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id
 d2e1a72fcca58-81f5381d168so1458435b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 18:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768271190; x=1768875990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iW1zjR2bH63sUC9kWdfqTHJPDTn4Q4NXCWxZ8Jhpl0M=;
 b=Aud3a8rrHmsijokyEy81AbxfckLHswTgNJIG1RJtDK4Fvp2E7Xt9iB9mIcIvZ7Ipya
 k4dhTvtsrdRnNlGHZeQQL522wlO0wl9bIXWIMIz8RBfOdJfI/k5tadnAUqmneU7Moede
 W/8LfnMAEUPZ8IBEvl/jEUcy31Bv1/YYJAklMVZ+80h+BhggAg1CYSMFYob42m8AecJ3
 S6elhxzJH7uUfzoKv/qpHeO5cKBFdsw5zaC/djA8q+4U3oLSFQY+R3k9L3xmlHPtUkO6
 AicLL7DVlujqMRnwPheJp963dQCFm951hK5d9A1uRFA+G2bwT9oT3qDP00UTosPYA8uj
 qybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768271190; x=1768875990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iW1zjR2bH63sUC9kWdfqTHJPDTn4Q4NXCWxZ8Jhpl0M=;
 b=o9pfxVnxepDVvCXTO+foUVMVbCbhxiTPj/15K5IY8MsYFAz6W8FWWg/OO4sKtS0US0
 e6NZm9iP+5frYiZh4Vy5g8RcSX/aUTlx7vqiVi41+9hPC7x2ugliy0OL9i/lqQinKN8w
 QZEE4/WblHM8/sRAER75d802+HSxlmVGfU4hOuNfCV1r1BU5HBydOnlJn64GJK8DHxVI
 mJddaDqgWs98xXj0O97ZXoGd4WNKvQYzVc2bA+7IlPxCQld8RCUtPRChmOSeJwZn19Aa
 E2z3wlnttJR2fPjXarF38dVTE4SsXtqEmLHnSOB3yOepNbOXVo9LFmlQ6Y1iSuL2HUl3
 3N1w==
X-Gm-Message-State: AOJu0Yw1BtvpGBYbULsn88DLMGqS8y07E6Gbl3oqZ7QHT3p4RZ4W+Iya
 Z9cX7y3JPEyiwa77rc3FxCGlYXQkcJcQ6PNRm4Zt1ia+GpJrLAaAd+EI
X-Gm-Gg: AY/fxX7om40VqbOErrpfgNO/g0aoPiGls/xqdjxCokFO+F1IJwwseUQAeJcB2PGTI97
 gnPCKEfnpV0dDxZzmAyx8E0Kid6c06h0bEgKGEkoVPp2hX18r4vdWnqPuwWhpwYq97U7n+sUP2l
 hy4FYP8QIO07yY3C6uopX59muCLA3CutJJGy7K6IRkxaGT4kygSkxG+gDS+LvTAffD3EPUqZDBI
 eqx7pKX/X2KZWr2Zs81YPasM4soRfeyVJtyIpm5mk/XfSwMruRgXC1DP64XH34FhtNyzzJ375+w
 ScbJXEJx/N4GtnihtToW/AST1QnKwAPSLjWxN8X+85o7d+tZ6vFtVreuYQlA7LMskjwFD5NkpGf
 GDuWu5Y8MRW5IdQvc0dsT6NWShIN8zXeBX+XaRDafeYFSr89KUFkZRJubGH2mbp+63U36e4oDq/
 Be0lDcvOvJXD9nxyDx5H2TAx8=
X-Google-Smtp-Source: AGHT+IF5FvYiWFIbb5ECATEVt0CMutY2gIZKibKQM75WoVY6vMqwsXyRdBCG36b7Ofr9nw/C7ccN3A==
X-Received: by 2002:a05:6a00:90a6:b0:7ee:f5f6:68f6 with SMTP id
 d2e1a72fcca58-81b7f6ec194mr17648003b3a.38.1768271190060; 
 Mon, 12 Jan 2026 18:26:30 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81c4905ca83sm13965064b3a.38.2026.01.12.18.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 18:26:29 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>
Subject: [PATCH] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Tue, 13 Jan 2026 10:25:50 +0800
Message-Id: <20260113022550.4029635-1-xjdeng@buaa.edu.cn>
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

Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
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

