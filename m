Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C102B15A7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 06:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668536E3AE;
	Fri, 13 Nov 2020 05:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC8D6E3AE;
 Fri, 13 Nov 2020 05:55:21 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id p7so8637334ioo.6;
 Thu, 12 Nov 2020 21:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eYYeE8QzaK5WeR5CogaBzFoKN/iYwCNInsED+Vqp3bA=;
 b=FruX5hB/MZOmxJ8vRFcWL+Lts43ENq5BFcHkJ3quR9C20dfBhINV2j1tnszWPkkFIQ
 5nl8UNp7bta+Rdo8PBJx57Aq+X0lKzXCL6KnJgqXNf8qtXjuO7Pa33s3y7YAudWVLZge
 84EHShtNzJfRNdk6ydso6YTIjUxsluv2LLehwG9VIhOAFgXOX6JNipTFtnhmd6K9Yi28
 Rp5SsK5Dh3Iis+IuaaImUVQt9wd8Tj5obVLzFTem1yTskHwWsigUQ2bpvDeoNCnZL4AE
 q7mlaGiLa4vOT26HYtg+Z6CyQljqQKry2aFo2d4Mg5bgKPb4F6QXvWo6ZZJKqeaYN8Kp
 eO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eYYeE8QzaK5WeR5CogaBzFoKN/iYwCNInsED+Vqp3bA=;
 b=sc+RUW1/GOuVNAD6bDd6hZDHdYTgmBwomr5gRlFayXDvJDWbjRYcNc14y3c1HezNty
 Ko2ETgJqhd8doZEUfOSvcTF7SHxGfJlP60+jXxnJU8+PnaAsuIA7ZaC0yWAxmODab/Fk
 PSkOlzqPGNEZxRxjEMYiw5uHJXJqKWF2jiIXftIu0GsP7+nZDeys1/bQJ3SMleea9JtX
 3kiNU+Bud6uDNLEBBDPyqrMZ2M8RwfyQ4zdPsnMRr6nWdmXIryyx7mSB80j8Ga1PgFWb
 xN3fXU4We50QRvbs6FGWNlJ7veZ720Y4VbdmzUvKYbNlpJ83AKvuza5O2NADvs1h8Llv
 NDsQ==
X-Gm-Message-State: AOAM530GYsp/+6MpTOumAknLZQARZ/ur6uHiB4gbJXk5nZh0+/H/hcAf
 FZ2KcClK/IgbAKtgYP0w8sQAK76aZsc=
X-Google-Smtp-Source: ABdhPJy9zrC3fUnmHHu39HsmbrtRl3DB555IsUvWXhC5Jhkd5kHj+1f3HP+MlRfX+bK97vBclSBKrQ==
X-Received: by 2002:a6b:d907:: with SMTP id r7mr630227ioc.37.1605246920834;
 Thu, 12 Nov 2020 21:55:20 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id a1sm3898761iod.39.2020.11.12.21.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 21:55:20 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.10
Date: Fri, 13 Nov 2020 00:55:12 -0500
Message-Id: <20201113055512.3963-1-alexander.deucher@amd.com>
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

Fixes for 5.10.

The following changes since commit 4241b0411c60a97f87a25ff4da92dac53beb3039:

  drm/amdgpu/display: remove DRM_AMD_DC_GREEN_SARDINE (2020-11-04 08:43:50 -0500)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.10-2020-11-12

for you to fetch changes up to 38a2509184952f799d465b26279ef1bd36fb8277:

  drm/amdgpu: enable DCN for navi10 headless SKU (2020-11-13 00:30:05 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.10-2020-11-12:

amdgpu:
- Pageflip fix for DCN3
- Declare TA firmware for green sardine
- Headless navi fix

----------------------------------------------------------------
Bhawanpreet Lakha (1):
      drm/amd/display: Add missing pflip irq

Roman Li (1):
      drm/amdgpu: add ta firmware load for green-sardine

Tianci.Yin (1):
      drm/amdgpu: enable DCN for navi10 headless SKU

 drivers/gpu/drm/amd/amdgpu/nv.c                              | 3 +--
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c                       | 1 +
 drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
