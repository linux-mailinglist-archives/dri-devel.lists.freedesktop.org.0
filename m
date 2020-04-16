Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02FE1AB75A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 07:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C06E29B;
	Thu, 16 Apr 2020 05:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1456E29B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 05:36:14 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id f14so1348156ybr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 22:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=J0dXocf3QB32pjcmmgkqBqtBMjXeC23y62sIBT0a9k0=;
 b=RSwuKGyS3S0TRryOrsX4LUflzjfUV0agBzvt5kKQl4ayRQFXH9K9nwvZOsV6b37S9d
 LtPa6phZiY6mG+wr8pl5R/yr3BQdGckHtSylcEQ8IhoyTROG+Amv3FFfKkqkn/dDX3mg
 0JHy8hAyv+WsaBinhtDi9K6XAx2wlRkYL5UKOvqCZNU5rDpg//C1tiLEa9YfaZW4WxCl
 DzSMoEpn+MwG+g7qVWdpveDaJLqgPjwcTe9wVPUUoOuxD3s3VEKahSZKqPONUHYNAwer
 2tCzEX3SJm7q9n2cKbXslXk7cYTECn6Dw3eQ/PhS0oEyJy/R6m4QK1q1Muk2r5Szjvir
 Xiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=J0dXocf3QB32pjcmmgkqBqtBMjXeC23y62sIBT0a9k0=;
 b=sc9wlT0lElPI9x6vl8MCVrKxMIRSSq/xLzZuLyReIt16aubuaIjWNxZCjcHhHpslpO
 lhmtVMU0RBL6Oy9vZM8dp6V9yk7PKwJtR7e5GQJYcnkqwzxhW0l/4fACQCW6xgQQf5zt
 rIzRy3zXBrch358KCxYWP8VK62PJuNhTJEabV2wJdCord2nQwdtGOJbRWvLTflY/LKHv
 PHsTqJH+5Ov9gerbf/UFEqhFK+ejM+TztPGaO8Zvrn8k+WrzY8wUVUwfyA7drMcyneA+
 HazHqUUt/G9Sd8K6wbkYUgxd/MyifN6OwIWeXG025TO0FHjRoMgo9V23QQDyZ+q7cf+Z
 1jzA==
X-Gm-Message-State: AGi0PuZTTsDCu7gMJ+g5iIqA+wsgVzU7osBpSaVnMY49Ob68MQebZxeu
 ze0d7HIDDfGapfFrhRwTxiRpzsIkusHSygaV9hlEDe/fKLc=
X-Google-Smtp-Source: APiQypLN2h61BTnlL5Mozv9sQfFxjmhBzsQER78cXCXDJ+QoMG8Zd2nGt3Q/vsSxaJs+JjOs9A1MCMLHVUdelh2l/9A=
X-Received: by 2002:a25:2454:: with SMTP id k81mr13660878ybk.470.1587015373477; 
 Wed, 15 Apr 2020 22:36:13 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 16 Apr 2020 15:36:02 +1000
Message-ID: <CACAvsv4njTRpiNqOC54iRjpd=nu3pBG8i_fp8o_dp7AZE6hFWA@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.7
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

Nothing major here, just some missing MODULE_FIRMWARE() lines.

Ben.

The following changes since commit 374b55802cd567e9f340b7f27d2c5e20b069ac3c:

  drm/nouveau/kms/nv50-: wait for FIFO space on PIO channels
(2020-04-07 14:37:50 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.7

for you to fetch changes up to 92f673a12d14b5393138d2b1cfeb41d72b47362d:

  drm/nouveau/sec2/gv100-: add missing MODULE_FIRMWARE() (2020-04-16
15:34:12 +1000)

----------------------------------------------------------------
Ben Skeggs (1):
      drm/nouveau/sec2/gv100-: add missing MODULE_FIRMWARE()

 drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp108.c |  3 +++
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
