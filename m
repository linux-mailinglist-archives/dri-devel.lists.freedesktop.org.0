Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CBA6CB7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 17:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3353789613;
	Tue,  3 Sep 2019 15:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E667C892BE;
 Tue,  3 Sep 2019 15:16:54 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id b10so36818051ioj.2;
 Tue, 03 Sep 2019 08:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EvpevbcZ2qPaZyuwKfkYvTC+6R7AjOl01wbOESFBSas=;
 b=QzAngaeRgswHJ7D74OtszDN49xgAQs6H8wnK0qXdXPDLFACL/JucQuKK/IL+zduxWG
 X/4QVVIVRuG3X9g0wEIpM5tPKVUuIQ8FtyCSqZhtHxN2DQXhxq9bV6jMRK5G95VjTcmR
 RBCvLZuR+zibbaoQDavbbi4j05Lpqmo9b/GpQCZomeTGUDvl8j125aaZgJME27oyh428
 DTFEt1wiXdNfr/JDIMy6LWZZJRLdft5ZlUU0HJ18H9XXJAiptE8mGBCHUwj7XQpyyO26
 jCL+TZRPh/D88YlgGvGthyNb302IY1Sg8NMAZRuvQ9W97h3a1A/9Hf6fx/6O1QJAGx0Y
 2Abg==
X-Gm-Message-State: APjAAAVx/vV4j+idIwQzn7bnDRgG6GJR4QbKBY80P0yEAJzjImdcDFXj
 sICRpf6E0kmnQXwpgdTuWKW5sPPb
X-Google-Smtp-Source: APXvYqyWN0xhPL+5jEhHmhtFz9WdniszcBc6tSKq0ffrxKpJAm45OcAtNYixTSuXC5VTVJd0wB38QA==
X-Received: by 2002:a02:90c3:: with SMTP id c3mr1304013jag.71.1567523814060;
 Tue, 03 Sep 2019 08:16:54 -0700 (PDT)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id k14sm7984285iot.32.2019.09.03.08.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 08:16:53 -0700 (PDT)
Date: Tue, 3 Sep 2019 11:17:12 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH] drm/vblank: Document and fix vblank count
 barrier semantics
Message-ID: <20190903151712.ecv7wczevdmdqpes@smtp.gmail.com>
References: <20190719170654.GQ5942@intel.com>
 <20190723131337.22031-1-daniel.vetter@ffwll.ch>
 <20190903124703.7ldnm6owxu6r2fsm@smtp.gmail.com>
 <20190903150922.GY2112@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190903150922.GY2112@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EvpevbcZ2qPaZyuwKfkYvTC+6R7AjOl01wbOESFBSas=;
 b=pjOMYUAziF+u+XG8RSesckRBSnQPyzKF0cgAAqfBasAOhZj0ueQ9G1liv6QMh1lcVY
 B2c9tJak/4My2o6LYd7tLMkNgg9v+Ij73cCxIIFHm0luYvXTKYVvS6z3wB3oyW9qQwUg
 p7DOrgf55vvDCKmmGidUuFFEteR12XkRIy7yJANvmXm/pBSDUGMqBxHz1ikYDIzmfJFz
 /ufabrMbixHdy+0s8gMm9x1uWZH5s3YkiP0xEkDmwoYbyaWRAsP81SX95K9b9F9Vdlb1
 BhZ4CtvPHVEzSoGU/ECDYASpXWJ0kZlLJTf3TGNxJN9ZutV6i5jwsurAXvoz9lClO8Eq
 Es9A==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1553086036=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1553086036==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcb7tasdu57fn62w"
Content-Disposition: inline


--lcb7tasdu57fn62w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, thanks for the explanation.

I noticed that I forgot to add my r-b.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

On 09/03, Daniel Vetter wrote:
> On Tue, Sep 03, 2019 at 08:47:03AM -0400, Rodrigo Siqueira wrote:
> > Hi Daniel,
> >=20
> > All the series look really good for me. I just have some few questions
> > here.
> >=20
> > On 07/23, Daniel Vetter wrote:
> > > Noticed while reviewing code. I'm not sure whether this might or might
> > > not explain some of the missed vblank hilarity we've been seeing. I
> >=20
> > I have to admit that I'm a little bit confused about the "missed vblank
> > hilarity we've been seeing". Could you elaborate a little bit more about
> > this problem in the commit message?
>=20
> We've had various reports on various drivers that hw vblanks seem to get
> lost and the driver stuck on vblank waits. I think most of those where
> just driver bugs, but could be also that there's some issues in the vblank
> core.
>=20
> > Additionally, how about break this commit in two? One dedicated to the =
barriers
> > and the atomic64, and the other related to the documentation?
> >=20
> > > think those all go through the vblank completion event, which has
> > > unconditional barriers - it always takes the spinlock. Therefore no
> > > cc stable.
> > >=20
> > > v2:
> > > - Barrriers are hard, put them in in the right order (Chris).
> > > - Improve the comments a bit.
> > >=20
> > > v3:
> > >=20
> > > Ville noticed that on 32bit we might be breaking up the load/stores,
> > > now that the vblank counter has been switched over to be 64 bit. Fix
> > > that up by switching to atomic64_t. This this happens so rarely in
> > > practice I figured no need to cc: stable ...
> > >=20
> > > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Cc: Keith Packard <keithp@keithp.com>
> > > References: 570e86963a51 ("drm: Widen vblank count to 64-bits [v3]")
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_vblank.c | 45 ++++++++++++++++++++++++++++++++--=
--
> > >  include/drm/drm_vblank.h     | 15 ++++++++++--
> > >  2 files changed, 54 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblan=
k.c
> > > index 603ab105125d..03e37bceac9c 100644
> > > --- a/drivers/gpu/drm/drm_vblank.c
> > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > @@ -107,7 +107,7 @@ static void store_vblank(struct drm_device *dev, =
unsigned int pipe,
> > > =20
> > >  	write_seqlock(&vblank->seqlock);
> > >  	vblank->time =3D t_vblank;
> > > -	vblank->count +=3D vblank_count_inc;
> > > +	atomic64_add(vblank_count_inc, &vblank->count);
> > >  	write_sequnlock(&vblank->seqlock);
> > >  }
> > > =20
> > > @@ -273,7 +273,8 @@ static void drm_update_vblank_count(struct drm_de=
vice *dev, unsigned int pipe,
> > > =20
> > >  	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
> > >  		      " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
> > > -		      pipe, vblank->count, diff, cur_vblank, vblank->last);
> > > +		      pipe, atomic64_read(&vblank->count), diff,
> > > +		      cur_vblank, vblank->last);
> > > =20
> > >  	if (diff =3D=3D 0) {
> > >  		WARN_ON_ONCE(cur_vblank !=3D vblank->last);
> > > @@ -295,11 +296,23 @@ static void drm_update_vblank_count(struct drm_=
device *dev, unsigned int pipe,
> > >  static u64 drm_vblank_count(struct drm_device *dev, unsigned int pip=
e)
> > >  {
> > >  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > > +	u64 count;
> > > =20
> > >  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> > >  		return 0;
> > > =20
> > > -	return vblank->count;
> > > +	count =3D atomic64_read(&vblank->count);
> > > +
> > > +	/*
> > > +	 * This read barrier corresponds to the implicit write barrier of t=
he
> > > +	 * write seqlock in store_vblank(). Note that this is the only place
> > > +	 * where we need an explicit barrier, since all other access goes
> > > +	 * through drm_vblank_count_and_time(), which already has the requi=
red
> > > +	 * read barrier curtesy of the read seqlock.
> > > +	 */
> > > +	smp_rmb();
> >=20
> > I think I did not get all the idea behind the smp_rmb() in this functio=
n. FWIU,
> > smp_xxx are used for preventing race conditions in a multiprocessor sys=
tem,
> > right? In this sense, I can presume that this change can bring benefits=
 for
> > VKMS or any other virtual driver; on the other hand, this will not brin=
g any
> > advantage on real drivers like i915 and amdgpu since these devices are =
not
> > related with smp stuff, right?
>=20
> smp or not smp is about the cpu your driver is running on, not anything to
> do with the device hardware itself. And nowadays there's simply no
> single-threaded processors anymore, everything has at least 2 cores (even
> the tiniest soc). So yeah, this matters for everyone.
>=20
> smp_* functions only get compiled out to nothing if you have CONFIG_UP
> (which means only 1 cpu core with only 1 SMT thread is supported).
>=20
> And yeah correctly placing smp barriers is Real Hard Stuff (tm).
> -Daniel
>=20
> =20
> > Thanks
> >=20
> > > +
> > > +	return count;
> > >  }
> > > =20
> > >  /**
> > > @@ -764,6 +777,14 @@ drm_get_last_vbltimestamp(struct drm_device *dev=
, unsigned int pipe,
> > >   * vblank interrupt (since it only reports the software vblank count=
er), see
> > >   * drm_crtc_accurate_vblank_count() for such use-cases.
> > >   *
> > > + * Note that for a given vblank counter value drm_crtc_handle_vblank=
()
> > > + * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> > > + * provide a barrier: Any writes done before calling
> > > + * drm_crtc_handle_vblank() will be visible to callers of the later
> > > + * functions, iff the vblank count is the same or a later one.
> > > + *
> > > + * See also &drm_vblank_crtc.count.
> > > + *
> > >   * Returns:
> > >   * The software vblank counter.
> > >   */
> > > @@ -801,7 +822,7 @@ static u64 drm_vblank_count_and_time(struct drm_d=
evice *dev, unsigned int pipe,
> > > =20
> > >  	do {
> > >  		seq =3D read_seqbegin(&vblank->seqlock);
> > > -		vblank_count =3D vblank->count;
> > > +		vblank_count =3D atomic64_read(&vblank->count);
> > >  		*vblanktime =3D vblank->time;
> > >  	} while (read_seqretry(&vblank->seqlock, seq));
> > > =20
> > > @@ -818,6 +839,14 @@ static u64 drm_vblank_count_and_time(struct drm_=
device *dev, unsigned int pipe,
> > >   * vblank events since the system was booted, including lost events =
due to
> > >   * modesetting activity. Returns corresponding system timestamp of t=
he time
> > >   * of the vblank interval that corresponds to the current vblank cou=
nter value.
> > > + *
> > > + * Note that for a given vblank counter value drm_crtc_handle_vblank=
()
> > > + * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> > > + * provide a barrier: Any writes done before calling
> > > + * drm_crtc_handle_vblank() will be visible to callers of the later
> > > + * functions, iff the vblank count is the same or a later one.
> > > + *
> > > + * See also &drm_vblank_crtc.count.
> > >   */
> > >  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > >  				   ktime_t *vblanktime)
> > > @@ -1791,6 +1820,14 @@ EXPORT_SYMBOL(drm_handle_vblank);
> > >   *
> > >   * This is the native KMS version of drm_handle_vblank().
> > >   *
> > > + * Note that for a given vblank counter value drm_crtc_handle_vblank=
()
> > > + * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> > > + * provide a barrier: Any writes done before calling
> > > + * drm_crtc_handle_vblank() will be visible to callers of the later
> > > + * functions, iff the vblank count is the same or a later one.
> > > + *
> > > + * See also &drm_vblank_crtc.count.
> > > + *
> > >   * Returns:
> > >   * True if the event was successfully handled, false on failure.
> > >   */
> > > diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> > > index 9fe4ba8bc622..c16c44052b3d 100644
> > > --- a/include/drm/drm_vblank.h
> > > +++ b/include/drm/drm_vblank.h
> > > @@ -109,9 +109,20 @@ struct drm_vblank_crtc {
> > >  	seqlock_t seqlock;
> > > =20
> > >  	/**
> > > -	 * @count: Current software vblank counter.
> > > +	 * @count:
> > > +	 *
> > > +	 * Current software vblank counter.
> > > +	 *
> > > +	 * Note that for a given vblank counter value drm_crtc_handle_vblan=
k()
> > > +	 * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> > > +	 * provide a barrier: Any writes done before calling
> > > +	 * drm_crtc_handle_vblank() will be visible to callers of the later
> > > +	 * functions, iff the vblank count is the same or a later one.
> > > +	 *
> > > +	 * IMPORTANT: This guarantee requires barriers, therefor never acce=
ss
> > > +	 * this field directly. Use drm_crtc_vblank_count() instead.
> > >  	 */
> > > -	u64 count;
> > > +	atomic64_t count;
> > >  	/**
> > >  	 * @time: Vblank timestamp corresponding to @count.
> > >  	 */
> > > --=20
> > > 2.22.0
> > >=20
> >=20
> > --=20
> > Rodrigo Siqueira
> > Software Engineer, Advanced Micro Devices (AMD)
> > https://siqueira.tech
>=20
>=20
>=20
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--lcb7tasdu57fn62w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1ug/gACgkQWJzP/com
vP++Pg//XTEbjYfxdgBOYzWGYuNFcRCuG+N+sLBnWr5L3MnKih80NY+8IzrBXxnK
+P29GnOjDk9b7u+R1TxP8FvWZQJEwjuIZIguuYm0pVvD/N+XUro+rAFnjidyzvO+
AIloWRrxclZKYHxn2aDQzU30BlCR94W4zar/2FpZy4Fo0Y7PGgmxRTXDSvzIpiMz
6F4y3JhOGAUDWKuQlqlhbff6Pnw6OiqI6B89V4sTpYGtEBmY+LyHa0iv6UDM0Tu+
/JJSQA7A5cF/hwJhiV7dyb0X+JdfV8u3Z7Lnybl3Zeak3szEyqlbXD75g2VSTC8W
XHWNiPsaK1DCeq4459iXQpo93J4aaUd5D2FjI5ZyijAO/KrhRANNCgAEofMjkUgh
dBnC3a6O+O8iM+q0neR/ShjsYB7DAi22+Vvssr5Z8LzBO8Zu+R5rAjgDkGgoV7hb
JNVYLfEZHO1k4qZL/DWb322eU5BayefgStquSqge74m1yCEayJ3R/5CLh+VoIszf
2FCirG7OxRPRsfSrvlgecwC65kfsZA9apPY3rYu1pHLFbe7wuBtJQosoSOMdTdP/
m6dlJTOzuneov7rZ3b4EBuUxtlOtZ+SBxp7mwGItZUqFVRvJdiw2+FXMvFEN0maT
a7F4GflbwMfYTeaxeVi4xbMFm4Bc5fePpfsLq2wyDsGx84vAgQc=
=n/m4
-----END PGP SIGNATURE-----

--lcb7tasdu57fn62w--

--===============1553086036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1553086036==--
