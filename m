Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHXBDOWPeWl9xgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 05:26:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765739CF55
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 05:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72110E00A;
	Wed, 28 Jan 2026 04:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BYEOiMPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ACC10E00A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 04:26:07 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a12ed4d205so42409155ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 20:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769574367; x=1770179167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qewCajV2v8f+DolPwnEJpeH0aZGojL2p90D4oi4jTS0=;
 b=BYEOiMPksXum4MHTbtXzSVeTVnidji67v8x26ClO6f31BquXHDYR4paNPNwChMd3rP
 Zb0TF+8GRNGHiVFFOu3rSZx+SfFYMZ6hEKU00Q4KyiYsewOb5wrPsLPTt8j9sYqwj/Be
 Q3LBtHn+DhdohQ5WIiGFbG9oVjVdIapZPvzemihiRHsydpigcwTvo0d4zzTeEWvvtGh+
 rFYc2D6pNeiVsR+M0rOmqeBIYDyh2GqZJL5JCZGJAVNIKZaInrpZrvAiV0tMGQX9ZrX6
 +OE63w7t7+OOgNMcIlScJQiA/6pe6s1k2a3iWZ2XW454NWlr7JobPIwrIhDinrRlfz8t
 6ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769574367; x=1770179167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qewCajV2v8f+DolPwnEJpeH0aZGojL2p90D4oi4jTS0=;
 b=RwWtHwHwh3V1BbgNJB6hMcgc7VeiMVxy9ut3Y2co1DUf0Q2xovXeE1AcsCfxJqwVkU
 n7d7cQ3f1WJnGltQh1IJalpacfHEPpVZUHjg2jnaXOogU77QJuyfrp1xinaoGQnAjC4L
 k2SBkM8WEziitCnJJfJ/HC8U3iTcD6vcdHnAjVqbVLfV7mJZd/VcDktd/WZDgxJ8RoX4
 Wlxzuw/z6gtfBhLhIyWy5jg8pODBOhpXjPVfKyhAzsapeN5OqeYjtIpL1rzO7Rke6rxT
 mMSacHnGuzn/a2xKMQDma3zX+QvLpf2bISwp8KxRfeQpxzuVigJzp1dWmGyP3jpo6IM5
 caBw==
X-Gm-Message-State: AOJu0YzXq43DDt2weKT1Zz6J/K05gMORoGeOQ4L652kFNuNqF1Nrmlij
 PSdBRye8Xi8svKjbsBGPzCfFQ8QsCsob6qf4uHqFURl7ALks6YvDxKMZ
X-Gm-Gg: AZuq6aJoJs2G1oPIOWrPs2pfH7O8puOWqHINOlNIS1sx/Qg4mAchvfcX8OZNeOUF6B0
 UPDKVS+VLnN2So28RIdWfkWIeoJDW2908jtjqvq+AFTQvqHskKNRK1+7ul5tSzXs11siZ2+WYiV
 ayGXwxSHB3WVYJ/ZnMVUwCLU1bzY7Z4msaBiaenEXRo61lIMbKpXnKOrHbl857P108l5XI+gTwK
 KtMGShfW/+EjZXRx/wVX5rwCsKu+VA3MATrk1cwkYIccy/XMZSHs9YSaH1JzzdP1vOrr5OSEMTm
 gkCZiQMJnjbb8GbyVzhMNpLLgexU4fvYXRHQ6R0CJBnbUAPlbw+7elCIEccHdKxXy/3CjvVut30
 hetoFsBj++746MVgxCrAYHZgEveKWRQBxxD+h2tahSgVdQF6u1A/KlO3q4+Ro1dCOe1Zdw2LZCz
 hMA8DLXiiq9zaF5gnyDcq97a0OXWOEiRI=
X-Received: by 2002:a17:903:350d:b0:2a7:b8f9:5a5e with SMTP id
 d9443c01a7336-2a870e00597mr43973195ad.46.1769574366709; 
 Tue, 27 Jan 2026 20:26:06 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b414cc7sm8455115ad.33.2026.01.27.20.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 20:26:06 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v4] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Wed, 28 Jan 2026 12:26:00 +0800
Message-Id: <20260128042600.2641857-1-xjdeng@buaa.edu.cn>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 765739CF55
X-Rspamd-Action: no action

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.

Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

This issue was detected by a private static analysis tool.
No actual hardware testing was performed as the issue is purely
code-level and verified via static analysis.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v4:
- Add description of the detection tool.
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260117140959.879035-1-xjdeng@buaa.edu.cn/T/#u

v3:
- Adjust the email format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t

v2:
- Add Fixes: and Cc: stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t

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

