Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58FB3995A0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 23:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340736EE77;
	Wed,  2 Jun 2021 21:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19BD6EE5E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 21:53:00 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id g6so3297641pfq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ntQT2pZR3LJHS6LUFfJ+Qm+vXWzrrp5nCQGAwU1JB0=;
 b=hcmQBsf5LoocnIf8a/0Ca0mlBQCzY7GjMf15ueTI3PEpj3E/TBi5Q4d6mn33d2MJoP
 o9USDMmnfkAKRC+HQmjPpNpm9ItolNHZ1gLqyQzuO6A7JT97S8N4Sxu9N2mExjgaVVfG
 /6iv9Wdl/GeNVu3eeoA7T88o2yYmvWwncmi+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ntQT2pZR3LJHS6LUFfJ+Qm+vXWzrrp5nCQGAwU1JB0=;
 b=TOfmRZZjgsQ4j8HOQ/Y8+Y7FgsYuyzSJmiLqr+KlYSyIAg/7Mrdoo2oVTeR2ORFux2
 reSTmvPPOdrATeVouW7YqLUcqdeJlkNL/OydZGNQimYsofn3GCKkYKwAiMn0Hlz4wzGD
 q78yArMpukaugDCjkQZpiobvghJmygf0xHNWqneLoWqXcH4/nYxpsGXbVQaIx5Vpw3D8
 OzEb4S/t9RWwRxkD7Y9X8YFqRZz2XsEVt1M92OUcHDOYHXpdz/QSLM41SCqW4ewR4Fti
 qn+V26n60dBXh4R2rFTOOdrPFv3dcx948+u4YN4Up2F3KKsBYUyMEhTEsZNtzuOWsI+1
 TBNg==
X-Gm-Message-State: AOAM531twijKMvo0SntryqgD4PVOIvYeUIgApeBbIl/A+tZHORKnF7qo
 fpiR4WTpjWW6YxisYWfYjNl7aA==
X-Google-Smtp-Source: ABdhPJzeQ5qvww5ymAg1YzwWIo2ptK3WZmfCNVj/MFd8/a2Itlvi0o2veU1w5SbMD5HCoN+TggIUFg==
X-Received: by 2002:a63:1b52:: with SMTP id b18mr8618637pgm.263.1622670780419; 
 Wed, 02 Jun 2021 14:53:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 60sm338761pjz.42.2021.06.02.14.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 14:52:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH 0/3] drm: Fix randconfig link failures
Date: Wed,  2 Jun 2021 14:52:49 -0700
Message-Id: <20210602215252.695994-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

While tracking down spurious "orphan section" warnings on arm and arm64,
I needed to fix several other issues that it seems other folks have
tripped over before.

Here's the series that fixed everything for me...

-Kees


Arnd Bergmann (1):
  drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency

Kees Cook (2):
  drm: Avoid circular dependencies for CONFIG_FB
  drm/pl111: depend on CONFIG_VEXPRESS_CONFIG

 drivers/gpu/drm/Kconfig       | 2 +-
 drivers/gpu/drm/msm/Kconfig   | 3 ++-
 drivers/gpu/drm/pl111/Kconfig | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1

