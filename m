Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8918421F81
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864EB6E311;
	Tue,  5 Oct 2021 07:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F2D6E311
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 07:36:47 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i4so83083121lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 00:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=l4Eh9Fm6CEeY1/F9UGGeiDfd5DLo9FGWzjI2IQ9cYbE=;
 b=jGhetJark1c29/cNoqJHOAOsjdPxB1AJTwC+FWk3zWfdsXUUcu4NCee7ZLdlHcRigz
 IP7zd5K0fmYzzPMTFUri2AjIr/YEQYh17XUCUxuFuD47MGwhRn96EmPzI2UaYpozXtWW
 Vzsk5uaMNP3njjKTsDbeskIWRxGrmcoDnxcVEc7H2K2iv/FmcKTjxUbaQM64CGgmrTtP
 hK6Nze6rNCMvonjssNmpQxSAiMyvWeKDl0y3BeJpJQjfuNJOssyLQfhLZeuyK7IbaGh7
 GhDDQjQBMQglQRThBCjQE9gcP4RaroxWzWiS3kOpOCg2tKcBuLpv8IByLdnQ+HsUxwvo
 9G4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=l4Eh9Fm6CEeY1/F9UGGeiDfd5DLo9FGWzjI2IQ9cYbE=;
 b=Tj9fqxWwRLgwvPkkQgDGhxzzzvx0ohSAgbjopcMQj3rqN8+ulYS6sgE79DowotPq8X
 sByh1A3yrjmRG7nUVFwcyzdpZGl7rtpbiqrsiMZaQisjjDooCi3LkU2lzIALVCXFOfL5
 9g+DJr2GU7PGwYhakcX9rcRhqlCXhkCjYvMqC4BSOYKY1YfBM7YJqCF/YOozV+qIphEs
 PntfSHtl5MzmimseZcNN+nKe0a/eu6kMtoaF9nUmTgkk6w/JrbP7jX7pHVlynkQMZdcw
 ZBYOnHdLA/wUz0kjB4SJiVfLe1DAIsiQrjy1vIJZr7RgzOZpPcQwNMqHRqzIncSQc5V2
 Lqqg==
X-Gm-Message-State: AOAM533YHZ17MnHH3mWmd5CYMQlO8SxwU1yx0pEC8/OXrfbdGvHdoMI9
 o2+ler2Wt4MHCpnMGd4y+Ko=
X-Google-Smtp-Source: ABdhPJwy9jnQcjBQmf7MARrTrNtWZv29xiNvOtxwEkf5IExLBDUJHjqSQw7olObVdYxcnFscEize3w==
X-Received: by 2002:a05:6512:32a9:: with SMTP id
 q9mr1815719lfe.58.1633419405663; 
 Tue, 05 Oct 2021 00:36:45 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v3sm1745736lfr.295.2021.10.05.00.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 00:36:45 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:36:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Emmanuel Gil Peyrot
 <linkmauve@linkmauve.fr>, Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/connector: refer to CTA-861-G in the "content type"
 prop docs
Message-ID: <20211005103636.2262e889@eldfell>
In-Reply-To: <20211004091236.82010-1-contact@emersion.fr>
References: <20211004091236.82010-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_2U97tdo2P+U.QBtga02_zt";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_2U97tdo2P+U.QBtga02_zt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 04 Oct 2021 09:12:50 +0000
Simon Ser <contact@emersion.fr> wrote:

> The KMS documentation doesn't say much about the meaning of each
> content type. Add a reference to the specification defining them.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 3bc782b630b9..79d8163686cd 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1397,6 +1397,8 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_=
property);
>   *	Game:
>   *		Content type is game
>   *
> + *	The meaning of each content type is defined in CTA-861-G table 15.
> + *
>   *	Drivers can set up this property by calling
>   *	drm_connector_attach_content_type_property(). Decoding to
>   *	infoframe values is done through drm_hdmi_avi_infoframe_content_type(=
).

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks!
pq

--Sig_/_2U97tdo2P+U.QBtga02_zt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFcAIQACgkQI1/ltBGq
qqdLRRAAgRBqqV0qypvkX1FSAdOROFBqx09se//zJM2LAyZ5E9HlfgmMpAxw6aXE
wqYeU/LLsLV2yGDsNdvHIvyW2ZwZyUlt3IDm7qdd9Xn5luaDoYptQrUVH3rPuO5t
YVJla0dWIoBNuQ05ClwM8QBpYJbjp3dDJ9pWXTJJEg+UTDJQlnwf0NgoFOBgaZbg
arNRN9yMonqoZCYxPlWowrS7DUl5Hhg2oWYLE2K80NWblpfNoYoJDYU+rBJ3DWLe
MLLjY74NK1JksHu7hq8ylrYLmID1klqp5GawoqPZJFmZfYLCJcbm5+umKy/8/MLm
+P4k1gM8WEa79rY0P1kC4bOA8u+uIeJcoE3IXv2pkH9rlp2J3TjtUZ6rewc9Ce61
LMByJdytAxsBFs2R42AelaDHmmNBrvRzf1ONg09fVGbztB0OWoe91+F1SUjG6+LG
gjgeT2IBWS3i14ilbBxGLSGeVKilsiAbm1whOpWj70YnrKS7g7jz3hXK1LGBA3cS
pTDWD+ExRvMFB3UkFGS4aoM516gldarYKzzIEDMkhVEVVHvS4zcPs0O6f7BLt7PN
nYDVltvcZTb5bE/9tvkfiyn0dS2IiEMOAWd4iJbR1FDlNgzwZPkAZF3sPQGBVVpE
tz/+C2HpvFOSnkG3yUG9QIxQhp5Ee3qbYtKuP5kRvFhEapqKQjg=
=P7NH
-----END PGP SIGNATURE-----

--Sig_/_2U97tdo2P+U.QBtga02_zt--
