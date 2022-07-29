Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1165585611
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 22:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE79F10E27F;
	Fri, 29 Jul 2022 20:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F7910E27F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 20:24:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p5so7085431edi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=DD5ZTUFuKAP0HflbyT4tZofzegaYKmqv/uxWG1vqBO4=;
 b=Jm3l9HhHkx5hqABQOnfdln7qyATxQaRlBiOS5jsXIeXPzxxoAoLnBwmesVJ4gbG2cq
 Jm3PvjjOK+aW/VJqiIiPG1ccR5fKellIuDnzJ3J85hU++B35mEU9gMlNeK2AxEbScH27
 YZ1DrToUrRUkJRdKhmH72EMr2YW6Xv2WTp+X8rOqKxKZnKsxxam2whmLHQMXJlpfT5f1
 RrMlid5be+mecjbVQPP18JzrPep22/VkW7CnjW2b4CFY4GhOkk2wBT4+ms5aosZmhfut
 62jNX0H8y9n06SWlIoZ4FaRheLKx4sTeyYuo8QLpYoSGqQZ7wmXcT21Kgjz40dejhudN
 Xa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=DD5ZTUFuKAP0HflbyT4tZofzegaYKmqv/uxWG1vqBO4=;
 b=wqaUlqiYtV8BxsJHOaNatVH/oI6Ueq6iQvdUcUtx4s1p8LU1oecgIS+X33NGPO6hKA
 kYlXIXPTaw6XNAlRWYRQ+bhX4HyF96m1WjiAXF6NGIF++whp2CyG1utyvD/x9HtvjoXU
 FoxwWsWWPEMKqLiP6I07RVxQpsU3o8SLU7FIS6dVJRDiysCmjAUBVS3MMPhdX1RfRxRG
 c+Baua/K4JsoQu/1pXIyA0fNHhWl4DpuseDCJ+BtNnt6d6m/PKwy8tqQST9EiLQrAtO0
 UAQ5/6DTfniHurcfEwJpU7iTb+tFQevkKwdWwYwchm09hCPbd0WwU2PHWLawS0WbsZHS
 8OIg==
X-Gm-Message-State: AJIora94DqRuJfYXWJd8fKynHWO295UQLb0vFFdYR6iydd/lxSjYTJk9
 YWnbJSrkF/SNr7bRbHeOnk+b+KHhAywKuzmfLxo=
X-Google-Smtp-Source: AGRyM1sJGV43E1lWJdEwZnroFIFGxZkNFN0msL97/FHFmAUUBBTVi+g8K85bUi4sl3c8G/yjvwrPQMLOY30kIxj91pg=
X-Received: by 2002:a05:6402:e93:b0:43b:6a49:7e88 with SMTP id
 h19-20020a0564020e9300b0043b6a497e88mr5288547eda.132.1659126277931; Fri, 29
 Jul 2022 13:24:37 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 30 Jul 2022 06:24:26 +1000
Message-ID: <CAPM=9twcrq24uhTF4yYR2v1tJsK76D_S4=fjE=K4s+78Wds91Q@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19 final (part 2)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

Maxime had the dog^Wmailing list server eat his homework^Wmisc pull
request. Two more small fixes, one in nouveau svm code and the other
in simpledrm.

Thanks,
Dave.

drm-fixes-2022-07-30:
drm fixes for 5.19 final (part 2)

nouveau:
- page migration fix

simpledrm:
- fix mode_valid return value
The following changes since commit f16a2f593d0095e82e6b7f9d776f869c8ab45952:

  Merge tag 'drm-intel-fixes-2022-07-28-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-07-29
11:39:13 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-30

for you to fetch changes up to ce156c8a1811c96a243590abd0e9b5a3b72c1f3a:

  Merge tag 'drm-misc-fixes-2022-07-29' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-07-30
06:09:57 +1000)

----------------------------------------------------------------
drm fixes for 5.19 final (part 2)

nouveau:
- page migration fix

simpledrm:
- fix mode_valid return value

----------------------------------------------------------------
Alistair Popple (1):
      nouveau/svm: Fix to migrate all requested pages

Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2022-07-29' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Nathan Chancellor (1):
      drm/simpledrm: Fix return type of
simpledrm_simple_display_pipe_mode_valid()

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++++-
 drivers/gpu/drm/tiny/simpledrm.c       | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)
