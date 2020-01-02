Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1B12E6A5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 14:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7936389AA2;
	Thu,  2 Jan 2020 13:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB327899B3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 13:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 202DE28A04E
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Complete ddc symlink addition
Date: Thu,  2 Jan 2020 14:22:56 +0100
Message-Id: <20200102132300.24309-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series completes the process of adding ddc symlink in connector's
sysfs directory: of the initial submission only the below patches are
still pending, hence this resend. Rebased onto drm-misc-next as of
2020-01-02.

Andrzej Pietrasiewicz (4):
  drm/tegra: Provide ddc symlink in output connector sysfs directory
  drm/vc4: Provide ddc symlink in connector sysfs directory
  drm: zte: Provide ddc symlink in hdmi connector sysfs directory
  drm: zte: Provide ddc symlink in vga connector sysfs directory

 drivers/gpu/drm/tegra/hdmi.c   |  7 ++++---
 drivers/gpu/drm/tegra/sor.c    |  7 ++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++----
 drivers/gpu/drm/zte/zx_hdmi.c  |  6 ++++--
 drivers/gpu/drm/zte/zx_vga.c   |  6 ++++--
 5 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
