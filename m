Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2618C190
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085766EA77;
	Thu, 19 Mar 2020 20:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EB16EA6F;
 Thu, 19 Mar 2020 20:41:03 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id y24so3094091qtv.11;
 Thu, 19 Mar 2020 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8h9ME0liOqupNW0BxjFN6NYGSy0UHE34VThizl03uCM=;
 b=Zi4KiXGPqxh4kCfmNjblNOHr1Qr23MkzI50iNjx0adh6y1QsPG/cVB4Ui6mY1a7g6e
 cyUcmQWaNrMXi8LcSF1xz8HVzFHiFVuOVZzD/Pmd5yc6x8gGUI2z2PVVRNwGXp6F6uH7
 GKPU/r62yRu4WvdUJCt6/AcHKMtNo8ebb6wa0VJ8wCOF5y4kxvlACUAjss2gwcpGsiZs
 0YWBXRRa3Z67/OQSMQEFoqEib9SzE5qmYuwGi5CpeUdvODwKnkC3KUNqrQQ0iAJ8oxFm
 K6wLH2RXaNulHBC9F0pxv5YKfEbthpI39u8AEEXJVQqkoh4YuybFEvtRv9rFWvqS3ucW
 tbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8h9ME0liOqupNW0BxjFN6NYGSy0UHE34VThizl03uCM=;
 b=qjzbjmId3YQSTqocv8py+xQ/+U2PpEzRCWCfxJ7Dz8Xs8lREBqLfmdlWaUZvK2zHdb
 CE1DII6btR7HxyfY8JWjDnMreze0+Rc5oBgDiM3OTaL3nxWNRIcnBU3HtgXSsBxLZCbd
 Oti0lBiTDiFm/ECzdSf2XA4rpqnJH6KCgmpT7oQI90FX/aAhT0YzNn2yHAazL/xXytf+
 3hTDU/wZJxSvploHLKAEMoe0eoX3dOzhXF0Uhr43SDEWjnn2Z5eXf8U+Woa9zM2epqVV
 6gn6enRxweQCNgeY1EvCjW9kWjIrC17XwULZK1CMFtQDPjIj6p8oznQEOCC3zs9NpieD
 AyDA==
X-Gm-Message-State: ANhLgQ2WbhZ0rUiVfYCywf/PFfeuUSFbK08zMKURAYLKRbIcKUf2fOfu
 l8P6q6GLgBiYBLf38PORCNE0C+sO
X-Google-Smtp-Source: ADFU+vs8Z2fS3rC+e25lVZGhB0X3FTw4q+8FEOOKGy2AfwT20v9hZEpmCH1sQVk542mN1UzTPVG0wA==
X-Received: by 2002:ac8:46d5:: with SMTP id h21mr4889929qto.59.1584650462616; 
 Thu, 19 Mar 2020 13:41:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id n46sm2608244qtb.48.2020.03.19.13.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:41:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu 5.6 fixes
Date: Thu, 19 Mar 2020 16:40:54 -0400
Message-Id: <20200319204054.1036478-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.1
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

This just adds Mario's pageflip fix on top of yesterday's 5.6 pull.

The following changes since commit a3c33e7a4a116f8715c0ef0e668e6aeff009c762:

  drm/amdgpu: fix typo for vcn2.5/jpeg2.5 idle check (2020-03-18 18:21:57 -0400)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.6-2020-03-19

for you to fetch changes up to eb916a5a93a64c182b0a8f43886aa6bb4c3e52b0:

  drm/amd/display: Fix pageflip event race condition for DCN. (2020-03-19 16:18:45 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.6-2020-03-19:

amdgpu:
- Pageflip fix

----------------------------------------------------------------
Mario Kleiner (1):
      drm/amd/display: Fix pageflip event race condition for DCN.

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
