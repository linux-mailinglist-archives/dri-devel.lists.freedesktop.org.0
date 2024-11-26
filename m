Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCA9D974D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 13:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA86E10E84F;
	Tue, 26 Nov 2024 12:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mqZlj+0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7561410E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 12:33:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61CA9526;
 Tue, 26 Nov 2024 13:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1732624360;
 bh=VWBwwYDrYSPqco3vJKAcKsxo+QDzyL/dDLDUdf+f59o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mqZlj+0x+eUa8ByKbmVQCDIxlTbP+UHFyUjw2qVJuX12+08oPOiteslOV0U1j8xQL
 i9YdcHZsLSDWKzB2X7eXGp6bbhmPsKoE1ZEj8IApu9lfu0ZfPVrzFlok7Pf4tsrpo9
 lu6jXE3SmZzaDHLN4bggX/xoJJt5FaJyr09J0cYU=
Date: Tue, 26 Nov 2024 14:32:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/3] gpu: drm: replace of_graph_get_next_endpoint()
Message-ID: <20241126123253.GF5461@pendragon.ideasonboard.com>
References: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san,

On Tue, Nov 26, 2024 at 05:43:34AM +0000, Kuninori Morimoto wrote:
> 
> Hi Maarten, Maxime, Thomas
> Cc Laurent
> 
> The patch has been created as 1 patch for "drivers/gpu/drm", but this time
> I have finely disassembled the patch into 3 patches.

Thomas has merged v6 in drm-misc in commit 17558f97fe62fbe14757880a0aa998bfd194ea95

> v6 -> v7
> 	- created as 3 patches
> 
> Kuninori Morimoto (3):
>   gpu: drm: drm_of: replace of_graph_get_next_endpoint()
>   gpu: drm: panel: replace of_graph_get_next_endpoint()
>   gpu: drm: tiny: replace of_graph_get_next_endpoint()
> 
>  drivers/gpu/drm/drm_of.c                              | 4 +++-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
