Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092753108D3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 11:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547986F3DC;
	Fri,  5 Feb 2021 10:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CAD6F3DC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 10:18:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEC5A64FED;
 Fri,  5 Feb 2021 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612520300;
 bh=s6zOJkZnJEbm1xu0sX2TF5RgsugvUfGcTGQRbF8fYFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l8kKbOl3cDdM3E0eg11Cb78ojX1U42q1MLOpEbO9ohJ6ZsUhbIINgE9AGpi57xg07
 nrjjNaNlf57dKR3WfAKi/M4HzTfRDGroizd8ACmJPeidm7+lvaabIXe7cQPaeWn9o/
 A7dwUkMkXN6n1qunw/7DRnw+YFcS0Z5Mmkh9/ecc=
Date: Fri, 5 Feb 2021 11:18:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <YB0baUzgvpd+EoO6@kroah.com>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
 <20210204181551.ethtuzm65flujmwe@pengutronix.de>
 <20210205093744.kr4rc7yvfiq6wimq@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205093744.kr4rc7yvfiq6wimq@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 10:37:44AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Russell, hello Greg,
> =

> On Thu, Feb 04, 2021 at 07:15:51PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux admi=
n wrote:
> > > On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linux =
admin wrote:
> > > > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wrot=
e:
> > > > > > I'm glad to take this through my char/misc tree, as that's wher=
e the
> > > > > > other coresight changes flow through.  So if no one else object=
s, I will
> > > > > > do so...
> > > > > =

> > > > > Greg, did you end up pulling this after all? If not, Uwe produced=
 a v2.
> > > > > I haven't merged v2 yet as I don't know what you've done.
> > > > =

> > > > I thought you merged this?
> > > =

> > > I took v1, and put it in a branch I've promised in the past not to
> > > rebase/rewind. Uwe is now asking for me to take a v2 or apply a patch
> > > on top.
> > > =

> > > The only reason to produce an "immutable" branch is if it's the basis
> > > for some dependent work and you need that branch merged into other
> > > people's trees... so the whole "lets produce a v2" is really odd
> > > workflow... I'm confused about what I should do, and who has to be
> > > informed which option I take.
> > > =

> > > I'm rather lost here too.
> > =

> > Sorry to have cause this confusion. After I saw that my initial tag
> > missed to adapt a driver I wanted to make it easy for you to fix the
> > situation.
> > So I created a patch to fix it and created a second tag with the patch
> > squashed in. Obviously only one of them have to be picked and I hoped
> > you (=3D Russell + Greg) would agree which option to pick.
> > =

> > My preference would be if you both pick up v2 of the tag to yield a
> > history that is bisectable without build problems, but if Russell (who
> > already picked up the broken tag) considers his tree immutable and so
> > isn't willing to rebase, then picking up the patch is the way to go.
> =

> OK, the current state is that Russell applied the patch fixing
> drivers/mailbox/arm_mhuv2.c on top of merging my first tag.
> =

> So the way forward now is that Greg pulls
> =

> 	git://git.armlinux.org.uk/~rmk/linux-arm.git devel-stable
> =

> which currently points to =

> =

> 	860660fd829e ("ARM: 9055/1: mailbox: arm_mhuv2: make remove callback ret=
urn void")
> =

> , into his tree that contains the hwtracing changes that conflict with my
> changes. @Greg: Is this good enough, or do you require a dedicated tag
> to pull that?
> =

> I think these conflicting hwtracing changes are not yet in any of Greg's
> trees (at least they are not in next).
> =

> When I pull
> =

> 	https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
> =

> (currently pointing to 4e73ff249184 ("coresight: etm4x: Handle accesses
> to TRCSTALLCTLR")) into 860660fd829e, I get a conflict in
> drivers/hwtracing/coresight/coresight-etm4x-core.c as expected. My
> resolution looks as follows:

Ok, my resolution looked a bit different.

Can you pull my char-misc-testing branch and verify I got this all
pulled in correctly?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
