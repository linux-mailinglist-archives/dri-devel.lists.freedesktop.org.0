Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB072DBD0A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE1F89138;
	Wed, 16 Dec 2020 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258708845B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 01:09:39 +0000 (UTC)
IronPort-SDR: nwyQ2ACrNsAOqaSuBEWGUKGf7TsIPSE/GI/a1WFKHFInOYWct7VCEV7xth8gDdZEcxZB6t8ahW
 Ce26HoqCkEqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="193363374"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="193363374"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 17:09:38 -0800
IronPort-SDR: RU9tWlTsZCIOuXYyqvu9cECu6EZoHttatFgsVIZwtruFTVtcBbrZ/0/3IT6+IoHB60TAVdN/qk
 qWiQoArHUlyw==
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="556586381"
Received: from smtp.ostc.intel.com ([10.54.29.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 17:09:38 -0800
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
 by smtp.ostc.intel.com (Postfix) with ESMTP id E77316363;
 Tue, 15 Dec 2020 17:09:37 -0800 (PST)
Date: Tue, 15 Dec 2020 17:09:37 -0800
From: mark gross <mgross@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the drm tree with the crypto tree
Message-ID: <20201216010937.GA6517@linux.intel.com>
References: <20201214135453.16e76e9d@canb.auug.org.au>
 <CAMuHMdWYBLqUVRyNRbOZm=oxv+_uLJ9FK6ebPPvgHcN4Y-YUSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWYBLqUVRyNRbOZm=oxv+_uLJ9FK6ebPPvgHcN4Y-YUSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Reply-To: mgross@linux.intel.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Crypto List <linux-crypto@vger.kernel.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Mike Healy <mikex.healy@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 10:58:52AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 14, 2020 at 2:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >   MAINTAINERS
> >
> > between commit:
> >
> >   885743324513 ("crypto: keembay - Add support for Keem Bay OCS AES/SM4")
> >
> > from the crypto tree and commit:
> >
> >   ed794057b052 ("drm/kmb: Build files for KeemBay Display driver")
> >
> > from the drm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc MAINTAINERS
> > index 3b358262de8f,eb18459c1d16..000000000000
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> 
> > @@@ -8985,16 -8962,13 +8993,23 @@@ M:   Deepak Saxena <dsaxena@plexity.net
> >   S:    Maintained
> >   F:    drivers/char/hw_random/ixp4xx-rng.c
> >
> > + INTEL KEEMBAY DRM DRIVER
> 
> Is it KEEMBAY?
> 
> > + M:    Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > + M:    Edmund Dea <edmund.j.dea@intel.com>
> > + S:    Maintained
> > + F:    Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> 
> I was just going to comment about "intel,kmb_*" vs. "intel,keembay-*", until
> I noticed intel,kmb_display.yaml does not exist, but is called
> Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> in next-20201214.
> 
> > + F:    drivers/gpu/drm/kmb/
> > +
> >  +INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER
> 
> or KEEM BAY?
> 
> Or Keem Bay? Keembay? KeemBay?
It should be Keem Bay.  I googled sandybridge, ivybridge, baytrail,
cherrytrail, medfield and merrifiled and for the *bridge and *trail products
the words are split up and capitalized.  For the *fields they are one-word.

We'll update the KEEMBAY,KeemBay, KEEM BAY instances to Keem Bay to mimic SDB,
IVB, BYT and CHT since those are the majority. I'm not sure I'm going to rename
the file names however but, within the files wherever we talk about Keem Bay we
will use "Keem Bay" consistently.

Sorry for the variances,

--mark
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
