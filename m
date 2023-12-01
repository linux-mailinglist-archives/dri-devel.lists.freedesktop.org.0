Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C26F8000D0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 02:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707610E00D;
	Fri,  1 Dec 2023 01:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B36C10E00D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 01:07:46 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5c27ee9c36bso21426a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 17:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701392865; x=1701997665; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AUm1+PoLufKuRdIAF0NESslVUVq3hoSsK9m/WIJoGLk=;
 b=FeyFqZz0d8h8mgZYu21HMg9YXAL8tyhrKVm3G4LPLfufZeuUCf+s47JnPrs0EWozqe
 cZC4Qtv/v3hAfGWGGgG7q6kD3BHStSzmqueCwWvzt2ksBAnPPlyMYsViBA0VP5xuc6nX
 HUxskClfVvmigXj8Q0xkfCUxI1pON/mK9P+oqdq6Wt4cpAjvSNmssJCh8twzkCkb4Rql
 px1oU2F9yOTWeSyXwqf2f7C1zXUKZ5fCLBdF3NIpaoWH5lnRlxejGU5GY/uoPRyZ8pwa
 BBWih2RwXFKTPwAII8FWEh9bzqeIwYigJFwhGikSQIiUj7B81xv7zatoOXrFwvlL5vSz
 mX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701392865; x=1701997665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUm1+PoLufKuRdIAF0NESslVUVq3hoSsK9m/WIJoGLk=;
 b=TPsFhdzLfGZJ9Oq+gIQrlwD3PWksWpqS3ZF/f4FD5rIEN8DZrcGiOaM6vQfHvUrG4V
 1nEANL38tCQogvYCJ2+SrjzYmveNNKbFZHwzAu2/Fe7WfocyaYORePfFoQoaGU8E5FMz
 tQE8Es6ssmbLlQ8P6cN90Wc2Fclu98b9vkuFJbSODu+nSGOXmbwqsuYvjGtwpPWgm3OB
 5Oq2FS+hjQsHij+US7dz1pwARiySGUBHCxc1xGtkxxvtznjXlCbBAoeUjt3SjY6UfRQR
 PIuMJHci85Z+oquUPzyygviGuBO1DiWys9q7lqfhH7f2GHloXw9g17zqaMHWRZUNHgUe
 uCMA==
X-Gm-Message-State: AOJu0YzESWWgRbYboQ3+7ZnQtYVan/QlW/zJwUF0OPaKj/q2FE+5KtZ5
 Mvnch3FS8Un2jFkt/vdxEjU=
X-Google-Smtp-Source: AGHT+IEpqLtFWr3jS1uwx80udQpJF7FenfSx2/8uNdOnCyRz8PMl0jnNpn2rP/xjSVKJUPB3LIk5Pw==
X-Received: by 2002:a05:6a20:244b:b0:18c:fa:17f7 with SMTP id
 t11-20020a056a20244b00b0018c00fa17f7mr28928374pzc.46.1701392865475; 
 Thu, 30 Nov 2023 17:07:45 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 x67-20020a626346000000b006be0fb89ac2sm1887957pfb.197.2023.11.30.17.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 17:07:44 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 5370710136909; Fri,  1 Dec 2023 08:07:41 +0700 (WIB)
Date: Fri, 1 Dec 2023 08:07:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <ZWkx3IcUTxO-IdIK@archie.me>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="caVVT7EznlCmrsO+"
Content-Disposition: inline
In-Reply-To: <20231130200740.53454-1-andrealmeid@igalia.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Attreyee M <tintinm2017@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--caVVT7EznlCmrsO+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 05:07:40PM -0300, Andr=C3=A9 Almeida wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>=20
> Specify how the atomic state is maintained between userspace and
> kernel, plus the special case for async flips.
>=20
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>=20
> This is a standalone patch from the following serie, the other patches are
> already merged:
> https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@igalia.c=
om/
>=20
>  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 370d820be248..d0693f902a5c 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -570,3 +570,50 @@ dma-buf interoperability
> =20
>  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>  information on how dma-buf is integrated and exposed within DRM.
> +
> +KMS atomic state
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion,
> +without ever applying intermediate or partial state changes.  Either the=
 whole
> +commit succeeds or fails, and it will never be applied partially. This i=
s the
> +fundamental improvement of the atomic API over the older non-atomic API =
which is
> +referred to as the "legacy API".  Applying intermediate state could unex=
pectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which me=
ans the
> +complete state change is validated but not applied.  Userspace should us=
e this
> +flag to validate any state change before asking to apply it. If validati=
on fails
> +for any reason, userspace should attempt to fall back to another, perhaps
> +simpler, final state.  This allows userspace to probe for various config=
urations
> +without causing visible glitches on screen and without the need to undo a
> +probing change.
> +
> +The changes recorded in an atomic commit apply on top the current KMS st=
ate in
> +the kernel. Hence, the complete new KMS state is the complete old KMS st=
ate with
> +the committed property settings done on top. The kernel will try to avoid
> +no-operation changes, so it is safe for userspace to send redundant prop=
erty
> +settings.  However, not every situation allows for no-op changes, due to=
 the
> +need to acquire locks for some attributes. Userspace needs to be aware t=
hat some
> +redundant information might result in oversynchronization issues.  No-op=
eration
> +changes do not count towards actually needed changes, e.g.  setting MODE=
_ID to a
> +different blob with identical contents as the current KMS state shall no=
t be a
> +modeset on its own. As a special exception for VRR needs, explicitly set=
ting
> +FB_ID to its current value is not a no-op.
> +
> +A "modeset" is a change in KMS state that might enable, disable, or temp=
orarily
> +disrupt the emitted video signal, possibly causing visible glitches on s=
creen. A
> +modeset may also take considerably more time to complete than other kind=
s of
> +changes, and the video sink might also need time to adapt to the new sig=
nal
> +properties. Therefore a modeset must be explicitly allowed with the flag
> +DRM_MODE_ATOMIC_ALLOW_MODESET.  This in combination with
> +DRM_MODE_ATOMIC_TEST_ONLY allows userspace to determine if a state chang=
e is
> +likely to cause visible disruption on screen and avoid such changes when=
 end
> +users do not expect them.
> +
> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
> +effectively change only the FB_ID property on any planes. No-operation c=
hanges
> +are ignored as always. Changing any other property will cause the commit=
 to be
> +rejected. Each driver may relax this restriction if they have guarantees=
 that
> +such property change doesn't cause modesets. Userspace can use TEST_ONLY=
 commits
> +to query the driver about this.

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--caVVT7EznlCmrsO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWkx2QAKCRD2uYlJVVFO
o1dzAQCN5LKZj1UCW2xL0voB6jCSuPsFMnO4NRaUQ6gOPmqvvQEA/eALo0PO1AJE
7eegxBLTYviNT27pENbRqxLvYpGQJQc=
=8SQb
-----END PGP SIGNATURE-----

--caVVT7EznlCmrsO+--
