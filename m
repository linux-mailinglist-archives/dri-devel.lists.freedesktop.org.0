Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A4A7A93DF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A420A10E5CB;
	Thu, 21 Sep 2023 11:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95D1610E5CB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id C959F8107;
 Thu, 21 Sep 2023 11:37:23 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:37:22 +0300
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] omap: dsi: do not WARN on detach if dsidev was never
 attached
Message-ID: <20230921113722.GS5285@atomide.com>
References: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
 <6200f2c7-4e56-ee07-ec1e-589ba81c1b32@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6200f2c7-4e56-ee07-ec1e-589ba81c1b32@ideasonboard.com>
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
Cc: letux-kernel@openphoenux.org, Arnd Bergmann <arnd@arndb.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, kernel@pyra-handheld.com,
 sre@kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [230921 10:53]:
> I sent a patch to the DSI framework code,
> "[PATCH] drm/mipi-dsi: Fix detach call without attach".
> 
> If that fixes the issue (please test, I don't have a suitable platform),
> perhaps it's a better fix as detach really shouldn't be called if attach has
> not been called.

Yup that works for me, replied with my Tested-by on that thread.

Thanks,

Tony
