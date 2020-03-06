Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EA17BAE2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE776ECD1;
	Fri,  6 Mar 2020 10:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0055.hostedemail.com
 [216.40.44.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5856ECD1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:57:43 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 9675D837F27E;
 Fri,  6 Mar 2020 10:57:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:966:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3873:4321:4385:5007:6119:7514:7809:7974:10004:10400:10848:11232:11473:11658:11914:12043:12296:12297:12555:12679:12740:12895:12986:13069:13161:13229:13311:13357:13439:13894:14181:14659:14721:21080:21325:21451:21627:21740:30054:30064:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: mom04_25fb8bd6a1122
X-Filterd-Recvd-Size: 3105
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Fri,  6 Mar 2020 10:57:40 +0000 (UTC)
Message-ID: <155f99baffe11836fc9d794ff297bdcee7831050.camel@perches.com>
Subject: Re: [Intel-gfx] [PATCH] MAINTAINERS: adjust to reservation.h renaming
From: Joe Perches <joe@perches.com>
To: Daniel Vetter <daniel@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Fri, 06 Mar 2020 02:56:06 -0800
In-Reply-To: <20200306103946.GT2363188@phenom.ffwll.local>
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
 <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
 <20200306103946.GT2363188@phenom.ffwll.local>
User-Agent: Evolution 3.34.1-2 
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
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Sebastian Duda <sebastian.duda@fau.de>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-03-06 at 11:39 +0100, Daniel Vetter wrote:
> On Wed, Mar 04, 2020 at 01:08:32PM +0100, Christian K=F6nig wrote:
> > Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> > > Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
> > > renamed include/linux/reservation.h to include/linux/dma-resv.h, but
> > > missed the reference in the MAINTAINERS entry.
> > > =

> > > Since then, ./scripts/get_maintainer.pl --self-test complains:
> > > =

> > >    warning: no file matches F: include/linux/reservation.h
> > > =

> > > Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
> > > =

> > > Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> > > Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > =

> > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> =

> You'll push this too?
> -Daniel
> =

> > > ---
> > > Christian, please pick this patch.
> > > applies cleanly on current master and next-20200303
> > > =

> > >   MAINTAINERS | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > =

> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 6158a143a13e..3d6cb2789c9e 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
> > >   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> > >   F:	drivers/dma-buf/
> > >   F:	include/linux/dma-buf*
> > > -F:	include/linux/reservation.h
> > > +F:	include/linux/dma-resv.h
> > >   F:	include/linux/*fence.h
> > >   F:	Documentation/driver-api/dma-buf.rst
> > >   K:	dma_(buf|fence|resv)

Slightly unrelated:

The K: entry matches a lot of other things
and may have a lot of false positive matches
like any variable named dma_buffer

This should also use (?:...) to avoid a perl
capture group.

Perhaps:

K:	'\bdma_(?:buf|fence|resv)\b'


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
