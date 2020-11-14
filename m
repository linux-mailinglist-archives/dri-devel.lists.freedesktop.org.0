Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D352B2B53
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 05:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5459A6E8A2;
	Sat, 14 Nov 2020 04:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700606E8A2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 04:39:08 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id t33so10697608ybd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 20:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nAB5ZL8GZmo45TvNm8Pu4enelHiyGRANrlP8LRjXdkA=;
 b=r/OIRbmFHDgM0Ybuog0vbWTzOYObm9BfMcoKJ0mhHOFQDuI+Zn8xNY1MrwB1UIIncn
 MjDN42+4+90RbCr/McQhB7h7nlIobZ3siFXLA35FgLnfEzAtA0527p6vhxyxijACtiET
 gZDbGPi3FpAFDrksgkBaisnaNB8c/3p8E1n83vPFmaGqhEzPxkDQOIewbOg/+shQhrbe
 9BxGz/gQnkyfclc4pj9snfCgKV/aVwTJQOxHQM6W+66auC7DKt3NjAxfW33COxS5pSdS
 JZYzmbp/TEtfiwFvPvcHTvb3fjv1s98BYYTivVN6RXLs+IJT3xhJgOONrfit4Nrx3mnE
 TSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nAB5ZL8GZmo45TvNm8Pu4enelHiyGRANrlP8LRjXdkA=;
 b=l5ewidq3rDfWwxyT3lI3FlJu8PzXwDV2OXa8pfFIl7BywM/Vk+yHCYykydYUf4t7jm
 BI0Hxxx8aE54PhauTpKg10dw3cHngjsuBjFlcmHjy0ZEe0btS3B2NScAUtrRYeq8tk18
 GKemE6/nwGUu40WckJqEsu+OeiPCbuIOn/13Bbw5dMt1+H16/q4HA715AIatVcdFHlPW
 CpJ0lcMBotfvqXMM1Szx6CTgxHTVWn7dW9nD0hilamNRizqpxflyqJL78/cWFD+hE0tg
 3pWS/W61Qtih7EenyiXhO0OUGWDr+vUEuKx4A8erDYMXGg00Vd5fo+XHgXrtn3YYhts4
 pJCg==
X-Gm-Message-State: AOAM531K0So05NBtD+1ePA0LnaqVBmJQzGj4lwaLbzNalO4GfzUBAhEr
 bNWgctTAgUxAZtkMQoc/xkrfg94LA6EdeAvMSvrWJzXUGX8RYw==
X-Google-Smtp-Source: ABdhPJzfByZKm6oo1tVevg+jq+z5k3zHMb6Y+ZQy+lzkZAO/7ffE5Y2fBtuAcV9rCICY48vNWhCQQx6RF4HySBJPEpg=
X-Received: by 2002:a25:b11e:: with SMTP id g30mr7728326ybj.71.1605328747303; 
 Fri, 13 Nov 2020 20:39:07 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Sat, 14 Nov 2020 14:38:56 +1000
Message-ID: <CACAvsv5vuM54oU1Yp8sX5ZVmJAv+-oQRQj-AeaKFb3qs1EtP-g@mail.gmail.com>
Subject: [PULL] nouveau-next 5.11
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

Just a single fix at the moment.  An alternate version of a regression
fix in 5.10, against additional changes from drm-next.

Ben.

The following changes since commit 512bce50a41c528fa15c4c014293e7bebf018658:

  Merge v5.10-rc3 into drm-next (2020-11-10 14:36:36 +0100)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.11

for you to fetch changes up to be323a4cef022aa9685b08d5a94ddc841ccf617a:

  drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50
(2020-11-14 14:35:57 +1000)

----------------------------------------------------------------
Ben Skeggs (1):
      drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50

 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
