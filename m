Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46165AE0B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 09:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6970010E12F;
	Mon,  2 Jan 2023 08:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BB910E12F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 08:21:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89C25B80C85;
 Mon,  2 Jan 2023 08:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56077C433EF;
 Mon,  2 Jan 2023 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672647685;
 bh=1HJXtNHoGYBgH5Cwu2Oaw2kyPpvyq8RxKQUgogrOkj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j87z6cUH7m99vtmmxYCnBHwlRNIli7v5BNJoc7FJPSXXTc/8lC5FPlYgTadzBG0/V
 nTyRoHnLnpepF6mUZYSU2dZe2Sny3oJx0RGQrGbLMCj/t+2JC3kuV0abGGviN8C2o6
 J8d2NlrpOtQMeIjZ1IzGZi/zTXut0nTb1iSLt2s+u5y5eVamhwGUFZtSslEV994gUk
 hNikSOIw/uUqvE55sdHYvjuqIHiK84F29z1a9htgn6DE/FQZDn9KBUf3hVSShlkSbx
 DKWvusguCnJRdPSp/GfQXOTFtrFxTUsA4dErKHd6LsRNJ7r7slCzwp0ou6JfcwgIam
 kD23ZjY5BR2pQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pCG4i-0003G9-TH; Mon, 02 Jan 2023 09:21:41 +0100
Date: Mon, 2 Jan 2023 09:21:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH 1/2] drm/panel-edp: fix name for IVO product id 854b
Message-ID: <Y7KUFMjnra22YGlv@hovoldconsulting.com>
References: <20221231142721.338643-1-abel.vesa@linaro.org>
 <CAKXuJqjiEpxnX_E=HGqEaX91YA7XUmUoaK0NQqXHJCUkcqUPoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXuJqjiEpxnX_E=HGqEaX91YA7XUmUoaK0NQqXHJCUkcqUPoQ@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 01, 2023 at 10:58:42PM -0600, Steev Klimaszewski wrote:
> On Sat, Dec 31, 2022 at 8:27 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > The actual name is R133NW4K-R0.
> >
> > Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >
> > Assuming the information from here is correct:
> > https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 5cb8dc2ebe18..ef70928c3ccb 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1891,7 +1891,7 @@ static const struct edp_panel_entry edp_panels[] = {
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
> >
> >         EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
> > -       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),
> > +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
> >
> >         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
> >         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
> > --
> > 2.34.1
> >
> 
> Thanks for this - when I was looking for the panel, I simply went with
> what I found on panel-look.

Did you check what string your panel reports? For example, using
something like:

	# strings /sys/class/drm/card0-eDP-1/edid
	...
	B133UAN02.1

Johan
