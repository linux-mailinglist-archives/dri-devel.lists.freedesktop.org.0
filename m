Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229085689EF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FBF10FFD1;
	Wed,  6 Jul 2022 13:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CC61121B8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:47:59 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1o95Ni-0001kN-SG; Wed, 06 Jul 2022 15:47:54 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1o95Ng-0000Ee-KR; Wed, 06 Jul 2022 15:47:52 +0200
Date: Wed, 6 Jul 2022 15:47:52 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/bridge: tc358767: don't fixup mode sync polarity
Message-ID: <20220706134752.rwcbko5l5pdp43or@pengutronix.de>
References: <20220706132812.2171250-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706132812.2171250-1-l.stach@pengutronix.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-07-06, Lucas Stach wrote:
> There is no need to enforce a specific sync signal polarity on the
> DPI interface, as we can simply tell the TC358767 which polarities
> it should expect on the input interface.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
