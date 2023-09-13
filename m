Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062179E7A9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 14:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0410E4A6;
	Wed, 13 Sep 2023 12:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BFC10E4A6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:11:12 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01C0DBEB;
 Wed, 13 Sep 2023 14:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1694606979;
 bh=UeFdlu2oKUftOF98iCKd1KzwJ9Kg3oJeD3NVvC7NQFo=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=Tyz8o+uXQ2MS5aTNhKirIoFfduj3Wnc1TSOGnHE4otufVm526erBjYzW0Agk2ZFRa
 EC/SxoblTAcWOHBV5kw9P5Z39NSQfYWhpzy8hCt1abB679g4701n2iRh+gsy3tDojo
 2koZTEoM+Wm044E+ZhMZldVrNn7tEXvp9MQIKTbs=
Message-ID: <48972ab0-e4ed-11b2-31fb-ad93695a4db1@ideasonboard.com>
Date: Wed, 13 Sep 2023 15:11:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH] drm: omapdrm: dsi: add refsel also for omap4
Content-Language: en-US
To: Andreas Kemnade <andreas@kemnade.info>
References: <20230913065911.1551166-1-andreas@kemnade.info>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230913065911.1551166-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: arnd@arndb.de, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, laurent.pinchart@ideasonboard.com,
 u.kleine-koenig@pengutronix.de, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2023 09:59, Andreas Kemnade wrote:
> Some 3.0 source has it set behind a if (omap4).
> Maybe it is helpful maybe not, at least in the omap4460
> trm these bits are marked as reserved.
> But maybe some dsi video mode panel starts magically working.

Sorry, what does this mean? That this fixes something, or you are just 
guessing?

I'm somewhat sure that the upstream driver used to work on omap4 sdp, 
which has two DSI panels. But I can't even remember what omap4 version 
it had.

  Tomi

> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>   drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 60189a23506a1..e2f576cd9f63c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4505,7 +4505,7 @@ static const struct dss_pll_hw dss_omap4_dsi_pll_hw = {
>   	.has_stopmode = true,
>   	.has_freqsel = false,
>   	.has_selfreqdco = false,
> -	.has_refsel = false,
> +	.has_refsel = true,
>   };
>   
>   static const struct dss_pll_hw dss_omap5_dsi_pll_hw = {

