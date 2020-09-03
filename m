Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FC25BAA0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 07:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9578E6E169;
	Thu,  3 Sep 2020 05:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1C16E169
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 05:49:45 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id r7so1216790ybl.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 22:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YiQXfm5WAA7/pHwtegN5vAqJpZiOZfkwhsjE305NsAY=;
 b=NQS1Fn5DdSN5KR9lbxfnOaVheg8j2jsdnB+lTZRXfq7uSmkGjxkHFEnQg2NJ6ycsz0
 CG1zAO7VLMRfWsgTw8hHn5r3BHuKPFavZWJWJ1sBXcEwm4braOGi+/x87D7PKovG8c6W
 kHdvLvzxMKm1PCfOxRGLTIO0MFuJ+7V2rfjRKg8c8av/8smMZOHdACEimE7MDQZaZIXO
 vk6Bt0N7NWFci6a9MxzD3grV4oO9kSjtlPxvFquSzvhmkfLJo05eqiJsMHrbk5Bo23Cd
 Tjoe/bcem6W9TC5hc0P6ASjjvhujWtWkB7Kq2Uqkt/Nsa+Jqv17QUBXCSSVjT2DU7Nuf
 zduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YiQXfm5WAA7/pHwtegN5vAqJpZiOZfkwhsjE305NsAY=;
 b=ljKQMB7pY6YGEJfIxkZrs3xIn5qiEjp7OKQ7TRQJoFuszCk+5HnIi1VdMtgqs//A7A
 GgH39y87ucwDSef5yxy8+RZvA7VsGUZ4XYvLvHoZUdySCtsN6cbK+DC0cUKs6r9sJVPZ
 Ca4X8XRhHktVVeV3XNotw1v16bTmVeC9XvtpG00LzXU7d4kPKJD2zIp2tgR/bIqGOTjH
 QoPplfcRS8SatZN9C4EY+bhVKQCwVUaVJieHX3pczva2gPFt1aGjB3zspdvSLaKrGA5I
 s3o4nyBR8uDlclfDB6jd/9J34zPakBmygSKyf59GCEH5kbX+6jEKoEi/q/Mjq+LywUw0
 g31w==
X-Gm-Message-State: AOAM532/WVgGxMtSs4Bk7eLqwJqGoImalrSegk15vcwQsf21mC7UP/Bm
 OkzW7lG+xbnGo8ZOVF4zcg6B2RaNCVPW06Ndjkwbyvd/8MubaVe0
X-Google-Smtp-Source: ABdhPJzmWtaW27mghlKETanweDFwcAXFX9LEXS6eknZ3KOdhWFVs2ODadJxkBYLE3FJEzCypJrcYep4mr3DqAbtCPqU=
X-Received: by 2002:a25:c4c5:: with SMTP id u188mr507177ybf.162.1599112185069; 
 Wed, 02 Sep 2020 22:49:45 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 3 Sep 2020 15:49:34 +1000
Message-ID: <CACAvsv5QDxyMihrxbPk+-sORnaYtjR6_dbM68gEhb2wxht_G1w@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.9
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

Hey Dave,

A couple of minor fixes to the display changes that went in for 5.9.
The most important of which is a workaround for a HW bug that was
exposed by better push buffer space management, leading to
random(ish...) display engine hangs.

Ben.

The following changes since commit f75aef392f869018f78cfedf3c320a6b3fcfda6b:

  Linux 5.9-rc3 (2020-08-30 16:01:54 -0700)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.9

for you to fetch changes up to ca386aa7155a5467fa7b2b8376f4da8f8e59be4d:

  drm/nouveau/kms/nv50-gp1xx: add WAR for EVO push buffer HW bug
(2020-09-03 15:32:24 +1000)

----------------------------------------------------------------
Ben Skeggs (3):
      drm/nouveau/kms/nv50-: add some whitespace before debug message
      drm/nouveau/kms/nv50-gp1xx: disable notifies again after core update
      drm/nouveau/kms/nv50-gp1xx: add WAR for EVO push buffer HW bug

Lyude Paul (1):
      drm/nouveau/kms/gv100-: Include correct push header in crcc37d.c

 drivers/gpu/drm/nouveau/dispnv50/core507d.c     | 5 ++++-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c      | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c         | 6 ++++++
 drivers/gpu/drm/nouveau/include/nvif/push507c.h | 2 +-
 4 files changed, 12 insertions(+), 3 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
