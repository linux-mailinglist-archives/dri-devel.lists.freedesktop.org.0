Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE73E1CC4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D5B6E894;
	Thu,  5 Aug 2021 19:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76496E894
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:33:26 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 04ed92f2-f624-11eb-9082-0050568c148b;
 Thu, 05 Aug 2021 19:33:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3F9FF194B05;
 Thu,  5 Aug 2021 21:33:49 +0200 (CEST)
Date: Thu, 5 Aug 2021 21:33:20 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Torsten Duwe <duwe@lst.de>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devel@driverdev.osuosl.org, Qilin Wen <qwen@analogixsemi.com>
Subject: Re: [PATCH v1 1/1] drm/bridge: anx7625: Tune K value for IVO panel
Message-ID: <YQw9AKozQCPzk1wh@ravnborg.org>
References: <a565cb1662d2f8300905a369c575e19176fd8e4c.1628148418.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a565cb1662d2f8300905a369c575e19176fd8e4c.1628148418.git.xji@analogixsemi.com>
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

On Thu, Aug 05, 2021 at 03:30:55PM +0800, Xin Ji wrote:
> IVO panel require less input video clock variation than video clock
> variation in DP CTS spec.
> 
> This patch decreases the K value of ANX7625 which will shrink eDP Tx
> video clock variation to meet IVO panel's requirement.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>

Looks good, I assume someone else (Robert) picks this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
