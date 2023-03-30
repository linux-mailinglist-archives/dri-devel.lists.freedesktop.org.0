Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B576D006B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3C810ED88;
	Thu, 30 Mar 2023 10:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB610ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:59:51 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 5445B20B49;
 Thu, 30 Mar 2023 11:59:47 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/6] drm/bridge: tc358768: Improve parallel RGB input
 configuration
Date: Thu, 30 Mar 2023 11:59:35 +0200
Message-Id: <20230330095941.428122-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for different parallel RGB input format and mapping, this enables
using the TC358768 when the parallel input width is less than 24-bit or the
input mapping is not the default one.

In addition to that this series add support for the TC9594, that is the
automotive version of the TC358768 (100% identical from the SW point of view).

Francesco Dolcini (6):
  dt-bindings: display: bridge: toshiba,tc358768: Fix typo
  dt-bindings: display: bridge: toshiba,tc358768: Add TC9594
  dt-bindings: display: bridge: toshiba,tc358768: add parallel input
    mode
  drm/bridge: tc358768: Add TC9594
  drm/bridge: tc358768: Add parallel data format cfg
  drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation

 .../display/bridge/toshiba,tc358768.yaml      | 20 +++++++-
 drivers/gpu/drm/bridge/tc358768.c             | 51 +++++++++++++++++++
 2 files changed, 69 insertions(+), 2 deletions(-)

-- 
2.25.1

