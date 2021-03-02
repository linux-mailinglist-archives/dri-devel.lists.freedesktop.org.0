Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24F329D4D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 12:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907E289CB2;
	Tue,  2 Mar 2021 11:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39DB89CB2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 11:54:24 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id m9so20413592ybk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 03:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pZ9+GTUWUfaZO8ei+Ry1owzsI7itc01sQ4/y+WASpZI=;
 b=iqN2Y/51dZaoKwBx+CfQ+tiWaKaGLkV8veYIcAaWrxmEuDQ+Xn0Wt31B8Xq4r6s34U
 EWxnWPIFeBj1u/oEkD2QhbKUbgjH/0MyMAe2VIBm09CbMOfUh7faqC+MygxGMdaDda8Q
 HDMA/Pc0ubYiEtNLkOIloZuAhpWTRfSTGg6RdUc04ND6T982rX3HQ48Su3fgfEQ3M0ts
 WREvnHzY+DjHSuvFBpTZbThnJc9HBaBlKzOA0KsI8J5pPNgnC7Z2qB5G1sUZIoV6VaoW
 lMMsQyzu9HU/Nrk9uhfpUKTUVn21ccwedWw6Ny9ukwQPvbc2TiZ7er/b1fi4MFeb+bEk
 I3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pZ9+GTUWUfaZO8ei+Ry1owzsI7itc01sQ4/y+WASpZI=;
 b=Y1WZGYiMxTB7nWeMsT+y4mkWGmKUu9SAQopQ/NHAn0PnHT5a8iilqzc0tL5opM9Y1D
 I9NwBZ1B8ub2WhSMFTM+7HEpQhDCQnhhrrNEU5ZFutJK7R3xlQ054p3di77P/g3MZWA/
 Ohx1ZJz8QvV67I72vT/ZUtAL6R4AGnWoEHnymQh3vGXW+ZH4z5aYQz7tgIwtpTlb6O+c
 QNQeLSVCzbXFEzUAZ7Zr77SD6MDyH/DJ3us8pfE4IuZFQDU5Nh4L6oaXZhPtzBJuRvp8
 zuZENYXxLl/TyEl7a15uMpboubZXJ4afdJfWIyerPnQXJo9zniT5E5Oyffox1PNqE0h8
 vKsg==
X-Gm-Message-State: AOAM533wm5Oh7dPnN9KKXyALIbKZceye0+vWRjINpKjQYg9fS8XZk6MI
 T0oJekef9ZrX9mJv/zyfQ9o6tRgeuC8rQbJru8xGO6X9iAJoLw==
X-Google-Smtp-Source: ABdhPJxXVinHYSwqxrjkb1tEa55i32i7lKz7++LlVREHcqJxis4TC8BMKx82Ylsd4NdCxnTotnqdZkB7vRk+OqYAiHI=
X-Received: by 2002:a25:7a45:: with SMTP id v66mr29016696ybc.175.1614686063453; 
 Tue, 02 Mar 2021 03:54:23 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 2 Mar 2021 21:54:12 +1000
Message-ID: <CACAvsv5gmq14BrDmkMncfd=tHVSSaU89BdBEWfs6Jy-aRz03GQ@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.12
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

A single regression fix here that I noticed while testing a bunch of
boards for something else, not sure where this got lost!  Prevents 3D
driver from initialising on some GPUs.

Ben.

The following changes since commit f6df392dddbb9e637b785e7e3d9337a74923dc10:

  drm/nouveau/top/ga100: initial support (2021-02-11 11:50:04 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux 00.00-inst

for you to fetch changes up to 78652ff69be439f7e925067c6a61b1839e531c01:

  drm/nouveau/fifo/gk104-gp1xx: fix creation of sw class (2021-03-02
21:48:42 +1000)

----------------------------------------------------------------
Ben Skeggs (1):
      drm/nouveau/fifo/gk104-gp1xx: fix creation of sw class

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 3 +++
 1 file changed, 3 insertions(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
