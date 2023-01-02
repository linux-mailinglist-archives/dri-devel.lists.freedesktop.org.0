Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF7865B7A9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 23:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD07410E232;
	Mon,  2 Jan 2023 22:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF1E10E232
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 22:36:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z16so11121312wrw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 14:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6JcpeTvadU5Tog/xue6k6ZJ3yGd7vrQ+zBzOEtD1ges=;
 b=WoN0jqoZxWZ+sX/jIpoVGzAct/1iHN+DeD+qkRj2voaxz+pVnwcqdA1Ip2eEQdcc/9
 k0ZPPjHOxOW08O1FLJEkTUyW39Ou6Hwn2gFrJmpTq1kC3aYx3kbHljvG5KBXspaQqPbE
 jKnX3i5d1HSeHh5uuCGExXBY2BXNmu+k6Pat7DXaE93G+6k8OAkFwfkwtN9X9kvK7MtL
 02iM3OiyUC7KFKO47nkyNEY7spz2ZrC3WAce++UgRb29jFaAPgw/FYyqaiGIxRH8LCWU
 Lr/sebaT64Rsv73FNemcKwLHi/BpcwtZdngL0wkxL+SZMapUxuj9IGdtGWDinYfJgU4W
 5EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JcpeTvadU5Tog/xue6k6ZJ3yGd7vrQ+zBzOEtD1ges=;
 b=7D9GclZYRTArcAlIlk/Hm/ImrGeeTQyk+9OYBP3T2CKFHmI8QxCF2L5DAVQvMHPUC+
 R6fUEAIvoN+QWTViU4lBWlpuFoli0025FZ6hinMOEjaANEunOnZx0V84By3mtrjZx8X8
 Z71gdieZpoky2r4YKrvfih2JPUXA25AFEwjm9aAtdHipp8ljrSg4p5M6YSYFXMeF5GNw
 W9jG3B9klz1tgViV2Z9WmfRs8niU6NIBEBR6D559cTMVzn/XJwrAYxwsIpAIlZ0RCCJT
 J5THPLrQ7WwZYXW8svYjHJEvBMpjRI1afKKoVOpDJl8H3hGSPPizWaSy26UD0uwoCCvp
 1VTw==
X-Gm-Message-State: AFqh2kpi+kLENO5VoMPkLcDWgQDrFJXXauR4AVWnmK5jBFini2GsT4ip
 V58aHoC9FyyfG1I05EY/DLOsbg==
X-Google-Smtp-Source: AMrXdXuMKb9aoopqhrEI1EsTNuvk91/H8xLxImT0dmvAd0Klcy6YKtl4ERaUDY+mykgVwV602Ncbow==
X-Received: by 2002:a5d:4403:0:b0:268:f9de:d551 with SMTP id
 z3-20020a5d4403000000b00268f9ded551mr27160473wrq.40.1672699013173; 
 Mon, 02 Jan 2023 14:36:53 -0800 (PST)
Received: from linaro.org ([94.52.112.99]) by smtp.gmail.com with ESMTPSA id
 o5-20020adfe805000000b0028cc9d2ec1csm15340814wrm.54.2023.01.02.14.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 14:36:52 -0800 (PST)
Date: Tue, 3 Jan 2023 00:36:51 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/2] drm/panel-edp: fix name for IVO product id 854b
Message-ID: <Y7Ncg9DMbHBagcoz@linaro.org>
References: <20221231142721.338643-1-abel.vesa@linaro.org>
 <CAKXuJqjiEpxnX_E=HGqEaX91YA7XUmUoaK0NQqXHJCUkcqUPoQ@mail.gmail.com>
 <Y7KUFMjnra22YGlv@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7KUFMjnra22YGlv@hovoldconsulting.com>
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
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23-01-02 09:21:40, Johan Hovold wrote:
> On Sun, Jan 01, 2023 at 10:58:42PM -0600, Steev Klimaszewski wrote:
> > On Sat, Dec 31, 2022 at 8:27 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > The actual name is R133NW4K-R0.
> > >
> > > Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >
> > > Assuming the information from here is correct:
> > > https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md
> > >
> > >  drivers/gpu/drm/panel/panel-edp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > > index 5cb8dc2ebe18..ef70928c3ccb 100644
> > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > @@ -1891,7 +1891,7 @@ static const struct edp_panel_entry edp_panels[] = {
> > >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
> > >
> > >         EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
> > > -       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),
> > > +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
> > >
> > >         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
> > >         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
> > > --
> > > 2.34.1
> > >
> > 
> > Thanks for this - when I was looking for the panel, I simply went with
> > what I found on panel-look.
> 
> Did you check what string your panel reports? For example, using
> something like:
> 
> 	# strings /sys/class/drm/card0-eDP-1/edid
> 	...
> 	B133UAN02.1

Mine shows: M133NW4J R3

But since both R0 and R3 have the same product ID, I decided to drop the
revision part, otherwise we would need to add a second entry with the
only difference between them being the revision part (Rx). This is what
I did in patch #2.

> 
> Johan
