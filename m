Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53744F5EE8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE3610E0D8;
	Wed,  6 Apr 2022 13:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85A010E0D8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 13:08:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h4so3085987wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EzPicKvhciEAshSHE/waFTsLkuf/DuXzcy4ZuAGYnOQ=;
 b=ZYv5p3MjHvI8UrhE6y/d5AJOhKKDQVlCHSNdip8u3z4CcvBJcKQ8oD6c1RWTeExkK1
 v4cjRoN/i0pYgQkZfJlLDo2EfdJDgFu7rGHeRogFVEfkgRN4Z4oCKOOUJCf50s0uRjjS
 LlOeu0sDQkrNbfcjpleVjhFwDblFIE3EP22lt9x1QV9I9/t9Btk9oGzNXLS3Jwm5Wb88
 oFe0tO+M2YWSYPnNhCnxARmvOCqYhrwHblygkyDSZJsJO/t8OxGg+vSUfNs3ev1RdwpA
 a4eWqeh0gjhTzsUs1gIE1GYYiz59nAenynDYpUlIwXrmMgY1Uukv8orchLBAQ2QGPzVc
 5jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EzPicKvhciEAshSHE/waFTsLkuf/DuXzcy4ZuAGYnOQ=;
 b=PzVP9Om4Y0KqNyCZkQS/RwZMg7rb1vWSHBf28hightfpRZAqXoyyACeOEaKUEpRJFy
 WE4032+RLMnuKb0sjabWvw7RbvfybsJREyPBe/o5+2k5QMkny59Q4UmLwqAtyYCB8A5d
 X9sDs0emtDChm8AqyHt8OOd9MmwQud6PWFFdh3W15UZX1/tpESq2PfuDzqcicwK3eRr7
 xXmA7B8mcOhBQXjjW6rMzkLlLDL3RimFgK85q/f6z62KWLMBhD+rLfgA7DlIhXDMWZzZ
 QbuB2bUsljxP446fzQTLWz181rtT9YJm0JDWByXZT2XC/bInoxU7wK5snlk57nTla4V/
 5k9g==
X-Gm-Message-State: AOAM533/AtUNdemOSEjhPNGS7oY5aPL9f9DgeWpeIY7Dd+JYZV9dHXKC
 zLnEn8blns5LajH6zxKn+cI=
X-Google-Smtp-Source: ABdhPJx0Yr5teJaPktbkGEyUw2tv218TFtm8lcAFMNVMPKfCxv/8tvYndt0yGBd8nPkC8ru6DeBr6Q==
X-Received: by 2002:adf:fb0b:0:b0:205:dfbd:8601 with SMTP id
 c11-20020adffb0b000000b00205dfbd8601mr6302576wrr.527.1649250525257; 
 Wed, 06 Apr 2022 06:08:45 -0700 (PDT)
Received: from orome (pd9e518f7.dip0.t-ipconnect.de. [217.229.24.247])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfc5d2000000b0020589b76704sm15184511wrg.70.2022.04.06.06.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 06:08:44 -0700 (PDT)
Date: Wed, 6 Apr 2022 15:08:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] gpu: host1x: fix a kernel-doc warning
Message-ID: <Yk2Q2kcgrECbhAi4@orome>
References: <20220403225354.2492-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9J87IkycnimcbG86"
Content-Disposition: inline
In-Reply-To: <20220403225354.2492-1-rdunlap@infradead.org>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9J87IkycnimcbG86
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 03, 2022 at 03:53:54PM -0700, Randy Dunlap wrote:
> Add @cache description to eliminate a kernel-doc warning.
>=20
> include/linux/host1x.h:104: warning: Function parameter or member 'cache'=
 not described in 'host1x_client'
>=20
> Fixes: 1f39b1dfa53c ("drm/tegra: Implement buffer object cache")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  include/linux/host1x.h |    1 +
>  1 file changed, 1 insertion(+)
>=20

Applied, thanks.

Thierry

--9J87IkycnimcbG86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJNkNoACgkQ3SOs138+
s6GQ7A//U1t+rjKiIEIQmxmnfruDLVKJ+IOn6D45CGb52JfwVSCEK+1JC5Z3V7+a
owzbWNXmCh33rHIf4wiXGZYmlkXcyjYCowBMDGsUejA+eVlQzo8H2eiNfovPkBFB
M+UY1gB0T1KbzEpDO5i9a1tBfy22P38pV19sxN8EKkq0pwdFXKwwQ3xMw+SC0e7L
jDrWqJgp4pg1H10+GlHM8ipHOhCx0QNcYae9T1vTsToa56gmOWadGnHqUHUhb1ES
KjnpZg08XPq3fcw/AEzir4SZqfgx8O7MJYGofzZOnXoztNoH9ytiiPDfY5CeQy2a
ExDOgXX+hckf0rr2uIJWvqxklDAt1QkIaT7+68MMh/kuzEwNdmyXBcOzggrD+IlQ
xk56pa5abrdxWgb9p6E4CKyjvTAJ+puc30jbaZLG6T1Deh+92dBJlMyLDVcaprqQ
spqZjMe7uqEfR32Wm9b4K59HdTiacvBTfUbTgmdRazHlTJ9KOQpL+xtnU9KqhMmu
h/ahj7DYwXSkt26G1z5rPcJ6cp8tO1pjHcZSaIWxfXJbzYQ/EikyYn4p2YTEPBak
kOkev2jc09VAKLUxn5NA3TK5lwHRu42IBRaNWn8odtvjDTWFYwSDSr+KOIX1gy3X
aRKKkrkteE1wpYeWhVxv+B5CJiOs73jXDsoPtlwZKA35Xtu5SuY=
=xxNp
-----END PGP SIGNATURE-----

--9J87IkycnimcbG86--
