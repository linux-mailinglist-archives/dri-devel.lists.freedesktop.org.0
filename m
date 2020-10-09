Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8136288156
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 06:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08C36EC1F;
	Fri,  9 Oct 2020 04:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CF26EC1F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 04:29:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ce10so11183092ejc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 21:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=HDOEMZJ1iJUDawkzsd6EJs2p6R7I3avbJFeF5Kk04rI=;
 b=E1fxnykXu5SuBbCy7jL9XNrfSWR/aHJa/kUXc7duEbL8II561wlxMxkMqfskOaXPaD
 mAo/vP7AUxf17/jUTX8Ydau/JtP5smxgnxpY3IUmSDPFUnbHGk07yfQWagJByHg8un4G
 RL8oC38HIq/NiU1nK669pKz3rfm+GlXUga6npM7bZMyu4voKZqZGxe65JW4qP6W0i3Tb
 CbbgnnaWrlqcbZkCYcZ3KKKxpDVPDmYL9Wy40Q3Nk3Jzu47h8zHHcYI4pHNRs8mI6iuh
 GKtUH3wLemdLUG3xbdDP5wgRoV2XqB4NVQbDat3oMyHKvNQR5nt6eiq+t5ZZ4dvRxSAn
 611A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=HDOEMZJ1iJUDawkzsd6EJs2p6R7I3avbJFeF5Kk04rI=;
 b=szjRYwYJSrMLHlEX4PdYUzaee62TyTtaWSMzOPbNDyUOASuBtXhWgvtogidqp6wC0u
 krSIgk+89OZ7pQMTiSDuyebfmL2sZYdJsnfFEkTbyYZCQQkTP/yBZWdJYyDX/QPot6Oh
 eKzi4as26WNdFYX86mANRUgZl/Mt6gn54S4M3ihNfPa1p2FjlT+7qg8r18XHTty/AiKa
 2YVZBwm30Z/KrIBdfDEptnkDXaiAgZUMLh5sumul0GujzkDDZpOg0fg36XpqtjnCxSdQ
 zEK6gA5xzl4vidV/g1+wo1Ps5zy89DDZZIq/vw+oYh7jo/as/h9S3ay2g1QW8yk3Q1Sj
 Wx9g==
X-Gm-Message-State: AOAM533CRz5EhjKQUhbPjtzy9A7l4PF6JD2O53K3lSwntgTfbI7KvwYK
 gWGheWK45ib6np9DI/OOqfFRzFibqwqk79KRpSk=
X-Google-Smtp-Source: ABdhPJy4V9ovDJkkp+I+JIwk2btygwFc179EQv+3NzkavRWXfk6broysUpKrBqF97YRL4lUy+Owj/I4LkDx6y+gG+As=
X-Received: by 2002:a17:906:38c9:: with SMTP id
 r9mr12922751ejd.9.1602217767821; 
 Thu, 08 Oct 2020 21:29:27 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 9 Oct 2020 14:29:16 +1000
Message-ID: <CAPM=9tywYP9zfkWJ6ad-+Eg51WgD0efM+CUc_wCmE-jmHEGTYA@mail.gmail.com>
Subject: [git pull] drm amdgpu fixes for 5.9 final
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Fixes trickling in this week, Alex had a final fix for the newest GPU
they introduced in rc1, along with one build regression and one
crasher fix.

Cross my fingers that's it for 5.9.

Dave.

drm-fixes-2020-10-09:
drm amdgpu fixes for 5.9 final

amdgpu:
- Fix a crash on renoir if you override the IP discovery parameter
- Fix the build on ARC platforms
- Display fix for Sienna Cichlid
The following changes since commit d10285a25e29f13353bbf7760be8980048c1ef2f:

  drm/nouveau/mem: guard against NULL pointer access in mem_del
(2020-10-07 15:33:09 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-09

for you to fetch changes up to dded93ffbb8c4a578adf13b54cd62519908a23f8:

  Merge tag 'amd-drm-fixes-5.9-2020-10-08' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-10-09
13:02:49 +1000)

----------------------------------------------------------------
drm amdgpu fixes for 5.9 final

amdgpu:
- Fix a crash on renoir if you override the IP discovery parameter
- Fix the build on ARC platforms
- Display fix for Sienna Cichlid

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/swsmu: fix ARC build errors

Dave Airlie (1):
      Merge tag 'amd-drm-fixes-5.9-2020-10-08' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes

Dirk Gouders (1):
      drm/amdgpu: fix NULL pointer dereference for Renoir

Yongqiang Sun (1):
      drm/amd/display: Change ABM config init interface

 drivers/gpu/drm/amd/amdgpu/soc15.c                    | 10 +++++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     |  2 +-
 .../gpu/drm/amd/display/modules/power/power_helpers.c | 19 +++++++++++++++----
 .../gpu/drm/amd/display/modules/power/power_helpers.h |  4 +++-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c            | 14 ++++++++++++--
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c    | 14 ++++++++++++--
 6 files changed, 48 insertions(+), 15 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
