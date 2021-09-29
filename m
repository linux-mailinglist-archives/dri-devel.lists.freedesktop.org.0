Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47541CB86
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1276EAC8;
	Wed, 29 Sep 2021 18:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E096EAC8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 18:09:29 +0000 (UTC)
Received: from notapiano (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C9D6B1F44852;
 Wed, 29 Sep 2021 19:09:25 +0100 (BST)
Date: Wed, 29 Sep 2021 15:09:20 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Thomas Hebb <tommyhebb@gmail.com>
Subject: Re: [PATCH v3 3/4] drm/rockchip: dsi: Fix unbalanced clock on probe
 error
Message-ID: <20210929180920.mczakda7msbojrxx@notapiano>
References: <20210928213552.1001939-1-briannorris@chromium.org>
 <20210928143413.v3.3.Ie8ceefb51ab6065a1151869b6fcda41a467d4d2c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210928143413.v3.3.Ie8ceefb51ab6065a1151869b6fcda41a467d4d2c@changeid>
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

On Tue, Sep 28, 2021 at 02:35:51PM -0700, Brian Norris wrote:
> Our probe() function never enabled this clock, so we shouldn't disable
> it if we fail to probe the bridge.
> 
> Noted by inspection.
> 
> Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
