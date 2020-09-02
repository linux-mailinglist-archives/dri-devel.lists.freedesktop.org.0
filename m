Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8938025A9D6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FCB6E463;
	Wed,  2 Sep 2020 11:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230706E463
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:02:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y17so2564783lfa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=TQ7QpY2AynaKC/NzAGom0uQVe973/8igtmH4MHMVo5A=;
 b=iNOmQaB/4Bu6P82TL1NxHnzuDO9y/jyFL1LRM9X8T9sESN1zfEURuG6dbt1ejlotCG
 1tgIjU7i8D9lM0KxzlLeAZTY2+icspOytDmXBCf3X5f2dPeHwbeQ5TGciAVFeM4wBnFb
 Pgurbup20Mcgr0QDdTGmuoZB8RroWkxy1M9XjiB8Hs5qdD7aFtJXUclGwOZtcrQq0wQq
 VqKV/4N+S2DRI9B4rTuV4LBo/p//hQPUJ0T2Tqq5ogVhX14Yo+OawX3BRFfRuqrt6ZuS
 7NlH5u/oC6+yQaZUVB7m9/ZWUk7qZIp1ov54fJzCl/MIEs1YwaP0IGmfkYit8rd0qBTI
 9qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=TQ7QpY2AynaKC/NzAGom0uQVe973/8igtmH4MHMVo5A=;
 b=n4gOURl/+MbqJOf8ycF9vouksdVUwtaEz4IRU1ifeOtgAQGCcQVBxxbYgG0CyDM1sK
 VJZkVdHemIcC2W8o5Cc3Zdw7JYu6B1BCcyoK4JteIWO3c5HTogvXJjvOvtUzw1v6R4Nt
 cCXaM26eKq0hOcdcrQWFk8voxDZncUZBKs0Eq9vsmIR5+Km2t43GGVyaMeDqVAuIti+H
 Br1DDiamLwIu5ntf4nAO8pNjlYVSB1Jk/wsRTnPNAUkoJzFmBJzkDKRTAq95C/jlsGoM
 ifFv66nV166r1c/AK7DHJKt+NfAap5TAx13+Q41LkuRsf4EzxdAJUqHoZ5Jhl7Cp2U6i
 HIRA==
X-Gm-Message-State: AOAM530HzcPi/z2GT76+0Wx8ZvIts3oEmQUS9ULnU/R4DECuVWp3PqRN
 A8VZeorAz+Af6M2pC4vs370=
X-Google-Smtp-Source: ABdhPJy6pjsH28Q6p8giD4p0ByMxWCFTr2s7n3xgHxcVrmVoQsS2cUtFn3H0oBaKvw0eEPZA6ejMRg==
X-Received: by 2002:a19:6b18:: with SMTP id d24mr3135166lfa.40.1599044568453; 
 Wed, 02 Sep 2020 04:02:48 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h11sm899532ljc.60.2020.09.02.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:02:48 -0700 (PDT)
Date: Wed, 2 Sep 2020 14:02:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required
 for fb
Message-ID: <20200902140238.51089b99@eldfell>
In-Reply-To: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Marek =?UTF-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Juston Li <juston.li@intel.com>, Daniel Stone <daniels@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1846989561=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1846989561==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9NRslKyTrGp=LVqo+NZK8AG"; protocol="application/pgp-signature"

--Sig_/9NRslKyTrGp=LVqo+NZK8AG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  2 Sep 2020 12:24:40 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Even for legacy userspace, since otherwise GETFB2 is broken and if you
> switch between modifier-less and modifier-aware compositors, smooth
> transitions break.
>=20
> Also it's just best practice to make sure modifiers are invariant for
> a given drm_fb, and that a modifier-aware kms drivers only has one
> place to store them, ignoring any old implicit bo flags or whatever
> else might float around.
>=20
> Motivated by some irc discussion with Bas about amdgpu modifier
> support.
>=20
> Fixes: 455e00f1412f ("drm: Add getfb2 ioctl")
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Juston Li <juston.li@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>
> Cc: "Wentland, Harry" <harry.wentland@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  include/drm/drm_mode_config.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index a18f73eb3cf6..5ffbb4ed5b35 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -58,6 +58,12 @@ struct drm_mode_config_funcs {
>  	 * actual modifier used if the request doesn't have it specified,
>  	 * ie. when (@mode_cmd->flags & DRM_MODE_FB_MODIFIERS) =3D=3D 0.
>  	 *
> +	 * IMPORTANT: These implied modifiers for legacy userspace must be
> +	 * stored in struct &drm_framebuffer, including all relevant metadata
> +	 * like &drm_framebuffer.pitches and &drm_framebuffer.offsets if the
> +	 * modifier enables additional planes beyond the fourcc pixel format
> +	 * code. This is required by the GETFB2 ioctl.
> +	 *
>  	 * If the parameters are deemed valid and the backing storage objects in
>  	 * the underlying memory manager all exist, then the driver allocates
>  	 * a new &drm_framebuffer structure, subclassed to contain
> @@ -915,6 +921,13 @@ struct drm_mode_config {
>  	 * @allow_fb_modifiers:
>  	 *
>  	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
> +	 *
> +	 * IMPORTANT:
> +	 *
> +	 * If this is set the driver must fill out the full implicit modifier
> +	 * information in their &drm_mode_config_funcs.fb_create hook for legacy
> +	 * userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
> +	 * broken for modifier aware userspace.
>  	 */
>  	bool allow_fb_modifiers;
> =20

Hi,

are there any drivers that would infer this information at
modeset/pageflip/atomic ioctl time instead of AddFB/AddFB2 time?

Userspace may be creating the FB once per buffer and keep re-using
that over several render/display cycles. If a driver was changing the
"effective modifiers" dynamically, userspace could break.


Thanks,
pq

--Sig_/9NRslKyTrGp=LVqo+NZK8AG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9Pe84ACgkQI1/ltBGq
qqfmTRAAp9EH7OaW9+j42DcTNejrKKE3UvXa1XIEi9IWw7qqO29JyRb4caHdcrms
qdWpYB+kG5mzApUBapMkyEnzh0PzUbIHzY4z9RDE16jYkG33ZKd/rWp5q87A0z5b
75/Ily7UmGMnr+o+pc0dUmEXc32luh2/VRX05rXKtRM5VD6qMANwVezU8dqp+ttf
zROViIgqXG6OVwpQwFN3ddbT9rysXbbHCe0B0GrydjwhNwxp5WfKaL+GL49DP1j+
9ZMZOapjXaK9N6r2itZpvwp78AC9EPdFuc/WwcO6ZIC2CTXruywEKW5Q9En0e5O7
uUVzYtHJpaRXR0uPGkHTz/0ENd9PJ6BIuLYr+4vUK41A8ebI+9e8mKMdpw5KS1EV
DN9RjWqNmYG0xJR2JWvHlNhzndUuKX+43VTl/b0j6EpX06ZHns6qUlTGdf5+Jr0p
xFiO/rVCpoUl7Rqdw1183vWO/v5r1PKa0+eDZK5G8UCmUaw1Qklj52CetjKRXS7r
4adZnDaAWXGwG+MXA1DeHeii1NitMdGr4IimAJf5KqWy/sKip5RY8fLiqu3wBzhs
FS1zG4ae9IZSvQg8y53jzOqQTzUUt4HAlzrU3TGpLCWJTnQFNm1ujvlOHBPA2Etr
430lvsKmG9i56Kg1vNgGjgHNivcPho8VTUtvvMI0VDKz+ja8Dfo=
=ypGd
-----END PGP SIGNATURE-----

--Sig_/9NRslKyTrGp=LVqo+NZK8AG--

--===============1846989561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1846989561==--
