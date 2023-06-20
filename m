Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8717B7365A4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7C310E083;
	Tue, 20 Jun 2023 08:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D876510E162
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 08:04:37 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 33FFE1F37C;
 Tue, 20 Jun 2023 08:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687248276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OJL+2ljSAsX+K1gdyXTKpGUjBVDC+iSX2Dkj5l9F1E=;
 b=VwbYO1I6T2fGkPwnvn8GfJx+WUb0vQY9rr31AUTLpwwKOPrVZv8b7Lp3E8scFLga/iXhKF
 4J+n9bzh5K7KoTqbMZDkhu7GRdzExRvH+v0jCYnNgOIj1A9ICZgQA2qTZm/+h/rOYZVw+w
 7EVW6DSk9IQie8tiGFoGvneGqoe5GKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687248276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OJL+2ljSAsX+K1gdyXTKpGUjBVDC+iSX2Dkj5l9F1E=;
 b=UCMTO8CD/webcRI2Fo5EoQLq/NF5sqXQ42k43dTN1pLahxxl7WrTimou6gZWuLATpKgGBV
 vidFDbrvfCFwdHCg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B94712C141;
 Tue, 20 Jun 2023 08:04:35 +0000 (UTC)
Date: Tue, 20 Jun 2023 10:04:34 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Message-ID: <20230620080434.GD9196@kitsune.suse.cz>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
 <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
 <fe3b90b0-b52f-9677-0245-a201975c3e0c@suse.de>
 <20230615132107.GA9196@kitsune.suse.cz>
 <20230615200901.GA1572644-robh@kernel.org>
 <20230615211924.cf2qs52cfaf7m3f7@debamax.com>
 <3d8c3a8c-68be-422a-c4ff-6d2e99c3f01b@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d8c3a8c-68be-422a-c4ff-6d2e99c3f01b@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cyril Brulebois <cyril@debamax.com>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 08:24:34AM +0200, Helge Deller wrote:
> On 6/15/23 23:19, Cyril Brulebois wrote:
> > Hi Rob,
> > 
> > Rob Herring <robh@kernel.org> (2023-06-15):
> > > On Thu, Jun 15, 2023 at 03:21:07PM +0200, Michal Suchánek wrote:
> > > > At the time this was proposed it was said that "of-display", is wrong,
> > > > and that "of-display.0" must be used for the first device instead, and
> > > > if something breaks an alias can be provided.
> > > > 
> > > > So how does one provide an alias so that offb can find "of-display.0"
> > > > as "of-display"?
> > > 
> > > I'm not aware of any way. There isn't because device names and paths are
> > > not considered ABI. There are mechanisms for getting stable class device
> > > indices (e.g. i2c0, mmcblk0, fb0, fb1, etc.) though not implemented for
> > > fbN (and please don't add it).
> > > 
> > > In any case, this should be an easy fix. Though if "linux,opened" or
> > > "linux,boot-display" is not set, then you'd still get "of-display.0":
> > > 
> > > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > > index 78ae84187449..e46482cef9c7 100644
> > > --- a/drivers/of/platform.c
> > > +++ b/drivers/of/platform.c
> > > @@ -553,7 +553,7 @@ static int __init of_platform_default_populate_init(void)
> > >                          if (!of_get_property(node, "linux,opened", NULL) ||
> > >                              !of_get_property(node, "linux,boot-display", NULL))
> > >                                  continue;
> > > -                       dev = of_platform_device_create(node, "of-display.0", NULL);
> > > +                       dev = of_platform_device_create(node, "of-display", NULL);
> > >                          of_node_put(node);
> > >                          if (WARN_ON(!dev))
> > >                                  return -ENOMEM;
> 
> Michal, does that patch look correct?
> I don't have that hardware, but that way the boot-display gets named
> "of-display" while all others get "of-display.x"....

Yes, that's inconsistent, and IIRC it's what I originally proposed to
preserve compatibility as much as possible.

The patch went through multiple iteration by me and Rob and the final
version that was merged uses the consistent but incompatible naming.

The other option would be to adapt the offb driver, presumably.

I don't understand how the device name figures in attaching the driver
to the device, the only other occurence of of-display is the name of the
offb and ofdrm drivers.

> > I've just replaced my clueless workaround with this patch on top of the
> > kernel found in Debian 12 (Bookworm), i.e. 6.1.27 at this point, and it
> > indeed fixes the black screen problem in the installer's context.
> 
> ... at least it fixes the issue.

I would expect as much. I don't have the hardware either but keeping
what was there before, and only adding on top is kind of the least
disruptive way of adding new stuff.

Thanks

Michal
