Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E559D2AE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D557B0748;
	Tue, 23 Aug 2022 07:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B1AB0702
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:52:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 786D0CE1B22;
 Tue, 23 Aug 2022 07:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E279EC433C1;
 Tue, 23 Aug 2022 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661241151;
 bh=iSO3PHv91eS3Mg/NxRVM4R0uyfbRFbYAiJtmZp7lFO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oK4Vrj3+oRe77PnPSsTGrWx4aKWHOHTYyEeYSGf/YMOMu0z0ngkuIh4o8yd3Ojltc
 IcufgUnnfDEwdzKGUFlb/qbosJkgMNin1AATxWzi1o7vpIusBabt1QlIWRso/qTjac
 v9R16zDH2woBfaki20os5n/O0RZu3BmKY6bz7r3OpHsPorWQy3cPI1jGA1rPpK+nq4
 V7Pta4MOymBDbvyMmCXFsjhqYrkjZi52BET5WdzRyT0YHRXSRvgwK4BLKTvvDE1T7+
 +7ZQlbytw6srR1AkqR8vCpRWUkdlCC57ViXXZkXYnxdW32hb063znF/XZWxyShCvib
 ik4RPoO0CHAQg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oQOi6-0004ZR-Ps; Tue, 23 Aug 2022 09:52:31 +0200
Date: Tue, 23 Aug 2022 09:52:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/panel-edp: add AUO B133UAN02.1 panel entry
Message-ID: <YwSHPooA189qn/Qx@hovoldconsulting.com>
References: <20220711075202.21775-1-johan+linaro@kernel.org>
 <YtpyeCHojFovBKxv@hovoldconsulting.com>
 <YwOGCPFTx0+MNfN2@hovoldconsulting.com>
 <CAD=FV=XRjpbeMnh_dtLh1hb-zfWOk6UJwqFBr+otk=sq9vjm3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XRjpbeMnh_dtLh1hb-zfWOk6UJwqFBr+otk=sq9vjm3A@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 22, 2022 at 10:33:40AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Aug 22, 2022 at 6:35 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, Jul 22, 2022 at 11:48:40AM +0200, Johan Hovold wrote:
> > > On Mon, Jul 11, 2022 at 09:52:02AM +0200, Johan Hovold wrote:
> > > > Add an eDP panel entry for AUO B133UAN02.1.
> > > >
> > > > Due to lack of documentation, use the delay_200_500_e50 timings like
> > > > some other AUO entries for now.
> > > >
> > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

> > This one still hasn't been picked up.
> >
> > Is this something you can do, Doug? I noticed you applied a couple of
> > patches to this driver recently.
> >
> > Or who is really responsible for this driver?
> 
> Officially it falls within this section of maintainers:
> 
> DRM PANEL DRIVERS
> M:      Thierry Reding <thierry.reding@gmail.com>
> R:      Sam Ravnborg <sam@ravnborg.org>
> L:      dri-devel@lists.freedesktop.org
> S:      Maintained
> T:      git git://anongit.freedesktop.org/drm/drm-misc
> F:      Documentation/devicetree/bindings/display/panel/
> F:      drivers/gpu/drm/drm_panel.c
> F:      drivers/gpu/drm/panel/
> F:      include/drm/drm_panel.h
> 
> ...and then you just have to know that if the "tree" is drm-misc that
> it falls under drm-misc rules. That means that anyone who is a
> drm-misc-next committer can commit it.
> 
> I've been trying to keep an eye on panel-edp ever since I split it out
> from panel-simple, though. I'll post up a MAINTAINERS entry to try to
> make that more official.

Sounds good.

> In any case, I've landed this on drm-misc-next:
> 
> ee50b0024408 drm/panel-edp: add AUO B133UAN02.1 panel entry

Thanks for that! Perhaps you can take look also at this one:

	https://lore.kernel.org/all/20220720054152.2450-1-steev@kali.org/

which is for another panel found on some X13s?

Johan
