Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97A330923
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 09:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9170C6E822;
	Mon,  8 Mar 2021 08:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0071189CA8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 06:42:57 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d23so1175656plq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Mar 2021 22:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODgkqx4pNeJ6A9xIx1+aI4dlTAb9Gpe0ejgF29HEIfk=;
 b=LM8gwnrjgswn/vWyVxVAEljwIlFgjuQFE/1uxZ4lzYO5Lr/DZ319KAz2ixUuVy6Xf3
 yztij+p69jUhyp75XLlnQola2FEvFtk/nerfjwh4kJmWsv/ZKGlXPPJigG5RRLfO8Mph
 e3j9Qfjkx3OsQdDr7pdFj/U/NifroFGWbssHxz1D8MQ00CvbNjSyIs/KsSxvZKjGRsds
 PDbC4GZ19+EiFp37E/PbvGmbd0QFGWoCAyDjFNCVC5fSFn+HrReThhXxIGM2/pdxUKaN
 qN4d42Jgv6lSQr1/jwCCFbO+UPREelCwZtZMd6ORNpVyJi2RPYD+WoPw+UiY83QmCh3h
 H/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODgkqx4pNeJ6A9xIx1+aI4dlTAb9Gpe0ejgF29HEIfk=;
 b=L0rBmyRRjtCVnA69jFT2hNi+FIthwKPEsB/Y7ZOowX0iP5Mk8t5fo8UspBNpq5FI+N
 yOQZ69ndq4Rk3F1Rp547/CBKo08a85YmR7KlvRl0WoLm3dSczp1zo69iwJfDScIF4cti
 3PHm11rUSQeAnLt3mWkPf/L9QYwud7IkNDhzHs5y+nxf6VRti9m93dXJEYm7Qh+xHLK4
 02bQ0i7mUu8Wz2699UujV6+iyLaycvZtb4qxJRZZ2iQALpsRz3AL9RLFNngMXJP18FAC
 IeS43YiyO1OH5LsM4LSXQgrsyTYa7pmxgTI18QtIVaS75sjlz+rCU+4HZr28kaHlmyZ7
 Eolg==
X-Gm-Message-State: AOAM53079DL1vFDGRYYv61JTySCFSyibhFT3kv/5/CtUOgOWUnY6KxL+
 5qrdCq+GCbBZ/Vr3p+DYDL8=
X-Google-Smtp-Source: ABdhPJxbJGuwvYp5m37Td+Zd9pm+Y8TY9TO2AIXXXeV5YlTVQpVuoVoDcqLXAPXsL8YFMzTAPU7Gfg==
X-Received: by 2002:a17:90b:1105:: with SMTP id
 gi5mr22931041pjb.26.1615185777606; 
 Sun, 07 Mar 2021 22:42:57 -0800 (PST)
Received: from localhost ([113.92.199.103])
 by smtp.gmail.com with ESMTPSA id n126sm2972018pgn.66.2021.03.07.22.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 22:42:57 -0800 (PST)
From: Jianhui Zhao <zhaojh329@gmail.com>
To: linux-doc@vger.kernel.org
Subject: [PATCH] docs: gpu: fix typo
Date: Mon,  8 Mar 2021 14:42:50 +0800
Message-Id: <20210308064250.3681707-1-zhaojh329@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Mar 2021 08:05:40 +0000
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
Cc: corbet@lwn.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 Jianhui Zhao <zhaojh329@gmail.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 40ccac61137e..b7f1acb355f5 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -700,7 +700,7 @@ Outside DRM
 Convert fbdev drivers to DRM
 ----------------------------
 
-There are plenty of fbdev drivers for older hardware. Some hwardware has
+There are plenty of fbdev drivers for older hardware. Some hardware has
 become obsolete, but some still provides good(-enough) framebuffers. The
 drivers that are still useful should be converted to DRM and afterwards
 removed from fbdev.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
