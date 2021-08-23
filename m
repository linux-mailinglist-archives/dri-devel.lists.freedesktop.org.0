Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BE3F4E10
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 18:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67732898F3;
	Mon, 23 Aug 2021 16:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBE7898C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 16:12:16 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICYX-00089N-WB; Mon, 23 Aug 2021 18:12:14 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICYW-0002hc-WF; Mon, 23 Aug 2021 18:12:13 +0200
Message-ID: <85a41af99beb2c9e7d6020435a135bf9f205a5ff.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: fixes for v5.14
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Date: Mon, 23 Aug 2021 18:12:12 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Dave, Daniel,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3=
:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/imx-drm-fixes-2021-08-18

for you to fetch changes up to 72fc2752f91b40312e493afe0a72e7c76ae27990:

  drm/imx: ipuv3-plane: fix accidental partial revert of 8 pixel alignment =
fix (2021-08-16 15:18:31 +0200)

----------------------------------------------------------------
drm/imx: imx-drm alignment and plane offset fixes

Fix an accidental partial revert of commit 94dfec48fca7 ("drm/imx: Add 8
pixel alignment fix") and plane offset calculations for capture of
non-aligned resolutions.

----------------------------------------------------------------
Krzysztof Ha=C5=82asa (1):
      gpu: ipu-v3: Fix i.MX IPU-v3 offset calculations for (semi)planar U/V=
 formats

Philipp Zabel (1):
      drm/imx: ipuv3-plane: fix accidental partial revert of 8 pixel alignm=
ent fix

 drivers/gpu/drm/imx/ipuv3-plane.c |  2 +-
 drivers/gpu/ipu-v3/ipu-cpmem.c    | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)
