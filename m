Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5861B3564B4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 09:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC0989C7F;
	Wed,  7 Apr 2021 07:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B881089C7F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 07:02:37 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b4so26778150lfi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=qFNZUgqGlejiuMp8cdntR3aLAhOwwWtWbK93/gtJcuw=;
 b=m3ytSXJ8X4dgyWmZACcF3oK3kLUc4/IUWM4buRabq6ULzivhuoYmbT4oNxyauiA686
 EqqE65pfpkD1MuHgAyzRu0hQncwPXfIwRGJfw5wXknei7v6wEcgCfi9L1aSB37+gmsXq
 dYeVhESEDX+QIVmU6n66bK8/aBJwZdLXzKkoaltfTgCtivMN0plBBrzbCBdIpJnrUSxS
 mSRs3EMok1UTynHIeQmdaw2j8vorHNEP1ZBR6mOcPYC/doE0Nzn6i/mERbKl3x4jB6/H
 0tL7p/mgZX6kR0aBXgCGRpvd93XZ8KL/ESiJnFxv0NRBrMKAbLJGlE+1hzRIhSZsAlMp
 7lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=qFNZUgqGlejiuMp8cdntR3aLAhOwwWtWbK93/gtJcuw=;
 b=h7zPlvvsonUEpdPJd2hrFj2IMHcXaKZmspvrHr7cVlkb4Oo2O78GSt5VV9HojzbIXG
 Q86BY4oA9ZduueK9YxN9aqyYNEAOYkOqp4Ufxq1YMPUx4Rd7+Zg3DGJ5+1Nb1JB2Raza
 zMRltn9bXOV67Ua8YcRtvbYicUIoMiTwYBUuNU4RXWcey+1Y72bjKTuuDZBesFe8RCER
 VjIB0w6XyyJ0THJ1r6iRwhWlUrHkrG/Ma/VSoKttmqyKf0LnOtmnSABndBVnx4fcgWK7
 iJ0AD6krfJ8kVIwz/xFevE5u3LSHlFeqzRE0oNUUE9VudywlbjxYRCIpREOh2bNwIkBE
 K/pg==
X-Gm-Message-State: AOAM533IjmYBLPFMwxcdlzPsk/uCPLPapvBHXd0tVe2MCdtltTR94txR
 ILPeM18Z4QbVrSn31ovy97U=
X-Google-Smtp-Source: ABdhPJyWi4D6BDasU4rWu/tUFswiHMHbaKUbyLM7k7oyWgDEgV97B4RpLwVpXcAroDWmyBnhqgehig==
X-Received: by 2002:a05:6512:310:: with SMTP id
 t16mr1663130lfp.477.1617778956092; 
 Wed, 07 Apr 2021 00:02:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j24sm168402lfm.89.2021.04.07.00.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 00:02:35 -0700 (PDT)
Date: Wed, 7 Apr 2021 10:02:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: demote connector force-probes for
 non-master clients
Message-ID: <20210407100224.653fa3e7@eldfell>
In-Reply-To: <20210402112212.5625-1-contact@emersion.fr>
References: <20210402112212.5625-1-contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1900117159=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1900117159==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ne2b4V.EZthkUnqnA9c6Ezy"; protocol="application/pgp-signature"

--Sig_/Ne2b4V.EZthkUnqnA9c6Ezy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  2 Apr 2021 13:22:12 +0200
Simon Ser <contact@emersion.fr> wrote:

> Force-probing a connector can be slow and cause flickering. As this
> affects the global KMS state, let's make it so only the DRM master
> can force-probe a connector.
>=20
> Non-master DRM clients won't be able to force-probe a connector
> anymore. Instead, KMS will perform a regular read-only connector
> query.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Hi,

seems like a good idea to me.
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Btw. can force-probe be triggered via sysfs as well and does it require
root privs?


Thanks,
pq


> ---
>  drivers/gpu/drm/drm_connector.c | 11 ++++++++---
>  include/uapi/drm/drm_mode.h     |  7 ++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 7631f76e7f34..2f70a52a892b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -20,6 +20,7 @@
>   * OF THIS SOFTWARE.
>   */
> =20
> +#include <drm/drm_auth.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> @@ -2374,9 +2375,13 @@ int drm_mode_getconnector(struct drm_device *dev, =
void *data,
> =20
>  	mutex_lock(&dev->mode_config.mutex);
>  	if (out_resp->count_modes =3D=3D 0) {
> -		connector->funcs->fill_modes(connector,
> -					     dev->mode_config.max_width,
> -					     dev->mode_config.max_height);
> +		if (drm_is_current_master(file_priv))
> +			connector->funcs->fill_modes(connector,
> +						     dev->mode_config.max_width,
> +						     dev->mode_config.max_height);
> +		else
> +			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%=
d:%s] but is not the DRM master, demoting to read-only probe",
> +				    connector->base.id, connector->name);
>  	}
> =20
>  	out_resp->mm_width =3D connector->display_info.width_mm;
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a5e76aa06ad5..3efa2e38d89b 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -413,9 +413,10 @@ enum drm_mode_subconnector {
>   *
>   * **Force-probing a connector**
>   *
> - * If the @count_modes field is set to zero, the kernel will perform a f=
orced
> - * probe on the connector to refresh the connector status, modes and EDI=
D.
> - * A forced-probe can be slow, might cause flickering and the ioctl will=
 block.
> + * If the @count_modes field is set to zero and the DRM client is the DRM
> + * master, the kernel will perform a forced probe on the connector to re=
fresh
> + * the connector status, modes and EDID. A forced-probe can be slow, mig=
ht
> + * cause flickering and the ioctl will block.
>   *
>   * User-space needs to force-probe connectors to ensure their metadata is
>   * up-to-date at startup and after receiving a hot-plug event. User-space


--Sig_/Ne2b4V.EZthkUnqnA9c6Ezy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBtWQAACgkQI1/ltBGq
qqeNZA/8DpkgLt+PUtN/dHvYdDveZ0KfLocgmBVTpFPtyf4Yk1PRJoMIwnfUo7aE
aij+/+rQyQXamTlDFLVuiaG0lIY14fzRGE6iZ15KQH0mUu46HRzXseVNEZUcdN8T
W+xknmpgGf14oReBCQLSfB+hmJ81V54BlcOhxYqNVbMxAFngXcEEmUuZBWeuf9cC
BcMsMu8pGyiBBapmNwI/2ubBWItDI4ocUcsxOQ6J2NFUlIw+FK4E/Ak3etlPTxZQ
GjG/FfP4ZNbOdm9cj1c608Lj6wDuTYIu1E7X6zzfet/Z3NvC/R3dcZzm+ZjVNNEp
J8vikuvHn1jnWE9cJ4IkMq6AK0WGfP/90lDKfQHXl5RiM3GY+Po650OeKwyGVzCB
T2/z72sTnIgsnvnvgf6FhkkwrXAFmFZHt118kg+YasLb33OzBx0eFQIZ3ibtUJnh
9qILgHgP24QSUQe8D8KSkdfjHskk2l4Y54Gxp5K6r3qgj6iydRqqPieTJDmwH/Z/
ssEIfv0jlRlY5Z+SkbImBudqbXcWvr97G7JFWU3U/NAuT8hE0Xw3QgkiB5y+Ebh6
lz99Isz0icTarJsoQ/tuE2NIUFhLLPoc0yi57K4cF4eGTZsruiQUlqHeARC+DuB2
7xUyI15gaIQxvlQn2NjpY7N5WPBDTlGpcmvpizZiREsFMOOjtHE=
=+62A
-----END PGP SIGNATURE-----

--Sig_/Ne2b4V.EZthkUnqnA9c6Ezy--

--===============1900117159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1900117159==--
