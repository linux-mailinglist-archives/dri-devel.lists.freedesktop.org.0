Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33656B0296
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB6310E5E6;
	Wed,  8 Mar 2023 09:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7B410E5C7;
 Wed,  8 Mar 2023 09:15:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id g17so20463336lfv.4;
 Wed, 08 Mar 2023 01:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678266916;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=AwKRPT4TXKEm82H2u2CV6fnnoU6b+DAtqngrDF+0Ppk=;
 b=is1heQ8IMeQrr1uPon5P5YBt2V7N2lY/FY9yEEysHFBenytLzkC8LWDdCy7qrF2Kkf
 +9soc3VAYN+ty10b7yk86IUFulApk/YcH//xs31KCOKzCzZ/1w2rfGvXR7dyPwD8VgH8
 7GoSt3+4aY3yqU8K7GQegRmvuw1TwNtHiQUcG7khWgEenABUWDYKyOyBnf+p5FWNxH1S
 gfBOhL5SWxYUpYvTKOz/7lnSCC9qmMH3XMdfgztTJ4hSkVXRY2dh5I0LjxuVgmoQJj3X
 H/QE/KkAucoJDHH1Zzb9OuTBj4A7CWn9sszaCZZ/jOw9drqPOQ0zxaEwhYcCYIKVmhWQ
 Geeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678266916;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwKRPT4TXKEm82H2u2CV6fnnoU6b+DAtqngrDF+0Ppk=;
 b=RIZstiUIszB9eAdonP4laVkSAruaYbzH/hcoic03Xgq29RM/tEAwxKY3WD20C+c+52
 GY+hp5HdjwPKOZyyv8gPkZr5CLgGS79bVDXi6evLZaOdNINASOJj37kQcxZJqD1i0lPe
 Rphp2VXD2fU72RVATiF1ZM/tbJjYYxPTaelngOVqXKgc2YkhEaXSUnA6yaL9iyEz0NyW
 22CxAuBDGkUk4oPvwGLNcfspGtOLpyYauZd6uuFaJiTTsFoG7fK1sGr3TMaQUVff5JPX
 a/n9wU9vHyhBqMCzUur+VVpnriRco8Iw+GR+3Mfd/St0hlVTXtyEEahdf/EWMaSkilE6
 htAA==
X-Gm-Message-State: AO0yUKWJxf4ZBNDCn5DkRbdYOGc3MX5lldo1G0yCApmGv/tp0R9C5N7q
 Hv4G4dJQ8HPOuD/HGX1o05c=
X-Google-Smtp-Source: AK7set8UMMbpZQhVUL4gBig67f5Ovu3wsRQl3STnjmewYgqPoiDfIN7Ow6DnXdXfu9c3vt2stUZoWQ==
X-Received: by 2002:a19:f00e:0:b0:4db:1b30:e634 with SMTP id
 p14-20020a19f00e000000b004db1b30e634mr4372635lfc.65.1678266915771; 
 Wed, 08 Mar 2023 01:15:15 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s9-20020ac25fa9000000b004dc807b904bsm2272367lfe.120.2023.03.08.01.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:15:15 -0800 (PST)
Date: Wed, 8 Mar 2023 11:15:11 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 05/17] drm/connector: Use common colorspace_names array
Message-ID: <20230308111511.175c9cf6@eldfell>
In-Reply-To: <20230307151107.49649-6-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-6-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QoPo.N4v9WVhK3k+SzJHvRt";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QoPo.N4v9WVhK3k+SzJHvRt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:10:55 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> We an use bitfields to track the support ones for HDMI
> and DP. This allows us to print colorspaces in a consistent
> manner without needing to know whether we're dealing with
> DP or HDMI.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_connector.c | 131 +++++++++++++++++++-------------
>  include/drm/drm_connector.h     |   1 +
>  2 files changed, 78 insertions(+), 54 deletions(-)
>=20

...

> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3e2e1bc7aa04..46c064d9ffef 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -460,6 +460,7 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	=3D 13,
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	=3D 14,
>  	DRM_MODE_COLORIMETRY_BT601_YCC		=3D 15,
> +	DRM_MODE_COLORIMETRY_MAX

Maybe a comment to say that MAX is not a valid value?
Given that things like iccMAX exist (even though it makes no sense as a
colorspace), MAX could perhaps be confused with something.

Or call it DRM_MODE_COLORIMETRY__COUNT? or __END?


Thanks,
pq

--Sig_/QoPo.N4v9WVhK3k+SzJHvRt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIUh8ACgkQI1/ltBGq
qqcI6w/9Hih4Wlnhy4mxeri05lkao3cZn415K1D9ZGnx3l5HcHVOTJW5mMUo4NCD
cMa5mkbDcixRYHg1Tvk486fWIiVt92wIQbERvf7M3MeiZXtLdB7q6Fg/v4lD0A8k
SbVoygJ1Tu2+XfHhYfC8zIImRZ5M/BLdyIYi38uae2rhOsmG6kERutSDOeLY+tsg
VIE06TLAJWw7xoshIj0Nx1richQll2VtE4f5zTQm0QIoKIQ12nh+8ffJ3s4MLo/L
ZragC0zHwLCTL5UVFeqD5KcLs40Z9Agwous7sgq3P6uS6Lmt+SD9jxRo/fxzFrx3
pAAYeZiPwXgywAtD7ZB5GmfRsQwLygfjFAqvm3RcUA6dlQFeXnmigcmPycIrXjTW
yhLJjc6/2B6yfvw4dMEQ37QxTm0Hivbj4RDqB540NWnTu5V9MX8Pl+3wEJawxucM
lkKha4rTT07PXFJFJtLmIdCiEs9ial3Xn56pnoCgGi9ldLLH4ZyXpC8KYiXzV/Yf
07FXpY6ZM4OL1P5GlIa3iK/pv0mHsQsadi6qOIXAIazPnObz1Oj4sqvYY+dhHJ9M
06mO0DN1RxFGNGwRLlnPOXyyUx2/DkB7SwmyL8kWF14BOeeB1plY1sePDTL35NMr
Ldi2VtNS63BrLDNMrr+0euWucJAChYxaMzthB0jwwUi5gl7ejhI=
=y34t
-----END PGP SIGNATURE-----

--Sig_/QoPo.N4v9WVhK3k+SzJHvRt--
