Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773C7AFB49
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 08:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B4910E46F;
	Wed, 27 Sep 2023 06:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 334 seconds by postgrey-1.36 at gabe;
 Wed, 27 Sep 2023 06:44:25 UTC
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45D310E029
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 06:44:25 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 0AF442065C;
 Wed, 27 Sep 2023 08:38:46 +0200 (CEST)
Date: Wed, 27 Sep 2023 08:38:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: stable <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA
 and EOT packet
Message-ID: <ZRPN8ii6jqQqZi6r@francesco-nb.int.toradex.com>
References: <20230403190242.224490-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403190242.224490-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 09:02:42PM +0200, Marek Vasut wrote:
> Do not generate the HS front and back porch gaps, the HSA gap and
> EOT packet, as per "SN65DSI83 datasheet SLLSEC1I - SEPTEMBER 2012
> - REVISED OCTOBER 2020", page 22, these packets are not required.
> This makes the TI SN65DSI83 bridge work with Samsung DSIM on i.MX8MN.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Hello,
can you please queue up this to kernel v6.1-stable ?

commit ca161b259cc84fe1f4a2ce4c73c3832cf6f713f1
Author: Marek Vasut <marex@denx.de>
Commit: Robert Foss <rfoss@kernel.org>

    drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and EOT packet
    
    Do not generate the HS front and back porch gaps, the HSA gap and
    EOT packet, as per "SN65DSI83 datasheet SLLSEC1I - SEPTEMBER 2012
    - REVISED OCTOBER 2020", page 22, these packets are not required.
    This makes the TI SN65DSI83 bridge work with Samsung DSIM on i.MX8MN.
    
    Signed-off-by: Marek Vasut <marex@denx.de>
    Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Signed-off-by: Robert Foss <rfoss@kernel.org>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230403190242.224490-1-marex@denx.de


It solves a real issue with some displays not working without it.

Thanks,
Francesco

