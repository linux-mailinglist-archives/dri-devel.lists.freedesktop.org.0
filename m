Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488230B9B4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1366E932;
	Tue,  2 Feb 2021 08:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36676E9E6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 19:10:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id f14so1837298ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 11:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kq3V0zk7/NxAJfrOZfZ2Vz2Yq/qtwdkfS7jsVoNMjUY=;
 b=kzPzL5Hv2XEwxEoE2DGFHOqbXj08SBsj5rwtKZEuYuGtWhprWrNxdhroyVOAuCtve4
 PrTSzFwXzkYMF3AULP03fAoDJHS+WKjMjJnpq1IONBbcypF1q1U0ojLIOGpkUcfGvY2V
 VUVWJOXexBQOKypBZkS6yN0tRG+X+stJr2cOW26osOK/ImpnekCzKsJ6QAiSPEyVUTnq
 hgRvIl6lzDTGH1ngF5OKwD50G+kfMITLvC5tuVPkjIwkOQbcD+TVB9iB3gSY4Fc62YPy
 bmmvGNxtKlUQSMAHDA3yNFHkStxmMjEKMyoIOck5A7FrVRRzbBH7ptasjhaXCA7bhUZN
 YLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kq3V0zk7/NxAJfrOZfZ2Vz2Yq/qtwdkfS7jsVoNMjUY=;
 b=t2UMKrxjpxejrGotq0YA5jzn7UCFGMmwH7H96TOVWUSy591X53kxme6p3omrDsZGxC
 vXDhb8wGwwDpbXQ8z+JStIOlRUsdcxY3I3TWUXmsHj2ldxbD9arJ6I4uASYydAq4Sa7w
 v72eUBf+bDd6/jqptM0/wdeXenKBlvzHPtvVLWLcvpg7p6YI7R5mhZtLhOjJpmwD2zHk
 2mYszB+59y5SMIAQdYeGoilh1tzLyjYFeIFgi9bW8Ci/Gjoce5jiz4Xbf30S+6ZJirNo
 A+PxN3u/kqzUR/LNbzU1LGoLUD5pJbg0li6ZFdPnhIxjZGtbshldmKla5G0uF78k3TSa
 HYtw==
X-Gm-Message-State: AOAM530Q0HimE/wFMUXdrtjs/A9k9JJA9e+pbEiJR7hzmQU9jANjOcjN
 Rb9J4YIXAON693uIK1SauMI=
X-Google-Smtp-Source: ABdhPJyQOsm7R+5kJJsGidkuXPRG0pnv4N8x5w5RIIwYx77so+HoKA9dy2dTcZNs8XqBDMCCyM9mlg==
X-Received: by 2002:a17:906:1f8b:: with SMTP id
 t11mr19272726ejr.224.1612206612283; 
 Mon, 01 Feb 2021 11:10:12 -0800 (PST)
Received: from localhost
 (ipv6-4edfac2144800d4b.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:4edf:ac21:4480:d4b])
 by smtp.gmail.com with ESMTPSA id w17sm8416280ejk.124.2021.02.01.11.10.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 11:10:11 -0800 (PST)
Date: Mon, 1 Feb 2021 20:10:01 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210201191001.GA22816@portage>
References: <1611947364-30688-1-git-send-email-oliver.graute@gmail.com>
 <20210201132736.dbqnyzn7dbu7dsmq@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201132736.dbqnyzn7dbu7dsmq@pengutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/21, Marco Felsch wrote:
> Hi Oliver,
> 
> thanks for the patch :)
> 
> On 21-01-29 20:09, Oliver Graute wrote:
> > Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
> > to panel-simple.
> > 
> > The panel spec from Variscite can be found at:
> > https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf
> > 
> > Signed-off-by: Oliver Graute <oliver.graute@gmail.com>
> > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > ---
> > 
> > v2:
> > 
> > - changed bpc to 6
> > - set max value of pixelclock
> > - increased hfront_porch and hback_porch
> > - dropped connector-type
> > 
> > adding of bus_format = MEDIA_BUS_FMT_RGB666_1X18 results in wrong colors.
> > omitting bus_format and using some default is good (Tux Pinguin is colored
> > fine)
> > 
> >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 2be358f..c129a8c 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3336,6 +3336,28 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > +static const struct display_timing sgd_gktw70sdad1sd_timing = {
> > +	.pixelclock = {30000000, 30000000, 40000000},
> > +	.hactive = { 800, 800, 800},
> > +	.hfront_porch = {40, 40, 40},
> > +	.hback_porch = {40, 40, 40},
> > +	.hsync_len = {48, 48, 48},
> > +	.vactive = {480, 480, 480},
> > +	.vfront_porch = {13, 13, 13},
> > +	.vback_porch = {29, 29, 29},
> > +	.vsync_len = {3, 3, 3},
> 
> Please add also:
> 
> 	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> 		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_NEGEDGE,
ok will do

> 
> > +};
> > +
> > +static const struct panel_desc sgd_gktw70sdad1sd = {
> > +	.timings = &sgd_gktw70sdad1sd_timing,
> > +	.num_timings = 1,
> > +	.bpc = 6,
> > +	.size = {
> > +		.width = 153,
> > +		.height = 86,
> > +	},
> 
> and:
> 
> 	.delay = {
> 		.prepare = 20 + 20 + 10 + 10, /* T0 + T2 + T3 + T4 */
> 		.enable = 50, /* T5 */
> 		.disable = 50, /* T5 */
> 		.unprepare =  10 + 10 + 20 + 20, /* T4 + T3 + T2 + T0 */
> 	};

ok will do

thx for your review.

Best regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
