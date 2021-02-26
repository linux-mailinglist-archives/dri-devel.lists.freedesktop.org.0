Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884013265F2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 17:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9696E0F5;
	Fri, 26 Feb 2021 16:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9006E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 16:57:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AD7F64F0D;
 Fri, 26 Feb 2021 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614358647;
 bh=D6Ll0Gy5CJCzeg9qJEhC+n1ib3HpyruXYBbUWhZU4Yc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qy2sdYiF2mQY/XJoT3V8jzCdI2nQKbFWesmeSF5YoCtnXAeYIGK3nBTi/Qth7JPjJ
 dyYlIlww6Cn12G9EFHYCWff/a8IFAiJu8v48ad1QyhrwchAFioUDG00vU0nrrzjkw0
 pCuYNoTJXUNUO3EQZhqQBxV6xhIZMAhrmC/xi3YRxMqy90CUwuxTh5f/BJ37OTYLoZ
 ZpIy5SeQ0oBMZfuIIqiAIeJlJbs68POHA1hrruKcRcTbxjGsLl3+X/fRyMN7J3dCsY
 gMySPfclEcYDkvWkV68dj4CNBmS08x7RZ0dQm+fRgLut/eRVTg8iL0o/6s02EznXyT
 XY0dxlbF8qJBw==
Date: Fri, 26 Feb 2021 17:57:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 6/7] drm: sun4i: dsi: Use drm_panel_bridge, connector
 API
Message-ID: <20210226165723.szblbiswz5vgapq2@hendrix>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
 <20210214194102.126146-7-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210214194102.126146-7-jagan@amarulasolutions.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 15, 2021 at 01:11:01AM +0530, Jagan Teki wrote:
> Use drm_panel_bridge to replace manual panel handling code.
>
> This simplifies the driver to allows all components in the
> display pipeline to be treated as bridges, paving the way
> to generic connector handling.
>
> Use drm_bridge_connector_init to create a connector for display
> pipelines that use drm_bridge.
>
> This allows splitting connector operations across multiple bridges
> when necessary, instead of having the last bridge in the chain
> creating the connector and handling all connector operations
> internally.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Most of the code removed in that patch was actually introduced earlier
which feels a bit weird. Is there a reason we can't do that one first,
and then introduce the bridge support?

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
