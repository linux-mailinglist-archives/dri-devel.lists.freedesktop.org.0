Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40EEB537E6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B59010E058;
	Thu, 11 Sep 2025 15:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="YzSMYxPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E671110E058
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:35:01 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 7D2D81FE01;
 Thu, 11 Sep 2025 17:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1757604898;
 bh=UyweX7SE8c9CfDGXhCto/AhrdcqS5N0Mx0GHOkPY9yE=; h=From:To:Subject;
 b=YzSMYxPh8M1tJOBzz9j3MD96AcqlXsqfmaOSV3v1qUZCRub1QcVBfYLiFKjxVFpSK
 Pvm4QXfrS8OkYYV0Ihi0lZPmowutCCzCt9lDazrvhjtrU7HRlLFw6QTbakTzpO8MxP
 cZskO0tenr8Z4Qg65SlUg7eBAWO4cPJUh3qePcDDyJ4NAlTSvV7zhAEhlwUihtiD8D
 3niw+e9WGsntqBGH++t/HEh6OOybQEyFVjElNj9B9d86uYuzAPe14Pld2rlRlfrUG/
 bCkkuYP28vv7MDNwToBhF8/JK5L5UwYfLCpTkAqwr88O1ugWPNfD+xB6i99jaH2tLw
 5jZzjnu0J8I8A==
Date: Thu, 11 Sep 2025 17:34:53 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: lontium-lt8912b: Do not generate HFP
Message-ID: <20250911153453.GA80715@francesco-nb>
References: <20250728150059.2642055-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728150059.2642055-1-max.oss.09@gmail.com>
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

Hello all,

On Mon, Jul 28, 2025 at 05:00:50PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The datasheet of lontium-lt8912b doesn't require blanking during
> the HFP period. Thus use LP during HFP.
> 
> Tested with a samsung-dsim (i.MX8 MM) and a tc358768 DPI to DSI bridge
> as the DSI host.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Just a gently ping on this

Francesco
