Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F1445079
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F5F6E8A5;
	Thu,  4 Nov 2021 08:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF056E8A5;
 Thu,  4 Nov 2021 08:38:41 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id g3so8231568ljm.8;
 Thu, 04 Nov 2021 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=y6c0lX9YO0GagXVF8wdjl89BQqUBHzqARgOtyubUOyo=;
 b=bfg7QPZY0SJCj5pBe2sU+KkbiDT+UJCY9VxbsO40hDbuJzzGJmg4MfMP1V69wjqt+U
 /Q0bmljNlqnVjYzH+/2YYO0kOhjMEPme56OpC0VFoqBXNf+KzkPQW/LWWvDZ9Hrq0oKC
 dwFhZrYTibCZoVKh2JimrmWaBcemhsrYkCFARuZcSzMwgb1p4vu92bwo5qYO5YLu1tcE
 DJouwHqLuI7EE37SNtAudbkyK+ymDq5sfZMbJ/d2e0NrCpcyXdWUeEKteeIWK85FOVah
 G3zXDpNckchDR6bZk9sZXOGcrhEz5NXrM0O19TEEedg4i6cKiWrnStmgTK7Xjx6PrBWs
 NBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=y6c0lX9YO0GagXVF8wdjl89BQqUBHzqARgOtyubUOyo=;
 b=swswOYTx4TBTQEbFQP3fnvScP5FbIiI6l3R8SA6v8s8Bul39rfG/1PAK5kzqf8x7oD
 0ZeyPGZpFqnLxgOHirzQ4trE3J4nMimROiuWbu8KhHlJstOV3r3bTUZlrSIvwH4NocVI
 jt8Kfvr5Halw4PhSbNdizl+8aKYBOcoI2Wa6zSFoDk22RV/2yyMBEqv3NpUwZO0rnM+K
 1EZOiAFzIfgMb1URgkuIA298N532eBGkA1QwK3IftT6uMKSnGT7hmSS7Q99JNE/qO7JR
 E+KaRXHNDTscNH1Lkycwr0DzavXWAhy4xDkTCexPYONkUgNtAtwDxC3yt9n8MKKkCksc
 YZhQ==
X-Gm-Message-State: AOAM530VbCaDLOF8VOnMghBeIJrMfEtnNMdr4IWuZUV2PkoINRwY8AwO
 JejLu1aiKQvuMM37XTVFKGQ=
X-Google-Smtp-Source: ABdhPJwUFvilVG25JkxnNxp/kfYGB+eNnwG8co332jw67Bl8KU4nmzXNwtzfrt0hT4O7hnV0von0wQ==
X-Received: by 2002:a2e:9e93:: with SMTP id f19mr52998335ljk.196.1636015118421; 
 Thu, 04 Nov 2021 01:38:38 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s3sm403337lfr.13.2021.11.04.01.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 01:38:38 -0700 (PDT)
Date: Thu, 4 Nov 2021 10:38:27 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Message-ID: <20211104103827.2cf48bb7@eldfell>
In-Reply-To: <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qb_O9J89kTOH9Qm=6+y9Tv_";
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Qb_O9J89kTOH9Qm=6+y9Tv_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Nov 2021 11:08:13 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-09-06 17:38, Uma Shankar wrote:
> > Existing LUT precision structure is having only 16 bit
> > precision. This is not enough for upcoming enhanced hardwares
> > and advance usecases like HDR processing. Hence added a new
> > structure with 32 bit precision values.
> >=20
> > This also defines a new structure to define color lut ranges,
> > along with related macro definitions and enums. This will help
> > describe multi segmented lut ranges in the hardware.
> >=20
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 90c55383f1ee..1079794c86c3 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -903,6 +903,64 @@ struct hdr_output_metadata {
> >  	};
> >  };
> > =20
> > +/*
> > + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
> > + * can be used for either purpose, but not simultaneously. To expose
> > + * modes that support gamma and degamma simultaneously the gamma mode
> > + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
> > + * ranges.
> > + */
> > +/* LUT is for gamma (after CTM) */
> > +#define DRM_MODE_LUT_GAMMA BIT(0)
> > +/* LUT is for degamma (before CTM) */
> > +#define DRM_MODE_LUT_DEGAMMA BIT(1)
> > +/* linearly interpolate between the points */
> > +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
> > +/*
> > + * the last value of the previous range is the
> > + * first value of the current range.
> > + */
> > +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
> > +/* the curve must be non-decreasing */
> > +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
> > +/* the curve is reflected across origin for negative inputs */
> > +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
> > +/* the same curve (red) is used for blue and green channels as well */
> > +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
> > +
> > +struct drm_color_lut_range {
> > +	/* DRM_MODE_LUT_* */
> > +	__u32 flags;
> > +	/* number of points on the curve */
> > +	__u16 count;
> > +	/* input/output bits per component */
> > +	__u8 input_bpc, output_bpc;
> > +	/* input start/end values */
> > +	__s32 start, end;
> > +	/* output min/max values */
> > +	__s32 min, max;
> > +};
> > +
> > +enum lut_type {
> > +	LUT_TYPE_DEGAMMA =3D 0,
> > +	LUT_TYPE_GAMMA =3D 1,
> > +};
> > +
> > +/*
> > + * Creating 64 bit palette entries for better data
> > + * precision. This will be required for HDR and
> > + * similar color processing usecases.
> > + */
> > +struct drm_color_lut_ext {
> > +	/*
> > +	 * Data is U32.32 fixed point format.
> > +	 */
> > +	__u64 red;
> > +	__u64 green;
> > +	__u64 blue;
> > +	__u64 reserved;
> > +}; =20
>=20
> I've been drawing out examples of drm_color_lut_range defined PWLs
> and understand a bit better what you and Ville are trying to accomplish
> with it. It actually makes a lot of sense and would allow for a generic
> way to populate different PWL definitions with a generic function.
>=20
> But I still have some key questions that either are not answered in these
> patch sets or that I somehow overlooked.
>=20
> Can you explain how the U32.32 fixed point format relates to the input_bpc
> and output_bpc in drm_color_lut_range, as we as to the pixel coming in fr=
om
> the framebuffer.
>=20
> E.g. if we have ARGB2101010 what happens to a 0x3ff red value (assuming a=
lpha
> is non-multiplied)?
>=20
> If the drm_color_lut_range segments are defined with input_bpc of 24 bpc =
will
> 0x3ff be zero-expanded to 24-bit? Is the 24 bpc an integer? I.e. would ou=
r 3xff
> be interpreted as 0x3ff << (24-10)?=20
>=20
> Assuming the output_bpc is 16 bpc and the programmed LUT makes this 1-to-=
1 would
> the output value be 0x3ff << (16-10)?
>=20
> On AMD HW the pipe-internal format is a custom floating point format. We =
could
> probably express that in terms of input/output_bpc and do the translation=
 in our
> driver between that and the internal floating point format, depending on =
the
> framebuffer format, but there is the added complication of the magnitude =
of the
> pixel data and correlating HDR with SDR planes.
>=20
> E.g. any SDR data would map from 0.0 to 1.0 floating point, while HDR con=
tent would
> map from 0.0 to some value larger than 1.0. I don't (yet) have a clear pi=
cture how
> to represent that with the drm_color_lut_range definition.


Hi Harry,

I think you just would not. Conceptually an SDR plane gets its very own
LUT that converts the FB [0.0, 1.0] range to any appropriate [a >=3D 0.0,
b <=3D 1.0] range in HDR. This is purely conceptual, in the terms of the
abstract KMS color pipeline, where [0.0, 1.0] is always the full
dynamic range at any point of the pipeline, meaning it is relative to
its placement in the pipeline. If you want to use values >1.0 in hw,
you can do so under the hood.

At least that is how I would imagine things. With LUTs in general, I
don't think I have ever seen LUT input domain being explicitly defined
to something else than [0.0, 1.0] relative to the elements in the LUT
where 0.0 maps exactly to the first element and 1.0 maps exactly to the
last element.

I'm of course open to other suggestions, but having values outside of
[0.0, 1.0] range in the abstract pipeline will always raise the
question: how do you feed those to the LUT next in the pipeline.

Yeah, I have no idea what it should mean if an FB has a format that
allows values beyond [0.0, 1.0].


Thanks,
pq


> If some of these questions should be obvious I apologize for being a bit =
dense,
> though it helps to make this accessible to the lowest common denominator
> to ensure not only the smartest devs can work with this.
>=20
> Harry
>=20
> > +
> >  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> >  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
> >  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
> >  =20
>=20


--Sig_/Qb_O9J89kTOH9Qm=6+y9Tv_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGDnAMACgkQI1/ltBGq
qqeHbA/9FiFxfGVmxxpzvXkcPI35jn7YcJTvba8VWsaI1dTDFlbnLAtMfBuEhpFc
4PPz7W0OzOzaH1Oquy30QrUnPNSL5I2BK/3yHMvLZLCzc3StlvCojLuvWiXNfc8R
ZlJIJZkTs3MdGzPdfRpOME9/zZufLdFCkPFV16CEqcVWHXCEXkExrVNXiPUQJj0V
4NO2MD5Y9q/tKIrDBGgbrUM+PuCU2YUXYN+GaUwFYEmurjc2tcGomYm2FsE3q3A7
867AoIQov0ZpzSbmD+c8WZcQRKOdca3DOoimda26FeonlB/eC1VC2yNgWZ8iKPoY
DdFL23TKOj+jlJ7WwjQgqCgZADZ1bSleL+iuP+e73lD39T/9OciJvJPGAcbS1Yf8
yU9mMlQLX/qJ5FiBZRiTQZIUdYZS01q8THKlB3eSgjelSCGldnzxfwEIEXcF1WOG
pR4PKYt7vuhuesqCe+Px91PmCb1FXDw+a+/tFlTNva/CJd/K6aeDL+SkPKVA8cFU
RgIze85TEsXpM9+h/w255b4MNOzgb/n1cvNpikePXgV7LzE4Z3r8o2jN+xY0WRHZ
7XrLMb2cFjt7eKNoQLsgL931Sp+IVamKnCmobELjefUmvvWijIfgFtpaG0o3sXpf
0HFlgWni7BVYmZC0z/P1iStyOEyXV0NOiF8bdrOC2boiBf9iTO0=
=HtZf
-----END PGP SIGNATURE-----

--Sig_/Qb_O9J89kTOH9Qm=6+y9Tv_--
