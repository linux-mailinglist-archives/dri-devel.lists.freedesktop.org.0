Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C510A11BDA3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 21:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D5E6EBC3;
	Wed, 11 Dec 2019 20:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB406EBC7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 20:06:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 53575200A3;
 Wed, 11 Dec 2019 21:06:53 +0100 (CET)
Date: Wed, 11 Dec 2019 21:06:51 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jerry Han <jerry.han.hq@gmail.com>
Subject: Re: [PATCH] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
Message-ID: <20191211200651.GA10693@ravnborg.org>
References: <20191209014641.24685-1-jerry.han.hq@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209014641.24685-1-jerry.han.hq@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=gl-9RGMvwZyvjzrOo0oA:9 a=CjuIK1q_8ugA:10 a=26CFN5KYESCqVWovzqLp:22
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Rock wang <rock_wang@himax.com.cn>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jerry.


> Support Boe Himax8279d 8.0" 1200x1920 TFT LCD panel, it is a MIPI DSI
> panel.

Thanks for your persistence with this driver.


Unfortunately the driver no longer builds after the drm_panel
work we committed earlier this week to drm-misc-next.

> 
> V9:
> - Adjust init code, make the format more concise
> - kill off default_off_cmds (Emil)
> - use mipi_dsi_dcs_set_display_{on,off} in their enable/disable
>     callbacks. (Emil)
> - Adjusting the delay function (Emil)

...
> +
> +struct panel_info {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *link;
> +	const struct panel_desc *desc;
> +
> +	struct backlight_device *backlight;

We have included backlight support in drm_panel.
Can you please introduce this and post a patch updating the driver to
use this.
See other panle patches what is required to use it.
(Mostly deleting code)

I took a look at the rest of the driver and everything looks good.

Sorry for causing you this extra trouble due to the drm_panel changes.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
