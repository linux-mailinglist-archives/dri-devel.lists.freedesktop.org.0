Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F220C2104A1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D5F6E82B;
	Wed,  1 Jul 2020 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31F66E39E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 02:16:32 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c11so12648487lfh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k7GavqngVCUaBApgwQyCfuKl9lw5lJf0UO6BJ5H8TMY=;
 b=pj+hCLZLkSJQ7gnlprPd1fqPSXDB2HalnCJx/+6pNvnUy4hF9fNKXX1jpL88q5RoYh
 haMHvyHku7okEvKs5IyBpWzyFBJNP7blFKohPZhEQZMnqn7yRRt1aaL2vkHo/CdAPwiQ
 LwjYXPIaaOpFiRF/3tMEkSmCdsz1oIS8hKihIHC3Yh6d61R/TGxxkvnmkAHiumsLAfgw
 1K9NVkBQ1WSvmbWQGZ4IRYzLxZtBcQzElq1iafivdQf4LH1l9AE1EF6Zs+zw+DTVH4j6
 U5ETvTX15hbJHQ6uA5wcE2wnqF1zY6JGc8y+Qn5ZICVoul8zrSagYtqtxN1Ivao2bcG4
 CMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k7GavqngVCUaBApgwQyCfuKl9lw5lJf0UO6BJ5H8TMY=;
 b=ZbMVX9rVVDy3tZ9fIMMZux3Gd8yu4thvnL1IjU+bS2Ym3GmQsU2YUNVkLXaNwuusrO
 SPHOcynP2kg3tOx5MAhfMxSwoCKPMyonRcU1/gTTHgJ3VwJx0PcWlJx8Q5I2C+H6vCgD
 zNBz99qx7JSGjWxfNWDij+Pp4jv9gwOSuVaS1yvyow2L8xbywYSFllD+RRiv0ja2Cj+t
 UYflyBJw0TbHADCwxGhhWdhhWe8nkYLvhw51L4HF3BmRvbdTfFthLvUW79HIceTuGq9O
 7MRzOgqsJkuArYfnGXWmO6ldF9X43R0kSWp/Wa4EK45Ud8OELkPZ9F2rdw4N0EkfGdwo
 TgAw==
X-Gm-Message-State: AOAM532VD/H9WDyyjQ8qfSGAKR4RpPpxFcbvhg1O6DSEByIsRwltl9LC
 TlpCAZdQ37xdLJswWKYSWrw=
X-Google-Smtp-Source: ABdhPJxRfiPi+5cDss3Dp0ElI46PwRSZ4XmSiwAh6s3AG1kUhgLRi3HZuUeVrle446Zpc8sjCa//gA==
X-Received: by 2002:a05:6512:6c4:: with SMTP id
 u4mr13467097lff.98.1593569791344; 
 Tue, 30 Jun 2020 19:16:31 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id i2sm1296892lji.59.2020.06.30.19.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 19:16:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v9 0/2] Silence missing-graph error for DRM bridges
Date: Wed,  1 Jul 2020 05:16:15 +0300
Message-Id: <20200701021617.12030-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

This small series improves DRM bridges code by silencing a noisy error
coming from of-graph code for the device-trees that are missing a
display bridge graph.

  graph: no port node found in ...

One example where this error happens is an older bridge-less DTB used
in conjunction with a newer kernel which has a display controller driver
that supports DRM bridges.

Changelog:

v9: - These two patches are factored out from [1] in order to ease applying
      of the patches.

    - The of_graph_presents() is renamed to of_graph_is_present() like it
      was requested by Rob Herring in the review comment to [1].

    - Added Rob's r-b.

    [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=184102

Dmitry Osipenko (2):
  of_graph: add of_graph_is_present()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

 drivers/gpu/drm/drm_of.c |  9 +++++++
 drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
 include/linux/of_graph.h |  6 +++++
 3 files changed, 58 insertions(+), 9 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
