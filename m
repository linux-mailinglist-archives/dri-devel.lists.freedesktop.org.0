Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC293B18AC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2476E8AD;
	Wed, 23 Jun 2021 11:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA9F6E8AB;
 Wed, 23 Jun 2021 11:14:36 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u20so2416054ljl.13;
 Wed, 23 Jun 2021 04:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=sVCNkG1sjid0l6fkpvpwMveMxwqV4qVEQF+03S3gbMk=;
 b=Isyhss64Lo63ULrdcWdldg3vYy7t0wFmWBADC2lk5CeYqL/ia93o6sG6WtC0AoE99G
 nx2LRunRuYeLP4HcccRiXUeVeu0hI9A5xJ/KMd2sEIbZLqUmjq5JInhftZIJv+Sq/U1T
 K7uf8aAU8Yc96U+SqguGfHGLQ2frBV+qk0is0ra9ozBeYyms27veirfW4k3M7uA0t1gZ
 ufs2XYMgEqBNYThhmMRoqs/NnuYC2Pyn2u34ElQDSMY9gZqAQzlmXABtmlrvzIIUtUV4
 zxYLXbcjV5VSYqpACDmGzaev3ujPrYveGOAHF0n2CvlmbvL6t09teuefXabGuiSnw+Qn
 Xx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=sVCNkG1sjid0l6fkpvpwMveMxwqV4qVEQF+03S3gbMk=;
 b=pcbiPZPwGlFZfbZ7Bli9Qw0vmWpmAbr3z2f50DHBsKGqOePbydTCmU2MBxVpizCDD1
 d92IC9IrPd0wXF5ncJ+IFLxajrfsuiBh2XtlD9MCKqgAPMs3T6ce3e61lUC4TvJ2HzSy
 uw5PYIn8KbX+3PEOU1zSN5hUKtGTiTg4GhfpHm5DNIJ3efHcqbXu3grDdBiwCnlcUHLg
 ZKnq1dv5ky6lElexBj1smWDMAP3uQwGggS7CvJWsuqoUUVbJsSX4VAl+8M+lZJcsRkNY
 Oxxk7iw3cVUEKQw4Nr+YAg1v+2fYDXVyFFnQNVHjy6rSLWN4ldW4AiNWIy2QJZTDHpEX
 hLFA==
X-Gm-Message-State: AOAM532LzF3EGFS6k360Od5tcqJeNZlecn5SICnsff5aXYEagEerENn1
 Zty3nhGQbpRPfSRdrnTkHMs=
X-Google-Smtp-Source: ABdhPJwgFL6X5sNyB5lAj2pWReVokn5IciFDnMioc3JNGQrae8usHzOmGagfauGFAy/RJNs1/LbboA==
X-Received: by 2002:a2e:8584:: with SMTP id b4mr5964164lji.107.1624446874580; 
 Wed, 23 Jun 2021 04:14:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b14sm2508766lfb.149.2021.06.23.04.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 04:14:34 -0700 (PDT)
Date: Wed, 23 Jun 2021 14:14:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 09/17] drm/uAPI: Add "active color range" drm
 property as feedback for userspace
Message-ID: <20210623141423.3f6c3e9f@eldfell>
In-Reply-To: <5947f768-dd87-6b39-ecfc-b7c4aaa88aca@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-10-wse@tuxedocomputers.com>
 <20210622100042.4041624a@eldfell>
 <56d079d4-841a-0ca5-b8a6-d2c10f91d211@tuxedocomputers.com>
 <k_QeCRpur3SNNIspBiTHOTT6Oj1pSteEO3MzyQFUG0lSXmEqJUI2tMXJ6wR9chzUHGahdQApJZrUxdJvIv6s8aXr2DBdoHg-2PsGH4kEMyA=@emersion.fr>
 <20210623103256.01d680ba@eldfell>
 <5947f768-dd87-6b39-ecfc-b7c4aaa88aca@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gPEvcW1kQm+Ybq.N/v+Zg1q";
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gPEvcW1kQm+Ybq.N/v+Zg1q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jun 2021 12:17:40 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 23.06.21 um 09:32 schrieb Pekka Paalanen:
> > On Tue, 22 Jun 2021 11:48:52 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> > =20
> >> On Tuesday, June 22nd, 2021 at 11:50, Werner Sembach <wse@tuxedocomput=
ers.com> wrote:
> >> =20
> >>> Unknown is when no monitor is connected or is when the
> >>> connector/monitor is disabled.   =20
> >> I think the other connector props (link-status, non-desktop, etc) don't
> >> have a special "unset" value, and instead the value is set to a random
> >> enum entry. User-space should ignore the prop on these disconnected
> >> connectors anyways. =20
> > That sounds fine to me. =20
>=20
> Currently the only case for "not applicable" is when the monitor is
> disconnected, but sicne the properties are so interdependent, there
> might be a case in the future where e.g. a color format that has no
> differentiation between full and limited arises. When there is no
> special unset/not applicable option, the userspace has to know
> exactly when an option is valid or not, possible requiring additional
> logic.
>=20
> Setting a "not applicable" value allows userspace to be more dumb,
> without much hassle on the kernelspace side.

That's a good point too. So "not applicable" would be a value, but
"unknown" would not be.


Thanks,
pq

--Sig_/gPEvcW1kQm+Ybq.N/v+Zg1q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDTF48ACgkQI1/ltBGq
qqe5aBAAqjWygSQjmKD6D7wupf6+Ir2Pto1tmAW7ioCbPvk4RutUtuKzbT4WoBku
RtE2pHxKp2SiqKyo8rjRfgOR2gvDdOmfuKI5yfdKfPDZKhiyNIA2Wpyx9ntnFS+f
HGVdWVFTJh61TfNtqC0FQqvEASiRPC7mnu9GzLtb69DU/0Jdu+NlALsH2FIYo1lb
4+HpBXhq1sd3EsgqnWbnC8BquKmH0Whea27uEidyo0B1VdHdT+vDEJzc0juN7TSo
xs3us/rckFCEkhP0dASPe9ieWsYfUQIklQw1oKb/4WHHy0O9lyW5x0qABTbD34oF
jOy9byLTiWmXQuR9zLpiW24Qo6n58hRTQ2+10mFPif7j/brhobX/k1js+cO9sDRJ
+BkFsAJ0eU+cajpPi/lUGMgyTRPTT49yv1tjfzwsZihnH02Att+PtlXuCdmAei2/
6imtfO3ETUcbyqgbmOeqPkY4dXqY7bhRCt82KCmAf1Bx/gJz2rhrBOjwhwJbXTeF
NwcsWiFljcfSE118AJlkdHDGXnq+NaXNIqbfeOTYN0moUePis31A8+j78AEtFkAh
dapDvoirU08Z2MgQAElb3HfD9EZf+en8s7JvPn/VTCi7jxMVBUPqyzZf8pceQVwU
Vh7z8kFjqJKrRwBOSp6EpGnKYW244wCIc/24cUwx34e4MmOWmNc=
=r73d
-----END PGP SIGNATURE-----

--Sig_/gPEvcW1kQm+Ybq.N/v+Zg1q--
