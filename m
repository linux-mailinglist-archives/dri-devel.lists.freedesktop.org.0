Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA291BAEB2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 22:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DCC89CDE;
	Mon, 27 Apr 2020 20:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693E89CDE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 20:04:49 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F9F8206D6;
 Mon, 27 Apr 2020 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588017889;
 bh=m3jQiUHzkwqrgD6Uvyq9EGhqWeH+voB+Nd3N343ee34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HncrMfRPGvdCZBBl7tgqwXsHIwk7k7NCTKmuifYxmUGiy0HMMrRFM2Ws0s3lpvA8i
 aCVmvidD2ps7bR6qL191Uwn7r/kZ7RLGGsxiQdmg1oec4VjLTdnRfWS5LvicMBwAf0
 Ed3bMvNfuVnVdpRYEDavE0jEKCM2kxcrZp4PN3yk=
Date: Mon, 27 Apr 2020 13:04:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] get_maintainer: Add email addresses from .yaml files
Message-Id: <20200427130448.74b75c3a6c91e5ede31542e4@linux-foundation.org>
In-Reply-To: <79ade7bc8ce57ef11f94011bad1842372c61fdd7.camel@perches.com>
References: <87d082jtfn.fsf@collabora.com> <20200420175909.GA5810@ravnborg.org>
 <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
 <9a32f150f85f851d04afd148b2a9a5cf203f7ce1.camel@perches.com>
 <7beaedfd63017973b910dd21cac13ecb42dbe503.camel@perches.com>
 <20200427055755.GA21898@ravnborg.org>
 <79ade7bc8ce57ef11f94011bad1842372c61fdd7.camel@perches.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Sun, 26 Apr 2020 23:33:02 -0700 Joe Perches <joe@perches.com> wrote:

> On Mon, 2020-04-27 at 07:57 +0200, Sam Ravnborg wrote:
> > Hi Joe.
> =

> Hi Sam.
> =

> > On Sun, Apr 26, 2020 at 10:40:52PM -0700, Joe Perches wrote:
> > > .yaml files can contain maintainer/author addresses and it seems
> > > unlikely or unnecessary that individual MAINTAINER file section
> > > entries for each .yaml file will be created.
> > > =

> > > So dd the email addresses found in .yaml files to the default
> >      ^
> >      add
> =

> Andrew, can you add the a to this please?
> =

> > Signed-off-by: Joe Perches <joe@perches.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Tested-by: Sam Ravnborg <sam@ravnborg.org>
> > =

> > The patch did not apply on top of -rc3, but it was trivial to fix.
> > Tested and works like a charm.
> > Thanks for doing this!
> =

> As most of my patches, it was done using -next
> =


The patch assumes that we have

-	    if ($file_emails) {
-		my @poss_addr =3D $text =3D~ m$[A-Za-z_-_\"\' \,\.\+-]*\s*[\,]*\s*[\(\<\=
{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$g;
-		push(@file_emails, clean_file_emails(@poss_addr));
-	    }

but today's next has

	    if ($file_emails) {
		my @poss_addr =3D $text =3D~ m$[A-Za-z=C0-=FF\"\' \,\.\+-]*\s*[\,]*\s*[\(=
\<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$g;
		push(@file_emails, clean_file_emails(@poss_addr));
	    }

so what do do here?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
