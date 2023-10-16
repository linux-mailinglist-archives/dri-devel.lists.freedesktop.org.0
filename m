Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA467CA3B1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9D10E162;
	Mon, 16 Oct 2023 09:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA2310E162
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:13:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E861460DFF;
 Mon, 16 Oct 2023 09:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C8FC433CB;
 Mon, 16 Oct 2023 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697447587;
 bh=j761xarSLCNPEyfkRFS6qQSw7YrKA9macjPqSUOVD7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n16rmH6n2lZkMK6AFtZKJxaYnArQ5Zw8uPeXgKhU/IKNFBGe03FI+7cws4IcAu1KN
 BZUdeDeGMG5O1YiOCARf3vwbjMr2LBjuJqPD+lciNNErClmkfIefHzV/NU70we0zs6
 QmK4jCLZk0zqD+PU5V43JKyRbxvASdRQSGZ8sSv/s4MCDKql8I6Frx/ibfW7dCwwD0
 MwEHr3SAFx615qbWfv8NOxsP5K2lamZKCuFknyVcxkPDOiRWOPDiMXR4UOTcKIfQHU
 nsnDRuuxzG2H70RCSNuYH09+eamIlhtRqDHleeGBLm+WqzPTZOdM+nEUQvw29pq4Et
 YJVDKfn2fSXRA==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Biju Das <biju.das.jz@bp.renesas.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 0/8] ADV7511 driver enhancements
Date: Mon, 16 Oct 2023 11:12:57 +0200
Message-ID: <169744753889.562442.4612949090009224880.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Aug 2023 15:23:50 +0100, Biju Das wrote:
> This patch series aims to improve ADV7511 driver by adding
> feature bits and data instead of comparing enum adv7511_type for
> various hardware differences between ADV7511, ADV7533 and ADV7535.
> 
> This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
> ADV7535.
> 
> [...]

I aplogize for the delay in merging this very neat series.

Applied, thanks!

[1/8] drm: adv7511: Add struct adv7511_chip_info and use i2c_get_match_data()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=19e77c7aef57
[2/8] drm: adv7511: Add max_mode_clock_khz variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=11ae4e406dd9
[3/8] drm: adv7511: Add max_lane_freq_khz variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=399562fc02d8
[4/8] drm: adv7511: Add supply_names and num_supplies variables to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ac196fb9a17
[5/8] drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8d6cf5719011
[6/8] drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c75551214858
[7/8] drm: adv7511: Add link_config variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7618aa3ab38e
[8/8] drm: adv7511: Add hpd_override_enable variable to struct adv7511_chip_info
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e12c4703cec0



Rob

