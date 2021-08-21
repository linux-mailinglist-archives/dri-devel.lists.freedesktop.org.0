Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A03F3996
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 10:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3356EB4F;
	Sat, 21 Aug 2021 08:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A186EB3D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 02:18:44 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id r21so9001477qtw.11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 19:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICy06zsKPY88E4K8E9mtKZ1ECGVlz+4+NHijGy1OXms=;
 b=Wci5lZvCI8k9tQqolpEzHPQrd/i8CUfaaa3O6E6N1crRhv73wLCgONGBGbXOF4FS7i
 Eq/Wk4CoqONSBwwG1jYY9eP+gtGYwV3gJ4XpaCJwf76vaGuN/H70NjO/W5rk0GxlVr7s
 kCUMefgx1R/QKTBtDhMTPcrpALRhCPfpy4GXMQ+OkzyNbZuCBFKbpfcEnRQ03GfrQxfg
 n+qgsJAH59Qo+mDiBamrlWQTn3n3imTNO8G7c0FVesseGjHy0+SBhZSW940KwlBNrrA/
 +zi8/u4uuSIHqmkuJrEp0Ne6poamr6vgLFf7j1WiJ7RF2dMluCIv1JmmVOCVbg2a3E5C
 0Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICy06zsKPY88E4K8E9mtKZ1ECGVlz+4+NHijGy1OXms=;
 b=pH5ixlwsqM/HZ3kUpjGsTrZ5YpIxNmgaX2Nxxxh2+HuzAc9KEjDUb+P6rnj8pOre9Y
 xxNelOBY5vovHXJi8XvQWnICPa7vzeOjz1NC12RS6RSbWYL+wfN6rcrhs/Z5mtneG5UT
 JihrQnYmADinOnN7cJFUcqOhnjZduirytjNJpYWZ/DTXnKMfmunKc5fWaCyQPUo9nw4C
 sHNFZX8BYaVzycpbmmkzAZllvFN6jMmgSf7dYGC1IYYGzpbCBsHT501gCld+W81gJpYI
 KGZWIEBfKEsGiCkPyNfmW6j96LFNBq/B1p0bnCbTWKtz6nrHw5Ry5BXFnzqnRY3qWeUc
 INnQ==
X-Gm-Message-State: AOAM532lELYG0kqN28RjkLmKLEepSOsvwuev65F/QKpuqVHlXZqiGaLC
 2xhfMg6BwdBnLTOVSXHrZX8sNTWOEoc=
X-Google-Smtp-Source: ABdhPJzzUXmVc10/csCH0VPL4FXF950um6EZtMywuLnbfpe9CVLhFsPMgUZxj5OaslRyJwsDcruOEw==
X-Received: by 2002:ac8:7c5:: with SMTP id m5mr14013073qth.180.1629512323881; 
 Fri, 20 Aug 2021 19:18:43 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id c7sm3655813qtv.9.2021.08.20.19.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 19:18:43 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <luo.penghao@zte.com.cn>
To: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luo penghao <luo.penghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] video: fbdev: mb862xx: drop unneeded assignment in
 the mb86290fb_imageblit8()
Date: Fri, 20 Aug 2021 19:18:33 -0700
Message-Id: <20210821021833.27238-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Aug 2021 08:46:30 +0000
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

From: Luo penghao <luo.penghao@zte.com.cn>

The first assignment is not used.In order to keep the
code style consistency of the whole file,the first
‘ptr’ assignment should be deleted.

The clang_analyzer complains as follows:

drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:135:9: warning:
Although the value storedto 'ptr' is used in the enclosing expression,
the value is never actually read from 'ptr'.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Luo penghao <luo.penghao@zte.com.cn>
---
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
index d40b806..61aed7f 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
@@ -132,7 +132,7 @@ static void mb86290fb_imageblit8(u32 *cmd, u16 step, u16 dx, u16 dy,
 	cmd[2] = (height << 16) | width;
 
 	i = 0;
-	line = ptr = image->data;
+	line = image->data;
 	bytes = image->width;
 
 	while (i < height) {
-- 
2.15.2


