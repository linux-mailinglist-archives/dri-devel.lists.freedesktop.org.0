Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39E4F3F65
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929D110E269;
	Tue,  5 Apr 2022 21:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C3A10E269
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso411840wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EmOaY3X+UzOd3pPiVPd9yA17wGGx9u9yHzR4JJcIBQg=;
 b=j+XliKJ6kXANBjdtgyve2RxlWQewDg1F5yXlFuvu3EF1JqD2j6vPL4SUquS3KAPU0K
 zP/CT6ddM704lb3Z2VspQrEOSlPl6y/zmmZ1EgkXBJ1lf0Xh5Vt8bLkgaC1BgoGAMrkd
 /ed1COEsfeJxE4vcgLAlqRXFQxptD1z6bRXA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EmOaY3X+UzOd3pPiVPd9yA17wGGx9u9yHzR4JJcIBQg=;
 b=LFopqkgTDoz4T/zRc64FyEt3bH+77tCsG/H2V0WIv2Br4l4IHl8ltap/x7GLDQ1Sv6
 mJrnYO6VF3IQ5o3xZjXCBfo0o47lwXTkOcPYOF9OhR7JVy4+DC0e0wIzazYiZOTPkBqC
 zLHfwJDQXe8U9ynAqoOBW38ptePqkAHdhKrhmHZMcR4jQ75m4Dd+Q5k0DpVShvhICvPH
 kigJd7an133SAepXJIVSYRnEoOsKtdQVosYuY17lBfWdGOrqPNofeSUaSuvz0srGgaPa
 R9o5QCllsugu6TDUWOqakw6iYKU/TsUVJlidPPxjvAlBd+KQK+zEWBiiCZdyDp3tF2dB
 DmDw==
X-Gm-Message-State: AOAM53316QYbp4WD8uUwJDnN6Jb7dFgItOGJY5ZHVk1p5IR92beHlQDY
 CR6iUqWmWYABOzXwjdRAm3Vm9gE7uYaUjiwgViA=
X-Google-Smtp-Source: ABdhPJw+D0Cg8RRWzYqb5QOhMmnklaJ31pGCpY1jjaALOB3p+zdqhVAAqhHrNW7Xu3rx9Wxt/gNFSA==
X-Received: by 2002:a05:600c:a48:b0:38c:c582:c3c7 with SMTP id
 c8-20020a05600c0a4800b0038cc582c3c7mr4721862wmq.171.1649192621411; 
 Tue, 05 Apr 2022 14:03:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 00/17] fbcon cleanups
Date: Tue,  5 Apr 2022 23:03:18 +0200
Message-Id: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Finally got around to respin this. Changes:
- Bunch more acks and r-b, still not yet all patches.
- one tiny fix for a bisect issue, end result was all fine
- I dropped the last to patches to make registered_fb private, that needs
  more work around how we handle the unregister vs driver load races
  around fw fbdev drivers.

Review and acks on the remaining patches very much welcome, I'd like to
push this pile.

Thanks, Daniel

Daniel Vetter (17):
  fbcon: delete a few unneeded forward decl
  fbcon: Move fbcon_bmove(_rec) functions
  fbcon: Introduce wrapper for console->fb_info lookup
  fbcon: delete delayed loading code
  fbdev/sysfs: Fix locking
  fbcon: Use delayed work for cursor
  fbcon: Replace FBCON_FLAGS_INIT with a boolean
  fb: Delete fb_info->queue
  fbcon: Extract fbcon_open/release helpers
  fbcon: Ditch error handling for con2fb_release_oldinfo
  fbcon: move more common code into fb_open()
  fbcon: use lock_fb_info in fbcon_open/release
  fbcon: Consistently protect deferred_takeover with console_lock()
  fbcon: Move console_lock for register/unlink/unregister
  fbcon: Move more code into fbcon_release
  fbcon: untangle fbcon_exit
  fbcon: Maintain a private array of fb_info

 drivers/video/fbdev/core/fbcon.c   | 692 ++++++++++++++---------------
 drivers/video/fbdev/core/fbcon.h   |   8 +-
 drivers/video/fbdev/core/fbmem.c   |  27 +-
 drivers/video/fbdev/core/fbsysfs.c |   2 +
 include/linux/fb.h                 |   1 -
 5 files changed, 333 insertions(+), 397 deletions(-)

-- 
2.34.1

