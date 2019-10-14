Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EDED622A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257A89F24;
	Mon, 14 Oct 2019 12:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202B589F24
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:17:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o18so19414863wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dQgT5H/Xc9q+3AtDVp2JNpLmcY62zJNWlUUwGtmQ0Wo=;
 b=iI5LoY255yMpFRDmkGmLEQA14ZPVxi1U5eyeh9tSF1QrEc2dFGl8xS8A8WZwrc+5bx
 4H3r/jNMfPwTGTIkgMQopO0vvpHUx3/i+tV8Bq5qyLumiXazcLFR6RgiCNwtwk5geXeB
 V54C7LTcUbS5u8y9kdBs2fZAWE8CAWDPID2vHpCwqvJ56+6jhKupf7nokvDI0gbvMHvW
 7UeuYLpvOXDU3xm7QYetU9AHkDXPBcmeeNrGTywbETGL8D2NT2ejWc065yWm8QTq8zl8
 aIli9KKkY4iV94YQZ13Jt/tWuXflOOE51l8pcGpxMERZjVLYOniFUbYyNj4bZ2KNTcEt
 q1XA==
X-Gm-Message-State: APjAAAUTKq3T5Yh6MATX+v0/h8yZa/ekyB7U1DykT6S2ANevbiuqev4b
 dDrZo3yKOLAb4q7KT4c3jzQ=
X-Google-Smtp-Source: APXvYqzetdo3YCN8COK0mky4NkK9+49LZYZHk+TML/4W+y8fO3M80yj+cto3H+SDIORaGJrSA+Getw==
X-Received: by 2002:adf:ea07:: with SMTP id q7mr8912608wrm.102.1571055442619; 
 Mon, 14 Oct 2019 05:17:22 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id b130sm28589013wmh.12.2019.10.14.05.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:17:20 -0700 (PDT)
Date: Mon, 14 Oct 2019 14:17:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Message-ID: <20191014121719.GB422231@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dQgT5H/Xc9q+3AtDVp2JNpLmcY62zJNWlUUwGtmQ0Wo=;
 b=JWn/gz6zswsVuo5VIsfT3FXmgtFAz/Uqwy63Qq/Ua2Vd92gl5Iy9jzykSzF2aV4Lhi
 2tooIsOVGIw2mrcgajZiU3L41ihUA7yDWsBBdjtnYaedrQC6yoZ6eIXFnyQ5fZRo+qm7
 X+y+YW7Oea7C7ZOesXyDyQA5sVQFToRwhs4MjcfMzM4w4Zc5VTi80JHh0OkOYKTw/A9A
 jWQShjNFBkRQWuEKjiDwzFqV9pdRTql9HP0YEvYII8M2M0f1X35eo6DMZCChf3hYEX7L
 5MAVhVtmsJeFaML+hOAoh+ZdM1sUIOAcL2L/HYad2XoVI9ipraBxCz+XyPA25Lrc4tBj
 +cDQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1301656807=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1301656807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 12:45:05PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
>=20
> Changes since v4:
> 	- only create a CEC notifier for HDMI connectors
>=20
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kZ08ACgkQ3SOs138+
s6HRvA/9FCMG8xuBzW58WQPgv7upIyoGmbyjXMcB+GZHiu/ziLojFw2/6AHUVgWv
vUdbN79pMwLpJ/6fyDlltaeB6y9U4KSJ1B8+0CzAivrc454O/AflNVE/Eq+GNvWY
bZSicV3BhRfZcQ99FpApoX/RR+RWqJgSCw7FGRFPnV6zODoHzTrceTABesfyajku
uG15X+iKJn+BLWnXBGUCzJAVOmDARdUipNrGZX+sz0YlWTEw7RHMrKWyErmjy0AE
HUUsxB5jLFZu5oBii2NangwZCb4vyGsFSmxHYeUzKVeg1bSymdvN9tPbDARY3084
KWbqqQ52vZD2dNDWQbzWAKWyFYffjBT88FdfZVM1RGTlR//6cFk3takN7xoKCHjv
E2zXdDb9jj8dhoJZrEUN/D9XB18jsDMU88+5zpsmNTTd0kBhzbNg1bqhoYCXyfsj
wRsTfHhicnPWBPEUyLhukyWiAqYDoOzCkPylPMe+YRte+n3ENh+BqUAGkwW9gyZJ
x7efFoQs4mCeEFcNl5A4a/DHaqH5q9FY3+193To/+lHXsH9vMFlner04WTp0UTa3
Vk6xW57T9XvbY/dLcA80HLQWcObfsIgLPRinUhs/ZKTIrvEhZImWIKQqX+vqYLkQ
3Tri2+gUpeODIShnLlTJ8T7LEMB9FfxuLVy10DsX4faZW/WiF9M=
=igMm
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--

--===============1301656807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1301656807==--
