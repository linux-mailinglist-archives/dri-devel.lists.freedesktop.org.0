Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257AD23A821
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 16:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06856E04B;
	Mon,  3 Aug 2020 14:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4416E04B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 14:11:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 184so15601311wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UAnP6E5TPeMdf1SeFFPVmgwF97w2X2IThLR1O4ARXkc=;
 b=CXs8wayIt9gkwiEND6J4tnORfRlfqI4dBUO/SU872gahC4Q4k7r7xqgNDX3DmyeY6U
 XXNdebKUqyc/PObSAdx2U+RvTVU2VvDDBYxb6g+gotbon53TQBPj7Dr/N8jE94OOF9zd
 VS7FBulmM5S8s6FeqX/9x3wG82TCUOcfYiAqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UAnP6E5TPeMdf1SeFFPVmgwF97w2X2IThLR1O4ARXkc=;
 b=ekJXNsZLxxoTJpm+gpA5c5VfKmBKfmLypxT139IeGR2Ui/Wg8zCGvExCBe4Pasq6eY
 SyRLfXdS9BPO1+0SPeQMtf63JFRrS72TvB6g8v6O3Tb683kQKawwZPpAAKMrXwpMlmBz
 hwlFeuM5fr9Q4ySNaFE1X7zGJ+adeUNIU7W3rPN9V7tyf2TjazocCuegPmmPTTiAuVl0
 qyUZHvQlLspmC4VIKqJrk2tEfnsPiRqsGWOS7Fme9bvG4wVK+S/wZafo5OBQl78aMbFq
 WbvAR7Ne8TMXLsMx3Boxz+9q2FgqBnN9HfOVdoYqnRbcg2hspIGsZusCKKk0y8/r7Hfj
 VX/w==
X-Gm-Message-State: AOAM531C8hDAlCOEkobsg80O7XS12u1KMm5giRsH7vZgSXCHHXSv4Xxm
 AakiWApI2sf8WL35XmE/2ET3vw==
X-Google-Smtp-Source: ABdhPJw8ovdXsMle2mqTETLoD1e1Q8sFNlfkx9e/fXxnzUHfWMx2Q/5woZYfJ03+EnQGocc0EknlCQ==
X-Received: by 2002:a1c:26c4:: with SMTP id m187mr227846wmm.90.1596463916859; 
 Mon, 03 Aug 2020 07:11:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l18sm25376005wrm.52.2020.08.03.07.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 07:11:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: enlist Greg formally for console stuff
Date: Mon,  3 Aug 2020 16:11:42 +0200
Message-Id: <20200803141142.1606661-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Greg KH <greg@kroah.com>,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I did a few greps for main console data structures, and there's a few
places outside of drivers/video/console:
- a braille driver
- a sisusbvga driver
- fbcon, but I think that's fine if we leave that officially under
  fbdev maintainership
- lots of stuff in drivers/tty/vt, which is already under Greg's
  maintainership.

So I think this match gives reasonably useful Cc: lists for the files
and places I've tested.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Greg KH <greg@kroah.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab94723c0cae..8084d118892c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4343,6 +4343,12 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/connector/
 
+CONSOLE SUBSYSTEM
+M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+S:	Supported
+F:	drivers/video/console/
+F:	include/linux/console*
+
 CONTROL GROUP (CGROUP)
 M:	Tejun Heo <tj@kernel.org>
 M:	Li Zefan <lizefan@huawei.com>
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
