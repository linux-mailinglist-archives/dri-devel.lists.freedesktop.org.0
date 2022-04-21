Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D250A0E2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B80210E058;
	Thu, 21 Apr 2022 13:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 73558 seconds by postgrey-1.36 at gabe;
 Thu, 21 Apr 2022 13:34:42 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B13F10E058
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 13:34:42 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-47-192-nat.elisa-mobile.fi
 [85.76.47.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 047811B00252;
 Thu, 21 Apr 2022 16:34:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1650548074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oVFIWam2OH5Kq5QzsfblzUEMIMiatzAi7D5irCcCglk=;
 b=Xk3qyrppSMBB4y+4boXcQF3oQ0tJICSyEousvelDBkd8/PVx55tQbJieAi/Q0KQa0aNG+G
 Gh88Z+pM8E36JmzxlWSVvjXm3PFhBwLXYL2LZOWOsctt2/ybfngzEzXevKqVRqqsk+dHOX
 5L1WRR3RN0Tc57TLDGaoxQzs/vTRLS73kqV8NQ7Pr+rYaKPhEVw6YpbHAi1CUcgHmT/iJb
 sSsFTNRKlLJoxWjnYPJUSCoDtMuNfYAqp6Y4933cAcgTAbeGBst/0aU+ZHi8x118KnYG/L
 TTEMpWSI21eBdlKccjScwxNSRB5ywON2ldVT1bI/+m9vyrFPnxxWxtiiOfNC6w==
Date: Thu, 21 Apr 2022 16:34:31 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
Message-ID: <20220421133431.GE1947@darkstar.musicnaut.iki.fi>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
 <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1650548074; a=rsa-sha256; cv=none;
 b=ENXGTtwbaVogGy0K8rD23cjHmjO1KDBpZYPSWyAXiJ0/g3DluUJMMqXizYyXV1sh/1O56S
 hChw4SwQwbKFg4HYlY2SOiU8koj4G0UA6uGgTWSMxSwgySv+tbXfSR2Tt70pNgc6FN/vqj
 fDExRVdSPenGd/ZTQhfjmyvSX3P7pooRbwh0WQDjEhItMOJyG5yZgN9teFQT3NBHXEEZkO
 lTJHNaVgxdVFvqiak5FfjdiYOvwW5qr/IFspdks2sOUviaT7JpvKaacUapRAwuXFYtOguN
 JXEZ3bM5xviSbbt9Tw3xErBDkB9cnwUXXzqGZHNp79d0+eb+sY0cVMOQI8ss7A==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1650548074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oVFIWam2OH5Kq5QzsfblzUEMIMiatzAi7D5irCcCglk=;
 b=Eu1uUO0EKvbhrdQZfCpIhRELzJA5jQZA+tye8R+aaTvgG9DkVEsXKYWX2Sby3kmhYmBCFx
 570Cbs63dCqUFZqQdnWOK5t2vzZfwXPpwZynEikAKA3hi3QfuIi/BoBmae0xNSLey+fMmB
 6AN1xF39YRJln008whjTgBohIBALbd/JXyh+rxwe1mx9rmT55Z+64rbOepQpAj7WZ0ttFr
 jnTgxti7i7/9Pg4jNgskYWOOvKpXwrgTWzEQwA6H3TD1Jh0kJTMK2AunGS+FmvtC90A9Rp
 r/9gYERVC+5BvSqEpSaGtYy+3htyiKaREqUWXaB7dxpxJqJYBA33p4txWzgVSw==
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 20, 2022 at 10:00:13PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 20, 2022 at 7:08 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > On Tue, Apr 19, 2022 at 03:36:42PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This is the full series for converting OMAP1 to multiplatform, rebased
> > > from my 2019 attempt to do the same thing. The soc tree contains simpler
> > > patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> > > means we are getting closer to completing this for all ARMv5 platforms
> > > (I have patches for PXA, which is the last one remaining).
> > >
> > > Janusz already tested the branch separately and did the missing work
> > > for the common-clk conversion after my previous approach was broken.
> >
> > I tested the full series on the following OMAP1 boards: ams-delta,
> > nokia770, osk, palmte and sx1 (QEMU only).
> >
> > Apart from the earlyprintk breakage, everything seemed to work OK.
> 
> Nice, thanks a lot for testing!

With the updated patch 26 also earlyprintk now works, so if you still
update the patches, feel free to add for the whole series:

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.
