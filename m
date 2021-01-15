Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052992F8363
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF986E45D;
	Fri, 15 Jan 2021 18:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FE66E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l12so4976510wry.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2J3GjpOO3HekYRLC9b6PVtgl9N3gd4w+azAVwpWeog=;
 b=LxwyehuC8GrWwvLbGs+Rh5yjqTjMc92zt0+XsCWcB2L6OviLjYZJ+vhBjbplszNCXn
 g6TyGID0z2rgR55jgd2irYjclgl+gS0Jqnisd8W2QFF8g1EtL6hZu2p57vGbErjXtCbh
 FQB1weosVOThVbi05jFtscL+11qNHfhw1DZfFu4Rqp22rz+Q2TxSRx9vgqHlaaH2pQjx
 r5LyEptMvzxNzv/Au4o2h/UsGeDxr/p7tv9/ip9axINBqq9d/tuojLnV4JwHHFYOgL67
 zn36WMzXqgJ+z8DBDANHuLJcsV4OOEsOCWwOYWfeoRnL6u0C1MZjtX0kdt8k8KHMCIs8
 gGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2J3GjpOO3HekYRLC9b6PVtgl9N3gd4w+azAVwpWeog=;
 b=L8SVeH+Ege6oJ6pW5JLLUcjnh9uSCYKsjiSgIsBisMClSIK246hMnUJOqbtYN5/4y+
 nQ1eZ/gEpLkhv5Ue+CEyALvvZzIuL4J/E9m5J5nhb4AQ+LecoDRTcK5mCXAsRusyvjqr
 r8pBAeO6nKOH72gMLNwliHACAe6NWFgFkc0R1ItZlqFK7+EQk4HBnPYqHzj6LnZVsS7U
 ybjo9sq24uiNgna3br5/7F04wimSwa4pnCncPOntFgj1ITjoJfrlAzqgyias9gi0FpYW
 GaRNzzUxtedv7pX0E1J6FTlUl/l350UDYlUGXFmqJEZK8UBPZWHMqwxGVSdfAd6J57x9
 4quQ==
X-Gm-Message-State: AOAM531cguufKJnP7AWHalP/lkbqDXO36DajU8egjys2zMrfhtO75+LB
 c5fgLPaDVxB/l5r1E2mX9+irjA==
X-Google-Smtp-Source: ABdhPJwFsstq3kKhxXDJeD6jx43iN+/htYNp695e9BAORta+J3PbuXxbkAN7oi9iI0hB/Ug9WYwRQw==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr14406677wru.174.1610734403031; 
 Fri, 15 Jan 2021 10:13:23 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/r128/r128_ioc32: Fix formatting issues in
 'r128_compat_ioctl()'s header
Date: Fri, 15 Jan 2021 18:12:38 +0000
Message-Id: <20210115181313.3431493-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/r128/r128_ioc32.c:182: warning: Function parameter or member 'filp' not described in 'r128_compat_ioctl'
 drivers/gpu/drm/r128/r128_ioc32.c:182: warning: Function parameter or member 'cmd' not described in 'r128_compat_ioctl'
 drivers/gpu/drm/r128/r128_ioc32.c:182: warning: Function parameter or member 'arg' not described in 'r128_compat_ioctl'

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/r128/r128_ioc32.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/r128/r128_ioc32.c b/drivers/gpu/drm/r128/r128_ioc32.c
index 187bdc435cb54..cdeb1db872226 100644
--- a/drivers/gpu/drm/r128/r128_ioc32.c
+++ b/drivers/gpu/drm/r128/r128_ioc32.c
@@ -170,13 +170,13 @@ drm_ioctl_compat_t *r128_compat_ioctls[] = {
 };
 
 /**
- * Called whenever a 32-bit process running under a 64-bit kernel
- * performs an ioctl on /dev/dri/card<n>.
+ * r128_compat_ioctl - Called whenever a 32-bit process running under
+ *                     a 64-bit kernel performs an ioctl on /dev/dri/card<n>.
  *
- * \param filp file pointer.
- * \param cmd command.
- * \param arg user argument.
- * \return zero on success or negative number on failure.
+ * @filp: file pointer.
+ * @cmd: command.
+ * @arg: user argument.
+ * return: zero on success or negative number on failure.
  */
 long r128_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
