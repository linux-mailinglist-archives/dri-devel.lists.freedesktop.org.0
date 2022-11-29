Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499DE63BF5D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B693710E028;
	Tue, 29 Nov 2022 11:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21FE10E028
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:49:44 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id a17so7741358qvt.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 03:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwy1vGtxbJANcG7P6mnYEhIP56iYI+V4HEAxAZcQxWs=;
 b=G8SSMkS/xQKUo/D8VGiM/N7THFPg7hOJrLJDnNrOC4NZq7A/HewGD6VMtxPXIhwCCh
 +EQOkc541+deUPH7oAj4HsDvqMzpfE+mruwrdp7Q+auzUB2WA/Rehj2mAeIo76ZFzXYX
 00NTlyOD42PnNJfHqD1jetccWxO9RqyvPXKX/TzqWymOCHeXDNOwSPqCRHFp8Qgui2Nu
 F2QJGaPf3USLUurP8hw3way9vCIJD2Az+qkg0kRKi4EWqnhexwcgVVkrXorVqXcypeSi
 f7qsQhOHXnwmuscKQaqVz5yp2lPnSFYKUOnur8FmHmIwRTr0c3p7ThLchBMA0S53SY8n
 peZw==
X-Gm-Message-State: ANoB5pkZGPRoBi00OU8JurID1HAIYZPb0Y8hNykLO18ZTFw2qeLdV6sc
 +NhwkYqzJhTXOlwGygbM0ppxJT7u/NTYdQ==
X-Google-Smtp-Source: AA0mqf71txchMTZh8xnVF/n6kSU9rRR8FOR+FCqM/b+qwUOFEvl1St93IT0zWFBkKW19YMlFzLZZQA==
X-Received: by 2002:a05:6214:2c1a:b0:4af:9543:2eee with SMTP id
 lc26-20020a0562142c1a00b004af95432eeemr40443217qvb.2.1669722583468; 
 Tue, 29 Nov 2022 03:49:43 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 q38-20020a05620a2a6600b006b949afa980sm10455142qkp.56.2022.11.29.03.49.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 03:49:40 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id y83so17087130yby.12
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 03:49:40 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr27506745ybc.543.1669722579841; Tue, 29
 Nov 2022 03:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y4VlHIpS9UnvWwt/@pendragon.ideasonboard.com>
 <d11033df-e103-e33c-c61a-a0725f7098b1@ideasonboard.com>
 <OS0PR01MB59224C2B4F889534922ACFE186129@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224C2B4F889534922ACFE186129@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Nov 2022 12:49:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXz8ZSge5b4s8v6Oon55gO+3Cu_Uvn7GFV62JCSqNf1Qw@mail.gmail.com>
Message-ID: <CAMuHMdXz8ZSge5b4s8v6Oon55gO+3Cu_Uvn7GFV62JCSqNf1Qw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: dsi: Add r8a779g0 support
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Tue, Nov 29, 2022 at 12:40 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > On 29/11/2022 03:49, Laurent Pinchart wrote:
> > > On Wed, Nov 23, 2022 at 08:59:46AM +0200, Tomi Valkeinen wrote:
> > >> Add DSI support for r8a779g0. The main differences to r8a779a0 are in
> > >> the PLL and PHTW setups.
> > >>
> > >> Signed-off-by: Tomi Valkeinen
> > >> <tomi.valkeinen+renesas@ideasonboard.com>

> > >> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > >> @@ -9,6 +9,7 @@
> > >>   #include <linux/delay.h>
> > >>   #include <linux/io.h>
> > >>   #include <linux/iopoll.h>
> > >> +#include <linux/math64.h>
> > >>   #include <linux/module.h>
> > >>   #include <linux/of.h>
> > >>   #include <linux/of_device.h>
> > >> @@ -28,6 +29,20 @@
> > >>   #include "rcar_mipi_dsi.h"
> > >>   #include "rcar_mipi_dsi_regs.h"
> > >>
> > >> +#define MHZ(v) ((v) * 1000000u)
> > >
> > > Isn't the U suffix usually spelled in uppercase ? Same below.
> >
> > I couldn't find any coding style guidelines on that. I like the lower
> > case visually. The suffix stands out much clearer on 10000000u than on
> > 10000000U. But I can change it if you feel otherwise.
>
> https://elixir.bootlin.com/linux/v6.1-rc7/source/include/linux/units.h#L11
>
> Maybe you could add MHZ here??

Or use the existing MEGA? The metric system is soooo nice! ;-)

BTW, looks like the people adding definitions like

    #define MICROHZ_PER_HZ 1000000UL
    #define MILLIHZ_PER_HZ 1000UL

    #define MILLIWATT_PER_WATT 1000UL
    #define MICROWATT_PER_MILLIWATT 1000UL
    #define MICROWATT_PER_WATT 1000000UL

didn't grasp the full power...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
