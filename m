Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4451CEE85
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26FD6E027;
	Tue, 12 May 2020 07:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CA56E027
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:49:28 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a4so9720252lfh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=IWCaPf4XEJsTe17+39kkGomj/u955j82TEa3UFeM2y8=;
 b=pvpwenIQpYfv7+V1v0kCV3oqwcpTQCNLauhxaCf1ApRakeDyEDRJ+fkppDdazX1bFS
 uGnq/DZwKoG+XOYAXMAkJm+jSGtvgD4aLvHnJZCtsA75yUqR57p/aa17K4FtiOWxa6em
 t69moDdaiBkWt/ROIJH1z1mjcWdm28Xc+KJJfH6Y0NQnL0AOf6xpzBEXVXh8Sbvryw/J
 AFeROh5xRVG/lRYdHz8FBAatbwEiRYLCcPQrUiG2g7MPD1wVr3LTfM0AEZEr+mJS0mju
 ovSH0sLMq6hRGvW+P10v/X2nQ8RXimIITtzS7BOwhDfIkXlG/O909ujgOYqusT8iWLpg
 +nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=IWCaPf4XEJsTe17+39kkGomj/u955j82TEa3UFeM2y8=;
 b=DfxDcpOxH+yP/XGrIvB3WfICida1uLwSWuj6i8R3nGvIqrfTjLWxImNNjjvpbNMkkG
 q2aUR5fs/gTX9UHXBEdl40QTn3fQBWlpky9/7n8BMzb3UtHIDdefa0AUYax/tXf2M5cw
 TK+A0ilaVPZxU6bhCXL9A+PhVe/pe3yBl1aOBY/8VFCabshyWs26MIFGiutApAhACJYO
 DFKqwWDst3imN662/BC6k4vqc3+vehsX1+GS5vQ2vDAIRUij8MTH2ENgbB9+IT8Rd3gM
 oVWOZ+YnmACM2W8dE4UyDNmsuUq7bVfEFgRHTpV68bfq5hyXimMVLY0z0eDPxzEvNwZt
 nJsQ==
X-Gm-Message-State: AOAM530Cxe9WSXpEOI9Z71No40gZIl2Mwbfqm7HhfmHMXCgnJrEV2opg
 wUWd+zUqxc1Os869tneeuTg=
X-Google-Smtp-Source: ABdhPJwhD/2+auVwlY+1BhylovFjxSUzdCSvHSmm/cI7QgT6+nOlY2UagC1VIpfJHUea7cF986P5pg==
X-Received: by 2002:ac2:4da1:: with SMTP id h1mr13361254lfe.152.1589269766301; 
 Tue, 12 May 2020 00:49:26 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j9sm14177115lfe.24.2020.05.12.00.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:49:25 -0700 (PDT)
Date: Tue, 12 May 2020 10:49:12 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v2] drm/connector: Add support for privacy-screen
 properties (v2)
Message-ID: <20200512104912.419270ff@eldfell.localdomain>
In-Reply-To: <20200511174724.21512-2-hdegoede@redhat.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <20200511174724.21512-2-hdegoede@redhat.com>
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jared Dominguez <jaredz@redhat.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============1017470190=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1017470190==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nI6z5hVMcIPSqlRupCx5ms0"; protocol="application/pgp-signature"

--Sig_/nI6z5hVMcIPSqlRupCx5ms0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 11 May 2020 19:47:24 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> From: Rajat Jain <rajatja@google.com>
>=20
> Add support for generic electronic privacy screen properties, that
> can be added by systems that have an integrated EPS.
>=20
> Changes in v2 (Hans de Goede)
> - Create 2 properties, "privacy-screen sw-state" and
>   "privacy-screen hw-state", to deal with devices where the OS might be
>   locked out of making state changes
> - Write kerneldoc explaining how the 2 properties work together, what
>   happens when changes to the state are made outside of the DRM code's
>   control, etc.
>=20
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Co-authored-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  Documentation/gpu/drm-kms.rst     |   2 +
>  drivers/gpu/drm/drm_atomic_uapi.c |   6 ++
>  drivers/gpu/drm/drm_connector.c   | 100 ++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h       |  50 +++++++++++++++
>  4 files changed, 158 insertions(+)

...

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 644f0ad10671..01360edc2376 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1186,6 +1186,45 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   *	can also expose this property to external outputs, in which case they
>   *	must support "None", which should be the default (since external scre=
ens
>   *	have a built-in scaler).
> + *
> + * privacy-screen sw-state, privacy-screen hw-state:
> + *	These 2 optional properties can be used to query the state of the
> + *	electronic privacy screen that is available on some displays; and in
> + *	some cases also control the state. If a driver implements these
> + *	properties then both properties must be present.
> + *
> + *	"privacy-screen hw-state" is read-only and reflects the actual state
> + *	of the privacy-screen, possible values: "Enabled", "Disabled,
> + *	"Enabled, locked", "Disabled, locked". The locked states indicate
> + *	that the state cannot be changed through the DRM API. E.g. there
> + *	might be devices where the firmware-setup options, or a hardware
> + *	slider-switch, offer always on / off modes.
> + *
> + *	"privacy-screen sw-state" can be set to change the privacy-screen sta=
te
> + *	when not locked. In this case the driver must update the hw-state
> + *	property to reflect the new state on completion of the commit of the
> + *	sw-state property. Setting the sw-state property when the hw-state is
> + *	locked must be interpreted by the driver as a request to change the
> + *	state to the set state when the hw-state becomes unlocked. E.g. if
> + *	"privacy-screen hw-state" is "Enabled, locked" and the sw-state
> + *	gets set to "Disabled" followed by the user unlocking the state by
> + *	changing the slider-switch position, then the driver must set the
> + *	state to "Disabled" upon receiving the unlock event.
> + *
> + *	In some cases the privacy-screen state might change outside of control
> + *	of the DRM code. E.g. there might be a firmware handled hotkey which
> + *	toggles the state, or the state might be changed through another

Hi,

in the above three lines, I'd use the term "hardware state" instead of
just "state" to be explicit. Or should it be "physical state" since
"hardware state" might be confused with "hw-state" property state?

I don't mind as long as it's unambiguous and distinguishes explicitly
between actual and the two property states.

> + *	userspace API such as writing /proc/acpi/ibm/lcdshadow. In this case
> + *	the driver must update both the hw-state and the sw-state to reflect
> + *	the new value, overwriting any pending state requests in the sw-state.
> + *
> + *	Note that the ability for the state to change outside of control of
> + *	the DRM master process means that userspace must not cache the value
> + *	of the sw-state. Ccaching the sw-state value and including it in later

Extra 'c' in "Caching".

> + *	atomic commits may lead to overriding a state change done through e.g.
> + *	a firmware handled hotkey. Therefor userspace must not include the
> + *	privacy-screen sw-state in an atomic commit unless it wants to change
> + *	its value.
>   */

This documentation and intended behaviour looks perfect to me. If you
can record an R-b just for the doc, please have:

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

You can also downgrade that to Acked-by for the whole patch from my
behalf.


Thanks,
pq

--Sig_/nI6z5hVMcIPSqlRupCx5ms0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl66VPgACgkQI1/ltBGq
qqfXxQ//dVi+kCWNbeWC9LKOnO6XaVX7sT85KKZ1Tiq76u7o2ajso5kUpdmsU7FX
0tae0cnfTOJ9hA1l5keUaU6XUqeTwOrBO7jF68D6WWLd5X0aiTCQpi4DQMq+VsaJ
QoF+Y4RLJ5dj2f2YkIywdBjHM1A+EpowVUNQnpVfIt2xHjnBzDBYxm+I+wd+f/E5
rlnIuR1d3guAICV4AJ+Y7ktU6BMHuuIbxgbj4tZmPfTPx5scQNaQGMnYq5DtSlOw
5hy6aP3IHFfiueKEpC6ISp8IAn7EhCXYhlV1l0JLtnokA15uEN5POcFjYXeo1apR
a3iwP4xSMmcr12kmy8ugGjV6lUDuJvaENy5vqyOdGnysfUCyyi6J1MjWiyC2eBfL
eK378eGWxtx24kez0C5H9FFfHcCot7t3OF5NVFUSBKeE79kFtLcQCiP38e237yvE
3R9ECoG9zcpdrBr9e9HACbi55C0DuieGEy4fkxdpW8gqlRuSQkDvMTllkYsvt+Lr
PYX7u4Hnx+AeigTdY9bPBXzxuVk8J19KQfW8vHmtvItnQEBh/PBbBrL9HetF1p+b
nFpl4dsOaOQxFQb292bYFwLyz4CXusUx5Yx54Ufw9tXxExZjdz8kppOJ/N66RcTQ
7ZaWx1TSpUn2JN4/EcTvjkOPQvE+XtO0hDDPGoyr2YiQpThPtps=
=BvSD
-----END PGP SIGNATURE-----

--Sig_/nI6z5hVMcIPSqlRupCx5ms0--

--===============1017470190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1017470190==--
