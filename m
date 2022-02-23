Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153F4C1873
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552D10EEA6;
	Wed, 23 Feb 2022 16:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D7B10EEA6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:21:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bg16-20020a05600c3c9000b00380f6f473b0so1425979wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVwNHQiSpXBaDORd4lQQJt9AWzBF4ic78fYgBBPQJPo=;
 b=NauvFfpLoCbCxDIbWgtAYUxORV0+Pm9GMMLBBMNQFFa3w7A7dzMoD3EnRZ0ouTVS+R
 Q6JDzZn1fKUvnt1mFj+J0jVy/1HxC7Ui35/+1pA7x+55k40o48CNH2lNMuo/Cc8a7kCm
 BP1EU6Xc33Mku+ovG3A1i5j5P5jSnRzXXsUUfKAjyVwVRoU+gfSrLK05KbSE19A0qW4a
 sCgdYFLW9hPkMMDXc43u+QGql9tTRb9DJJRHii0VArAOlQFOTpScpvpRwgnJZHofkZmT
 CpigxpNJ+N+ErhAzo63UqxQHgm5xM1m/xa8OjnBVuYPxbg1wvdkKj6M+BjmflJn1MlcB
 CSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVwNHQiSpXBaDORd4lQQJt9AWzBF4ic78fYgBBPQJPo=;
 b=13S4NwUd+ttCsOW3Ps4FHyOgmoLwdGozJ+PwOm29RR0sD/5cApcjFHQ2bE4AuJrGNi
 FFaf9OuF9PIZZOb2jLToMp+gtbI89kIt4slRzsOCy5kgJ4aw6qtUEI72HtgZQI+mYw2+
 /s4YY8xDZBMwAHEVozQCeKizl46zngN+2ZyFqlXTXLsQnpntVDAaInTT2/oYt00wqcW8
 1zIvB9erpsfEkYaB8qDm5aUdhLQ8gggIA5VScub+n2BetFAvYpBS0uEUOp+JxyXe8FoE
 zzQrS4666eco1KtrJrYLWngttuKFbDEF81bqa8yguKhwQWavTnPy59iIww3kC/N0qJDC
 hWpw==
X-Gm-Message-State: AOAM533+KiMfNUfjVBs5QvO6yVcOUaulfOKZ1IHOJVZqn3isCdHq2k1w
 j1JZL2LSGyUlTXvzS6IO3Y4=
X-Google-Smtp-Source: ABdhPJwp5jSP5K1hYmysx536AoQFTu1UPyAZhffySXT1/KlFmWd+MbYWCEd05Im1Uyp0UNs2VcjOEQ==
X-Received: by 2002:a7b:c4cc:0:b0:37d:1e42:4ed5 with SMTP id
 g12-20020a7bc4cc000000b0037d1e424ed5mr8299912wmk.133.1645633278075; 
 Wed, 23 Feb 2022 08:21:18 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id i13sm184128wrp.87.2022.02.23.08.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 08:21:17 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Fixes for v5.17-rc6
Date: Wed, 23 Feb 2022 17:19:03 +0100
Message-Id: <20220223161903.293392-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.17-rc6

for you to fetch changes up to 8913e1aea4b32a866343b14e565c62cec54f3f78:

  drm/tegra: dpaux: Populate AUX bus (2022-02-23 13:00:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.17-rc6

Contains a couple of fixes for Tegra186 suspend/resume, syncpoint
waiting, a build warning and eDP on older Tegra devices.

----------------------------------------------------------------
Dmitry Osipenko (1):
      gpu: host1x: Fix hang on Tegra186+

Jon Hunter (1):
      drm/tegra: Fix cast to restricted __le32

Mikko Perttunen (1):
      gpu: host1x: Always return syncpoint value when waiting

Thierry Reding (1):
      drm/tegra: dpaux: Populate AUX bus

 drivers/gpu/drm/tegra/Kconfig  |  1 +
 drivers/gpu/drm/tegra/dpaux.c  |  7 +++++++
 drivers/gpu/drm/tegra/falcon.c |  2 +-
 drivers/gpu/host1x/syncpt.c    | 35 ++++++++++-------------------------
 4 files changed, 19 insertions(+), 26 deletions(-)
