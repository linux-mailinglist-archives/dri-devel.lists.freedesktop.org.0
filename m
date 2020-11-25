Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC962C42AE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 16:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D836E8BE;
	Wed, 25 Nov 2020 15:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938BF6E8BE;
 Wed, 25 Nov 2020 15:11:55 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id z3so1786999qtw.9;
 Wed, 25 Nov 2020 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NbN+usI9dkWtUkhAV5x714S2MuiTlPFp3Bt6KB4Nktw=;
 b=L0Zlv3H8wOxJRFW2zIP/9O8WqMlwwQzme6Xj4XTKp9WsCHGjNUriVIp6XiLNMYeW/I
 ZzvHohPE65UeyQQvmRIAT0mDhpR1jw496d9Nzp3PzU7xCJK2yegIAoWakITSImJngy3k
 ghGbGuigXKxJe/5UhMqj4KKv6v8I1M37NgIinwR++2pDmVbhymLUSQSq3QrFabAm7rci
 sGE9IIylhSnQ69WKiKCJ9bzVgDTt4PT3Hua7CR24JQXYt1jC+T4f4KghY33sYBj//cev
 D80AYEsCRpQWt9RGq0D0NH0pou/3qUMIvwfHtOQfqPwD59q974J376mm6IY9ECYKw0vH
 +JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NbN+usI9dkWtUkhAV5x714S2MuiTlPFp3Bt6KB4Nktw=;
 b=W8CPiJjzZCIiq2yI6cqa/sJL2uQoNdpZoB73R+BLKsV69M/qm79dkf8CGFVo06rYK6
 uBUwje6oo/7Kq/REbG6a8KcRV7Mw8sXRerdZ6xsw/+JqqN+YchS2zBEjBwtMx5pnXkzS
 /K/T3XJcT1zC4cJUwuDaYsTt+Qzp1k6he0W5xEAP1vLKxGCeN5JRwLG2g72QZ7yvRXTY
 H9TWLFKOcomVj9t0e/t3AsnpXULRaqiY83sbTjyvkHUF11KCNcqmTohQEJLURL0Ogs/G
 nUhK/3Q2VFtaJhCeFAs45+Y/JNoowzHJEgOdqM3aVD6B9dBSaSHCe/9dKgtG4bjo/Q4X
 ttAQ==
X-Gm-Message-State: AOAM53326G8EpStXd9/LxrvhzRW+sXzWcK309ttfiZOYNNrsN31EmvhP
 fqjzqJ991U+8nxtQV6c8NqJ9WARvrvw=
X-Google-Smtp-Source: ABdhPJzyOlpEXaVdfTZCHoDLn5SQweFpzI5QzOkGhYxLhFWTDOCTfqsB/ClOOU5JRnWbZzU9m5q0Vw==
X-Received: by 2002:ac8:7395:: with SMTP id t21mr3578825qtp.358.1606317114275; 
 Wed, 25 Nov 2020 07:11:54 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id z81sm728042qkb.116.2020.11.25.07.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 07:11:53 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.10
Date: Wed, 25 Nov 2020 10:11:45 -0500
Message-Id: <20201125151145.4263-1-alexander.deucher@amd.com>
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

The following changes since commit 6600f9d52213b5c3455481b5c9e61cf5e305c0e6:

  Merge tag 'drm-intel-fixes-2020-11-19' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-11-20 11:21:54 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.10-2020-11-25

for you to fetch changes up to 60734bd54679d7998a24a257b0403f7644005572:

  drm/amdgpu: update golden setting for sienna_cichlid (2020-11-24 12:33:07 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.10-2020-11-25:

amdgpu:
- Runtime pm fix
- SI UVD suspend/resume fix
- HDCP fix for headless cards
- Sienna Cichlid golden register update

----------------------------------------------------------------
Kenneth Feng (1):
      drm/amd/amdgpu: fix null pointer in runtime pm

Likun Gao (1):
      drm/amdgpu: update golden setting for sienna_cichlid

Rodrigo Siqueira (1):
      drm/amd/display: Avoid HDCP initialization in devices without output

Sonny Jiang (2):
      drm/amdgpu: fix SI UVD firmware validate resume fail
      drm/amdgpu: fix a page fault

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             | 20 +++++++++++---------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 5 files changed, 17 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
