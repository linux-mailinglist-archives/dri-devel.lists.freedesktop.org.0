Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861C272363
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 14:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2DA89BFD;
	Mon, 21 Sep 2020 12:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F0F89BFD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 12:12:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id b79so12394106wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZukQy9tOjRzKywMf/Ule7Bh+CxzP/d82LscaFBE4NEg=;
 b=RC8OoVrpyF1z87Z/ktGmqzl/Cm48OoIpqbsoHlSEKacl2Hayl2yMf/dzlMOK5BcpHw
 LFhGalvFUrNiuckwVaQMdgdX0s/nOgmkdVCj2LLenDl9Zc7zYT9V4I9IEI6qAgabJnkL
 UEZS2MNjhXJjWNf5qZ5TQS0yy2z0jbgo8mA8o4C2efIytlZ8BKEezh3ydNKrTgKVVd1I
 xkhZKm5OAW2X7vh3vkwxdscAMsd00/1wFM9QCYRKSC8b9IxiDFzmfpC2/vbg2HrbbPnH
 xneq8knwsDXl0rwOwB43eqbkcxudNqLHd/pq7UkaPOEifm7HcT3cpQVIhZ5F0GEHLmzg
 2ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZukQy9tOjRzKywMf/Ule7Bh+CxzP/d82LscaFBE4NEg=;
 b=JZ35GK9VNvoSet2LvcUKprSIYifD3VPsmYdThuXtn/oX4x7eLYNCORoQ3AMWTNNtoA
 oihUuKEBzGeYRGYZTV/Ix8LlfsIaYD43BChvVWtLc91AlMHaqYb/V/OUu9EBLMyZ4q/f
 /NVzvDPZ2t3XmkoXcnWBKjxRVWDf87luShIE4MeSaghoPNEG8AQSq8a01LgL7+vyExSz
 U0ZSsoqRqPw1Rxsme2sY0MTJKHQrXhUpOO3zMt3tatKasJmD508pcBKOox+I0JHoTNLb
 OqYo068+QCzbm0/tOI9i/Lb5+QKVxo6j55VoTPZVSejfOEvM538smiUA+3SF+bPmFiBV
 +YRw==
X-Gm-Message-State: AOAM532RjYQfqq4dwU8kNmggNjgOSpwgzKgBX1fXkn/6wfgn6r/TOHXg
 peX1Gk0sMMvc/L61iaWcp0o=
X-Google-Smtp-Source: ABdhPJyFPlYLlSQ7O0Xf78qHQtPuSfbfRKOtZ0PZyW76/joJ6MWeBAdrS/PdKHu+pZoV8bN3aZ81Sw==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr17334153wmj.125.1600690368406; 
 Mon, 21 Sep 2020 05:12:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t124sm20040035wmg.31.2020.09.21.05.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 05:12:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v5.10-rc1
Date: Mon, 21 Sep 2020 14:12:45 +0200
Message-Id: <20200921121245.3953659-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.10-rc1

for you to fetch changes up to d9f980ebcd01d90a2a76ea2383c925abf9223cab:

  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge (2020-09-17 12:31:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.10-rc1

This is a handful of patches that add bridge support for Tegra devices
and fix a couple of minor issues.

----------------------------------------------------------------
Dmitry Osipenko (4):
      drm/tegra: output: Don't leak OF node on error
      drm/tegra: output: Support DRM bridges
      drm/tegra: output: rgb: Support LVDS encoder bridge
      drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge

Thierry Reding (1):
      drm/tegra: Properly reference count the DDC I2C adapter

 drivers/gpu/drm/tegra/drm.h    |   2 +
 drivers/gpu/drm/tegra/output.c |  24 +++++++---
 drivers/gpu/drm/tegra/rgb.c    | 102 ++++++++++++++++++++++-------------------
 drivers/gpu/drm/tegra/sor.c    |   7 ++-
 4 files changed, 80 insertions(+), 55 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
