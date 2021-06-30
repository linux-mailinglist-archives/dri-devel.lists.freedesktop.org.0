Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD53B7AE2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 02:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840D76E0E8;
	Wed, 30 Jun 2021 00:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17CC6E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 00:14:01 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id v17so168653qvw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hky4gTO3tCng7PAo2ZSFyODqxh+C6jpy4pwGTu49BJc=;
 b=grZUwsGrSYGngYzkWbVNyBDJ1S/5eltMHO5ZbTGbQpbWpn0DFKQGKWenqPXVqhNA9g
 2oSS2GeKgriipxnWjxH+IS7AmE79VJ0Jw6FGd8iL7PMV9E/6aeIgu3qHmBZpJAggA+3I
 C1bC8wLbzTlrtVHXWNVaESLQ+nBqjzLiMLkz6Eflq9/TQOqeyPzXxJNVt4O2ElBnz7AO
 DI0eHaomh7CUM8F6yl5ACRfjsAQCM7CvAoYGpWaPexCdjolrHsy84N0I5zKHKDkUopzp
 rIUMbIs8AxX1uMkwiUNl69N1nrEPRBmXCFSLccoOR8fbaC34XVaWAO5VWGnoHSheZ5PT
 pxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hky4gTO3tCng7PAo2ZSFyODqxh+C6jpy4pwGTu49BJc=;
 b=dcaVCQY0RoJpxa8/nF25LlWxzwySIV+4RcNaKOUny0geSqLuOAWRguuzGlq7yR+OnP
 6xAGlq8w49bEPrfUoz/p7jzsvOD2vkHMrKuOKBgBHVuOEQeET0wcTMOhFhNNpewE32op
 LYouba5UteatvyT6XwNWwcW2p3Do1G4AksRn3Tsik5UrMtMZ9ABM+E7Oggd4fsto6oIv
 VWD6vlyEsfhq5dT4J2ZmwCHASVpBIEJHQN5KQEFfOEMN1g12FYJVyhILs3+d82GE2+KG
 x652LSqwcmEZ3/4xTZkZAr7O8OFHkp3fCeoPJBp+EYqXhrOYyQ4dq7VNDaRr3JmrP/bL
 nweg==
X-Gm-Message-State: AOAM531qUBzpi8G7CkXRDo9fD2weD6wCx5b4gbktkWqHLGDoPB3PHtdf
 EyNdQMNK5m0cbW4t9EaFGT8=
X-Google-Smtp-Source: ABdhPJwlu3sG4+OVqNSqletsvabQVcYQnlFFswXR5yfARIWxMguYh4h9zHMzM9BRn4QbHe1ZdAe4uQ==
X-Received: by 2002:a05:6214:518d:: with SMTP id
 kl13mr10356074qvb.31.1625012040814; 
 Tue, 29 Jun 2021 17:14:00 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56e0:6d60:fa75:cb9a:650:2eeb])
 by smtp.gmail.com with ESMTPSA id p6sm13047168qkp.80.2021.06.29.17.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 17:14:00 -0700 (PDT)
Date: Tue, 29 Jun 2021 20:13:57 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v2] drm/vkms: update the current status of todo list
Message-ID: <20210630001357.ldij2s3zituiuvv7@smtp.gmail.com>
References: <20210626092655.ghmmt2yux5klrne7@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bzm6pstzaq3s344m"
Content-Disposition: inline
In-Reply-To: <20210626092655.ghmmt2yux5klrne7@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bzm6pstzaq3s344m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/26, Melissa Wen wrote:
> Update:
> - debugging issues on igt testcases
> - plane composition features: add primary plane improvements
> - suggestions of good tasks to start working on vkms
>=20
> Drop:
> - syzkaller bug report:
>   what triggered the warning was replaced by shmem functions at
>   https://patchwork.freedesktop.org/patch/394614/
> - overlay plane: this feature was added by
>   https://patchwork.freedesktop.org/patch/430941/
>=20
> ---
>=20
> v2:
> - add task to enable multiple overlay planes (Simon)
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  Documentation/gpu/vkms.rst | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 2c9b376da5ca..941f0e7e5eef 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -98,9 +98,17 @@ with VKMS maintainers.
>  IGT better support
>  ------------------
> =20
> -- Investigate: (1) test cases on kms_plane that are failing due to timeo=
ut on
> -  capturing CRC; (2) when running kms_flip test cases in sequence, some
> -  successful individual test cases are failing randomly.
> +Debugging:
> +
> +- kms_plane: some test cases are failing due to timeout on capturing CRC;
> +
> +- kms_flip: when running test cases in sequence, some successful individ=
ual
> +  test cases are failing randomly; when individually, some successful te=
st
> +  cases display in the log the following error::
> +
> +  [drm:vkms_prepare_fb [vkms]] ERROR vmap failed: -4
> +
> +Virtual hardware (vblank-less) mode:
> =20
>  - VKMS already has support for vblanks simulated via hrtimers, which can=
 be
>    tested with kms_flip test; in some way, we can say that VKMS already m=
imics
> @@ -116,7 +124,17 @@ Add Plane Features
> =20
>  There's lots of plane features we could add support for:
> =20
> -- Real overlay planes, not just cursor.
> +- Multiple overlay planes. [Good to get started]
> +
> +- Clearing primary plane: clear primary plane before plane composition (=
at the
> +  start) for correctness of pixel blend ops. It also guarantees alpha ch=
annel
> +  is cleared in the target buffer for stable crc. [Good to get started]
> +
> +- ARGB format on primary plane: blend the primary plane into background =
with
> +  translucent alpha.
> +
> +- Support when the primary plane isn't exactly matching the output size:=
 blend
> +  the primary plane into the black background.
> =20
>  - Full alpha blending on all planes.
> =20
> @@ -129,13 +147,8 @@ There's lots of plane features we could add support =
for:
>    cursor api).
> =20
>  For all of these, we also want to review the igt test coverage and make =
sure
> -all relevant igt testcases work on vkms.
> -
> -Prime Buffer Sharing
> ---------------------
> -
> -- Syzbot report - WARNING in vkms_gem_free_object:
> -  https://syzkaller.appspot.com/bug?extid=3De7ad70d406e74d8fc9d0
> +all relevant igt testcases work on vkms. They are good options for inter=
nship
> +project.
> =20
>  Runtime Configuration
>  ---------------------
> @@ -153,7 +166,7 @@ module. Use/Test-cases:
>    the refresh rate.
> =20
>  The currently proposed solution is to expose vkms configuration through
> -configfs.  All existing module options should be supported through confi=
gfs
> +configfs. All existing module options should be supported through config=
fs
>  too.
> =20
>  Writeback support
> @@ -162,6 +175,7 @@ Writeback support
>  - The writeback and CRC capture operations share the use of composer_ena=
bled
>    boolean to ensure vblanks. Probably, when these operations work togeth=
er,
>    composer_enabled needs to refcounting the composer state to proper wor=
k.
> +  [Good to get started]
> =20
>  - Add support for cloned writeback outputs and related test cases using a
>    cloned output in the IGT kms_writeback.
> --=20
> 2.30.2
>=20

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Thanks

--=20
Rodrigo Siqueira
https://siqueira.tech

--bzm6pstzaq3s344m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDbt0AACgkQWJzP/com
vP8B4A/8Cbpfz1Ad6JHBdrZZS3GoO9fz/1pw8nwsof1MP2Vunkb5GGXcgwOmEqIb
rJaCDvMCtct6HLzCmtUgJ/NTtSU4rG4cjsCgSOCq+UDhqwsYKrFBupXXVFl3YCCR
ZAXmi8QUwccELqZdMhflqgZSm7gvK0IZbjDrCotNOdIvU+jgqzMHwKj9rqJoRxgR
rgxgmOoug3zBcmxZtv4DCj6hhlWLwdLmrbIneeVOxpBKR3Ksyv1WpZVB2CUHMtcE
6ZQemlEtMZF4ZPyrLsZXGjF7PS39tIY9OhZ4KKZkPbJF3YJt5b8sERXSCb6xveTo
zQDlVEOBhxzmfjuy2tg6Aj9urPQijYVw7qpGy4Le5erR1FjuzPg7/W9fLS3I3lgt
y+cE+4MgoBYablQl1JMSbVQUppx7iwGwPdbTA7jE4ihmPXISYbBaXnnKnMGdcySm
fshAJxDYcZK3Tj7UM1TloBWSBDaWq+oxcy4gw7QUQWutKm0BxhuuCZEuYk8qVNvz
EvQlWAvXbgc5K6gBLsCOecQnP6b5wf7SZ3ZZT1HfXd1I1uqGc6X4SlN2DajEkrgp
qVNoul1H7FM/pCaXGZi/10JpCNiO5cy9tfpPh2RFcnKgJfk8tVHMMkoiJExyHvVg
1+00DPUpNHoW8KG7UmV6FguNFoBDe4UgPlFd0dL5FxUGNPMKJGs=
=PQTm
-----END PGP SIGNATURE-----

--bzm6pstzaq3s344m--
