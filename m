Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44EC1BAF70
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 22:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61D889B66;
	Mon, 27 Apr 2020 20:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0184.hostedemail.com
 [216.40.44.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B6089B66
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 20:26:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id EA3A4100E7B42;
 Mon, 27 Apr 2020 20:26:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2693:2827:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:4605:5007:7903:9040:10004:10400:10848:10967:11026:11232:11658:11914:12043:12050:12297:12740:12895:13019:13069:13072:13311:13357:13439:13894:14180:14181:14659:14721:14777:21060:21080:21433:21611:21627:21660:21740:21819:21939:30022:30054:30056:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: cub03_1b15e2b16104b
X-Filterd-Recvd-Size: 3435
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Apr 2020 20:26:26 +0000 (UTC)
Message-ID: <7b29655cc4ab872d338565145498bd15118dad8d.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: Add email addresses from .yaml files
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Apr 2020 13:26:24 -0700
In-Reply-To: <20200427130448.74b75c3a6c91e5ede31542e4@linux-foundation.org>
References: <87d082jtfn.fsf@collabora.com> <20200420175909.GA5810@ravnborg.org>
 <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
 <9a32f150f85f851d04afd148b2a9a5cf203f7ce1.camel@perches.com>
 <7beaedfd63017973b910dd21cac13ecb42dbe503.camel@perches.com>
 <20200427055755.GA21898@ravnborg.org>
 <79ade7bc8ce57ef11f94011bad1842372c61fdd7.camel@perches.com>
 <20200427130448.74b75c3a6c91e5ede31542e4@linux-foundation.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Ratiu <adrian.ratiu@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-04-27 at 13:04 -0700, Andrew Morton wrote:
> On Sun, 26 Apr 2020 23:33:02 -0700 Joe Perches <joe@perches.com> wrote:
> =

> > On Mon, 2020-04-27 at 07:57 +0200, Sam Ravnborg wrote:
> > > Hi Joe.
> > =

> > Hi Sam.
> > =

> > > On Sun, Apr 26, 2020 at 10:40:52PM -0700, Joe Perches wrote:
> > > > .yaml files can contain maintainer/author addresses and it seems
> > > > unlikely or unnecessary that individual MAINTAINER file section
> > > > entries for each .yaml file will be created.
> > > > =

> > > > So dd the email addresses found in .yaml files to the default
> > >      ^
> > >      add
> > =

> > Andrew, can you add the a to this please?
> > =

> > > Signed-off-by: Joe Perches <joe@perches.com>
> > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > Tested-by: Sam Ravnborg <sam@ravnborg.org>
> > > =

> > > The patch did not apply on top of -rc3, but it was trivial to fix.
> > > Tested and works like a charm.
> > > Thanks for doing this!
> > =

> > As most of my patches, it was done using -next
> > =

> =

> The patch assumes that we have
> =

> -	    if ($file_emails) {
> -		my @poss_addr =3D $text =3D~ m$[A-Za-z_-_\"\' \,\.\+-]*\s*[\,]*\s*[\(\=
<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$g;
> -		push(@file_emails, clean_file_emails(@poss_addr));
> -	    }
> =

> but today's next has
> =

> 	    if ($file_emails) {
> 		my @poss_addr =3D $text =3D~ m$[A-Za-z=C0-=FF\"\' \,\.\+-]*\s*[\,]*\s*[=
\(\<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$=
g;
> 		push(@file_emails, clean_file_emails(@poss_addr));
> 	    }
> =

> so what do do here?

It's not "do do" nor "doo doo", but it is odd.
Must be some weirdness with the evolution email composer again.

I'll resubmit with Sam's sign-offs using a proper git-send-email
(and I'll fix the dd/add typo, thanks Sam)



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
