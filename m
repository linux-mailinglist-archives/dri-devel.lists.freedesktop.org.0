Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A991826F4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 03:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FE06EA12;
	Thu, 12 Mar 2020 02:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CB66E52F;
 Thu, 12 Mar 2020 02:09:35 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id e11so4206982qkg.9;
 Wed, 11 Mar 2020 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x5II60aZSBbTDv/ankg5R9N5ZnZmTO16QBbjlaMju2I=;
 b=e9ov2jeyM89aJQWeqOZhgkdVw/Jtpw03qJU9K+ubvFMYrpHpeN9O0Xe1T9cI22B9mW
 NFzOMGtEcjE875xUBR9bC4Pea7BMPLcEuly79meiRTL+JN4qtHBXlmZnBq+v3zT+lI/j
 USDL4Za40Tb30UmGwjT2bCkGoh/qc18wMmtTRFIK+TwGEIGxklT10P93R/N++TbuZ1ej
 AFi3XytZGkXhOxFYgRVVodnlfg2D7/qPihNTohgLlPKoDeIJ0H2dgdRpTpUveipMTdq+
 L75JAo1wcgB7REib43VTDnH7uKU4rtR+Sz4Qocc70Dxu2rZ6cYyNx5WiEjqx1XOs7PA/
 xmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x5II60aZSBbTDv/ankg5R9N5ZnZmTO16QBbjlaMju2I=;
 b=ZxR9PnJjq7FJxA+B6y18upFTNbdjhEHqR2CSQvVsiZH0k52Wz4+vg5fln6YUF6dj1e
 V0C7pCQ6d2uYj4HQpBLqCEcmIR6g8BHuNCxCYrv36ms+9Jj++FdaJAvmUYmNYfWESi2R
 gplD6qIyVVgOb9PRxZYRErauW3l5Qg2Mvzz6VBRaHbqO5IwxIRTcwtkNC1zmD/co+lGT
 bmZpXGGG2+E8PBBp+4kjo+2uCGsF0rdkyyYsyVBfrKStFImZlbCr0gu73AGkbGzcEZqh
 1GERtxHa13RA9LXuRLSNNHwRGdCIyviVwvcXnt8fCHl9zqZ2IaZgxX93g6XC9l9Pd/4X
 TpBQ==
X-Gm-Message-State: ANhLgQ0mvMiJcI3Pd5I+wCWMK+hHgrJ0EN9IjkPuP+vVywa7G3DNl0q1
 4AUFLiNleN9vcreufLE1/WyzTXig
X-Google-Smtp-Source: ADFU+vtkFdpd1CbfBu3OEvrIsBYs+XlhbY+87lX8a85HsdiUQ5K03NXHJJlRQUsN7RWkzi6PM8uqYg==
X-Received: by 2002:a37:a0d6:: with SMTP id j205mr5555558qke.455.1583978974129; 
 Wed, 11 Mar 2020 19:09:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id b25sm7867478qkk.28.2020.03.11.19.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 19:09:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu 5.6 fixes
Date: Wed, 11 Mar 2020 22:09:24 -0400
Message-Id: <20200312020924.4161-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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

Fixes for 5.6.

The following changes since commit 513dc792d6060d5ef572e43852683097a8420f56:

  vgacon: Fix a UAF in vgacon_invert_region (2020-03-06 21:06:34 +0100)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.6-2020-03-11

for you to fetch changes up to 1d2686d417c5998af3817f93be01745b3db57ecd:

  drm/amdgpu/powerplay: nv1x, renior copy dcn clock settings of watermark to smu during boot up (2020-03-10 17:31:10 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.6-2020-03-11:

amdgpu:
- Update the display watermark bounding box for navi14
- Fix fetching vbios directly from rom on vega20/arcturus
- Navi and renoir watermark fixes

----------------------------------------------------------------
Hawking Zhang (1):
      drm/amdgpu: correct ROM_INDEX/DATA offset for VEGA20

Hersen Wu (1):
      drm/amdgpu/powerplay: nv1x, renior copy dcn clock settings of watermark to smu during boot up

Martin Leung (1):
      drm/amd/display: update soc bb for nv14

 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  25 ++++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  | 114 +++++++++++++++++++++
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |   7 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |  22 ++--
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |   5 +-
 5 files changed, 158 insertions(+), 15 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
