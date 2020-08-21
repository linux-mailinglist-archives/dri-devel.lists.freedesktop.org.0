Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27E24E67E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDAC6E426;
	Sat, 22 Aug 2020 09:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC86EC25
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 22:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598048662; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFOWt65Ij7m8Cz6FC4oh/LD/IRehebqtrYl1xNT9kic=;
 b=vGKf/zB+vNVVikdi65lNZYnYp91rd4KHwzwSh4RO5ACeX5ihHSFrgk8tlnbejbnk4LZGSA
 ljanBlDdWlsI2EDTVZ/LJ41wlOrAwPVJPXgSkx1BGsSHwE9dwmlB9TE2saQmyDh1904UUX
 RzuqY5bRPlrGmorOzwgfa6dHBPNR/HM=
Date: Sat, 22 Aug 2020 00:24:11 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: Paul Boddie <paul@boddie.org.uk>
Message-Id: <B8QFFQ.FVZD8SCWAWD51@crapouillou.net>
In-Reply-To: <6531669.OW97vx6Khr@jason>
References: <1940005.XIBaf5lNV5@jeremy> <1857880.I5TKlsx52r@jason>
 <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
 <6531669.OW97vx6Khr@jason>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le sam. 22 ao=FBt 2020 =E0 0:11, Paul Boddie <paul@boddie.org.uk> a =

=E9crit :
> On Friday, 21 August 2020 15:32:46 CEST Ezequiel Garcia wrote:
>>  On Thu, 20 Aug 2020 at 19:49, Paul Boddie <paul@boddie.org.uk> =

>> wrote:
>>  >
>>  > It still doesn't work for me. I still get "Input not supported" =

>> from my
>>  > monitor. It is a DVI monitor connected via a HDMI adapter, but =

>> EDID
>>  > probing
>>  > works and, as I noted previously, the HDMI/LCDC can be made to =

>> work (and
>>  > obviously did work in the 3.18 kernel).
>> =

>>  This means the dw_hdmi encoder driver is still not good enough
>>  to support your adapter. I haven't yet compared v3.18 vendor
>>  with our version, but I'm afraid that the dw_hdmi stack has
>>  probably changed quite a bit, so a comparison will be difficult.
> =

> I would have to look at this again to check, but although I may have =

> referred
> to the 3.18 HDMI driver (drivers/gpu/drm/jz4780/dwc_hdmi.c), I'm =

> fairly sure I
> used the more recent driver =

> (drivers/gpu/drm/bridge/synopsys/dw_hdmi.c) as my
> primary reference when making the hardware work with the L4 Runtime
> Environment. But the actual functionality with regard to setting =

> registers in
> the HDMI peripheral is mostly identical between both forms of the =

> driver.
> =

> (This makes sense because few people are likely to have access to the
> proprietary documentation. In fact, few people are likely to have =

> even tried
> to deduce what is doing on. One of the register value tables suggests =

> that one
> of the values would really need to be different, if you consider the =

> patterns
> involved, which means that either the documentation mentions this =

> special case
> or that a mistake has been made that has not yet been exposed through =

> real
> world use.)
> =

>>  The natural debug path for me would be to checkout v3.18,
>>  connect your DVI monitor and make a dump of all the
>>  dw_hdmi registers, then make the same dump for our
>>  mainline kernel -- making sure we are comparing the same
>>  mode.
> =

> It is possible that something does not get initialised in the same =

> way, and
> Nikolaus and I have been working with register dumps, although I =

> haven't been
> generating them myself within Linux. So it is possible that I am =

> missing some
> misconfiguration in the driver that causes an incompatibility with my =

> monitor.
> =

> It should be noted that the initialisation is simpler with the DVI =

> mode,
> thankfully. The "AVI infoframe" stuff (going from memory) is =

> completely
> skipped, as are a range of other things, which made my =

> reimplementation effort
> somewhat quicker. I also didn't bother with the audio functionality, =

> but then
> I don't think DVI has any audio channels, either.
> =

> One reason for implementing drivers for L4Re was to determine what is =

> actually
> needed to initialise the hardware correctly, doing so in an =

> environment that
> has been quicker to test than Linux has been (given some very old =

> development
> hardware I have been using until recently). Another reason is that I =

> actually
> want to get the CI20 hardware working with L4Re, which it was =

> originally
> supposed to do, but in fact that effort was never actually finished.
> =

>>  > I downloaded it from here:
>>  >
>>  > =

>> https://gitlab.collabora.com/linux/0day/-/tree/jz4780-drm-hdmi-v5.9-rc1
>>  >
>>  > (I was going to clone the repository late last night, but it was =

>> taking a
>>  > long time and I also didn't want to clone everything yet again.)
>> =

>>  If you want to avoid cloning the same things over and over
>>  you can use git-clone --reference. And if you want to checkout
>>  just a single branch, git now has --single-branch.
>> =

>>  For instance, (assuming a torvalds/ local repo):
>> =

>>  git clone -b letux/jz4780-hdmi-v4 --single-branch
>>  git://git.goldelico.com/letux-kernel.git --reference torvalds/ letux
> =

> Thanks for the tip! I guess I will spare everyone my thoughts about =

> git's
> never-ending usability deficit.
> =

> [...]
> =

>>  > It would be nice to reconcile the JZ4780 support with the evolving
>>  > upstream support, accommodating the extended descriptors and the =

>> extra
>>  > register usage.
>>  I think that's already done in the patches I've cleaned up.
>>  The only thing left to check is plane offset and overlay enablement.
> =

> There are some things that are done in different places, like various
> registers being set in particular "atomic" methods and not during =

> probing.
> Also, the upstream driver has specific plane descriptors whereas my =

> own
> modifications introduced dual descriptors in a slightly different =

> way. Plus,
> the upstream driver doesn't support extended descriptors, as far as I =

> am
> aware.
> =

> So, unless Paul Cercueil is fine with what you have done, I don't =

> think we are
> close to integrating anything. Then again, I am not really a Linux =

> kernel
> developer, so perhaps I won't comment in depth about what the =

> requirements
> might be.

If you send clean patches, there's no reason for me not to merge them.

>>  > P.S. I noticed a few problems with the 5.9-rc1 branches such as =

>> powering
>>  > down not actually removing the power and, in my own branch, =

>> networking
>>  > not working reliably (or maybe even at all), with the tedious =

>> progress
>>  > indicator never terminating in the boot sequence. So, once again, =

>> it is
>>  > another case of half a step forwards and about three steps back.
>> =

>>  Life (and kernel) is like this: sometimes you need to take three =

>> steps
>>  back to make a jump forward :-)

That's pretty much expected for a -rc1 release. Wait until -rc3 or -rc4 =

to have something more or less stable.

Cheers,
-Paul

> Well, I wish I could be so optimistic. Objectively, the whole Linux =

> kernel
> development process is just so poor when we consider that we started =

> out in
> 2014 or earlier with software that actually worked with the hardware, =

> but
> since it wasn't written quite to everybody's tastes and in line with =

> the
> fashions of the day, the whole exercise of reworking it was thrown =

> straight
> back at the developers. And since the developers were only being paid =

> for as
> long as their employers were interested, which turned out not to last
> particularly long, we all ended up with yet another piece of =

> equipment which
> risks becoming obsolete unnecessarily.
> =

> Of course I would probably benefit from upstreamed support for the =

> CI20,
> although I was actually fairly happy using the 3.18 kernel with a =

> relatively
> recent Debian version, and we might not yet be at the point where new =

> Debian
> releases don't work with such an old kernel. But for the most part I =

> don't
> really care personally about fixing up Linux support for such =

> hardware because
> my own interests lie elsewhere. I suppose the most I get out of it is =

> looking
> at how the hardware works and being in a stronger position to =

> reimplement the
> driver support for L4Re. Indeed, I got the RTC support working in =

> L4Re in
> order to troubleshoot the Linux drivers, although they still seem to =

> be
> pathologically unable to handle the "lost clock" condition that is =

> hardly
> unlikely on the CI20.
> =

> Yet at the same time, I always manage to feel guilty asking for =

> cooperation to
> get improvements made to Linux, spending quite a bit of my own =

> personal time
> working with the underdocumented frameworks involved, building, =

> deploying,
> testing, and so on. And this is just my own way of offering help to =

> others who
> might not be in quite the same position, technically, to improve a =

> situation
> that might be far more important to them. Whatever little =

> satisfaction I might
> get from helping out tends to get completely overwhelmed by the =

> amount of
> effort, frustration and time involved.
> =

> Anyway, sorry for the rant. I'm sure other people find their own =

> activities of
> this nature to be sufficiently fulfilling and enjoyable. Life does =

> present us
> all with setbacks, but I generally don't appreciate getting served up =

> with
> more of them just so that some people in the Valley or wherever can =

> "have fun"
> or whatever the mantra is these days.
> =

> Paul
> =

> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
