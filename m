Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8D1E512A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 00:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36686E102;
	Wed, 27 May 2020 22:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F836E0AC;
 Wed, 27 May 2020 22:27:14 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id l3so12013305qvo.7;
 Wed, 27 May 2020 15:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQK1VK4/wYN9YE3uPIg2aTNDXxDiE+OSMlDeuXcvzwM=;
 b=odypDNEsu3vmlN6lTjY7M3GWkl81A1cFeMrc/KlzFBY7pZ53LBjYg2CakXmv+JI+Mj
 eb+1/YCSF603onXU+ciJyN/ybUZvbfL9mMiK/R+Mobk1oljaMtmL7yz2WsIVEgsUHuQb
 0oQHafjOnFHN/IExV91Sr/53Xy5awZ+WaVJA2R9++lPrQa61wQ7zh6ugbfrILq9n8Fe+
 9IrQOIHKD8ty1An9LYB5jgVjetCdXf/WsWkxp5d8ZA5v78e6crZBNi3Xkiom2e/Q8y8h
 Vk7jPCGEH0ExUazPvayVIzINrgs1VThIwGr7FE9TT9X6ejjtnyulL41YgqxVgOnv/iDo
 KRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQK1VK4/wYN9YE3uPIg2aTNDXxDiE+OSMlDeuXcvzwM=;
 b=AaySCeyXLsPOHZce8DKXpYPJ3l1Z6hUDsIMUomHjJ4geIsErHeTga9bKAx3gjAu3ml
 u6RMiHMLRH4/glkhpW5qtFYen6oJrFdAHUnAskDi68OYza6CP3rMACRQ7FIsuhIdTcNj
 khspFzclwTYMVCPUn4tiLT92vMO9ye8Q9XmdK3UxNshE4pEOARp39LFcWHV5m3ke8McD
 UOrdBC3zQYwy/cs8Enr4RGQYpZfrVN7qTFktQmteoUhQf59myexGSTzZOWaOf9nBzDb+
 MF4qUSvEC/elkm63mvRSav2hzGg+v+IkZRmnPcSUCkWTVHVM6kwOVkNNU9HRzAhK7lNn
 EHhQ==
X-Gm-Message-State: AOAM5303M9Hz5hr6TmS8g/TAidg/PTKHq2pnji5m5BVCwycSF0fJEAY/
 msg+4O7LNuONuk5gXTwdx6YNCMk2
X-Google-Smtp-Source: ABdhPJwe6dhqESdNiZQok/N4fqF43aM01SDWfTtGRycTZMi6eU7QSUmh3IH78i4u7E4MK+sCz+59+Q==
X-Received: by 2002:ad4:556c:: with SMTP id w12mr241348qvy.52.1590618433144;
 Wed, 27 May 2020 15:27:13 -0700 (PDT)
Received: from localhost.localdomain ([71.51.180.250])
 by smtp.gmail.com with ESMTPSA id c17sm3270544qtw.48.2020.05.27.15.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 15:27:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.7
Date: Wed, 27 May 2020 18:27:00 -0400
Message-Id: <20200527222700.4378-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A couple of small fixes for 5.7

The following changes since commit 7d9ff5eed4146bf026c69e766ff630bc0bd555bb:

  Merge tag 'amd-drm-fixes-5.7-2020-05-21' of git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-05-22 10:30:51 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.7-2020-05-27

for you to fetch changes up to 4e5183200d9b66695c754ef214933402056e7b95:

  drm/amd/display: Fix potential integer wraparound resulting in a hang (2020-05-27 18:13:14 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.7-2020-05-27:

amdgpu:
- Display atomic test fix
- Fix soft hang in display vupdate code

----------------------------------------------------------------
Aric Cyr (1):
      drm/amd/display: Fix potential integer wraparound resulting in a hang

Simon Ser (1):
      drm/amd/display: drop cursor position check in atomic test

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 7 -------
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 ++
 2 files changed, 2 insertions(+), 7 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
