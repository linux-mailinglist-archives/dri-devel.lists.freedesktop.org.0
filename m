Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325A5F725
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844D6E32C;
	Thu,  4 Jul 2019 11:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F016E328;
 Thu,  4 Jul 2019 11:14:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p197so4002975lfa.2;
 Thu, 04 Jul 2019 04:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Ch7LrvEVfQbD6iozkWhx2k2G+3TEmrTlcZ74pPQy2FU=;
 b=CZPx8RX1EC5/iIMhv0ecP8LDffYFlBkAiX74ypPlQ/FNSkXczmX8J/0/EawVilzAcR
 h4Tx9SXQF/g/lNEw9tmsub7l2OtfkxloBg88TAgXbD0wr37NwK76aIDrR813iqNSAO0B
 5foSsIF50WtNzPJhfPV45qD6NPH/X5PNRvyQNIrYci5siTCGtgKJsyPUh1RASfr1xknu
 svsupVjrnto9SI/ldoE+wRCmXRtpco7AnZl94hiIn3MwD2HE7mB4/DgyVYgoKJQCngKV
 /BcncmHpaJs3TrMtEruLG4L/h1oXredBiu1Ct+64AUwAHXVE7AmjRqtpXb4MG6FdSVcP
 1mpg==
X-Gm-Message-State: APjAAAWIt+L4BFi93cEpBPvYp/27skcBdpuEdHZshw7hQxIm3Gzr/Mht
 D7jIH22stgdD2usv5xSNjfs=
X-Google-Smtp-Source: APXvYqxt7DiLGgLMbmmpZHrnguAEs5TK7gIkbycQAUaxQsC5qWjJSmgcziIE80MKwyYGbnoZQ/gcHA==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr6826373lfn.85.1562238863504;
 Thu, 04 Jul 2019 04:14:23 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u13sm818305lfi.4.2019.07.04.04.14.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 04:14:23 -0700 (PDT)
Date: Thu, 4 Jul 2019 14:14:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v7 10/11] drm/hdcp: update content protection property
 with uevent
Message-ID: <20190704141419.145ff9bf@eldfell.localdomain>
In-Reply-To: <20190507162745.25600-11-ramalingam.c@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-11-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Ch7LrvEVfQbD6iozkWhx2k2G+3TEmrTlcZ74pPQy2FU=;
 b=mOI4eymCM2R//40hvcEl6q4xiPKD5UilyGz9HIaIsBG2FahySySVZB+ux/Agnftn7X
 u7vU7FyJWUZSk5vvP5TEQNCsadfiGmaBTMSK8O5XttHF2fZLJWjo/kbiPbmuZ/j54TGL
 WYLi1oq1wsOlGDEZbHtyQQbsbfkAom3T3mjwkiSEOju1xYgdJ2jq76ctPPc3kbS9a4BI
 q7KsTxto3F/vuA+5JlqOPSL3RxVulbr23Dm6MdblXeBQh4BAbcXwi25sodvR2yM4jsek
 BMla5n23klH683GNSYemvSR1++Bd2qPfXc7AHHtnzGpydLp2NcT2xsxJ3l4083I8RNX4
 ZIdw==
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com
Content-Type: multipart/mixed; boundary="===============1440670750=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1440670750==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6iW7AgD5amer1q.e7w=SzqB"; protocol="application/pgp-signature"

--Sig_/6iW7AgD5amer1q.e7w=SzqB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 May 2019 21:57:44 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> drm function is defined and exported to update a connector's
> content protection property state and to generate a uevent along
> with it.
>=20
> Need ACK for the uevent from userspace consumer.
>=20
> v2:
>   Update only when state is different from old one.
> v3:
>   KDoc is added [Daniel]
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_hdcp.c | 32 ++++++++++++++++++++++++++++++++
>  include/drm/drm_hdcp.h     |  2 ++
>  2 files changed, 34 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index 75402463466b..f29b7abda51f 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -372,6 +372,10 @@ DRM_ENUM_NAME_FN(drm_get_hdcp_content_type_name,
>   *
>   * The content protection will be set to &drm_connector_state.content_pr=
otection
>   *
> + * When kernel triggered content protection state change like DESIRED->E=
NABLED
> + * and ENABLED->DESIRED, will use drm_hdcp_update_content_protection() t=
o update
> + * the content protection state of a connector.
> + *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> @@ -412,3 +416,31 @@ int drm_connector_attach_content_protection_property(
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_attach_content_protection_property);
> +
> +/**
> + * drm_hdcp_update_content_protection - Updates the content protection s=
tate
> + * of a connector
> + *
> + * @connector: drm_connector on which content protection state needs an =
update
> + * @val: New state of the content protection property
> + *
> + * This function can be used by display drivers, to update the kernel tr=
iggered
> + * content protection state change of a drm_connector. This function upd=
ate the
> + * new state of the property into the connector's state and generate an =
uevent
> + * to notify the userspace.
> + */
> +void drm_hdcp_update_content_protection(struct drm_connector *connector,
> +					u64 val)
> +{

Hi,

don't you need to ensure that 'val' cannot be UNDESIRED?

> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_connector_state *state =3D connector->state;
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> +	if (state->content_protection =3D=3D val)
> +		return;
> +
> +	state->content_protection =3D val;
> +	drm_sysfs_connector_status_event(connector,
> +				 dev->mode_config.content_protection_property);
> +}
> +EXPORT_SYMBOL(drm_hdcp_update_content_protection);
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index 2970abdfaf12..dd864ac9ce85 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -292,4 +292,6 @@ bool drm_hdcp_check_ksvs_revoked(struct drm_device *d=
ev,
>  				 u8 *ksvs, u32 ksv_count);
>  int drm_connector_attach_content_protection_property(
>  		struct drm_connector *connector, bool hdcp_content_type);
> +void drm_hdcp_update_content_protection(struct drm_connector *connector,
> +					u64 val);
>  #endif

This patch is missing all UAPI documentation.

Particularly important is the detail that the kernel will not send an
event corresponding to userspace explicitly setting "Content
Protection" to "Undesired". That is what you explained to me in the
Weston MR !48, but I don't actually see it in the code here. It would
be best to enforce that in the shared DRM code.


Thanks,
pq

--Sig_/6iW7AgD5amer1q.e7w=SzqB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0d34sACgkQI1/ltBGq
qqcd6g//dvwyW1qJd9Qk+hlLA9IkBXo7D1apzweMjXaEQ1Vzg7AwbwTo7c5oVp9n
pw6aY0ueCnf6KnVq/cXS6TbJ3WjeioQJjc7DfGnITF7psMen34XrYnRnV7y1lPQb
QSOhi6W3xKOp81054SO1LmqKaF4+Q3CQ0ug3o2XtS6MQviJyf8r/TZ0cgPUYa/nW
ufOL8ellMcDCTTNlcxYmAH+JbDAlqD/ErApQ9sTmCnKKRpRaTxu1GNcJYuEIojby
wuOztQNBociN75GFliN/iHA18596WLErJKHOlRy5qulZQr8cd3uCUhoeMdoPPRq8
4mxi8I5ShivWUl9Pn2ATSQlwEbIxdzYfyeifWpzvL7oh5QjYvpSEFavrt/7XNcxd
+vKu4a5lCXc89dt9HzEtvQtdpFd1qsyINm5kK4Zccs27yYAmbSJ2rBAa3a3qsQ/R
lpmnfCq22last+By2YEP3lxnDdCglBIOWQ7+07C5EJ8yT8hcIuAWid9KWmNUEFN7
R5Sb0fA3e9iAkEIp2tCLbVYX9XDn14UV7gShZpVUf1O82yRy+6Z4Nh6LCjZ/DRU4
fj1v8p3pjGw1Fjwwx9M+sMwlo5/7E8DND4BrEMXTsC+FjE2JlMCaZf6TVzRrKcqx
QWVG/v97QrnQPrqi40SLTe+8oIu7GPqn0k28GTWvUg1uBMrgF/o=
=KRkF
-----END PGP SIGNATURE-----

--Sig_/6iW7AgD5amer1q.e7w=SzqB--

--===============1440670750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1440670750==--
