Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C2824905
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 20:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEE610E51A;
	Thu,  4 Jan 2024 19:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 443 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jan 2024 19:28:12 UTC
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0475710E51A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 19:28:12 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 1F14F201D7;
 Thu,  4 Jan 2024 20:28:10 +0100 (CET)
Date: Thu, 4 Jan 2024 20:28:08 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH 3/6] drm/bridge: imx: imx-ldb-helper: Use dev_err_probe
Message-ID: <20240104192808.GB20694@francesco-nb>
References: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
 <20231218105718.2445136-4-alexander.stein@ew.tq-group.com>
 <20240104191928.GA20694@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104191928.GA20694@francesco-nb>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Fabio Estevam <festevam@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 08:20:37PM +0100, Francesco Dolcini wrote:
> On Mon, Dec 18, 2023 at 11:57:15AM +0100, Alexander Stein wrote:
> > This simplifies the code and gives additional information upon deferral.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

mumble, looking at this more closely with your change you stop using
the print wrapper from drm_print.h. Probably a more generic solution is
needed there?

Francesco

