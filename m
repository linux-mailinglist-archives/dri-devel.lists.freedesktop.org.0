Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23DED13E93
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BDE10E412;
	Mon, 12 Jan 2026 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BXZcDrwr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD10D10E080
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:02:30 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8b2148ca40eso899911385a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768208550; x=1768813350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f/3Ni1AGsR21lHeqIB2U7YviI8F5jnCb8Sudq+AQrGs=;
 b=BXZcDrwrV08kCnqNZ3dGmg8ZdA3h4ezQvyIAQ5BuynrHDyjov0UksPHqGazXc7Sw09
 HLSrtByLfF1bGln8fvonQqX+qSYKGZOqw/ZT16K42QydPORDkEQnCGkFORmzifqEdIno
 B47ouPZVaGKRBhoUmN0DbE+WAiGzAoerHxV6yoz+It4Oqh9olsEbrYbPfKBPxqzS5JQF
 O7M3UuSq1CsZHr737NP8hw6nrYPkhcGRX/2gtcOdpzT8YuuJ/7gMWdS3kmKc44okijJM
 qUoH6H/br9tHtSZgm7rOnAIdj2rLLyTe8l5VRoO9fEgYmyjCJMXf1akizgAl4T/pIexz
 NroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768208550; x=1768813350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/3Ni1AGsR21lHeqIB2U7YviI8F5jnCb8Sudq+AQrGs=;
 b=hL0QydrC8MhPDPVhu3nqed28/EaGpQz6LtQ1/BVRNXKp+Ns8GknPIhrPsQN+qhcWjv
 ZLcLTVz6SxegFkAHbS42en3zL67sO6Tof75RD+qR5vXI7BiPhwoAaRkLsUtpc5bYcRrc
 gAQI6l956oL7pGZBJcKQJfQWazzTqjyPh67NcD4nCCWcK9GkXuCmg7QacQEHqq5C37lb
 jctcn1pbOnQnWqItC0rGygSe114r6Scf20Qct6OIIcSESXeHM1Cy66Y34a+SLS5LQJ5a
 rLLUNvEHGiSwGrXmhYH/xqZW4dquXPyOhdkhkS8ZOjW5JnhmZu0E9sMgfyaegmTuPfip
 fRBw==
X-Gm-Message-State: AOJu0YyVoAMFjZEPFuNZwuq3tRlV5PK2waleGa2kA5MbA5vyNB19D6Vk
 F7cQtnQaFUDNqcSxEZCGY8q+6oHxnKSBH3iZgkxWhdmafZUKZcqPU1qR
X-Gm-Gg: AY/fxX7NyEBFQQPW64KeGsru7tfIyOjn2pX8rCohejMFhYSCjdR55JJ79EU5lL0ph9W
 ec+jL6Tyb73mju9bnFtz4IuJKHx9lX8FP0PpYDKwJ9HTJfQ1cClitYXXGctIJNLPbxaITQZhMh1
 8q7tJ61F0LzKvDEf95ku+IWV67hjC1awCMLFuKTWGcYSKYMNsQqkQ7QO75rPjaLabUtDylQjlJ6
 gM/F6Nni6Otag3kXFGQwjcG3XIN61wbv1OkWawyR554nCU/kKAzlSOMTm0P1yohOrLDDFlx4CW7
 0lmIBecRdldBQmRluYmEJ18jA9aIIsnHSbFsF3tgui4rPADvxtkmajzcPfUl4z7FIeZfqKQ3Y3d
 6s5isR4S/EGaM4JDrgrWvuRd8p5k3mnm0GXXVVtYDyrixEnq2E5vxNrAZNQ8TQELjKnGa6EcS5N
 Ee/3KiIWdmZzZK4hCbpfhMD/YLLTK0WDov8w==
X-Google-Smtp-Source: AGHT+IEg0mp9jO6y1Lt6tC7eIYErHG5kCDpk5M+8QrBI9vPUXF57/zRZlnQ6clWw/LTZD+kezSTbiA==
X-Received: by 2002:a05:620a:4802:b0:8a1:762a:ab13 with SMTP id
 af79cd13be357-8c38936cc36mr2222399785a.10.1768208549448; 
 Mon, 12 Jan 2026 01:02:29 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f51cf95sm1477935185a.33.2026.01.12.01.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 01:02:29 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>
Subject: [PATCH] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Mon, 12 Jan 2026 17:02:21 +0800
Message-Id: <20260112090221.3250133-1-xjdeng@buaa.edu.cn>
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

Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
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

