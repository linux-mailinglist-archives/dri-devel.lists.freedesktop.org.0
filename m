Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDE817A93
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F62210E3E4;
	Mon, 18 Dec 2023 19:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E01710E370
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:04:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B949D4A;
 Mon, 18 Dec 2023 03:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1702866960;
 bh=YPAckEBh+UtrsRq0bMrNFh1hjjNvHYAydGDRzbdUjYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oeytA5DBvo/zVvbH4ouv3SkLgYbn2QZXrMlQ4dRc/r+8p2cJAiRddvt1YB0KDVx+R
 ibSpbduGPuGtN5cOdI6Ald3jMje7zDDrXTM5m5fJEpCTHABhFi7QtKWhoZjJWKF83x
 htkLGRsWoCeknWkcF5CeG7K4tW8gk6iIVMKv5GY4=
Date: Mon, 18 Dec 2023 04:36:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Message-ID: <20231218023655.GG5290@pendragon.ideasonboard.com>
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
 <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
 <CAOMZO5C7_Rj-Ja0BO0D0Po+gy+XbvyMdQf-wH5YNyhAdMof2vg@mail.gmail.com>
 <20231215142308.GL21146@pendragon.ideasonboard.com>
 <CAHCN7xJPg_Nk=o9fKwkZfVTNSB-YL0m7vY6p1O7+i=PHShp7hg@mail.gmail.com>
 <CAOMZO5AGAkPpds=5H-iQj53djcQtW5GsRQrzdC_JOOrcENhvvw@mail.gmail.com>
 <CAHCN7xLHMGcS2-QTneqqpHYU66JwuEG4TyR0j0riFGqO6RC8ug@mail.gmail.com>
 <CAOMZO5B2bWVciDEwSh+YQWu6b_Hp5ijk6Jq-bMePPTDRJ-vHFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5B2bWVciDEwSh+YQWu6b_Hp5ijk6Jq-bMePPTDRJ-vHFA@mail.gmail.com>
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Adam Ford <aford173@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 05:09:41PM -0300, Fabio Estevam wrote:
> On Fri, Dec 15, 2023 at 4:01 PM Adam Ford <aford173@gmail.com> wrote:
> 
> > Thanks for the list.  I was able to successfully build the stable 6.6
> > branch with those patches applied and I have the HDMI working.
> > Unfortunately, I get build errors on the linux-next, so it's going to
> > take me a little time to sort through all of this.
> 
> If you need help to figure this problem out, please let me know.
> 
> I haven't tried it against linux-next.
> 
> > I am thinking that it would be better to consolidate all these
> > together into one series instead of piecemealing it.  However, there
> > are some items that can be submitted right away without significantly
> > reworking them against linux-next.  Do people have a preference?
> 
> I think it makes sense to re-submit the "easy ones" right away.

Agreed. The more we can merge quickly, the easier it will become to
rebase and upstream the rest.

-- 
Regards,

Laurent Pinchart
