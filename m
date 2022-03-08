Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6160B4D1353
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3D110E204;
	Tue,  8 Mar 2022 09:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38A410E204
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:30:01 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w27so31087782lfa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ga9S2XkZFL0z/IdGKvGm1bT0IfoZFxwQdK6AxGAbNLI=;
 b=qD6NE5nq1xDdKVAWbwSDI9N7F8NF77L+pqiX64EWLJKoj33zBwoMrCMhg1Lv8iCDLU
 aujqIoLD1KG2tmDZ08ZGjIcS57GU+4OTLbFV53a83wRqmkjLJz4xzNy4Z5rWXJ6nVFJA
 iBCo+ctpar8xjLjVz/g++Az/55YsjElT5Mk1LR5xPIZsOA0B3/x7OXZudJRNq0XxZETm
 VyDkF7x3G8bqcbqS/P26ir8BzirQWMn4Wo/Am7nTZJyv3N5/y57AiqMvVQNmok5QLCVy
 lQGXFUnEyqdOa+om4/NbrYoyXIj8bPHVSonPbsFWFaOUviYLWDaXK64fEabQyaykZiSS
 qIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ga9S2XkZFL0z/IdGKvGm1bT0IfoZFxwQdK6AxGAbNLI=;
 b=oo/TE+e9UkcFY35hOwI3E3v+WPnCT9tyfK+tsfkPvzPYGFzJT3UGRLTUXeqnHqQb3x
 iuhUHf2T/hogSQFW74NXSUnCTwVXebFrk0r5D318i7DgPQTkSppM842jx4sOWxngp41T
 xN65XyRsXSZRtZb08cWvTYJoeoZJv+nEUZBDRcRnEzXJISza/GUJ1NuwqTFKVXHi4Q35
 BsDGtDat5b33MYOg3nGg2nA9GsKo0nlfAdFjRff+YhH40/XP+U0+8gSmjtIwl49qNyGN
 hxoATG9sauzlIqtYFbzjHFJA0AZfMayIKlF1/TuQ//L59b5G0kKIlhFfrysJA9kJHqEV
 HEDQ==
X-Gm-Message-State: AOAM532+ZUqLfKF09tnmLX2iABMGnT2UG8geCONSpxKn+B1W+gcnriam
 F8Yi9CpmL75VxUCul2ffsW4=
X-Google-Smtp-Source: ABdhPJw6tvyjhN2yXMNWbZmDziUTnUGlD4E0wPEKKO1S/V5OqiTMiqFNJ71OVhp4onpYyostFcFXgg==
X-Received: by 2002:a05:6512:228b:b0:448:246d:97d with SMTP id
 f11-20020a056512228b00b00448246d097dmr9270131lfu.94.1646731799953; 
 Tue, 08 Mar 2022 01:29:59 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 i6-20020a198c46000000b0044424910c94sm3376017lfj.113.2022.03.08.01.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:29:59 -0800 (PST)
Date: Tue, 8 Mar 2022 11:29:56 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFC libdrm 2/2] util: Fix 32 bpp patterns on big-endian
Message-ID: <20220308112956.73598e53@eldfell>
In-Reply-To: <1be5820fe86d6940aab8acd52a522d39a35995c3.1646684158.git.geert@linux-m68k.org>
References: <cover.1646684158.git.geert@linux-m68k.org>
 <1be5820fe86d6940aab8acd52a522d39a35995c3.1646684158.git.geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s9LE=MLSN/epi5g8OW.516d";
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/s9LE=MLSN/epi5g8OW.516d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  7 Mar 2022 21:53:42 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> DRM formats are defined to be little-endian, unless the
> DRM_FORMAT_BIG_ENDIAN flag is set.  Hence writes of multi-byte pixel
> values need to take endianness into account.
>=20
> Introduce a cpu_to_le32() helper to convert 32-bit values from
> CPU-endian to little-endian, and use them in the various pattern fill
> functions for 32-bit formats.

Hi Geert,

FWIW, this explanation matches my understanding, so it sounds correct
to me. That's all I can say. I guess that means

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

?


Thanks,
pq

>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Works now with Linux' drm_fb_xrgb8888_to_rgb332_line(), which uses
> le32_to_cpu() to read pixel values from memory.
>=20
> ---
>  tests/util/pattern.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> index 42d75d700700dc3d..48677ea6d25b2676 100644
> --- a/tests/util/pattern.c
> +++ b/tests/util/pattern.c
> @@ -61,6 +61,18 @@ struct color_yuv {
>  	  .u =3D MAKE_YUV_601_U(r, g, b), \
>  	  .v =3D MAKE_YUV_601_V(r, g, b) }
> =20
> +#if defined(__BIG_ENDIAN__) || defined(__sparc__) || defined(__mc68000__=
) || defined(__MIPSEB__)
> +static inline uint32_t cpu_to_le32(uint32_t x)
> +{
> +	return ((x & 0x000000ffU) << 24) |
> +	       ((x & 0x0000ff00U) <<  8) |
> +	       ((x & 0x00ff0000U) >>  8) |
> +	       ((x & 0xff000000U) >> 24);
> +}
> +#else
> +#define cpu_to_le32(x)	(x)
> +#endif


--Sig_/s9LE=MLSN/epi5g8OW.516d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmInIhQACgkQI1/ltBGq
qqesnQ/+PJ0AbdwL6Pa88PL1CNGPbO77spmrf/5fy8iSK5g1I+QAcRbgi9wd+8yv
JkCEYlpXaFFWO1idOoPsBna/bJ3mRaQV0qk1niWYyKpBdJ/TKCEqnuAaRS5yutDu
wIbqStqUDLsHFl+IJqUwse/1/mZnHqfdDFej0e2z0Gruh8WIw20+2MCirBHuGNBy
wtoK26DeM/R/wKyhCwgrTx7nNm8F43PbDKHFxhsejLFhNltWxmuu8erBhfRpg8o8
wAjdDfsu8YSdtgvTKq0E4NGjWNkaFbxduME3aiOZn6Va8ye1ScRA3U8XCSor0ZSi
F/1lWu8Hfk93XM6WJ62YoVmurs2mvIh8B2I4fMuJ+927NHO4RrQ2pb9Qsj+3u7YN
rJ7fl317yXmqez9NvcRzt6ycBijDm74LcdfTfE+dgTNgT5Ntd6KtapiGEyihK7dW
RcUgu6RZ7Ap+a2JU5NExPlA062EdU+K6SfGl8n3WLBCa6p41wTFehEl5rN8mjNGp
iQg9FSppJnVxwMyu1cu7qSqz/xYw4JCWrkF1M2iEmS8Al8br0y7k/Tyb+puqcdnm
6QRyL0UsGWNYH+xe5Zu7gLxHN0cS0DbtFTXxCbhMj6rHfEDOQkWCSaBAjCDtpXd1
ExdkCO32YSuwtN24qQtTfpNWUuqJ188eZoBQKhl8aq3piUMJl94=
=JnlO
-----END PGP SIGNATURE-----

--Sig_/s9LE=MLSN/epi5g8OW.516d--
