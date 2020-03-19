Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6918AA8F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 03:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527156E89F;
	Thu, 19 Mar 2020 02:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D786E89F;
 Thu, 19 Mar 2020 02:11:26 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id n1so227501qvz.4;
 Wed, 18 Mar 2020 19:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyNDjcIUtk2mj1zn3x1BNcAPFDNTmNPp6P9iZk4jj0s=;
 b=Xsw5hZvS3v02YO/zu+M1nPMjmrMXf3rX5CViiRIjRyRmLMoaRCizJfGTYfYoXrVl+d
 5U012/QacH7K/CSRX9F8/1Dcuo8B2YnKq9o3GBHJ+Qh+8+Q7pMEr7+KbukEmyS4q38Bu
 uTJ5FB+tpuh/jTV8AVvJef6UyB0JV8/tPIxUlxnERnxIZOcM1CyLpbbQ4tHgPLNh1j7q
 TRKwPZAhLhPyxHmb07gtoyho4AO/FH+kj7ja7Nn+uK7r1voTa284Ub86mIZ6tD2J1tJx
 M+oV6Zca9zWeuhOXSt5Ht49ThXJ1FRq2k+pXSsaTJRWYlSvYqgwaV+PzdusPDTHjrCHS
 KE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyNDjcIUtk2mj1zn3x1BNcAPFDNTmNPp6P9iZk4jj0s=;
 b=WVP5rrgp5SR3UnaSFBJH2ajebcnQ3Z+GAhHnCkHTIIuj4JHz0z+V/QK35yoZXWZmJ/
 1v+FeIhOsN7L3evBG6g2sjklFv2qbhls8q/FA1J5Nwaia+0kO4mDYnaqvyZjs1tRV2iF
 jEfb1qEXTlFMUtItKl5DdYqbWeMGuRC0ZsycbiIW6W1awalFHS/UWX7eLO1A8uv9d4le
 JtWWCBqfmK3rGnLyd9mu2M2x5HM1ny7DSl+NeOiV6iUIzL9pAr+ozMnCTRw4sViTt6Vf
 NGt3yA06zxhrQwuAyhJr6bw8YBEzBIL7+LX8O+HabSpm1z3f3TserVedvgBd9AO1pMD3
 ZdZw==
X-Gm-Message-State: ANhLgQ3zZKukit2bjgsGJiSuJak4ZLvBemJY8CJRNEJtMRWo6Mb0meqd
 hBqfzfIkPzq+3B9rtLur/j9w86mz
X-Google-Smtp-Source: ADFU+vvAB4HDyTS2PCD54j7mI+G1mpWaO64NU85Y0iJVcsYJSUT++ybcE4gh8gFBigu4PNMUO0Zl/A==
X-Received: by 2002:a0c:b203:: with SMTP id x3mr854958qvd.197.1584583885325;
 Wed, 18 Mar 2020 19:11:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id z23sm627192qkg.21.2020.03.18.19.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 19:11:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu 5.6 fixes
Date: Wed, 18 Mar 2020 22:10:45 -0400
Message-Id: <20200319021045.4071-1-alexander.deucher@amd.com>
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

Fixes for 5.6.

The following changes since commit 16b78f052d0129cd2998305480da6c4e3ac220a8:

  Merge tag 'topic/mst-bw-check-fixes-for-airlied-2020-03-12-2' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-03-13 10:38:25 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.6-2020-03-18

for you to fetch changes up to a3c33e7a4a116f8715c0ef0e668e6aeff009c762:

  drm/amdgpu: fix typo for vcn2.5/jpeg2.5 idle check (2020-03-18 18:21:57 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.6-2020-03-18:

amdgpu:
- VCN clockgating fixes
- GPR debugfs fix for umr
- GPU reset fix
- eDP fix for MBP
- DCN2.x fix

----------------------------------------------------------------
Evan Quan (1):
      drm/amdgpu: add fbdev suspend/resume on gpu reset

James Zhu (3):
      drm/amdgpu: fix typo for vcn1 idle check
      drm/amdgpu: fix typo for vcn2/jpeg2 idle check
      drm/amdgpu: fix typo for vcn2.5/jpeg2.5 idle check

Mario Kleiner (1):
      drm/amd/display: Add link_rate quirk for Apple 15" MBP 2017

Stanley.Yang (1):
      drm/amd/display: fix typos for dcn20_funcs and dcn21_funcs struct

Tom St Denis (1):
      drm/amd/amdgpu: Fix GPR read from debugfs (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c       |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        |  4 ++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c  | 11 +++++++++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c |  1 -
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c |  1 -
 10 files changed, 23 insertions(+), 10 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
