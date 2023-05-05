Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB16F8883
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8F510E063;
	Fri,  5 May 2023 18:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338E410E063
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:14:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 912076114C;
 Fri,  5 May 2023 18:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31340C433EF;
 Fri,  5 May 2023 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683310458;
 bh=0BxOsweHAsdSWwpMc1VYAmtq0gF5pxlUHWsC8Y24ZNo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oNwdu0OIW76KAjenXjaZsiXJVTDfeFjpl86Xt688+csW3DdJtQwgf6gxvWIARc8It
 9NyALEij4thtsMl73Ex5Ifl6tupPOhAAg/FB613jKLtcLpSfrMTRd4IsxHBcsSMPBY
 x/8pwCGWR5fTK1v/x6mQkIA0y4sUFrLqTHgdkIujCHID1cOT1Yxzp/3oo0tniWgDhJ
 BvxKMzAN+lL/5ajjRkyNYRRDJDZQg/mVjbZzmoh4SScw0O08EDXCMg50VPS5O2PE3C
 PrgWjZ/Okqhy8Q1Azsg3Y38W7QXMwfmwTf9BLA9qnE/OkVGMXZSaOA+romMGy8+XUx
 51J/o3fLoDWoA==
From: rfoss@kernel.org
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco@dolcini.it>, tomi.valkeinen@ideasonboard.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v1 0/9] drm/bridge: tc358768: various fixes on PLL
 calculation and DSI timings
Date: Fri,  5 May 2023 20:14:11 +0200
Message-Id: <168331044052.921601.10791583333930906104.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230427142934.55435-1-francesco@dolcini.it>
References: <20230427142934.55435-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
 Robert Foss <rfoss@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Thu, 27 Apr 2023 16:29:25 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series includes multiple fixes on the tc358768 parallel RGB to DSI driver.
> 
> With the following changes I am able to have a stable display output using a TI
> SN65DSI83 (DSI-LVDS bridge) and a 1280 x 800 LVDS display panel and the
> register values are coherent with Toshiba documentation and configuration
> spreadsheet, I was not able to test any other display sink.
> 
> [...]

Applied, thanks!

[1/9] drm/bridge: tc358768: always enable HS video mode
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ee18698e212b
[2/9] drm/bridge: tc358768: fix PLL parameters computation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ee18698e212b
[3/9] drm/bridge: tc358768: fix PLL target frequency
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ee18698e212b
[4/9] drm/bridge: tc358768: fix TCLK_ZEROCNT computation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ee18698e212b
[5/9] drm/bridge: tc358768: fix TCLK_TRAILCNT computation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ee18698e212b
[6/9] drm/bridge: tc358768: fix THS_ZEROCNT computation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=77a089328da7
[7/9] drm/bridge: tc358768: fix TXTAGOCNT computation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3666aad8185a
[8/9] drm/bridge: tc358768: fix THS_TRAILCNT computation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bac7842cd179
[9/9] drm/bridge: tc358768: remove unused variable
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e4a5e4442a80



Rob

