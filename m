Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8634AC80
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 17:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0A6F402;
	Fri, 26 Mar 2021 16:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FD86F400
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 16:28:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kt15so9269795ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 09:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XfiMkxOSKnCM3WBrbINx55gt3hO9rgqZUMHuwA9vK0s=;
 b=gJUUJRsS6Atywe0x09TsRJR0vW4UBZZK7Fi8lFtOsPllIwcHr0D2JAMBZhVJGzt2vo
 G2W8NPyHHLZro5OkOqht4WXFnZ2RKlu2WtxsK2FxV1J4LQiu4cdvg7lotzKwmZAnrAf7
 GhIogshMRCcyT8MtlFuhCzknDHo/mwYUEPpqlJP+epkMRSzc7rGvSBe6QUqhJoFcIyeq
 XOIZiubUXc808oW1V3aiFQVPE2ku5yLG9QIVkDlcFPb3UYbRn7LwOesk7nEeDousOUhc
 6w8wJAyuFaxlPr760eqylWLDHfJGGxaUPO1ME4JPkpPR/uk+9+SyleqhkwuAtcNMoD//
 MnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XfiMkxOSKnCM3WBrbINx55gt3hO9rgqZUMHuwA9vK0s=;
 b=kCphrztZ6oH5uDePC4nY3ncfP3XLsdqiBy84dJQHTN16YQN5IcmkiOcYITmuBa3PKZ
 8ocjFbPByC2gnhrpr0Zh7feqp0bX4z2XOHoVZaapTr7xfRcL8TRSIOgmAzXLPCZx4FXo
 CrZuoY0DmpJYrRbCIm8nDNWKxEK4rbEp84h0xY843zGFsZwDjkcp5/7IgJuodrdHkA+s
 N98Xfecw52n5w9reCkpg9lj+pxGILCjr5hPepOuLu4XBj/xAyDmQIA56f+bb2FUpLq8t
 6rDOcf8s50ZPBi6+OZTAbDjM6p2mIjoEnACdaV/PVxaI8TOIG8Xhkyo86zgVgZrIxq/e
 dYrQ==
X-Gm-Message-State: AOAM531pcNC7iQ4pWhuM/emXSTPJAJCGYEK9MkwCXHmMC7NdQTUG6jKA
 JZdRzzwobNsWRCrZOyqSy5k=
X-Google-Smtp-Source: ABdhPJxnUv8rZ/nOHfwUUEysunJJImhJ/Sj3JPuR1aFnJGqlZbaVKjCaIkuOZBbzeS841gDtlHNgDg==
X-Received: by 2002:a17:906:1a44:: with SMTP id
 j4mr16516705ejf.401.1616776136891; 
 Fri, 26 Mar 2021 09:28:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p27sm3982365eja.79.2021.03.26.09.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 09:28:55 -0700 (PDT)
Date: Fri, 26 Mar 2021 17:29:18 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the
 modifier vendor
Message-ID: <YF4L3kq9UN6PWh/h@orome.fritz.box>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
 <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
MIME-Version: 1.0
In-Reply-To: <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: multipart/mixed; boundary="===============2100594497=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2100594497==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="686Eb1WuHm6N1ecX"
Content-Disposition: inline


--686Eb1WuHm6N1ecX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 02:54:22PM +0000, Simon Ser wrote:
> LGTM, thanks!
>=20
> Reviewed-by: Simon Ser <contact@emersion.fr>
>=20
> Let me know if you need me to push this to drm-misc-next.

I do have commit access for drm-misc-next, but I was thinking that I
could take this through the drm/tegra tree along with the subsequent
patches because of the dependency.

Anyone willing to provide an Acked-by for that?

Thierry

--686Eb1WuHm6N1ecX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBeC9sACgkQ3SOs138+
s6FTVRAAqQIOOT3+3AlCUL/zjkDyNQtgVx4n7/yhYFuYP6w2EF9nRjSfP6EdslTB
ximrw+qW0srUEU+Kp3uf4OQwHze1m6OGcKMlZMtVhI9cUUuE/GK6hPcAPmusr54L
nNnKjoD4kwmXBN2BB+xAMsRYD91kbTTpEKTovcnTh8QJvuyZXLnwDCk4NKAsDjC1
e0dM4FdOwFoSoDMWFtuC5obksf1lnP1sn+WnVo+PZa9OvhFjFPYHOsXiS7I7x3Fb
jg+fD32TH2xu6j77xkEjVZaw+Vp2VuQ400uD0P42dKaAzCamiJJFfLJicyzkKteF
2EVUIDPV0Yasd1RZw0Y9NVj6BR57VQexIdfVGWXr7QfzwWjEiN3HoMmEoNbn2dsq
ysQoAXCD5L/fM1F7WSZMlUHEa3/t/RDNL08DdvTaC2xQS1z+3UZyasv2RLy5FeqT
T+NNkhqRE+eOrUKN99XzA0r1pdhe+w1Y52VvHsh1Kcm7tuj+KWl3CSJR7bTP5PbR
G5bM2PXX5WlZ7bh3d68kU7TU6yUXZyNBIOZTAYNC+EGE0nu8bWSQN9gxDvGXhBEs
6E1F0OvW9BRt7HJwSfWpAtsNpew9J610T629ddAcaoGXEqNlssdsfpoJYH0Rh3J9
IRo/RhH7/QRrGqZwCG5/cWbYgIPrIlGOn7y1DfJIHf1Vp4gYaUc=
=aNQI
-----END PGP SIGNATURE-----

--686Eb1WuHm6N1ecX--

--===============2100594497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2100594497==--
