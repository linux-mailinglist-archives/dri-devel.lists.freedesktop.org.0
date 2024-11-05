Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0D9BD38B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 18:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B35010E2DD;
	Tue,  5 Nov 2024 17:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H1FeLUnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E3F10E607
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 17:38:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BE38874;
 Tue,  5 Nov 2024 18:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730828285;
 bh=TXks1usl6xJPmU3zdu93XzI2GYWes4w/RqJ+hsmoerI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H1FeLUnBkqz6K8s968EBaA8LpDUuftrlj20s85gYEPQ84Nejt+QnYQsbs+8EoRaq3
 zrO4iRVBqVbCj9wPLP/nGMBiRG3xrAfb5POQnVkw2Bqzh9gogjS1oXSvodFLlrvEKd
 u0lFQKT3xTlAlCbjvWDO02H6HJkB8hFNDZ5x7mNs=
Date: Tue, 5 Nov 2024 19:38:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <20241105173805.GA19866@pendragon.ideasonboard.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
 <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
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

On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >> > function.  IT6263 product link can be found at [1].
> >> > 
> >> > Patch 1 is a preparation patch to allow display mode of an existing
> >> > panel to pass the added mode validation logic in patch 3.
> >> > 
> >> > [...]
> >> 
> >> Applied to drm-misc-next, thanks!
> >> 
> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
> >
> > Where's the immutable branch Laurent asked for?
> 
> The patch set has been picked up after getting an Ack from Sakari,
> before Laurent's email. I am sorry if I rushed it in.

My review didn't exactly come quickly, so I won't blame anyone. The risk
of conflict in this file in v6.13 is very low so it should be fine. In
the unlikely case we have an issue, we'll figure it out.

-- 
Regards,

Laurent Pinchart
