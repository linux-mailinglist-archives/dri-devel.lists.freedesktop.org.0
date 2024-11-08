Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A1E9C1E9B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 14:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4671D10E9B7;
	Fri,  8 Nov 2024 13:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="bujVIQcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB1810E9B6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 13:54:03 +0000 (UTC)
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1731074041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k3Zn2bpSYjx0KdspBHLAyKP2HSBrvqQHEj0Q/hMzoJk=;
 b=bujVIQcH927mV5DqCLvbMvlG8Kcc1rhDUr244chfKffchmcgQJebhKtH6f5ajEukZ+1Z1X
 YpwG/j3iMCdCP5SF+TRY6GnVUVrZZPDG0XknzDLPgcOmF4MJ4xj6Dd4paLXjonnUGZUz3q
 ikmqsue3HJE8p5RnZSpuunABSwsn+gDnLmaxAeEJS/E131J3Q8eG8zuD3QQJLqecymiDPt
 iQztHpdQlrTw46doO+npJDfzRCY4zDabzIaxtF2h0rUwfizhBOVWdzeJT1tC/K7yc1VZtn
 KIGSHnN75JxuVtov0StSPDS18Pj+RW2+XxCaImwuoKNK6egIjMVVH+XljlXI5Q==
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] No longer produce error messages when dphy is deferred
Date: Fri,  8 Nov 2024 14:53:56 +0100
Message-Id: <cover.1731073565.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

This is a small series that makes the deferred dphy no longer emit error
messages to the kernel log, which may even be repeated multiple times, to
avoid possible false impression of some issues.

This series also performs a few small, rather trivial code cleanups, to
make the code a bit easier to read and a bit more consistent.

Dragan Simic (2):
  drm/rockchip: dsi: Perform trivial code cleanups
  drm/rockchip: dsi: Don't log errors on deferred dphy

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

