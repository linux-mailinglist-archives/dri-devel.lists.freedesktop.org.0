Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C425F6FF2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 23:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3273410E8A1;
	Thu,  6 Oct 2022 21:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4FA10E8A1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 21:08:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mk3vM33ZQz4xFv;
 Fri,  7 Oct 2022 08:08:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1665090513;
 bh=tBh7R6EFNvNHC472p+hpxdozssjAKs0uoyZ2/Iz5m7c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lEZ1s/HQiOR9m8FWwvlBEaEksytuS4VvE0NaNWxJyYQUqlyvAgZV9TvsHaf8jc+0F
 TMbVyFcXYBIBH1GRM2dfDclqp0olE3JhdqgiOlM02TBf3ifpLxwe0y7qgBco6xYr//
 TrnyLkwtS7pFp5fKipMYaYCoYsWSo+suiCDC9y9tvJ370eCjGwKA2+BxDQBi92NFoP
 xx9AyE7ttg86rcV5lvlsAyfUHOcWzEE8lyMK4ghfM5X0MtyVxfVn4yYOn/wFCH+qR0
 BSBfEKgW9sOOF+2Z7+us9y+wJu/NzsOI7BQe581i8o1E1N38oqDfsKdSW8ypePg/ce
 2LEnAms0O1R8w==
Date: Fri, 7 Oct 2022 03:52:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20221007035244.46e258a3@canb.auug.org.au>
In-Reply-To: <CADnq5_N1cZiG39KzUzdHCtLRRCipMMNXjaNuAvoQs8=VTjtGCA@mail.gmail.com>
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
 <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
 <20221004140558.64f59f2c@canb.auug.org.au>
 <YzwbW4YQwQPsRPYw@sirena.org.uk>
 <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
 <09cd11c5-2a15-3653-957c-88c751fa9029@amd.com>
 <20221006092810.0c3a2238@canb.auug.org.au>
 <20221006191245.11bb0e2c@canb.auug.org.au>
 <CADnq5_N1cZiG39KzUzdHCtLRRCipMMNXjaNuAvoQs8=VTjtGCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yq=CMsPbtfbw3ZbIbj0A.8v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Mark Brown <broonie@kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yq=CMsPbtfbw3ZbIbj0A.8v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, 6 Oct 2022 09:56:32 -0400 Alex Deucher <alexdeucher@gmail.com> wrot=
e:
>
> This looks good to me.  Care to add you s-o-b?
>=20
> On Thu, Oct 6, 2022 at 4:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > This works as well, and (in my opinion) is better:
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/=
gpu/drm/amd/display/dc/core/dc_stream.c
> > index ae13887756bf..fb6222d4c430 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > @@ -499,7 +499,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
> >                 struct dc_stream_state *stream,
> >                 uint32_t dwb_pipe_inst)
> >  {
> > -       int i =3D 0, j =3D 0;
> > +       unsigned int i, j;
> >         if (stream =3D=3D NULL) {
> >                 dm_error("DC: dc_stream is NULL!\n");
> >                 return false;
> > @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
> >         }
> >
> >         /* remove writeback info for disabled writeback pipes from stre=
am */
> > -       for (i =3D 0, j =3D 0; i < stream->num_wb_info && j < MAX_DWB_P=
IPES; i++) {
> > +       for (i =3D 0, j =3D 0; i < stream->num_wb_info; i++) {
> >                 if (stream->writeback_info[i].wb_enabled) {
> > -                       if (i !=3D j)
> > +                       if (j < i)
> >                                 /* trim the array */
> >                                 stream->writeback_info[j] =3D stream->w=
riteback_info[i];
> >                         j++;

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/yq=CMsPbtfbw3ZbIbj0A.8v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM/B9wACgkQAVBC80lX
0GxPBwf/X9e+0uhZmXWuqnUtNXKQwd59fHfR7z+ygsIZb+QvXVfou3rxBBG01k9L
ynx2bUMXHzZclPr4YRBTujJg+WUrGRaSSwQLYMnaMldJPLIw1DVOzQPJc55MzkTx
Ot1EwdItYS0CohnccfrUZwWTs7j8j5rkn9tQNDRmkPAS5HQ+SzIir2oA0axR78yT
tL9uxN762UYNBTPGH07aZ2Z/tMMTglop9JtzsAhtJJzUMK9G4VMMP1UDld8PfYwf
1yz85G9JBKhEjk+NItYGvKLK3XzxERwusBaUUGgb77dsZ2A/njBwZkkHjPeP7Djr
gvipz9skgMi5RjNrKa3caq0X0EYP6g==
=mEP6
-----END PGP SIGNATURE-----

--Sig_/yq=CMsPbtfbw3ZbIbj0A.8v--
