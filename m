Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99286A54AB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFD310E4B3;
	Tue, 28 Feb 2023 08:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DF510E4B3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 08:47:01 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id bi9so12170213lfb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 00:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677574020;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CVmelUAguAMVIcLj3OKuHhtjIgIIx9Fsv/QeOOjw8B8=;
 b=pxw2UzZq1kv6jWM1hYYZ6ZJ+wi3ieZoX+2/tEX8Gqax2L6zT2fCRDfroKj/Mf5x/Yx
 cfvuxCYjE5bzwGruA6hSbd3mJ+uLnqu0ACEtjBU+z97YjrK6RzWw0xscKlkph4JNtQkG
 +2WfWYlQhF2/KTnks0rZd208weJeVUoB1Cxnc7GnrFGG9VdYlh2TRb39jbdwFHZzBaG6
 GdE8P28V/0ueGGTLAQ+9bp3f7NsP2ko0l/3+lZe6K6rbd78EkaWJ4qTk5J4SL029ljlr
 guYP7VZlrwX2/dOO9pJNV/MFCrs3aiklKwgc5R7u9Kgv3fEFCw6AmPlg6jUDPM0aWIJ/
 hcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677574020;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CVmelUAguAMVIcLj3OKuHhtjIgIIx9Fsv/QeOOjw8B8=;
 b=EuiHAAdiHv4OdkvCO5fjI/gJlqOj8ng03gOBVvEgSj8wIbqMjkURbjW+ZP6o05YfwX
 2jV+sQQjcxFDl18BXC3FlVF9HUUMXLWgYELsTt5gmheItV6XiSWA18A5q7wpXFc8IioY
 xAmMLi1ih/HfNuYyVjAWAr4pOmTiW47qL5+btXhId/HmmjfYLtkfWjz9MHzJNLGvaUmr
 ceT/WxhEvvqWFebjJ6+FSnOh3hIBTLG3Jj7+OFEuCh/BYtUBJbArWFN/Y2Kio7xQtSmE
 V9HublI9eW3OhBGBgaMlYyKpLXfr+kT/BYgRi3x55WUa/F1H/VzMIzPa4/l4hu0Iu3Zz
 Aryg==
X-Gm-Message-State: AO0yUKWbAEFr2rAUKAlgQ7A1WKYCIE3eENJawPJXgArRtYYnzGJiSDq9
 VyKQVhYLXFvdMEOsCUBzriQ=
X-Google-Smtp-Source: AK7set8ByfXOFfiAYbDM49r28yRRJaKiRUg8ob5V8+pwBOprp5g/HKdNa1MNeQXxY/zo3ZRvCS2UVg==
X-Received: by 2002:ac2:5dfb:0:b0:4dc:6ad4:5fe4 with SMTP id
 z27-20020ac25dfb000000b004dc6ad45fe4mr464208lfq.32.1677574019738; 
 Tue, 28 Feb 2023 00:46:59 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f19-20020a19ae13000000b004db20d07decsm1250977lfc.209.2023.02.28.00.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:46:59 -0800 (PST)
Date: Tue, 28 Feb 2023 10:46:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <20230228104642.21dae84c@eldfell>
In-Reply-To: <20230227122108.117279-1-contact@emersion.fr>
References: <20230227122108.117279-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=lJiL_ttp4epLO2kRh23Lx";
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
Cc: Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/J=lJiL_ttp4epLO2kRh23Lx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2023 12:21:16 +0000
Simon Ser <contact@emersion.fr> wrote:

> Add docs for "{left,right,top,bottom} margin" properties.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 9d0250c28e9b..65a586680940 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1590,10 +1590,6 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
> =20
>  /*
>   * TODO: Document the properties:
> - *   - left margin
> - *   - right margin
> - *   - top margin
> - *   - bottom margin
>   *   - brightness
>   *   - contrast
>   *   - flicker reduction
> @@ -1651,6 +1647,16 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
>   *
>   *	Drivers can set up this property by calling
>   *	drm_mode_create_tv_properties().
> + *
> + * left margin, right margin, top margin, bottom margin:
> + *	Add margins to the connector's viewport.
> + *
> + *	The value is the size in pixels of the black border which will be
> + *	added. The attached CRTC's content will be scaled to fill the whole
> + *	area inside the margin.
> + *
> + *	Drivers can set up these properties by calling
> + *	drm_mode_create_tv_margin_properties().
>   */
> =20
>  /**

Hi Simon,

can these be negative as well, to achieve overscan and not just
underscan? Did I get overscan and underscan right... these are related
to under/overscan, aren't they?

Hmm, no, I guess that doesn't make sense, there is no room in the
signal to have negative margins, it would result in clipping the
framebuffer while scaling up. So this can only be used to scale
framebuffer *down*, add borders, and the TV then scales it back up
again?

Looks like neither my Intel nor AMD cards support these, I don't see
the properties. More things to the list of KMS properties Weston needs
to explicitly control. Oh, it seems vc4 exclusive for now.

Where does this text appear in the HTML kernel docs? I tried to look at
drm_connector.c but I cannot find the spot where this patch applies.

Is this actually a connector property? How does that work, should this
not be a CRTC property?

Is this instead not scaling anything but simply sending metadata
through the connector?

Or are there underlying requirements that this connector property is
actually affecting the CRTC, which means that it is fundamentally
impossible to use multiple connectors with different values on the same
CRTC? And drivers will reject any attempt, so there is no need to
define what conflicting settings will do?

IOW, does simply the existence of these properties on a connector
guarantee that the connector must be the only one on a CRTC?


Thanks,
pq

--Sig_/J=lJiL_ttp4epLO2kRh23Lx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP9v3IACgkQI1/ltBGq
qqe8Dw//W6K51JbCCt+WZwoWWdzK54ap4w465v5PO7IfKWTsszcGYZtGeeTu8hEx
psq2mt7LPJW+CvT8vPY6ZUxXFLjWytfrKpdKgb3C44FhJWIYDHY0Sjm4jyh4dZQ9
oGRLMexmXeRYF7OutAqF6HmZf0PwqQ2qxwrZwSQl7bCq4foqW6yE0G6BUvufBQ5c
1TVJcxj5t1fv7KqeM3+5iyNU1YxHeFji3FCRPUrDUIvvggb1n+KS1zFVbsE/zz5V
hH0rZo9JXvsc2up7C98uc/mmQ0PfdsOWO5rKSn64B9uEHRUWOv/rQQzB17YNSiY1
T3eCRjYrykYNfOaB7fcXDSuoC0RFwHOvifjr7cyITD80mqsK/JHDl/YhqzgoPNiQ
9A92xqTJQqViGpwpMytsGq0z0bB1hrKzEBS0lX9wf9vfJv3XrWCnl4wHx9FM1QDi
M8B2ueh92XXb2iiEr4pHSbMdzBRJUaIRcVYGbf5ATfjuOSgpUYCZMGmukq86nv/u
fyJzvMg/0wHodOU11BqwzAbanXPl/9qr/KEKhdYnT9X0XMRRbDYk3pbi0KNVv2cf
Lw4EJgBJY0bzQJffu7qPBqPMMGTDcRDj2bQP2THd1rkxgH9SQ6Q2+SAYKhZjKFS5
gwn8O5JI+qgK1lmqvB6WE6vnKJ7eYN8GCTNrSYMMv4L9impHlyk=
=3ch3
-----END PGP SIGNATURE-----

--Sig_/J=lJiL_ttp4epLO2kRh23Lx--
