Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D554962E89E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5699D10E6AF;
	Thu, 17 Nov 2022 22:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D93C10E6AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 22:44:16 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id gv23so8823827ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 14:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7quD5Hy3ZWcPrpDWeaqeNjMDNzDYEXAy9NXdrwbcOnU=;
 b=q5WrBnSlx8pHrOHphw4/YZQmXS5GKpMW+DHOD9fthYRsK3Au0XWJoNEYppEhTj9KPB
 yQyzs5oJt8v9rPvjIwj+bYhfl1thHAfjSRrkf3BLVkF7CQv+F1l18LJbk1ozk9cb4/Sb
 HjvozOA78Aj52/Dvy9NmNdlUYYubAP73NvB3jKp33EHlWHXIDEbTsN5Zgjw7I+i0oeYN
 cuiQkqeVlzW+25nA8lmazGRvWdc1A/sVBYB7hg+kIhj2FJ75zpaG8dSsBuv7oPcR79gu
 3O1iIc6am6YVyI/SeuLalHuoirB0YNpQrbtg4ofD8IPhIGAaE0S/uHG+PyStlFXk4+rs
 8Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7quD5Hy3ZWcPrpDWeaqeNjMDNzDYEXAy9NXdrwbcOnU=;
 b=Ww3Z9fQ31FoaqM29aOsZVKJgetPaVrLFfYjNCegAh0jg2WCuhT4GbcAL7y4ZKkrs5r
 AH7l1QvRf9qaHEOy47y2Or9F0hBHW40egCd6hVjdJ2UsCByFIejFLpFVQRRCY7GjVwM3
 TYNBmMW+6yYar281vmuLqBWI7qqExeEWythTxjxW2whfuTomel0D2nkYsdKW3stqAX+B
 AdotjSKcmqaOk4oN0eniHhQObKdmtmg8XAWM9pfYNwfn/Pq4DXSj/enxj/fRD6EEL54/
 ePJTQJ59oO/PhQ2b0jq1+yF6DM6JriTkAgPiJ29jvXHYIniavluEY2mGHdLNaS3pb1Ip
 DaMw==
X-Gm-Message-State: ANoB5plxK7jPGdiGz8N2Wv8lZ9Ka968X5yj2CI/vpGlSKNd2ECEKJ909
 pDz50K9mv8qHdQz+51XMztlJTvS46ts=
X-Google-Smtp-Source: AA0mqf7E8OF8jcneLd9IXB70pKLdrySUW/wxBnItA+wIiC3LDnosCm8PfPWWL4m3U3hrUroVHfT49Q==
X-Received: by 2002:a17:906:19d7:b0:7b2:b782:e1df with SMTP id
 h23-20020a17090619d700b007b2b782e1dfmr130068ejd.308.1668725055059; 
 Thu, 17 Nov 2022 14:44:15 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 eo14-20020a056402530e00b004588ef795easm1060882edb.34.2022.11.17.14.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 14:44:14 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Fixes for v6.1-rc6
Date: Thu, 17 Nov 2022 23:44:14 +0100
Message-Id: <20221117224414.2374127-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.1-rc6

for you to fetch changes up to ce071fc9ceafd339b74631d4907d77f2e9ef1b0c:

  gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-10 11:21:18 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v6.1-rc6

This contains a single fix that avoids using the GART on Tegra20 because
it doesn't work well with the way the Tegra DRM driver tries to use it.

----------------------------------------------------------------
Robin Murphy (1):
      gpu: host1x: Avoid trying to use GART on Tegra20

 drivers/gpu/drm/tegra/drm.c | 4 ++++
 drivers/gpu/host1x/dev.c    | 4 ++++
 2 files changed, 8 insertions(+)
