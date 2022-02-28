Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6664C6B19
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A878B10E554;
	Mon, 28 Feb 2022 11:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED0B10E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id E91441F438DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646045989;
 bh=gFkF0Up+9NtOgOLNqe9lR243CToghyCTK5EY9eHmHzs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MJ8oRoRC8+rjgLECF5i6IhrMZzx/P7lN066bGYaNvM2pwNtfI/7W0OUur7hJWQhR0
 CCtVjsT87MhjVFsBPHdsIZWkI77UAoagHwIbtwEzgZ9xL9BeyIkPXDzZp/1BcchcIG
 BhSsZLqbnKAOu0ZpZ34ZZy4lyINvb6pmmzeoKe0kXTGv8hYJLkQ/OPOyiyiMl/hIRy
 vXbePQkvpAHYPycy0hQqHFYZCYXJBKfUbbGy7Er2jJCkE2Pdc9/+mk7lQx+sdlb/9+
 na7iJkOvpxzDEIdiPY9gWohTyDDSDd6n5Qg7fFxa+xqWGqrxQKZ0xwD2ylDTQ7BaYD
 +y/9ykdyFCdXQ==
Message-ID: <29ca1e0c-cb55-edcc-fed5-d60a122dc20b@collabora.com>
Date: Mon, 28 Feb 2022 13:59:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 03/24] drm/rockchip: dw_hdmi: rename vpll clock to
 reference clock
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-4-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220225075150.2729401-4-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 28 Feb 2022 11:45:51 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/25/22 10:51, Sascha Hauer wrote:
> "vpll" is a misnomer. A clock input to a device should be named after
> the usage in the device, not after the clock that drives it. On the
> rk3568 the same clock is driven by the HPLL.
> To fix that, this patch renames the vpll clock to ref clock. The clock
> name "vpll" is left for compatibility to old device trees.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v6:
>     - Simplify by using devm_clk_get_optional() instead of devm_clk_get()
> 
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 27 +++++++++++----------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Looks nice now. Thank you!

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
