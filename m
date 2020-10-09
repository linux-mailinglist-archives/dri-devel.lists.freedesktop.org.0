Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C5288074
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 04:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F346EC0D;
	Fri,  9 Oct 2020 02:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEFD6EC0C;
 Fri,  9 Oct 2020 02:49:50 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id c23so6933962qtp.0;
 Thu, 08 Oct 2020 19:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94CvYf8VNy2+UuSZRfNQshZy7BICopf1bewYnuNADqw=;
 b=ixiiTz6T6S9XDLaanVhgJV0E48pr7fTHGLV5Ed9HJfL+xivHgZqZz0kovCcP48JvHy
 i26meKYxYVuC7KcUODP4mM6/ewx3je0KkC+s85b9BgnPuyDylnt6mhYrd/YgCmvNQClQ
 0pjHPN1BzxvHre05c7HTwN9fXgPVvyZl3yA2vWJkXoS30KsexUl9yGn74CEMEN+enIJc
 gugFxIIsRhTO2KSSF5kC6w7mJMnBCnHyjemcbnwu8iAKe8ujfk8qvs8QijU7E+z4PCAi
 Oca8+zc1bUDfbVuzpWc3N457wEADNPclgQz0n7a8Fs+QCrRcbfnwFxibPqgHXMWkcsIc
 yQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94CvYf8VNy2+UuSZRfNQshZy7BICopf1bewYnuNADqw=;
 b=rKRDWkdrfuuOWONkjPknD6VBVlvRHptuVMy7kLMYIhpkxviJSbhSOiwAAVtAbrLx2K
 cwUDYV385GsnG+i+obrXvYsD0MELZqOs/PWTThFGK8qdswmxNqxz04nBxRDRY/kGmNaJ
 tM49ALCrYjDMKmhbNktRD0Kt3/s/wWr7lYRpcnDTQwHN/U9wmqpDY1ZsRvwsj6JrDvXk
 cdb5V8f1oo3DcVfyHcusFP+AFibwEPQ/8v/zQWgyu+bYF2W8A+vVeH55vxEbN96pnvub
 uu7R7BRVAoHNlSyiXiQe03Z3OepFfkryCG945oLT1Y5R9jJRLkeymU9QH2S+M1S3t1aV
 a6Jw==
X-Gm-Message-State: AOAM530P0N/oVIjAqqKI2/i8pDUTJtG1OIQ4qnZFfneFC5U+CwQU4/ju
 r3aUZaM0yAQs5lNTX4ee9zHwpRJBx1w=
X-Google-Smtp-Source: ABdhPJy9erLnYMjt0ViZd7LMGVc/NO5NADMdRxnMqSqrLqnKq4MzZO+GNZ3j0E7U79cocZXwyDFvmg==
X-Received: by 2002:ac8:22a1:: with SMTP id f30mr11911737qta.33.1602211789439; 
 Thu, 08 Oct 2020 19:49:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id 185sm5313551qke.16.2020.10.08.19.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 19:49:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.9
Date: Thu,  8 Oct 2020 22:49:17 -0400
Message-Id: <20201009024917.3984-1-alexander.deucher@amd.com>
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

Some important last minute fixes for 5.9.

The following changes since commit d10285a25e29f13353bbf7760be8980048c1ef2f:

  drm/nouveau/mem: guard against NULL pointer access in mem_del (2020-10-07 15:33:09 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.9-2020-10-08

for you to fetch changes up to 33c8256b3bcc0425caec2bb7511e34176f464348:

  drm/amd/display: Change ABM config init interface (2020-10-08 17:15:52 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.9-2020-10-08:

amdgpu:
- Fix a crash on renoir if you override the IP discovery parameter
- Fix the build on ARC platforms
- Display fix for Sienna Cichlid

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/swsmu: fix ARC build errors

Dirk Gouders (1):
      drm/amdgpu: fix NULL pointer dereference for Renoir

Yongqiang Sun (1):
      drm/amd/display: Change ABM config init interface

 drivers/gpu/drm/amd/amdgpu/soc15.c                    | 10 +++++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     |  2 +-
 .../gpu/drm/amd/display/modules/power/power_helpers.c | 19 +++++++++++++++----
 .../gpu/drm/amd/display/modules/power/power_helpers.h |  4 +++-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c            | 14 ++++++++++++--
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c    | 14 ++++++++++++--
 6 files changed, 48 insertions(+), 15 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
