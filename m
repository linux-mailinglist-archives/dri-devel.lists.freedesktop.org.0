Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1C9ADBCC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 08:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188C310E8A7;
	Thu, 24 Oct 2024 06:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3WELXQXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D4110E8A7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 06:13:52 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6e376aa4586so10675877b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729750431; x=1730355231;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=55/hvgYNWdvBpZX8vS6a0ZNEj9vu+ZIZIEdADHyK4mM=;
 b=3WELXQXqqy4b+zD5PU/Z6qVSwF1UcCBKFpd+S+lbXHMY8F4Qftu3zyJ92SAHH2gn+i
 0GjkqkpeJrDAZ3nlKIMGVjqblozyyM96ddClBd+6IOdmVZbSfX6yL0rbMWyyixxdXmQ0
 kyrn5P78pL9Ic32rz/0xfXSW9S4iVq8R5gVi3yxd3KeUGMtWucUEvJA+pK0/lLnpHEr0
 +6Vvt5RupU5+A6SSfHpRwHQX8Y5SQv4/AmeN2VgcP4rcZYi58ijHlIhv9LBa7mvpo7wx
 3K0K+59C3WN/sFILUqUI6B1dIfVjT/wvktfedSnaO08YpreBpo8y3iUruZliShA7Qu1i
 /1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729750431; x=1730355231;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=55/hvgYNWdvBpZX8vS6a0ZNEj9vu+ZIZIEdADHyK4mM=;
 b=LaffuKHntgw6PvjVV3xPQCkmg0JJtGszIbv9OnVscZ/HJPmYwoCbayw4DXtx9P1ZzY
 Tb18/795aoTxCWD4/rYCWi1nJiHbbT3Sdy4g7T8YqtbdwpQMfUoiVQzyCxo4A2pLPQEo
 tRfQkBEi3mNa9u1dt0cZhdOPg5BOJCbYJI0X7/kaiS7XUV0IAAJ/ADTD/2sMDbTSInyA
 wH+DkAYI+gHWeri1MinKPr6Yg3tXWTkdf/RjVxHctYIVXb/qSRtjxJ4IkTv4imKFQo6a
 AFFSHLUV6CCi/szFySw5bGrsUxVkxLCAIA33KMaUnRMkxPw9ytn8J6mXpQ9aES+sYixS
 0lEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Xv4yYNuOXAafpaVWg2EMDAiUSDh7hY+LZT2BFDTOsTioiPx7mO9z4S6RDhM66o7n+22nmrqao9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoLgXLbPLUsglOdXBntF4rcdE/Aj/TpPihvleTLXsDzp+gv0rt
 9ugfgJNvi0k/DaPx7KQeqVuVHCgz/lFGt2CaH+REB9hmi4ln7DK/yGOqU/oBFa9tyT4mKlDgcLK
 OMRzlb2SHnqnybw==
X-Google-Smtp-Source: AGHT+IEjm5xZ8oWEf7u6//TA4Kt5HjH6iFnxvFJipXmVy8asdr1VaVjmTPVebbvVpJLKuPZgRMsL7ilkx4vd+j0=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:7082:b0:6e7:e493:2db6 with SMTP
 id 00721157ae682-6e86632ee4bmr196737b3.3.1729750431239; Wed, 23 Oct 2024
 23:13:51 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:41 -0700
Message-Id: <20241024061347.1771063-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 0/3] A few minor fw_devlink fixes
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
 "=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?="
 <nfraprado@collabora.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Probably easiest for Greg to pull in these changes?

PSA: Do not pull any of these patches into stable kernels. fw_devlink
had a lot of changes that landed in the last year. It's hard to ensure
cherry-picks have picked up all the dependencies correctly. If any of
these really need to get cherry-picked into stable kernels, cc me and
wait for my explicit Ack.

Thanks,
Saravana

Saravana Kannan (3):
  drm: display: Set fwnode for aux bus devices
  phy: tegra: xusb: Set fwnode for xusb port devices
  drivers: core: fw_devlink: Make the error message a bit more useful

 drivers/base/core.c                      | 4 ++--
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 drivers/phy/tegra/xusb.c                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.0.105.g07ac214952-goog

