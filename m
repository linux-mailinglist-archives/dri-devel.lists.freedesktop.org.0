Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F7897A2CF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EDD10E364;
	Mon, 16 Sep 2024 13:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="fGnrhHKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de
 [129.70.45.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BCA10E364
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1726492751;
 bh=gwrpMCyhWMl92SWwm7Q0cD5PVk+J9gcPPoBFtVSNkmo=;
 h=From:To:Cc:Subject:Date:From;
 b=fGnrhHKOZMRhOtoy28FyzwZuny/XDeksH0ITtZIgnZHKY2ZPPxKQh9gVAKxeyEOd1
 fRpcUmCQqXVhre8P6cOZiqmgKwQeG83qZZaPRGIj6ecl62Of0XF4pn/neFizu1FrEa
 2h97pj5jVT7+2w649rgxUiEXREPYhIuvmJ7O68Iu1JJRegBrBEzsrHFTTLlwcV3SDS
 sGguQye6wiMhE/rjmGOehEy4+NjAehkINqb5FDB+tSUytTkvQEQlNiK7dQ3C9mVvfI
 /Sdvz+gzQoOfcyyd3S13c7rirA8d/pyEQYTlCFTaKHOAr7/vnKHUzalaFqZwtdhSgB
 rH5WstPjDwqng==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id 089C12066F;
 Mon, 16 Sep 2024 15:19:11 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/3] Panel orientation quirks for AYA NEO handhelds
Date: Mon, 16 Sep 2024 15:18:49 +0200
Message-ID: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this is a re-submit of panel orientation quirks for some of the handheld
devices by vendor AYA NEO.

The quirks were posted to dri-devel some time ago, but got lost:
https://lore.kernel.org/lkml/20230621220615.1253571-2-samsagax@gmail.com/T/#u

With best wishes,
Tobias

Joaquín Ignacio Aramendía (3):
  drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
  drm: panel-orientation-quirks: Add quirk for AYA NEO Founder edition
  drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.44.2

