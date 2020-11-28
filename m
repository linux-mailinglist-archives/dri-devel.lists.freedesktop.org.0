Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D242C7635
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34F56E0D7;
	Sat, 28 Nov 2020 22:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35D6E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s9so10556720ljo.11
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZ9ZgHWmJyOywbHzVVtwWtTG6YhIEQd9QstxbodpcBQ=;
 b=S0c68Zk+pF34kAn1jifJ7j61hFiv24XXgHlCdXnCscJJaMe3DhkHymeJf31QSOWTZt
 w23t3x4hST+caW1FOsEXWM4cxQR9p3lqbEh01FmIhxTzm9IO0NoPvqNRsYy/7Qi9QRw/
 Kpwq1matftd2bCkk8fwc8H8+ZiQ5416y39eY8V1Pp9zZuxf2DW5K7r4Y3/6owZGkNFZf
 ZPUyUwqQZ+kAOZPuAahXFeTK8ifShm5ehxN++I6tZFO2+TUI1UXymRVycWkTtFsBL2B4
 MZEhjNIiM3C4MnnHsJjjIXUu4VAz3pKDuRWlgFvwMqdhkUC0UO7hdRVwB7sCK8YQzG/f
 bN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kZ9ZgHWmJyOywbHzVVtwWtTG6YhIEQd9QstxbodpcBQ=;
 b=TESulf5FzE5YuEvNPF5VHjuIUi7CsFQ7hpLZ1ReV+KYKApPy/1+VzoZjM0ZDwwllEm
 6frIfuF2mIIdveZSP3ohvlbVKBrF5GuLIBrw8e7SlQqCrwnQYRysf0xB2iDjsCprQH2U
 e2oLamWmUhtYAfJT+NCcCKZVkefEv14+fzjMyuTmzIHTpGPv/8noOW6QRi9/D+tIV5Wf
 ThH515cUvuGrLyJ+yFs0qVuQF0AJDpj3yPqFE9uV5x5OSZE4oHYns9ysFKu1NcNmqBPm
 MxssxevwmEGa8Mxs91X046oxRBDL3N+znT1mEbqsdmKBeUgU+H+sXZQpEUKtihs3Wgmq
 n5Yg==
X-Gm-Message-State: AOAM530WtglGX4lf8rmWrdajNXbMLhiqjNn8edDr0n0ORAsT/hnq6O/h
 Ni42wSzjIrf+RsE2fiIzmYs=
X-Google-Smtp-Source: ABdhPJx4ymyjTnrmJSY6wFWclm51YzQlOTykubVxGPg/z9CJJLqHiLChQ9ZhrpimkKUPyuqHo1PtyQ==
X-Received: by 2002:a2e:161b:: with SMTP id w27mr6607806ljd.429.1606603290409; 
 Sat, 28 Nov 2020 14:41:30 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:29 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 04/28] video: fbdev: aty: Delete unused variable in
 radeon_monitor
Date: Sat, 28 Nov 2020 23:40:50 +0100
Message-Id: <20201128224114.1033617-5-sam@ravnborg.org>
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

Fix warning about variable that is asssigned a value but never used.
The variable was indeed never used so delete it.

Keep the call to radeon_probe_i2c_connector() as it may have
side-effects. It is unlikely but I could not verify that is was safe to
drop the call.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/aty/radeon_monitor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_monitor.c b/drivers/video/fbdev/aty/radeon_monitor.c
index 9966c58aa26c..df55e23b7a5a 100644
--- a/drivers/video/fbdev/aty/radeon_monitor.c
+++ b/drivers/video/fbdev/aty/radeon_monitor.c
@@ -488,12 +488,10 @@ void radeon_probe_screens(struct radeonfb_info *rinfo,
 #if defined(DEBUG) && defined(CONFIG_FB_RADEON_I2C)
 		{
 			u8 *EDIDs[4] = { NULL, NULL, NULL, NULL };
-			int mon_types[4] = {MT_NONE, MT_NONE, MT_NONE, MT_NONE};
 			int i;
 
 			for (i = 0; i < 4; i++)
-				mon_types[i] = radeon_probe_i2c_connector(rinfo,
-									  i+1, &EDIDs[i]);
+				radeon_probe_i2c_connector(rinfo, i + 1, &EDIDs[i]);
 		}
 #endif /* DEBUG */
 		/*
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
