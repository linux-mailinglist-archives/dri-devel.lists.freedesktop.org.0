Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4B1356E7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 11:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7606E8F2;
	Thu,  9 Jan 2020 10:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 356 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jan 2020 10:31:55 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F216E8F2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ifsgOFP9dRKENq6DPhFUqeIHFL0U53qJ5HRzpA7dSI=; b=hqrjw/g0cwe8zg/PeusiRfssO
 rNc9cLJq49GDY3RYGCJIwB5srXePzk9KQJWlC/qDMGDyhHX6RGH2zii6g4RraFsBCzZp8o0JxAv8L
 WwAu85KzjtlmPGlyGVdgoi3HqVg2ThgomIQ53QJDiJoL6Qc5LLDECTO68f3xxX6NGM0jPz7l4ZLBq
 dfP30aDiqZwjpDfKwzyrajz3YMD8fJX3ipxptlcY8RIZcGgbIjY6KM0T9nNn4XueNfqVQQHxGPHEM
 oR61cA0QqqFoY63jGYkiacRDr5gxgafRm+mv0E/o+B0SNXSClaByaE3d1/lAEHii3A1ctuO1dT9qM
 /kWZ2h14A==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:52586)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ipV0f-0004Ov-DU; Thu, 09 Jan 2020 10:25:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ipV0Z-0000QH-F2; Thu, 09 Jan 2020 10:25:43 +0000
Date: Thu, 9 Jan 2020 10:25:43 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH for-5.6 0/2] drm/bridge: dw-hdmi: PCM API updates
Message-ID: <20200109102543.GN25745@shell.armlinux.org.uk>
References: <20191210154536.29819-1-tiwai@suse.de>
 <s5h8smhm1vy.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h8smhm1vy.wl-tiwai@suse.de>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 10:10:09AM +0100, Takashi Iwai wrote:
> On Tue, 10 Dec 2019 16:45:34 +0100,
> Takashi Iwai wrote:
> > 
> > Hi,
> > 
> > this is a patch set for updating ALSA PCM API usages in dw-hdmi
> > driver.  I already tried to "fix" the driver some time ago but it was
> > utterly wrong.  So this is a combination of the revised patch and
> > another cleanup patch.
> > 
> > The first one is to change the buffer allocation mechanism in the
> > driver to the manual allocation of the h/w buffer and the automatic
> > allocation of PCM stream buffers via the new standard API.  The
> > significant change is that size of the h/w buffer isn't no longer
> > controlled via ALSA preallocation proc file but rather via the new
> > module option (if any).
> > 
> > The second one is a oneliner patch just to remove the superfluous PCM
> > ops.
> > 
> > Both need the ALSA PCM core changes in 5.5-rc1, so please apply them
> > on top of 5.5-rc1 or later.  Or, just let me know if I should apply
> > them through sound git tree.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > ===
> > 
> > Takashi Iwai (2):
> >   drm/bridge: dw-hdmi: Follow the standard ALSA memalloc way
> >   drm/bridge: dw-hdmi: Drop superfluous ioctl PCM ops
> 
> Any chance for reviewing these patches?
> 
> Since this driver is the only one who is still using the old ALSA
> vmalloc API, I'd like to change it and drop the old API in 5.6.

It isn't something I can even test at the moment; I have the platforms
but no TV to connect them to.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
