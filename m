Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C610A9487D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 19:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C11210E32F;
	Sun, 20 Apr 2025 17:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cul4MKBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F99310E147
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 16:47:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7394945d37eso2250727b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745081271; x=1745686071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
 b=cul4MKBSLXFvQOAxAv/bXFyO0iJbe2QZIQTAUudLO5tHmR84kN8uyEJPdt0jZCUVQd
 V/HaewZmdgDESTkGc4UqfNa+yKuqKlBcZuROOtAkQhh+nD2Kq1RjRc4mI9tblCBUmiKX
 TR//tDRop/C6BYkZD/WU+6zKsQ72cqVJubWHm8kFwwO1d2lb+Hvl9sNjlIH0mtUcYmxr
 IrvTzs7zqQIGhIrECM7Qm1tMJ8ryukip07hOlLLeg17kFmRhFqDaST2lkhe/WTQ3JHVc
 oUC3l45fMROl2bDNlaYk3YavpqdrvqI7mjT5J7HSryn25oNKIZmV+cMERNY1Tgqgl81j
 4j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745081271; x=1745686071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
 b=XhKgKSTlzey12A/4Tjwd8LHI5Cu7Jj7HzxwTTLuXP5jX5t5Uap6rDJZTfAUNzl3bjM
 T5IWFNhCfZz8BhD5H2pRvhi8x3gbkVz0+7ySJgPj3yP3Ccz6gPuDV5ovnuxeZqwwJ0VE
 gGy7FhTGQVnVYXgl2CS51mo/gH3kx2NOBDPDYyLiwGzTVNIW7SYMlSZV09+6HWy82jwd
 f9+jP/FUeGwEIrz8wed73+QB1qQPpCJiwlWT82d+WbaRjzY3gU646eWJwWZRHN279J/R
 no/heEz0EjVB44gMWqXQmQ8mEJVu+bMrmjZBg30s04XsyVjSy0OVKox1IO59Y+ASAbE/
 Kkug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbfkgVLqtue4DAH2Aayw2YsqMLDAG1TrQWwB2viGx0jykcUUgOZT238Swxyp+RKbinwBtrst37LpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWHbETuf99qfDAhj5QiEbZdz/uO+rdLaGc2sM/UBSCNATPRVBX
 ogTht/Zge+7d5xGZPokop6RJ3/IktzH4Ab+mGVY0jKnZmWe4NkLSL/Gm3SfVziYFzjXZ
X-Gm-Gg: ASbGncskIZwYSlg7NK2+gQHQIw5rH0wei/hTX7Y+fSn0wixv84RYvBzcmu6slE2EbXk
 5hGDsz09CZahdHk/rLXJBFUq6AdHKM2srSeu5HMqSdmJAnEe2iOEz3d3LPJDPt+lGfzz0O+H9XK
 ACSZFCjZM4vKegPXWZeH5fe9DLirWOUnebxXIsHBP2Z/Pvom61yKMi3tiF4iBKAW23a03t3eKG1
 gWWUc9hhbCxa2t5qNBbNoXp5iRYeVikYd+QbwitmlBrNW/+JrrtEY90gqEXtaQ+hTxuwuRDwuOC
 otbjC7MB3nsOXQ8NQ+3DE8Ga1BUAKkgJMBDfSrjT286o/XH2NA==
X-Google-Smtp-Source: AGHT+IE196NOTtBedrqto5+VyN6Q2bVQflAXIVFzTCK7aHTA5hvuR7r83bs7gc5R54Ihg852juLtBQ==
X-Received: by 2002:a05:6a00:4484:b0:736:5725:59b4 with SMTP id
 d2e1a72fcca58-73dc14439f4mr7604376b3a.3.1745081270817; 
 Sat, 19 Apr 2025 09:47:50 -0700 (PDT)
Received: from 10.0.2.15 ([112.19.146.144]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbfaea91asm3497987b3a.167.2025.04.19.09.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Apr 2025 09:47:50 -0700 (PDT)
From: Jiangyong Wang <wjy.scu@gmail.com>
To: yaron.avizrat@intel.com
Cc: obitton@habana.ai, ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org,
 Jiangyong Wang <wjy.scu@gmail.com>
Subject: [PATCH] accel/habanalabs:fix typos found in command_submission.c
Date: Sun, 20 Apr 2025 00:44:31 +0800
Message-Id: <20250419164431.2393-1-wjy.scu@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 20 Apr 2025 17:31:13 +0000
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

