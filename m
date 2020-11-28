Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664322C7638
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1026ECBE;
	Sat, 28 Nov 2020 22:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF8D6E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:39 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id t6so12711200lfl.13
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkkKBlbXcP/dpbOfp8AnQrPHxu0MxowQOk9O/jfPEvM=;
 b=myfU0/b/5BFYwWjwwEIJ580+u3RvEPUA2rg/ubozChfVxxDlaoKNZhuFfnDH0A5lrG
 Tkjm6VvYHDbp+kfHTtLsrR5IB4+2ywduPgh/R6Lia2iz/HVW2S/38gl+oCUAbTF588SD
 pnYfdcRPs/vK8bODBe3Mi+MI9yGQSUya1bejxklUrGBtk1OmDAKhiYGGl3P+djpopBhr
 xGRQSWwMN4hU6eGB7OibLrx26ww6spt5XEdh/kEjzKPS4LzNmTmqv4Ud8s7leX6vmfsN
 BcwrEHhPrxkT7U6CrheID/979KvzyHVQUz9rayaWEtR4xuYTrMohfC9rgMyNx4iwnc1k
 0kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CkkKBlbXcP/dpbOfp8AnQrPHxu0MxowQOk9O/jfPEvM=;
 b=KBDL9m6BA4eeBkrDG5DwYPGdaGVjUAKosRhmoSrBjf8ZhhKkH9dek4zO3/DN+duSpm
 pAYLfoaTaQkYdGq1XL/AUu7jXQCLK0lbNAIh1krY5YgpC0w8CkVAHAwfxajz0iEm7BnN
 zOlD1KxuSQnxzVvOfKo1vF6wYvWKeCxQeOR6VNX1KCf9dm4bEl9/+nQkTuWAIyUMSuFM
 HPuF9cRoowz2fWYsJg4Ot/ognP7knASquuDoRoqPdpFUTKhOc3Caq0wDyz2ylXTeB27d
 1kc+cNz9ySSPGPlGk/FCw8IgXkoGkei0DzrUFROuW9joQzEp2WE1uHMer0qtPGo4ijTO
 DYsw==
X-Gm-Message-State: AOAM530sNsq2ZtWUEPL+GcwAbASzzlUHMll98NpdhNpf1HK1XTvj6Lm3
 kTU6JiPu/6jtGvNzIyWMshs=
X-Google-Smtp-Source: ABdhPJw3xPU1N65OeV/W6wReXcoA9gIj8j2aMYlOo4jhEeadsqD44d7njz7QpKk4AOXAGGCfHn7uYg==
X-Received: by 2002:ac2:5486:: with SMTP id t6mr6432455lfk.138.1606603297672; 
 Sat, 28 Nov 2020 14:41:37 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:37 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 08/28] video: fbdev: sis: Fix defined but not used warning
 of SiS_TVDelay
Date: Sat, 28 Nov 2020 23:40:54 +0100
Message-Id: <20201128224114.1033617-9-sam@ravnborg.org>
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

Fix W=1 warning by commenting unused SiS_TVDelay* variables.

The SiS_TVDelay* variables seem to contain some magic numbers
so looks like data worth keeping around but not as code we build.

v2:
  - Update subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/sis/oem310.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/sis/oem310.h b/drivers/video/fbdev/sis/oem310.h
index 8fce56e4482c..ed28755715ce 100644
--- a/drivers/video/fbdev/sis/oem310.h
+++ b/drivers/video/fbdev/sis/oem310.h
@@ -200,6 +200,7 @@ static const unsigned char SiS310_TVDelayCompensation_651302LV[] =	/* M650, 651,
 	0x33,0x33
 };
 
+#if 0 /* Not used */
 static const unsigned char SiS_TVDelay661_301[] =			/* 661, 301 */
 {
 	0x44,0x44,
@@ -219,6 +220,7 @@ static const unsigned char SiS_TVDelay661_301B[] =			/* 661, 301B et al */
 	0x44,0x44,
 	0x44,0x44
 };
+#endif
 
 static const unsigned char SiS310_TVDelayCompensation_LVDS[] =		/* LVDS */
 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
