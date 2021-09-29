Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870241CB74
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B136EAC5;
	Wed, 29 Sep 2021 18:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2065F6EAC5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 18:05:31 +0000 (UTC)
Received: from notapiano (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9C0951F44850;
 Wed, 29 Sep 2021 19:05:27 +0100 (BST)
Date: Wed, 29 Sep 2021 15:05:22 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Thomas Hebb <tommyhebb@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/rockchip: dsi: Reconfigure hardware on resume()
Message-ID: <20210929180522.3zksg7mpwdut7tra@notapiano>
References: <20210928213552.1001939-1-briannorris@chromium.org>
 <20210928143413.v3.2.I4e9d93aadb00b1ffc7d506e3186a25492bf0b732@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210928143413.v3.2.I4e9d93aadb00b1ffc7d506e3186a25492bf0b732@changeid>
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

On Tue, Sep 28, 2021 at 02:35:50PM -0700, Brian Norris wrote:
> Since commit 43c2de1002d2, we perform most HW configuration in the
> bind() function. This configuration may be lost on suspend/resume, so we
> need to call it again. That may lead to errors like this after system
> suspend/resume:
> 
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-kingdisplay-kd097d04 ff960000.mipi.0: failed write init cmds: -110
> 
> Tested on Acer Chromebook Tab 10 (RK3399 Gru-Scarlet).
> 
> Note that early mailing list versions of this driver borrowed Rockchip's
> downstream/BSP solution, to do HW configuration in mode_set() (which
> *is* called at the appropriate pre-enable() times), but that was
> discarded along the way. I've avoided that still, because mode_set()
> documentation doesn't suggest this kind of purpose as far as I can tell.
> 
> Fixes: 43c2de1002d2 ("drm/rockchip: dsi: move all lane config except LCDC mux to bind()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
