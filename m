Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJA7ED/we2keJgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:41:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26ACB5BFE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC62210E348;
	Thu, 29 Jan 2026 23:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yy8YrC2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AD710E348
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:41:47 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-81ecbdfdcebso898326b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 15:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769730106; x=1770334906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=98ySn8T1ILY+Jx5xtFPY1cgInaA1UDWQE/WcppunKN0=;
 b=Yy8YrC2irrJSNmYo6qfWgFeCB9f8jFkE2Nm7BrAVLeWZOlSCp48Ko2QAfBC/4ocojh
 MjQmYHOLSuXkpdd6oXSY0fQL5ivEbTGp/uLiysiwK0qrbtVqPyj8CuouIeQZmEG/BUm8
 aeHXoGIQeFXAP9gZC7hV7XJtcV//wCS+gPLuckLAfxIWqarPCfeBdmCsL54JJEG9fI4/
 TQZ8/GQbFM/kVwvslWPrDucB5xVF9qTkrmQ2QiOkK6QTrGt5oX965XGMgjHTfDlF4qBL
 JOCosvEeMKriJ1jAF0EH/IIlbHa6MSZvjqT+sVzGuCRnKwQjbkr0AJchhDQ+FatFGeBj
 TBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769730107; x=1770334907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98ySn8T1ILY+Jx5xtFPY1cgInaA1UDWQE/WcppunKN0=;
 b=VKZZ3zmYjLlRC3r0hxAaQfzY8snHNkD6rr60W1cfjFcD5H3UUAtpWav8vSL9mWCOsr
 hdI0aaFzH0/5nvmquGPJc8FdWRb9Z9LIVrMl7VrR6vgF8//BtyPm6/Zr8aCRSZfk++FD
 u3+XEJ+xnsskh5K7z0R9AwogtqULkjqNpOANIs0eqjMgaeQoU8yHJI21Ih+aI0txUzk1
 HZB/whL3UoMqSCqMkBES96MenJE2GNfNoR6h4ECQEJaOktZq7zYR6F1PKAfk4EXrKtoG
 LIPaxKlkLTeDmT0Ah2hbwzf0OQkR91Uwq+uWEMqWyWzqXeHqE5H0QTEndZe7DerJuC0Q
 dj+A==
X-Gm-Message-State: AOJu0YzCjfoyDPT6F0WcJ1AtKvhNQ057JzXW3eq5TUmNnXVBsjBEzHxf
 QmCRzYGoMtEfxvpMHYb17W/m8LwJw7tRg15Pa9B0u43hsxtkaXRqNdD1
X-Gm-Gg: AZuq6aKbLKp9sSwBqmXROjlczV0fbls6s0XJ6sz7Ps/y1SfhYVLu113tw00SQ4HAOwE
 s7S3Rb/sbpzRBMsCoLE6scqSR//v86Ad1hdtwi0f8nRpeQYj3jhJU4sayOpbEFoZCe3QtHI3GXy
 Zv81iwH1B/eUN8dwvNvMV69zL5QEL1YE4iqgBUSNK2JSKy/HQFI4lyi5tzxAS9EhyiR5xp2hgKs
 BwgWRvunUYvQkyr0PWY5BJm2NbHkCjRGrs6W3SJlrgoDorczT32/bwylVYK6vOOlQy1F41reC57
 +qi792Zz00Mg5Qi1T4hXH13SsHR6a9oZmsSiPx1oy+D0FRf3Q+R2mMBsFeoLQC4P4AWrwVSkrxl
 1LD8I8XNLPLd9wWSoUe9CJLEp2T/uOZakp5CmlnpR3VEh3owPbjIj8oiw2BptWCXEZ5r8jUf5cg
 oShBT+YGpuY60FWrQ0mjP0V+eUdtE+msY=
X-Received: by 2002:a05:6a00:39a9:b0:81f:be3c:37e4 with SMTP id
 d2e1a72fcca58-823ab67bc4cmr780481b3a.27.1769730106458; 
 Thu, 29 Jan 2026 15:41:46 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c54d4dsm7397903b3a.67.2026.01.29.15.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 15:41:46 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v5] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Fri, 30 Jan 2026 07:41:40 +0800
Message-Id: <20260129234140.410983-1-xjdeng@buaa.edu.cn>
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[buaa.edu.cn:mid,buaa.edu.cn:email]
X-Rspamd-Queue-Id: A26ACB5BFE
X-Rspamd-Action: no action

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.
Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

This issue was found by an in-house analysis workflow that extracts AST-based
information and runs static checks, with LLM assistance for triage, and was
confirmed by manual code review.
No hardware testing was performed.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v5: 
- Add the detail description of how the tool detect.
- Link to v4: https://lore.kernel.org/linux-arm-msm/20260128042600.2641857-1-xjdeng@buaa.edu.cn/

v4:
- Add description of the detection tool.
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260117140959.879035-1-xjdeng@buaa.edu.cn/T/#u

v3:
- Adjust the email format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t

v2:
- Add Fixes: and Cc: stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t
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

