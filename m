Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665994C8BE8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 13:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CD610E5ED;
	Tue,  1 Mar 2022 12:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAD510E5ED
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 12:44:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p9so20291469wra.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 04:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NE6g7aBhFEFaU1SdDrP5TjQGRb1erEa1b8QUBNRKP18=;
 b=j8QNPzpBBwBQsNRsgki/IixZuYmjcvTT4n/s4mdWQdEU29kERc5OPyQiZw00O0Q6P1
 4U7qervFacqdo5DSMxwm5qdDcAIhHjlE8VQcCSYnISTmkElcutJFQnYkLU17ZJUpBSX1
 J0wtDaqFPDtSy8xMSaJlAIJArSUuPHYU6nmbF+PabhTXufPApWad9OMVeDB+urqc2tEW
 G0heg/SNI8H/rrcPTZRL4FrLw0x4lqfcqMBlvitAdjExxRrC+7k2cI6Ox9OscZxeF3e7
 S4fwv7u7lUzIYSFZSFla6FCB+7HIDZduKvYzQWEHkGErdYrZT8ZTkNXD4CgtOQ2GzsrR
 Kd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NE6g7aBhFEFaU1SdDrP5TjQGRb1erEa1b8QUBNRKP18=;
 b=bPWrDBlrPAGNySAUdjO0SjJcqIFmn1Pbr12M6rr8UVVe6KHYtqpKbDx+z1coRevHFA
 9JPXaovpTV8C5K/RU6budWluuTCpP9njfG3FbZ2abyO/zDIsOZJwmJNW9vZBHXACXkKO
 KR64qK841IOyaqQwTEfKwtEs1+fFbQ8CM7PL7XtVA/rqZaMIuqKJrhMy+/iYQhkCuili
 /4cBM6WhHUR5PZ4R1yWyUhydJXMCGS+aRCLtv+1fCADZAhGK98wSy7hW3WhZmknEQwnU
 pkbyVHVFK/7kv3eq9kzKPUkod4C64qcgIt/tKqNtENjoz761UEqbaGtJ+CBUAEN4yDhi
 DgHw==
X-Gm-Message-State: AOAM532g9p1R6otEpBxzMrHvCWiF3xbni2L/NVsa9ZEeBQVnJO66/0/9
 MuVIq50Wk5jJem10iHWrnzCkOIXqw2k=
X-Google-Smtp-Source: ABdhPJwpD7PBe27k167crPL9h3picvynqlPbpGDczGmcoFFsSiB9LiyAu9LTQqWF2gPNMOoLBBCXiw==
X-Received: by 2002:a5d:4606:0:b0:1ed:d3c0:19f4 with SMTP id
 t6-20020a5d4606000000b001edd3c019f4mr20045944wrq.555.1646138671186; 
 Tue, 01 Mar 2022 04:44:31 -0800 (PST)
Received: from localhost ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 a3-20020adfe5c3000000b001e68a5e1c20sm13720105wrn.4.2022.03.01.04.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 04:44:30 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL v2] drm/tegra: Changes for v5.18-rc1
Date: Tue,  1 Mar 2022 13:44:26 +0100
Message-Id: <20220301124426.1207653-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225163250.1063101-1-thierry.reding@gmail.com>
References: <20220225163250.1063101-1-thierry.reding@gmail.com>
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

The following changes since commit 8913e1aea4b32a866343b14e565c62cec54f3f78:

  drm/tegra: dpaux: Populate AUX bus (2022-02-23 13:00:37 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.18-rc1

for you to fetch changes up to cf5086d35d8c7c2b9cb1ca34590097a5f2f8b588:

  drm/tegra: Support YVYU, VYUY and YU24 formats (2022-03-01 11:13:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.18-rc1

This contains a couple more minor fixes that didn't seem urgent enough
for v5.17. On top of that this improves YUV format support on older
chips.

----------------------------------------------------------------
Christophe JAILLET (2):
      gpu: host1x: Fix an error handling path in 'host1x_probe()'
      gpu: host1x: Fix a memory leak in 'host1x_remove()'

Dmitry Osipenko (1):
      drm/tegra: Use dev_err_probe()

Miaoqian Lin (1):
      drm/tegra: Fix reference leak in tegra_dsi_ganged_probe

Thierry Reding (3):
      drm/tegra: Fix planar formats on Tegra186 and later
      drm/tegra: Support semi-planar formats on Tegra114+
      drm/tegra: Support YVYU, VYUY and YU24 formats

chiminghao (1):
      drm/tegra: dpaux: Remove unneeded variable

 drivers/gpu/drm/tegra/dc.c    | 50 ++++++++++++++++++-----------
 drivers/gpu/drm/tegra/dc.h    |  7 +++++
 drivers/gpu/drm/tegra/dpaux.c |  3 +-
 drivers/gpu/drm/tegra/dsi.c   |  4 ++-
 drivers/gpu/drm/tegra/hdmi.c  | 34 ++++++--------------
 drivers/gpu/drm/tegra/hub.c   | 24 ++++++++------
 drivers/gpu/drm/tegra/plane.c | 73 ++++++++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/plane.h |  2 +-
 drivers/gpu/host1x/dev.c      |  8 +++--
 9 files changed, 140 insertions(+), 65 deletions(-)
