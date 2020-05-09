Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3931CD24B
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586246E20B;
	Mon, 11 May 2020 07:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pruto.48.io (48.io [37.205.10.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2756E6E33C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 11:27:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pruto.48.io (Postfix) with ESMTPSA id 7F64194A35;
 Sat,  9 May 2020 13:18:42 +0200 (CEST)
DMARC-Filter: OpenDMARC Filter v1.3.2 pruto.48.io 7F64194A35
Authentication-Results: pruto.48.io;
 dmarc=none (p=none dis=none) header.from=48.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=48.io; s=default;
 t=1589023122; bh=rQmJ3VZbaNqR1Alm9ewytRFpWRVzT3bSjw86Qk2N+54=;
 h=From:To:Cc:Subject:Date;
 b=cYEODrpRKCVHjb09MmTrrjw7uMeQ7CpwSZt+CPRFqhFbsVaf4pU0q5NvWPWHYU6xJ
 QywQWnnRsmlsnsI9D089FXG68rV4mJ+kax4ObiNIXLQqhddvpSQX/4Ijl6fiXdGFAo
 ehBA/Jlkctf6It+4KEUL/zzurg3sJPD+v+m22g7g=
From: srk@48.io
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/2] Novena laptop panel
Date: Sat,  9 May 2020 13:18:32 +0200
Message-Id: <20200509111834.26335-1-srk@48.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Richard Marko <srk@48.io>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, Sean Cross <xobs@kosagi.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Richard Marko <srk@48.io>

Contains updated patches I've received from Marek with the following
changes:

- yaml docs migration
- fixed Fabios email
- panel commit split into two according to checkpatch request
- added connector for panel

Last review also requested more details for panel like timings and
bus format but these are marked as TBD (timings) in panel datasheet
and the bridge datasheet is not helpful either.

Tested on a Kosagi Novena laptop with imx6 display controller.

Based on v5.7-rc2, applies to drm-misc-next 5e6ed29d72d2

CC: Marek Vasut <marex@denx.de>
Cc: Sean Cross <xobs@kosagi.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>

Sean Cross (2):
  dt-bindings: n133hse-ea1: Add Innolux N133HSE panel
  drm/panel: simple: Add Innolux N133HSE panel support

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 27 +++++++++++++++++++
 2 files changed, 29 insertions(+)

base-commit: ae83d0b416db002fe95601e7f97f64b59514d936
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
