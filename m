Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183CB348599
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 01:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD396EAD3;
	Thu, 25 Mar 2021 00:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6D36EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 00:01:57 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id i144so463569ybg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tUumyIfbR/kugmX5BG8FBkvA3PetjkZU8N4oDgdWjng=;
 b=iLtP0hnjiYZc4dtJ4b1EcqEI572emU7NfYhFA9q4H6nGLT495xrmiCNKZwxemExTkU
 V3/BEIJO8fmNb4929hCPhofESLbhqqB/yZR9BauLnAZigNH+EKmnZ3Du/X+StYGin+PW
 UYTrUAyXk1XlUugQWDKUc6ssVlyiGiyUy1HdQX5PlDHwzU6fJeEq9uJO5LiQGA7yV6r0
 ysJ8bKB3XRquIQ9e5cH4miF5T3xJptfsKh0hN6YhFUj12vup0EUMOrf6dHHgsfSB7gmY
 Qap69bvisd2jqkf/AZvQrXvYWSC2b7tWU4JJ0RoNZebujv1d+4XESUJzcH0/Wt+MJvhg
 VWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tUumyIfbR/kugmX5BG8FBkvA3PetjkZU8N4oDgdWjng=;
 b=YI1F11qlHwYL7DxoGqGCCQJlo88XBQqhijBqDRcrEAzmmkuLt4Ofy2vO5AlD9DCbdh
 6K+TtEG2JwSBipLtwzkL6GdGdN2351FO6JX2vsT60+mWgAz4FgLeP8Tz/Fwoz98CW1t4
 dYPWZ2OSCFC7VKysrElbvA91dXl5V9W/Cn2mpViSd5WF3NvxD2AFd0bFnonP6/mDwnXG
 30B2k32kDhcToxZG5fQNZm8vpSguOVgdkXKrWh2fv/b1/it79s0TSE/6ot0P8Rn9P1qh
 VUq4/B28JDSH19mkooj0cjKwxEuiqci0Mdhs/Bi1Lni6NHdrbQeAltqrHmT3iZukqtAI
 ZPcQ==
X-Gm-Message-State: AOAM531s04rIYcX1+uYrVSGcQNo+GX250vvrjZ8/ypqIyy8ARd8ES+At
 WZ02Jgq8YLMBK+YBS/1Su9VVCj8T7gOGx8I+tqo5Tl+SjO25aQ==
X-Google-Smtp-Source: ABdhPJwv5jmHzrMQuy1yUfS4P+YyDeAaK82cG7OfEfRjoTVeZSB0ned6mgRxtLpBVVYp7t9pWx8SHgI7pql6X7D/XyY=
X-Received: by 2002:a25:6003:: with SMTP id u3mr8773556ybb.96.1616630516558;
 Wed, 24 Mar 2021 17:01:56 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 25 Mar 2021 10:01:45 +1000
Message-ID: <CACAvsv7js90N_PYc8JncQA9Hu0yjbg+vPw109FKxJ538nZ=fag@mail.gmail.com>
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

Single regression fix.

Thanks,
Ben.

The following changes since commit d27ce83fa4baa5cb908a42e9878564cad6ea0eb3:

  Merge tag 'du-fixes-20210316' of git://linuxtv.org/pinchartl/media
into drm-fixes (2021-03-22 13:49:55 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.12

for you to fetch changes up to d3999c1f7bbbc100c167d7ad3cd79c1d10446ba2:

  drm/nouveau/kms/nve4-nv108: Limit cursors to 128x128 (2021-03-25
10:00:04 +1000)

----------------------------------------------------------------
Lyude Paul (1):
      drm/nouveau/kms/nve4-nv108: Limit cursors to 128x128

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
