Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5CD251305
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E10B6E879;
	Tue, 25 Aug 2020 07:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8B6E045
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 14:52:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so2930586wro.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=maYxkadvfVGHjTEoYFrkgW4rniaUuEx8JmifeotSE1I=;
 b=AsCueFr5jn9blAC4tR/EED5jjVRIvRTyBnu2Byudhgi0GeZB1rK4e4rxcO5s3mmf54
 qrmG6fYf0abHZzh5gcnwt36qLw0Hr3sGY9A2m+JwLEY3IOTWVhHen+Vvg8Ln5rpCJSUZ
 WfkeFok8pN2RAKPDxy5C2paWFQhXTXtewfVAJttB8ku16cx7JmisjZUFKbc9SMS9HVvQ
 KQqe8TDNvGy/nR9jy80qs3QHDLZlAUDBBmBgKW0xpT7g0g2yPIi89V4o+8DkHJh5K2oI
 dlVYSHTEu3Tt+LJdlngi3FJ0LvWXv/KdAgq+BNrK1EuHzLP9kvsk2KVkspYLctHOL0hb
 heYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=maYxkadvfVGHjTEoYFrkgW4rniaUuEx8JmifeotSE1I=;
 b=Tsbo4lnkJbjsbI/qPkem1kEtlzYoGcK2VmDxYIu+JMHtqTPhmmeBwE2633iLIWMeDt
 BuAYjBUDcSdbUMA2uBud3zLvY81uz4/EaeI5qJwBcTuhYqGoTo5WCm5ru2TMj2UtFdn0
 ttg6I71pUgUB+AQMkDcUTwnAK9DOJV2wyD6gXxY7hj6wdGcMTigIPXTMJ3yeSWMI3RoB
 lrK9L3pxkTw4X87jfwAZlbzJQ0+dzlD/+IdKYSu+dsHEPBmcTSeUVbUdphS5Dai8I0oX
 uUG8oHAbAS7SX6OGzA++lEQ1bFJDEjPJK3WpHO+qdHQoUCdgrkRwcZ2RQ+jcRa4vKhDA
 PcRw==
X-Gm-Message-State: AOAM533oOoMZ1rqKjOJ5xzNwBCF4OGBZ+YfP4C7EtDTzkNXtoXq/ycLA
 mOyRUwyxtYti/JcWAkiQWCs=
X-Google-Smtp-Source: ABdhPJx/c+hJHlTuEfjleVzvC1y+b9nSw/44sBGPW74jQ37/FppAKE88ZEXjAoN76vHKzlvkqVF/rQ==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr6275431wrm.269.1598280757560; 
 Mon, 24 Aug 2020 07:52:37 -0700 (PDT)
Received: from a-VirtualBox.Dlink ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id 126sm25953778wme.42.2020.08.24.07.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:52:36 -0700 (PDT)
From: Bilal Wasim <bilalwasim676@gmail.com>
To: b.zolnierkie@samsung.com,
	corbet@lwn.net
Subject: [PATCH] docs: fb: Correcting the location of FRAMEBUFFER_CONSOLE
 option.
Date: Mon, 24 Aug 2020 19:51:55 +0500
Message-Id: <20200824145155.42502-1-bilalwasim676@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: Bilal Wasim <bilalwasim676@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbcon doc mentions FRAMEBUFFER_CONSOLE option to be under
Device Drivers->Graphics Support->Frame buffer Devices->
Console display driver support->Framebuffer Console Support,
while its under Device Drivers->Graphics Support->
Console display driver support->Framebuffer Console Support.

Correcting it in the docs.

Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
---
 Documentation/fb/fbcon.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
index e57a3d1d085a..a7b487cba307 100644
--- a/Documentation/fb/fbcon.rst
+++ b/Documentation/fb/fbcon.rst
@@ -20,8 +20,8 @@ A. Configuration
 ================
 
 The framebuffer console can be enabled by using your favorite kernel
-configuration tool.  It is under Device Drivers->Graphics Support->Frame
-buffer Devices->Console display driver support->Framebuffer Console Support.
+configuration tool.  It is under Device Drivers->Graphics Support->
+Console display driver support->Framebuffer Console Support.
 Select 'y' to compile support statically or 'm' for module support.  The
 module will be fbcon.
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
