Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA7F487133
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 04:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F1F10F5FB;
	Fri,  7 Jan 2022 03:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B81D10F5FB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 03:23:58 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id o6so17035634edc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 19:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=kKf+CD/ao0rjSkRE3ZyL+/Oy6FjN9bHh1KEcXllJnuU=;
 b=AxW355ZWhb1XUrvyneeJKALAKdrx6EinJv877EW2eXbv/50i2Y3ZTkGOgGi0LYRWGx
 ri1eFWHjTbEzDBrnQG2m+w87lXXw0o/EMwVyNXouD64SZGh1+yNz/96eHtCV9QDi/rZ6
 UqwtkmV7fxhMxhvuYUAwFHmLE7Y8PrqpcviB6O3UeEPbvGn/IBuAZpKlXuEH3ZGQ4LUV
 JW3umTyVi033vBc/UXc1i4ymI/25oG0rBbliqBlv4SJkCw/NKOReVSxyOutox/2lOOvM
 V7JI0A7S+hYU49S9cszjhr3zJL6a0lGI7VzO6nnHMIpUQnRkiSyMBx0ogj0x6QhtIly8
 7kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kKf+CD/ao0rjSkRE3ZyL+/Oy6FjN9bHh1KEcXllJnuU=;
 b=OcNycWBnv9BRnzSl+R5mNFThNnoxB6UTapZ/5kDvJGS0ruZNSMclnRC4aRBh9cbVx1
 /2FXFMIdJPSjiHk3ZyHTq5ty4tDEoUaMsfwawQjWyMa9ZsLR8qJwpVTiLXNEFY9JlYMP
 MOmmlBaW6fMDLh99MUJVdETA/fXZzWEtDwR8bBOT29leC1wua23SP4ZB6I7bJ7A4ETb1
 +fS37zOSNQTOkxCKLnadYwS9TDtJF+j+/O8f7+UjiE97KUNhjp5Bc35RZeHYZIXRqgSK
 TDadqO92REiHSwod874ccu0VBnk5jSttxfds1weNFjCMC4JK9ck/RJnU3LPZlGAsuDI6
 67HQ==
X-Gm-Message-State: AOAM532Ex2eK3ot+NXnYFmVY4/WNQqV2sKww9Q9lX0hLMzZdbC2GyOuX
 YHoLpb5jVRalZDxAhjRy373YrSCGE82Ix5tOe36po1ImSG8=
X-Google-Smtp-Source: ABdhPJwkID5JWif5YvCwDaMj7dKbtNDMViK1xvIKzZhFPSe86ibDhMOiKQ4NA3Q3pz++AXnBwvba7NUs0YqkxFs7aUI=
X-Received: by 2002:aa7:d55a:: with SMTP id u26mr59888661edr.265.1641525836614; 
 Thu, 06 Jan 2022 19:23:56 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Jan 2022 13:23:45 +1000
Message-ID: <CAPM=9twnYJ8SrVzJEEH+Vksibomvk5CE+Nn6BXKYwLG_8r=GJQ@mail.gmail.com>
Subject: [git pull] drm final fixes for 5.16
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

Hi Linus,

There is only the amdgpu runtime pm regression fix in here. I'm going
to be away next week, I'll probably pre-send you the drm-next main PR
before I go, if I can get it done today!

Dave.

drm-fixes-2022-01-07:
drm fixes for 5.16 final

amdgpu:
- suspend/resume fix
- fix runtime PM regression
The following changes since commit c9e6606c7fe92b50a02ce51dda82586ebdf99b48:

  Linux 5.16-rc8 (2022-01-02 14:23:25 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-01-07

for you to fetch changes up to 936a93775b7c4f2293f651f64c4139c82e19a164:

  Merge tag 'amd-drm-fixes-5.16-2021-12-31' of
ssh://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-01-07
06:46:08 +1000)

----------------------------------------------------------------
drm fixes for 5.16 final

amdgpu:
- suspend/resume fix
- fix runtime PM regression

----------------------------------------------------------------
Alex Deucher (2):
      fbdev: fbmem: add a helper to determine if an aperture is used by a fw fb
      drm/amdgpu: disable runpm if we are the primary adapter

Dave Airlie (1):
      Merge tag 'amd-drm-fixes-5.16-2021-12-31' of
ssh://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Evan Quan (1):
      drm/amd/pm: keep the BACO feature enabled for suspend

 drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   | 28 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c   |  6 ++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c |  8 +++++-
 drivers/video/fbdev/core/fbmem.c          | 47 +++++++++++++++++++++++++++++++
 include/linux/fb.h                        |  1 +
 6 files changed, 90 insertions(+), 1 deletion(-)
