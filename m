Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA211F8FCF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8557E6E297;
	Mon, 15 Jun 2020 07:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3E289E3B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:48:41 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49ky6d0nkkz9vJyw
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qySLg6qHyodi for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:48:41 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49ky6c6JxGz9vK04
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 20:48:40 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49ky6c6JxGz9vK04
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49ky6c6JxGz9vK04
Received: by mail-il1-f199.google.com with SMTP id w65so9441246ilk.14
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 18:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwS4iBH2TfaLSm/U9G8+/YZNlczPHmpLDZOOCLUssn4=;
 b=RAyZt079t6nAq4cI1GjMxaPYT9VqopIavYteGGrGjDji87vThIRg/BA0tMYwaPtsu+
 tYxd0WIABoM2N1EnOJoz9izoR1COivh5fagyr2hqq/4//15ubkqcuDEV8JHMEMvzNr1e
 WmwI0+9W/XP2V1LCMXiiwYciZVYKUhKGVvMAR7p0WXg9A3SclX5t11hlSWgOGjlONrt6
 q06KQtiSE6yYuT3xfPzvWWzWP56aIpRgfpWgBlL4DGlRkZOjSiTBp2Jdkw9gvr9ce9Ui
 QQkgtZC3UkO3J2zyUO2yK6ydDDQelAtrpY7YL48bv8PpRYSbhDkHJ+3DHrwnYMy0Jf+N
 DP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwS4iBH2TfaLSm/U9G8+/YZNlczPHmpLDZOOCLUssn4=;
 b=O3lQOMP09NT5sBfAGo389zsI/Jl9DR7T59LEPArGSA0GLWUIhtc/PoV9qSm7x64Cfe
 Kl4v4Npa5LLJe5vyKhfUCK5heJkayNGbmv5dSlvlBrELR3kDVYIwtKck4BTPzNyAsbht
 o7y2OusF64pyBCSDWGtKioNHF0rImBVvIvKPkutbu6B3uW0TizRz2lwM14HR5fXiEdVn
 XXrsbRPANSXYOs5YSId/N3HrDefhCHQi2hFDmsjVAzDkLQwOtTcy4q+VK9MJXH9f8Q3t
 t/xk3fS78varu5WuHVlCcxzyibRRir1sdfw8c6MY0wgpP24p0G2cd1vojHaTjllsc6x/
 yHeg==
X-Gm-Message-State: AOAM532EO4t5bLJ2vykpbmnHHrTdTZN4OHCxWIzLDQpDePbOHcpgy3+q
 7a30ffIrqFWm7ikDRP69Ix/WmzURUwgGXwALNdu6PNQxtwdObEOFHCrOJ+1qdaXUwkBr+Ud5XtN
 c4hxMnQvaNlA7KK2w7X5sE9HGXQBxC+kz
X-Received: by 2002:a02:8529:: with SMTP id g38mr15074446jai.143.1592099320332; 
 Sat, 13 Jun 2020 18:48:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQlNEPoOQIOiFAjrDKzToAN2cpikujTxQg4Kn8KjyoM4aKnt/Ueavi58mg3qK8fmxA97Jk3Q==
X-Received: by 2002:a02:8529:: with SMTP id g38mr15074434jai.143.1592099320183; 
 Sat, 13 Jun 2020 18:48:40 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
 by smtp.gmail.com with ESMTPSA id n21sm5598507ioj.43.2020.06.13.18.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:48:39 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/noveau: fix reference count leak in
 nouveau_debugfs_strap_peek
Date: Sat, 13 Jun 2020 20:48:37 -0500
Message-Id: <20200614014838.123171-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_debugfs_strap_peek() calls pm_runtime_get_sync() that
increments the reference count. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 63b5c8cf9ae4..8f63cda3db17 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -54,8 +54,10 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 	int ret;
 
 	ret = pm_runtime_get_sync(drm->dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(drm->dev->dev);
 		return ret;
+	}
 
 	seq_printf(m, "0x%08x\n",
 		   nvif_rd32(&drm->client.device.object, 0x101000));
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
