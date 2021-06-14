Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E39B3A5FC8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 12:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6AC89CF2;
	Mon, 14 Jun 2021 10:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA6D89CF2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 10:13:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233A9A59;
 Mon, 14 Jun 2021 12:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623665597;
 bh=8sfjki0UsWmUH2syJae6b5ofFcxpZFRbmNtSRrH89kU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PNkVAar8AcEWUhomLs8XPC17AM9eKFJTZEOgxZHCE0kvPCkzmm82n7djIxw7PXqYp
 TmGn+Jmir/Qm9i9VXot8TMkooEoJorDEWqJjprVphtpeaL4aFEzZtP4BC1cLGNjD8e
 +AYhRE1U6IXYVqAUA4Im3BpwtR5Ueppo8IMSlkxE=
Date: Mon, 14 Jun 2021 13:12:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v7 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <YMcrqIpHTa8ghObz@pendragon.ideasonboard.com>
References: <cover.1623402115.git.xji@analogixsemi.com>
 <19c0d381ed2911c04878f83ae40dad4d3a086d74.1623402115.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19c0d381ed2911c04878f83ae40dad4d3a086d74.1623402115.git.xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Zhen Li <zhenli@analogixsemi.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

Thank you for the patch.

On Fri, Jun 11, 2021 at 05:13:33PM +0800, Xin Ji wrote:
> Add MIPI rx DPI input feature support.

Could you expand the commit message to explain what this feature is ?

> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 245 ++++++++++++++++------
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
>  2 files changed, 203 insertions(+), 60 deletions(-)

[snip]

-- 
Regards,

Laurent Pinchart
