Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A9361CE1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B93E6EB5A;
	Fri, 16 Apr 2021 09:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2D789117
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:58:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A3935A5;
 Fri, 16 Apr 2021 11:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618567082;
 bh=xSo6PytDu5Cq4mnyjhpzVYDwWNwyPGmVgHOT/48h4nU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZOdxX5ofISyaTc31LDkhK/plA7k0+HS91ESbp1PMm16M18wsilwkkSaOsQ2Cug4w
 G+DmizAgRLLcii1bDbmZ9zJe7k4kt5/6nT340AKnyGUJfLTSluhMP+PjX7UM9aUsVf
 2TjmDMBTbT9JF4vbcSaaMTNZn0LW25TvON5CZO34=
Date: Fri, 16 Apr 2021 12:58:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Message-ID: <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416092737.1971876-1-narmstrong@baylibre.com>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
> 
> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
> confusion when the DW-HDMI CEC controller can't communicate on the bus.

If we can't trust the CEC config bit, would it be better to not use it
at all, and instead let each platform glue logic tell whether to enable
CEC or not ?

> Jernej Skrabec (1):
>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
>     driver
> 
> Neil Armstrong (1):
>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
>  include/drm/bridge/dw_hdmi.h              | 2 ++
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
