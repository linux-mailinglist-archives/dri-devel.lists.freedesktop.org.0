Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E237DA7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 21:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1E892BC;
	Thu,  6 Jun 2019 19:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E611D892C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 19:53:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45KbvF48Xvz9sDX;
 Fri,  7 Jun 2019 05:53:45 +1000 (AEST)
Date: Fri, 7 Jun 2019 05:53:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: RFC: Run a dedicated hmm.git for 5.3
Message-ID: <20190607055334.2bdea125@canb.auug.org.au>
In-Reply-To: <20190606152543.GE17392@mellanox.com>
References: <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca>
 <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca>
 <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca>
 <20190524064051.GA28855@infradead.org>
 <20190524124455.GB16845@ziepe.ca>
 <20190525155210.8a9a66385ac8169d0e144225@linux-foundation.org>
 <20190527191247.GA12540@ziepe.ca>
 <20190606152543.GE17392@mellanox.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1559850827;
 bh=d6SJxU0/ScjlRTFzNoaL9FcILbaOOHmHAty3CZ/Vh/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BjNv3BPoFFPjmA7YQV4rHasyQ0759LKCjrVwNHart/HO5uj6qphC7gz5KmZdB56+B
 +HwcAvXphavYyjktKp2nK/jcsCuzQMXr5tqUTMfnT+ev0DFZx39i29fZZF8dgmZc/X
 +9wCz+J4sHwuFLYcUDhILzckHTzdJn0r+exASPB5apFMQMHzlQXGO7rv4vH9K294gK
 DO22P0PGbGBiNs9bXbMEll8eNKCkiScDLyAPZh+OSYddhH9pzQnsx+RyjoatvzPYzs
 e6q3RHbjuSYXsBnUkV4GqSVVxHyycbvDTvvdYsR/a32WxXzAqT9enp//v76sEKQZFE
 jQf8GDy1+/pRA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Doug Ledford <dledford@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kaike Wan <kaike.wan@intel.com>,
 Christoph Hellwig <hch@infradead.org>, Leon Romanovsky <leonro@mellanox.com>,
 Jerome Glisse <jglisse@redhat.com>, Moni Shoua <monis@mellanox.com>,
 Artemy Kovalyov <artemyko@mellanox.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1337183434=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1337183434==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l+KwJlP++eQB4BpW/9k.220"; protocol="application/pgp-signature"

--Sig_/l+KwJlP++eQB4BpW/9k.220
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Thu, 6 Jun 2019 15:25:49 +0000 Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Mon, May 27, 2019 at 04:12:47PM -0300, Jason Gunthorpe wrote:
> > On Sat, May 25, 2019 at 03:52:10PM -0700, Andrew Morton wrote: =20
> > > On Fri, 24 May 2019 09:44:55 -0300 Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
> > >  =20
> > > > Now that -mm merged the basic hmm API skeleton I think running like
> > > > this would get us quickly to the place we all want: comprehensive i=
n tree
> > > > users of hmm.
> > > >=20
> > > > Andrew, would this be acceptable to you? =20
> > >=20
> > > Sure.  Please take care not to permit this to reduce the amount of
> > > exposure and review which the core HMM pieces get. =20
> >=20
> > Certainly, thanks all
> >=20
> > Jerome: I started a HMM branch on v5.2-rc2 in the rdma.git here:
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
> > https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=3D=
hmm =20
>=20
> I did a first round of collecting patches for hmm.git
>=20
> Andrew, I'm checking linux-next and to stay co-ordinated, I see the
> patches below are in your tree and now also in hmm.git. Can you please
> drop them from your tree?=20
>=20
> 5b693741de2ace mm/hmm.c: suppress compilation warnings when CONFIG_HUGETL=
B_PAGE is not set
> b2870fb882599a mm/hmm.c: only set FAULT_FLAG_ALLOW_RETRY for non-blocking
> dff7babf8ae9f1 mm/hmm.c: support automatic NUMA balancing
>=20
> I checked that the other two patches in -next also touching hmm.c are
> best suited to go through your tree:
>=20
> a76b9b318a7180 mm/devm_memremap_pages: fix final page put race
> fc64c058d01b98 mm/memremap: rename and consolidate SECTION_SIZE
>=20
> StephenR: Can you pick up the hmm branch from rdma.git for linux-next for
> this cycle? As above we are moving the patches from -mm to hmm.git, so
> there will be a conflict in -next until Andrew adjusts his tree,
> thanks!

I have added the hmm branch from today with currently just you as the
contact.  I also removed the three commits above from Andrew's tree.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/l+KwJlP++eQB4BpW/9k.220
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz5bz4ACgkQAVBC80lX
0Gz42ggAjd2XdELh29gxYaa3AGGZx68tH5E3qcBVYvxP3IEAfi0bUSvxNXFhstk6
YaxWX9oxbApTS2Uj3++jezF4Xjj2Y73HGUjGLQ3Otw3Mnqcf6jXCMx8Z++gM7yyC
VCZzpR+3xAuAY21M7Ov9ZplyOO2h0UgAm8zaMi5hxEyGVAKjncUBDg4Y0qrh0UAl
AnZKxV4zQyp4/PvVuYFQa+g8igqB+cGfBLY36wP0k2p3f7btC0m1JSgADRiqg0lA
reZ+53oVo8c90IhdJp2lysklnxwDvfGMcl5S93eBGYfT0TdJ0XWriIgIy+uwt6mx
VsgPHJUvyidpJbGyRC/m2LJnhvk19w==
=dJb7
-----END PGP SIGNATURE-----

--Sig_/l+KwJlP++eQB4BpW/9k.220--

--===============1337183434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1337183434==--
