Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0513D0CB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 00:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817B76E117;
	Wed, 15 Jan 2020 23:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83976E0F4;
 Wed, 15 Jan 2020 23:51:51 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id dc14so8245311qvb.9;
 Wed, 15 Jan 2020 15:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8o7NVoApUSqHQYO5Y+x9gRRA3zXkKtLzBZOMn6qg4Q=;
 b=hScPNWTnCvbDjHNFGk5yD15WLvAWvMHx8c0CNEmW0wn4fCFsj57PdIRwtWaPF3FrZn
 ID8fVi5DPOAMFHEF1kB7rIX9OFEqYe5/BTQo9XqUzD5LbFc+i5JGCVVW0inRhC9pLhn3
 RIs7yRdjsDt01Wk30dC2fMl/iO76QWPcZ+TQZyG1n51v7nzTQa4oBKNWfkCHzUDXhQ+Y
 5qrA7HmwjFXRwtPsPdpG6XNvjpf4KbkwlL0FvZ2QZkntXiKEZpbcAnvf34sMvx4MKMTL
 6FHrmNoJCff6cRS4psgVnA2hMy3MS89Vhoe4oTcZxEA9VWcElmx3cGepnDoD7cCOi+Q5
 ITTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8o7NVoApUSqHQYO5Y+x9gRRA3zXkKtLzBZOMn6qg4Q=;
 b=iMjttEEPkY2A6oR6VFf4IxdLfjnLJUDdiAVoCu1aYWqOgrIk8AtVrBwIppv60nAjtv
 sCvgYGGyGA1bf2bTdI+GUBk6HGKtaIgP1yNCFkcs/JuQDOoAEKkEy5vH4B4nkLlt1YFE
 hWbVB/esUneWhMKPpo2BRH/kAfAi0LJ2mQqt7DQr2eoajFMrO7laihVYrqe60SBaQFLW
 ZV6Sznagun6S8xppaf8Y34UgU/2WjmmyVRAEt9e+ddgULnY462EZwr8fvNToEoWRXSk5
 GR9gKtkZlZJSXKv+XWoumFSj0SYi9iRmTzOdWUQB5vP9kgI3m5KgsUf1wN67tPk3Dp7u
 YSfw==
X-Gm-Message-State: APjAAAWdSutzY/rjLrDEU7KUG1mZw9lK+SbqL5eLnQND5KVWsMvTcD19
 pztnV4K5M4eogu/+zTu5mzuRH7do
X-Google-Smtp-Source: APXvYqxDCtn0zsW/YrwIA+ibWMh6/fdERO8vGPQqaYGnkgsKDIJDWMW3ndb5zOffotiU9jAsQ8Y+Tw==
X-Received: by 2002:a05:6214:a08:: with SMTP id
 dw8mr24934495qvb.121.1579132310810; 
 Wed, 15 Jan 2020 15:51:50 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id x24sm10409618qtx.1.2020.01.15.15.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 15:51:50 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.5
Date: Wed, 15 Jan 2020 18:51:41 -0500
Message-Id: <20200115235141.4149-1-alexander.deucher@amd.com>
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

A couple of small fixes for 5.5.

The following changes since commit 023b3b0e139f54a680202790ba801f61aa43a5c8:

  Merge tag 'drm-intel-fixes-2020-01-09-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-01-10 11:43:02 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.5-2020-01-15

for you to fetch changes up to 3b7c59754cc22760760a84ebddb8e0b1e8dd871b:

  drm/amd/display: Reorder detect_edp_sink_caps before link settings read. (2020-01-15 17:54:54 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.5-2020-01-15:
- Update golden settings for renoir
- eDP fix

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: update goldensetting for renoir

Mario Kleiner (1):
      drm/amd/display: Reorder detect_edp_sink_caps before link settings read.

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
