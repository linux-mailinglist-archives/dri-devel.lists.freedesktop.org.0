Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FE656A59
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 13:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFF910E309;
	Tue, 27 Dec 2022 12:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F7210E309
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 12:01:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5F1686008804;
 Tue, 27 Dec 2022 12:00:26 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id KLYO961PBBUj; Tue, 27 Dec 2022 12:00:23 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D981D6000872;
 Tue, 27 Dec 2022 12:00:22 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1672142423;
 bh=HY/iceWFNHXcY6/T59a4bc7jEBDobCcHxPzG+znEMhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=J0YTsz5DWpVbzP8Q6IWQW4eow+xN3yhY87VRr8Rnmk2c9kMRFJZect+oXPgS8KUIu
 1iXVhffS7vMl8C7Lovwfgy76m1v0fGvbCC6OZACo0T/7EjVw5VIAw/JoV0bCFRU9bG
 31+vZKk+Ph7i53nCJU0EkUZHgW73io69nInMq/iE=
Received: from wslaptop (unknown [IPv6:2001:8a0:fbe7:6700:65be:d034:d2ec:60ff])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 95013360075;
 Tue, 27 Dec 2022 12:00:19 +0000 (WET)
Date: Tue, 27 Dec 2022 11:58:51 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Rayyan Ansari <rayyan@ansari.sh>
Subject: Re: [v2,3/4] drm/panel: Add driver for JDI LPM102A188A
Message-ID: <20221227115851.mpvlbero4nsdq4r5@wslaptop>
References: <20221025153746.101278-4-diogo.ivo@tecnico.ulisboa.pt>
 <7aa53ccc-2942-e2d4-9c84-32f1bdf462ad@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aa53ccc-2942-e2d4-9c84-32f1bdf462ad@ansari.sh>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Dec 23, 2022 at 03:33:40PM +0000, Rayyan Ansari wrote:
> On 25/10/2022 16:37, Diogo Ivo wrote:
> > +config DRM_PANEL_JDI_LPM102A188A
> > +	tristate "JDI LPM102A188A DSI panel"
> > +	depends on OF && GPIOLIB
> > +	depends on DRM_MIPI_DSI
> > +	depends on BACKLIGHT_CLASS_DEVICE
> > +	help
> > +	  Say Y here if you want to enable support for JDI LPM102A188A DSI
> > +	  control mode panel as found in Google Pixel C devices.
> Shouldn't this be "command mode panel" instead of "control mode panel"?

Yes, it should.

> > +static struct mipi_dsi_driver jdi_panel_dsi_driver = {
> > +	.driver = {
> > +		.name = "panel-jdi-lpm102a188a-dsi",
> Is the "-dsi" suffix needed here? Other panel drivers don't have this.

I had not noticed this, and I will drop it.

Thank you for your review and attention to detail. I will address these
points in the next version.

Diogo Ivo
