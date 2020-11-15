Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FC2B392D
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 21:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59A489C1B;
	Sun, 15 Nov 2020 20:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6555089C1B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 20:41:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j7so16600119wrp.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 12:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=J16eMJgIA1LQl6Gsx6rIuI7VHvHv37tOMcNHiYjyD60=;
 b=bVfhhPZQ4KbzE4I+TXENHiX55KfMC1dyrIYwFpDwhX4ErA8b2SRvlqCdQULAitQKY6
 otuoKWNNrFpnI+2wwR46szdnXh99J7SA+9yOp66Yyn9d7VYYzfl2+MGymsijOU+lvS8S
 UBjdU47HWugqs41tVgTNWwYj/SRMb8LqDsIHv0KhsHWYcH4uo1ph6B2OFZKRjjVDdU0Y
 +JRpPgNAmZu1LQTF+v7/mI3j/vBtfIXRY1bEEknM2Atdtv1knZQEEDk8MAzykCoPlYOU
 96hGCO1gzeGNd5KCrQ4IOv3ENXJkBX0iOY33HVhlYqnZSjE2iCFSYSCQDUa773L7gra7
 uF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=J16eMJgIA1LQl6Gsx6rIuI7VHvHv37tOMcNHiYjyD60=;
 b=Bd0ls7GZrMqvRaRckutL5Cyp4tTxsU6NsQ1gcJVcB6jGnkN9uFIesPd4khxiH1WIe4
 mEV0juhD1+EOQLyzt2e1vl4FS7zyh8cRXFDw0jSJbDJLzYIe+B49uGkrcPl+POAoMXpw
 KOY6xwQ/raDqnc0XjoLwn3CTo4rUc59URQqIM9KOUvaKov36d9Y8zjwKO34s+02hL7av
 lPW9mD86oRNrr0RaeZ67Z5/P+oyYVXV5Av1GzcG6LNmLh0g22dhB7vn0Qv/o2pQ+WSJD
 05Fsh8XNNVNQUmOwzQ+3Mip4ULFI9iJnqC0uDPFRWFljyc3sn80s9VgN5ayt7MtPar0E
 WS4g==
X-Gm-Message-State: AOAM531t1rL0AyInW/9AXB53QUwXbWKq6DnDOAbyocwscAji8z2JhTBL
 crT4pxGAWYtxE1nAbLDBrUTZJgdESgJQA3EkyKA=
X-Google-Smtp-Source: ABdhPJw8nnCeD9Pmfm4aONgo1FE+Mmmq29zBtsBn9axv7s85ARTsDI4Mip1atcZ/FCPMMaiF27W/eKujus1iRe4JOLc=
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr15473874wrr.273.1605472906065; 
 Sun, 15 Nov 2020 12:41:46 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 16 Nov 2020 06:41:34 +1000
Message-ID: <CAPM=9ty9cBzR5tr8g2B7LE9+Hcf4NViHcyDcEHJMVgYmSoub1A@mail.gmail.com>
Subject: [git pull] drm nouveau urgent fixes for 5.10-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Ben Skeggs <skeggsb@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

As mentioned I did have a fixes pull from Ben from after I'd sent you
out stuff, it contains the fix for the regression reported in the rc1
thread along with two others.

Dave.

drm-fixes-2020-11-16:
drm nouveau fixes for 5.10-rc4

nouveau:
- atomic modesetting regression fix
- ttm pre-nv50 fix
- connector NULL ptr deref fix
The following changes since commit 41f3ed2cac86ba533ce6a334a2e7fae5c7082946:

  Merge tag 'amd-drm-fixes-5.10-2020-11-12' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-11-13
16:05:31 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-16

for you to fetch changes up to 8f598d15ee6577a56d6617d9e4151591db34d8fa:

  Merge branch 'linux-5.10' of git://github.com/skeggsb/linux into
drm-fixes (2020-11-16 06:36:31 +1000)

----------------------------------------------------------------
drm nouveau fixes for 5.10-rc4

nouveau:
- atomic modesetting regression fix
- ttm pre-nv50 fix
- connector NULL ptr deref fix

----------------------------------------------------------------
Alexander Kapshuk (1):
      drm/nouveau/kms: Fix NULL pointer dereference in
nouveau_connector_detect_depth

Ben Skeggs (1):
      drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50

Dave Airlie (1):
      Merge branch 'linux-5.10' of git://github.com/skeggsb/linux into drm-fixes

Lyude Paul (1):
      drm/nouveau/kms/nv50-: Use atomic encoder callbacks everywhere

 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 29 ++++++++++++++---------------
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  3 +--
 drivers/gpu/drm/nouveau/nouveau_connector.c | 14 +++++++++-----
 3 files changed, 24 insertions(+), 22 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
