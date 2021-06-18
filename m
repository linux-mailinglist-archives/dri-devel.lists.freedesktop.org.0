Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3573ACA91
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 14:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBD06E9F7;
	Fri, 18 Jun 2021 12:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953C76E9F7;
 Fri, 18 Jun 2021 12:04:46 +0000 (UTC)
Received: from mwalle01.kontron.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7D5DA2224A;
 Fri, 18 Jun 2021 14:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1624017883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8Cup0WYTz8qyPQdVfnKBH0xN0Z3VBg7xVZOWY2enN54=;
 b=JcFkWaEbXa1aiX5rRfaEf+xdcq8mFodOnYH0x8e8YYfoGuNcuMsyTngV67pcfL9Cn3rhCo
 jO6IZCSdjlOZunQ955pIefJ7mKlumAjCSnT6UrDr34Xj1Nn7Lnv0gzYyFqWHD6IevqX7Pb
 bF5UaJc/StzAqFEuTsUEEOqDrl60cXA=
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/etnaviv: add GC7000 r6202 support
Date: Fri, 18 Jun 2021 14:04:31 +0200
Message-Id: <20210618120433.14746-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: David Airlie <airlied@linux.ie>, Michael Walle <michael@walle.cc>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Lukas F . Hartmann" <lukas@mntre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the first step to bring GPU support to the NXP LS1028A SoC. It
features a Mali DP500, a Vivante GC7000 and has one DisplayPort output
which is driven by a Cadence MHDP controller and PHY.

This was briefly tested with glmark2, a patched mesa kmsro driver [1]
to support the mali DP500/GC7000 duo, fixes from mesa merge request
9255 [2] and using ETNA_MESA_DEBUG=no_supertile,no_ts.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11419
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9255

Michael Walle (2):
  drm/etnaviv: add HWDB entry for GC7000 r6202
  drm/etnaviv: add clock gating workaround for GC7000 r6202

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  |  6 +++++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.20.1

