Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F316F347503
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAC16E99B;
	Wed, 24 Mar 2021 09:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE506E99B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:49:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id w3so31777513ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q2TNkdIQ/zqP4vTBESLhTRQ8ElDlSEpihHNWHVVdOWw=;
 b=S7+rpvwNmh3R0GucjXGfeKomhZ1GYmSIiZRFBQZs+DNgNJlAQYPIEbkKvfxfE7jqgJ
 Xp5ioShGHBPMpZz2X1rnpZdsQEU4OyXOOH9TerN/74vfVbeTt6VxpfxlJnR4b+dNky51
 O5YVnDX4eu+q9Ul9Q7CK5XSLe281AwPBrNHFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q2TNkdIQ/zqP4vTBESLhTRQ8ElDlSEpihHNWHVVdOWw=;
 b=MpIqBrcgckXc4+QCmLONw/LXn0J4TFwkoWeb/XsljaV4UiEyrD/GjuKrgr00HYzsW6
 shsol5QojaKwN6rQ02ADxhNrxWTVUs7mp7gcVseKRVAQANui8uyx+fenhjf3sFPQDQKC
 2U3z/lynQqKO3/GMgiyBNokOKBOoGYcmCoB7rHa10F8vHXN/Zwjk6AiUXbsymLQiRRpu
 HbtPJtBZgu7P7E5dzmGfWiumdJs9lcrIz+mjWhKsVj8l5hlJwPKbX7q+pKAwQf7KmbHE
 h9kwCnzwwSdnQsNCd4KR4aYCKaELVsGGgT/lN8fVDW1L6ntckngS7tqVgdQL6y1ExHHS
 hx9g==
X-Gm-Message-State: AOAM532mE2ZbxPKQ8BAc6dOrIh1g0F1DC+g4em4AH+Eytv/rSQjx3k5L
 BOs9kCFWOvKYALAwR9AUQmfwW56/ziCDT4jb980t0g==
X-Google-Smtp-Source: ABdhPJxT/mrB/QVLHNjBduRmjrJ94vDchGyD6p3if3yVTDDUhEZVii5KLyc4Gnw0eC6LPMdYKW6Vv8fzGXaNaflz2qw=
X-Received: by 2002:a17:907:104f:: with SMTP id
 oy15mr2758052ejb.252.1616579362156; 
 Wed, 24 Mar 2021 02:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
 <20210322140152.101709-2-jagan@amarulasolutions.com>
 <YFpxYpA+EIZm7sOf@pendragon.ideasonboard.com>
 <f47bc0ad-dbd6-05b5-aaec-2e3256e3715a@sholland.org>
 <CAMty3ZDOVeMeYTsuF8n4EQTG6eEbj6e33TuTPrFiMWG4RhRdSw@mail.gmail.com>
 <YFsIkGH2cRgWk8z9@pendragon.ideasonboard.com>
In-Reply-To: <YFsIkGH2cRgWk8z9@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 24 Mar 2021 15:19:10 +0530
Message-ID: <CAMty3ZBGnz_a4_HO_TZ-zPNJwHMcVJyrBi3kZX2=a6G47Ze-yw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Samuel Holland <samuel@sholland.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Mar 24, 2021 at 3:09 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Wed, Mar 24, 2021 at 02:44:57PM +0530, Jagan Teki wrote:
> > On Wed, Mar 24, 2021 at 8:18 AM Samuel Holland wrote:
> > > On 3/23/21 5:53 PM, Laurent Pinchart wrote:
> > > > On Mon, Mar 22, 2021 at 07:31:49PM +0530, Jagan Teki wrote:
> > > >> Replace of_drm_find_panel with drm_of_find_panel_or_bridge
> > > >> for finding panel, this indeed help to find the bridge if
> > > >> bridge support added.
> > > >>
> > > >> Added NULL in bridge argument, same will replace with bridge
> > > >> parameter once bridge supported.
> > > >>
> > > >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > >
> > > > Looks good, there should be no functional change.
> > >
> > > Actually this breaks all existing users of this driver, see below.
> > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > >> ---
> > > >> Changes for v4, v3:
> > > >> - none
> > > >>
> > > >>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 11 ++++++++---
> > > >>  1 file changed, 8 insertions(+), 3 deletions(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > >> index 4f5efcace68e..2e9e7b2d4145 100644
> > > >> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > >> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > >> @@ -21,6 +21,7 @@
> > > >>
> > > >>  #include <drm/drm_atomic_helper.h>
> > > >>  #include <drm/drm_mipi_dsi.h>
> > > >> +#include <drm/drm_of.h>
> > > >>  #include <drm/drm_panel.h>
> > > >>  #include <drm/drm_print.h>
> > > >>  #include <drm/drm_probe_helper.h>
> > > >> @@ -963,10 +964,14 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> > > >>                          struct mipi_dsi_device *device)
> > > >>  {
> > > >>      struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> > > >> -    struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
> > >
> > > This is using the OF node of the DSI device, which is a direct child of
> > > the DSI host's OF node. There is no OF graph involved.
> > >
> > > >> +    struct drm_panel *panel;
> > > >> +    int ret;
> > > >> +
> > > >> +    ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
> > > >> +                                      &panel, NULL);
> > >
> > > However, this function expects to find the panel using OF graph. This
> > > does not work with existing device trees (PinePhone, PineTab) which do
> > > not use OF graph to connect the panel. And it cannot work, because the
> > > DSI host's binding specifies a single port: the input port from the
> > > display engine.
> >
> > Thanks for noticing this. I did understand your point and yes, I did
> > mention the updated pipeline in previous versions and forgot to add it
> > to this series.
> >
> > Here is the updated pipeline to make it work:
> >
> > https://patchwork.kernel.org/project/dri-devel/patch/20190524104252.20236-1-jagan@amarulasolutions.com/
> >
> > Let me know your comments on this, so I will add a patch for the
> > above-affected DTS files.
>
> DT is an ABI, we need to ensure backward compatibility. Changes in
> kernel drivers can't break devices that have an old DT.

Thanks for your point.

So, we need to choose APIs that would compatible with the old DT and
new DT changes. Am I correct?

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
