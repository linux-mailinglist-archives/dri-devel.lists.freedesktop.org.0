Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AED2F4627
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B816E0FD;
	Wed, 13 Jan 2021 08:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138EF89D46
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 18:14:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b26so4756845lff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WmlXJxV3426flC9X6XIEScZVjUI1xhJoJxCzxaO19QU=;
 b=mpHRBNE8Zqrl/cKeGtplmH7385gfBvkxDOLO7fQaNM10orQk9DaSZucKRSt8Ibi6JF
 Wa8kqgOuIJdt/GAaGoe0vDhIL9JRunMpvzpP+aInQmt1j5/F6R3v1w7VMWCEavpydKlF
 rnAWSIClBmMm5VwcbsN1UYvZh49paiZLn3Q2u1d5uCiP5oaYzOZFQB9ieV6DJhBW7ChI
 pQGNu+jw5dAGan/0nYzuatENMwNfU1i9T6rKbGwjBx0o37l/frQ1sijXhHLNNcTbpS56
 JChOqiZHr2Rtpa4fzuv+SRAha+1XhAXteyPFtWbsERZCsSMk2ER4lmGvWEdBx6itH+So
 X4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WmlXJxV3426flC9X6XIEScZVjUI1xhJoJxCzxaO19QU=;
 b=Qi7ml8JxaRyWOr0+EgBC2Y0+P80Oqqw86jhljvmyAOD57Hjgk3UIeJKFFBWdPc9xQ0
 Bvypg2fAd+xuOJyyuvBqkC9D+Efez7Y8mBUgXT9/g8Hc9bOLprof8XBSl5255mJki4Qk
 N09zVCMEpVUqj/ILQnh5SoCkGpJkgKtiiEChSFBi5LlqS9PGBcWAxnafiFhQMJCz0jvT
 4C9uhFnOngQDosVRDodjqvgW0xbMhCBB5D2JSGlBPoEG07W0iKzSPtHjNei1d9xcn6ag
 S0DAkPpaeEIjuqcihkBsJlMCA/d674NIo9bAUp7OU7poGl2PKLEzww6OiHjv+Sa1c3eK
 C0wA==
X-Gm-Message-State: AOAM532g+eiNqiuyDmLfE/XEZAKfZVhGYqvJJEc2xKjzeLhJSOiomyez
 x6uQ7b/KweuWx5jmdp+ntvzBhEU7EV8=
X-Google-Smtp-Source: ABdhPJwRWJWf2uR9zyaVmRb/EqRQCPK9M4/RpuVB5UAs0Qe/O4slPwwUcPAjhdkAO5hAxRt2B4acBg==
X-Received: by 2002:a19:787:: with SMTP id 129mr79178lfh.234.1610475290531;
 Tue, 12 Jan 2021 10:14:50 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:14:49 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v1 0/3] Activate Tegra114 SoC support by Tegra DRM driver
Date: Tue, 12 Jan 2021 21:14:18 +0300
Message-Id: <20210112181421.21293-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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

This series enables Tegra DRM driver for Tegra114 SoC and corrects GR2D
compatible entries, which is a minor correction, but it conflicts with
the Tegra114 enablement if applied separately, so I included it all in
a single small series.

Patches are tested by Anton Bambura on his ASUS TF701T tablet device,
which is powered by Tegra114 SoC. Display panel now works on Tegra114.

Dmitry Osipenko (3):
  drm/tegra: dc: Enable display controller driver for Tegra114
  drm/tegra: gr2d: Correct swapped device-tree compatibles
  drm/tegra: gr2d: Add compatible for Tegra114

 drivers/gpu/drm/tegra/drm.c  | 2 ++
 drivers/gpu/drm/tegra/gr2d.c | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
