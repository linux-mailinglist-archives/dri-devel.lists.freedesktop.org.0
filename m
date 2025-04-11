Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A5A85C98
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7244510EB88;
	Fri, 11 Apr 2025 12:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/7FV31e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5338D10EA94
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 02:24:35 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-736e52948ebso1699819b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744338274; x=1744943074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
 b=Z/7FV31eDs/a8VzTJWme+5a1SYpqSFyhZTCNI7/4BIask6SjRcX1yBwOW0raIiXF8C
 ONDQCklL9Eu4k0ew1h8UYJAMO17zt5xpn2EvUVvn24awMriHoDlx8Go2lHNk5ck8TO9W
 qRd+nwAOzxZG3IRAK7r3NBSB1KTbeuuZ2B364wbsF9UXR6NPjf5ptOGkMhgFblmb9Oeg
 4muiLU6SbnGYZcaqJLHg8p6crV53GqGeKSjbRj41S2trFqskWqYswg8W/Z8KkpTEcJD8
 ZZFdljCKDSpQ/iey/axzruQtACvn/AFJwCtiekTJqRcC+T2PE5g9CurDtXJtIj6wIhzE
 Gqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744338274; x=1744943074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
 b=lu91wBLqp6650QK8X2u5GymHFgtSQufysXq3JOwQMYaBGv3OszoqhzYM7LX3AIB0LZ
 S1eyP/jIYkqt7RPMD0hgWE0q/gKPJHUjEa9WJvI7X8vq0OxGB8nHvE2Eu+weHiWxgXhG
 5j7wi2K2VTJb8juBAxK9DjCTA40T71bciuPoflTymgMu+/YHirQ7YtiaCpLpINZuhWlg
 PMkBmgLnepNa1XJ8zAwnJ3rnLPAz15168JNl2Zps9fIORq1PLfm6E+gytdZcCK2X+Iqj
 9/KQcEA20qJYuNmKIsVbtaXsZTrJ/wUpChtsJWA2xqsIeJ9CmE8f/uxemlCigKzaQnCy
 hfGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAGqSQISxMfPuBYkjQW+hY3pMDwCd1Jh8Mo6ioUSm122mrCXjyc+m+9GqDVcFUI59jbyQOhJwZGrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBh6RvoApgRg3Cbhtzbzxe6n/iBsxgvvdSEvF6++POiS8aKHjY
 ZJ8R7yg8XSkq+ckb2Hn8bT9b+vQ+UBGwbPG8JupwF3POFEidBiizXLpLUorkexM=
X-Gm-Gg: ASbGncvPiry0L4hvbqr3JiIuaVZ5BWu7By5fiZ8koWhXVmN6cizlrhFXoi33bC9kD/L
 6bVz1ttUQFykhsG1al/7sYa9IPgwYaA3P3vHNuj1iFfqk2nge3BNHbMOhtGSWWT6m3U6h+cA58S
 d5/cs/Loi5KE3skRMnh0ATrgN2Kft8rpTp8C4cGoDs9Yutnhm9RNcYLCGnP4IsLxHuURm+Ga8YH
 2hahlyxViuXDmVJPWfquSTHYvkvybrwcRHCbWsjB7J6Z1q+7yY8LBWlZm08/4WZIg47zNv6tN+C
 ibseV19R5csewRASm/bybXAYSm6ZiSY8o4pvyLm8i6vEpsLGCrovtPftUY0PpcO5NeXOG9SouLv
 dGA==
X-Google-Smtp-Source: AGHT+IHWqeE8BFVPVT6kvWnNVQXq8J6YpXRu6YCZc8UiscUgLxWWW+xd6xqeMJFm/G50uShEipUgyw==
X-Received: by 2002:a05:6a00:4653:b0:736:5b85:a911 with SMTP id
 d2e1a72fcca58-73bd11f84a1mr1630630b3a.8.1744338273952; 
 Thu, 10 Apr 2025 19:24:33 -0700 (PDT)
Received: from localhost.localdomain ([110.191.179.234])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2198a7esm316781b3a.31.2025.04.10.19.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 19:24:33 -0700 (PDT)
From: Jiangyong Wang <wjy.scu@gmail.com>
To: obitton@habana.ai
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org,
 Jiangyong Wang <wjy.scu@gmail.com>
Subject: [PATCH] accel/habanalabs:fix typos found in command_submission.c
Date: Fri, 11 Apr 2025 10:23:31 +0800
Message-Id: <20250411022331.4511-1-wjy.scu@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Apr 2025 12:12:44 +0000
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

Fix typos found in drivers/accel/habanalabs/common/command_submission.c.

Signed-off-by: Jiangyong Wang <wjy.scu@gmail.com>
---
 drivers/accel/habanalabs/common/command_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 59823e3c3..c9c61687d 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1786,7 +1786,7 @@ static int hl_cs_ctx_switch(struct hl_fpriv *hpriv, union hl_cs_args *args,
 }
 
 /*
- * hl_cs_signal_sob_wraparound_handler: handle SOB value wrapaound case.
+ * hl_cs_signal_sob_wraparound_handler: handle SOB value wraparound case.
  * if the SOB value reaches the max value move to the other SOB reserved
  * to the queue.
  * @hdev: pointer to device structure
-- 
2.39.3

