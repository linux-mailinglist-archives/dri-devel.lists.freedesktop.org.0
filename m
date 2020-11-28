Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73C32C763E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F4E6ECEC;
	Sat, 28 Nov 2020 22:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C3D6ECEB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:50 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a9so12760918lfh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJAdUrz4ca7tfhiVcvgtW18I/nrA8jkf6C7iRqjMNko=;
 b=jw0XiTnG1d1FmK/nuR/ygglGF41RFTNhbtqRR4OgEIBNX7fGeJyhCvlk/0UlZRGKhB
 hKpP8/sw22FxPKeVQnZXQTW3RcdeEsePU+TPneGrAY0HjyODWJqvkev+48AE+hMGHm5W
 eRm2UC+/iJNksDrQqhipr6yJhi0Vu3fyqdS+/buw7s9W2v8X8rtTtPDMNG1oPx5UxN9A
 DC0eByQ8YOtISYigmNx6DkpQyqREe+gFGr8aw4FOZS1rkq3bYIw0qJs1WX9/XdrbmAia
 LZ0ksCOKhZV7S2ujB+/VL2D+N/NV4dhmvHa/Sf55BIwWXlWB2f6QjbtQJd18M8dx+aUx
 08BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dJAdUrz4ca7tfhiVcvgtW18I/nrA8jkf6C7iRqjMNko=;
 b=q1/QUSTgN5DIsAwml3yxojUsc1BDfKCZshnXwY7UWKHmNRPTcwFLE0oWNxrMkj9d0I
 MBMgzbRozkPTPoFcTzE7602AzMWPIdvfCyMexZtcV4igAKoeS/zSjpfKlVcWZ4FmV5QL
 ZO30D7x7CEmqK80q/A2u1FZ/x5cAazze27XLbHowYlm2I0jtnlPbCfSsh6mPnT77Knql
 LM2ZxbPgTRZcSLp32S8pLeFthW5gpq/r7+ky9+KMF7kNL1j4sK0dH0WZXfuFKGItEm89
 tUjwm0LZVFbT8FvaWXT9tyKcJh6Pvk2vxhTMm49S/rK2eC2uPkbQt/ix+BcXvS5wwCzt
 S65A==
X-Gm-Message-State: AOAM530MLyxdOC0HR02KR7qCJ+kxV+N7wVYvADHCNU781m7UmvbMVIcl
 hW7afe40nWXuxKsmv8BG4E8=
X-Google-Smtp-Source: ABdhPJxVShbJ+jm3V2ncKID7nCBgc+IaHjlX3fKlU4tIxi1G3MqUw0FNx7BKk5v9g3hGKwWd3UTV4w==
X-Received: by 2002:a19:ac02:: with SMTP id g2mr6371043lfc.536.1606603308761; 
 Sat, 28 Nov 2020 14:41:48 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:48 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 14/28] video: fbdev: pm2fb: Fix kernel-doc warnings
Date: Sat, 28 Nov 2020 23:41:00 +0100
Message-Id: <20201128224114.1033617-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed a few kernel-doc issues to fix the warnings.

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/pm2fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 27893fa139b0..c68725eebee3 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1508,8 +1508,8 @@ static const struct fb_ops pm2fb_ops = {
  *
  * Initialise and allocate resource for PCI device.
  *
- * @param	pdev	PCI device.
- * @param	id	PCI device ID.
+ * @pdev:	PCI device.
+ * @id:		PCI device ID.
  */
 static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
@@ -1715,7 +1715,7 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  *
  * Release all device resources.
  *
- * @param	pdev	PCI device to clean up.
+ * @pdev:	PCI device to clean up.
  */
 static void pm2fb_remove(struct pci_dev *pdev)
 {
@@ -1756,7 +1756,7 @@ MODULE_DEVICE_TABLE(pci, pm2fb_id_table);
 
 
 #ifndef MODULE
-/**
+/*
  * Parse user specified options.
  *
  * This is, comma-separated options following `video=pm2fb:'.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
