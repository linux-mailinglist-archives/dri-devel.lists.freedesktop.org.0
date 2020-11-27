Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628B82C6C3C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B56F6F3C2;
	Fri, 27 Nov 2020 19:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284DB6F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l11so8587919lfg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=elXwDkZqCWbwars/a4PGxe80QnxYqSvOiXbjb845R9M=;
 b=jQJJ5C2S7D8szVUR25mbQT5RmCZpktF7FWL3p0OS57iRBuna6+UiSzqrn5Pv3gOO5A
 2oILbhokAeBdbYfI3Zw+b1ya+RZ8KfyrTKG2dlmHl14lPej6x8/ZHQAEmXnhZDd9XI2b
 mjTFmyM/x5arLTXOpOJPImA/G99hdnc3fEderAiqRBNil5gdBOfzZ1UFUglTGLe8pBKV
 E7IUwNmbMUh0hVJWdqbomvCxozev0ljukOfKl2EdMhenNN7hnv83Pj/c3/qHSE2cATIu
 UuJbfK+LNozQUhL3a7jVRGNqgDpXbw8QBT6qEagMw51lQHDQMkERakZHJNbCWEO8moOi
 /Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=elXwDkZqCWbwars/a4PGxe80QnxYqSvOiXbjb845R9M=;
 b=KMIw/AwZTPsh5fxmWmLVBeQSD9Ydfimc2lQJm2RilUDNnLTjX47tTTG7ush9fBgqIn
 +YZDUwU+31eIlemcVntA5zGmseeTvsvlIyv/2RJ85A3ubzegtD9u+F609uWUsT9UnrzM
 syAzFbbrxEmNhA4tHseIZyMIrYcIcw5RdGWwUFYCzPtIxRZuGNnP9SF+mYES7bhR0UYJ
 DnfTxAKTFBKwoalFHDQS9vbk1fwCEt03D6jbHcMxg4Ka1/6kmPatRHeuoUL587Lq/L+x
 NEll4R4sRikL/wyO50FvjxoSaubOAnvMG6JxQJbvH74GeYjCPrAUmrVQaAS9luHiKvmx
 /tqQ==
X-Gm-Message-State: AOAM533KzIvFnLq1aGjzaFEWePsSkqIb8i5gTJjOLmCukAosZWeugO9e
 K90ybrFUxJKx/L3wcRKdOKY=
X-Google-Smtp-Source: ABdhPJyEvODl2X9feO2V1e8aOwadRfjN8fIygmoqxMNyeCNcXtYuBfiDpc2mv8qb3JKasYlmoB391A==
X-Received: by 2002:ac2:4559:: with SMTP id j25mr2183950lfm.511.1606507124592; 
 Fri, 27 Nov 2020 11:58:44 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:44 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 04/28] video: fbdev: aty: Delete unused variable in
 radeon_monitor
Date: Fri, 27 Nov 2020 20:58:01 +0100
Message-Id: <20201127195825.858960-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
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
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix W=1 about variable that is asssigned a value but never used.
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
