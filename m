Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D9259073D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 22:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226768BF7E;
	Thu, 11 Aug 2022 20:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D298BF76
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 20:09:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id w19so35383180ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=wtcF5E6HHYGtowaMckWSPycHkBLnOQTqJU55D/wwaFs=;
 b=NyXMEAqNG7fhpAylWgJx4k+gq42Ptr9gUlhfLyd3zUOnXGUSsYyBdCANEnSJI1xBmT
 nAiLeUspjjhoPyeV17dhuEuqIg8tKrqKpA9eisf5kQWV5owNxpdoOSSqwn1hy7d0sirv
 0Mbj93g5WFp7YpxdI09lMYZYpwTRn1lYoNFOpoH8Mv89743mT9k89by3qLFfumdLg0Aq
 ZIM+FYwEsnrq3PFAe37Coj+ANgxZWDYMX5yh4bU3uw0yoyBzKrYAi//u8cODSpeLAAFl
 uMup32sbpzLE9ft2/wYPd3znpvIxut8oJ0we3lbB+G0vM4pa1Zinz1NgW2vmedwOZmOW
 izIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=wtcF5E6HHYGtowaMckWSPycHkBLnOQTqJU55D/wwaFs=;
 b=s5riq+SVOOmeV1I6n3/L9NgxuZe5P5BqNwBzrz7xzUC26d6GZQAjWl9RI3bi1RxBrW
 dmPTohDyhXbI7wVvCfWxqS4b2slCMoHtOfsJ7IALJJcGZ9+ReYPX0+OzsJycT6o0F+GR
 H4xASioBuUcxjNtXicrFlM8JwS0hHI5t4QppcW4KW4cIxWEgE46LqfwEmtn+U1sm1X5h
 cZp3+afGWcpNfH68QqY+/U6eJ92mhQT51rzyh601+dKibKCpZ7PjmxW4ezPimlmagulD
 KGV8rEyhQeTWnwVb6Oa0JfUOrXV3zXof9hT2ahMQZBpQgPa6YuUxoBWEmeZNepbJXURm
 taaA==
X-Gm-Message-State: ACgBeo0cctCRJHC3Hy+tfJUZfxuxcCxkpPxs/WVXDQePnsvqSN/K5y8v
 ggc6MNi5YGMOdBDKqaIlKB8zTJW+nx4Y7Q6d4nE=
X-Google-Smtp-Source: AA6agR5SI/7AnFOmm98ZrXP35jTyRo6XF8L8EWBJS7WGcfFvB7dTjYOfwcI2iqxg2YxgijaEdmELyLpw4UZBN4U7lNo=
X-Received: by 2002:a17:907:6d8c:b0:731:6c60:eced with SMTP id
 sb12-20020a1709076d8c00b007316c60ecedmr488338ejc.266.1660248595386; Thu, 11
 Aug 2022 13:09:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Aug 2022 06:09:44 +1000
Message-ID: <CAPM=9twZGrzg6pXcHQkaPfCScrE-DMh5PC1UnRULbtv1eC6vdA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.0-rc1
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

not much to squeeze into rc1, just two small fixes, one for core gem
and one for shmem-helpers.

Dave.

drm-next-2022-08-12-1:
drm fixes for 6.0-rc1

gem:
- Annotate WW context in error paths

shmem-helper:
- Add missing vunmap in error paths
The following changes since commit 5493ee1919eae4f49d62276cf5986b7f7c7aa8f6:

  Merge tag 'amd-drm-next-5.20-2022-07-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-08-03
14:00:19 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-08-12-1

for you to fetch changes up to 36fa1cb56ac5189c78dacbbb14d452d0c44b86c0:

  Merge tag 'drm-misc-next-fixes-2022-08-10' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2022-08-12
05:57:12 +1000)

----------------------------------------------------------------
drm fixes for 6.0-rc1

gem:
- Annotate WW context in error paths

shmem-helper:
- Add missing vunmap in error paths

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'drm-misc-next-fixes-2022-08-10' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Dmitry Osipenko (2):
      drm/shmem-helper: Add missing vunmap on error
      drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error

 drivers/gpu/drm/drm_gem.c              | 4 ++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
