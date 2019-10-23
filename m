Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62140E1333
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 09:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691A6E97D;
	Wed, 23 Oct 2019 07:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5A6E97B;
 Wed, 23 Oct 2019 07:34:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y127so15222324lfc.0;
 Wed, 23 Oct 2019 00:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2uqZjkBzuw4+/o0y2AVTI7MhPJ8t5LI2JQ2vi8QfGgA=;
 b=qEZyq0hEcHAFFZxO1REyo+Nyb7vR+R+k2hQ9AG7N1l2N/F0RAZBi6dJ0ktvDOSZ0YY
 4T+8/Ah1ZmpWc7bjmG7R+dzsa7HTOoV+U07zW8xnEX5Mdk4IPU4+35O9uwJ3HW2sr8la
 H+z10U27Zxbqxq5x/TuLiFuHQw485aImo34s28lJ5u/jg1YZGu7R8n2k6DCAhLXBnE8m
 o6eoU4qFAWH7IonbNJ301QcBnjffB6fzE7yqU77WDdXwXfE1kA45FlwPWWoj9cD6Zf2B
 ljCi2QbECRLNf1pW/SeoM8XbJRf93/m4aXEXYTLKtrHBTQ9NYhfcUEKmKDh0ihvRyNeb
 /tSg==
X-Gm-Message-State: APjAAAWjwPKgzIwWj/sCYW0uYNqFRh+EPdA9N93p9kls+R2phWTpqMDS
 7voiY9x63kpchAia79dtH9k=
X-Google-Smtp-Source: APXvYqxT30DXxrnxy0Sf+B0F+7d7yTPzqhCa0bjzr7lAzZT05Y1GLlxrkLV1xmJUBOYaaD3V7vUtfg==
X-Received: by 2002:a19:ac01:: with SMTP id g1mr21420504lfc.141.1571816055124; 
 Wed, 23 Oct 2019 00:34:15 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e2sm640783lfc.2.2019.10.23.00.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 00:34:14 -0700 (PDT)
Date: Wed, 23 Oct 2019 10:34:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Sharma, Shashank" <shashank.sharma@intel.com>
Subject: Re: [PATCH 1/3] drm: Introduce scaling filter mode property
Message-ID: <20191023103405.3815a311@eldfell.localdomain>
In-Reply-To: <2f6668c0-ea32-2028-165c-a1b89893dc2a@intel.com>
References: <20191022095946.29354-1-shashank.sharma@intel.com>
 <20191022095946.29354-2-shashank.sharma@intel.com>
 <20191022122034.GJ1208@intel.com>
 <2f6668c0-ea32-2028-165c-a1b89893dc2a@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=2uqZjkBzuw4+/o0y2AVTI7MhPJ8t5LI2JQ2vi8QfGgA=;
 b=R7KwN9WeJZhdoz36SJ1MMaFaKCKhokjDj8X2FtPVqiN6PglEgzdhVleVPRxh6ByeW3
 L5XRu+OiF/jRzes+PfvdjBtYrw0v6MDriL9Q4Im036GGasoUQ5MBWf0+6izHgzG0PrcW
 LsUBBNIM+AHl4ghfqHQgkAgVlQckX4LFigipSHjWGDD7DlEOTUROQ28pHDY0xDIoU1RC
 qMxCJuErnP8gTm/5HUrYCxylt4Asr/A3ufUrcVZMcHKCS4gYn5C+TN2ePNO8AkSBARJv
 vR6K+62D1ZfLN2KKSc1zYRxplHR6lnSS4qClAahtxmxgESTIa31O6UrDxqpkP6x7zaN6
 bs7w==
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0295063614=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0295063614==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ztLmTX5EpB=3FoV4D4yv=h9"; protocol="application/pgp-signature"

--Sig_/ztLmTX5EpB=3FoV4D4yv=h9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Oct 2019 20:48:02 +0530
"Sharma, Shashank" <shashank.sharma@intel.com> wrote:

> Hello Ville,
>=20
> Thanks for the comments, mine inline.
>=20
>=20
> On 10/22/2019 5:50 PM, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Tue, Oct 22, 2019 at 03:29:44PM +0530, Shashank Sharma wrote: =20
> >> This patch adds a scaling filter mode porperty
> >> to allow:
> >> - A driver/HW to showcase it's scaling filter capabilities.
> >> - A userspace to pick a desired effect while scaling.
> >>
> >> This option will be particularly useful in the scenarios where
> >> Integer mode scaling is possible, and a UI client wants to pick
> >> filters like Nearest-neighbor applied for non-blurry outputs.
> >>
> >> There was a RFC patch series published, to discus the request to enable
> >> Integer mode scaling by some of the gaming communities, which can be
> >> found here:
> >> https://patchwork.freedesktop.org/series/66175/
> >>
> >> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> >> ---
> >>   drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
> >>   include/drm/drm_crtc.h            | 26 ++++++++++++++++++++++++++
> >>   include/drm/drm_mode_config.h     |  6 ++++++
> >>   3 files changed, 36 insertions(+)

...

> >> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> >> index 5e9b15a0e8c5..94c5509474a8 100644
> >> --- a/include/drm/drm_crtc.h
> >> +++ b/include/drm/drm_crtc.h
> >> @@ -58,6 +58,25 @@ struct device_node;
> >>   struct dma_fence;
> >>   struct edid;
> >>  =20
> >> +enum drm_scaling_filters {
> >> +	DRM_SCALING_FILTER_DEFAULT,
> >> +	DRM_SCALING_FILTER_MEDIUM,
> >> +	DRM_SCALING_FILTER_BILINEAR,
> >> +	DRM_SCALING_FILTER_NN, =20
> > Please use real words. =20
> Yes, I saw that coming. It was getting difficult with the 80 char stuff,=
=20
> it was even more difficult while using it :). But let me see how better=20
> can I do here.
> >> +	DRM_SCALING_FILTER_NN_IS_ONLY, =20
> > Not a big fan of this. I'd just add the explicit nearest filter
> > and leave the decision whether to use it to userspace. =20
> Agree, that's also one option. I was thinking to make it convenient for=20
> userspace,=C2=A0 For example if a compositor just want to checkout NN onl=
y=20
> when its beneficial (like old gaming scenarios) but doesn't have enough=20
> information (or intent), it can leave it to kernel too. But I agree,=20
> this can cause corner cases. Let's discuss and see if we need it at all,=
=20
> as you mentioned.

Hi,

how could the kernel have more information or knowledge of intent than
a display server? I cannot see how, because everything the kernel gets
comes through the display server.

I agree with Ville here.


Thanks,
pq

--Sig_/ztLmTX5EpB=3FoV4D4yv=h9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2wAm0ACgkQI1/ltBGq
qqe+qw//QxdazE2Ikh9/ETm6+qbPFpeLqbmf54X/CFi/1wfhxz94ZRb35qrnrFZj
vsmkvE7LaBJm8WlwZ/EfHAl6NzCAoh/goHPIAeod3ETbiXy7+eA6VryhszseX1ay
QUm33F4AV4WGd2PbpKh8WE5zZWGzpxw/98RMybFaug2OJN58juPM1XPqe6f3BQ9J
RZyxOZEGCjKiPyujmGzNbOwZkF6t2waUgD2PGxVUrTiNoAmUyAJAPSIqYPRPoNBK
NRksNADFWCzXz06zmIHQpbVijHGXm+uZof9PKbVWJCtGIT2kbqE54UCdORTPogG9
rsOFuRuoezyWCc73j90RMgiR/y3Yaa1OL4kyOoUVMsKq9BxlDpdkIWjE9Mc5LV3G
tF+kmAaKwQoLOlCSlmYrJMI8SSy89QK/MNGcs9DZK/WldXghIlMyqOMWamcD2cw0
u5jmTo5m3IEUqr7tk886zKmPI+JgVr4JLOpoe2z0Q4surw6mbzRGM+Uw6zhkvu+9
2N2P2sQ7P4x/ZUEiH0+lk58xAJnWi6jUZCil/D1+iXr4mbAS/3SFWNsB+YXsHOCy
9fD2WI8nWL5IB4F5Oa7WD8awsA6z7Cv15UoR399V1qd6Ur212zpbgNHPSk01jelw
IMwgukaKECCSvCjGxEjzZbK6hosjIilrRxLCo8Hkqq3EqFgkKJQ=
=fHcr
-----END PGP SIGNATURE-----

--Sig_/ztLmTX5EpB=3FoV4D4yv=h9--

--===============0295063614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0295063614==--
