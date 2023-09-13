Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9779DD95
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 03:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9452010E04C;
	Wed, 13 Sep 2023 01:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F8210E04C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 01:32:24 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6bd0a0a6766so4541788a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 18:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694568744; x=1695173544; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vq8SgHFXKS/TzFJSEmQtwxfAWXj6dXC3+mc9FsXzQZg=;
 b=YE2M8hiePYwCTFhOLixodnJHWY1PyMVPZXDWpo4GrYnkO8nrU/dGqQIyfwWoPzI+xT
 +aP9i1pltNvFqVg1yungpbE32c0kC8u9a4Ru6n9DCl12d+Ia5QnG7nq4sq8Z7xgdg7KP
 yX3WTuC0+edfxAlGVB0dk+pVAjkoNXHbnSA1R9xNWUJjEfXNM/rJ5hkFOF1VpefI5mPk
 0dKKU1Gzj/PocSobQef9Vkt1ZElBjM/mtc2aJ5v1DM09fsRiR0LW2g1g7/V8TmMZpBe0
 f3eN0KzuPEXTHC98t8VK+vF8GQWEkbo6UasiDAPl75x1rpqAW4nG8ea1fsegQq5DsHeb
 EDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694568744; x=1695173544;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vq8SgHFXKS/TzFJSEmQtwxfAWXj6dXC3+mc9FsXzQZg=;
 b=u7zKE/KbrOdsceftkwmE13QvZ0HRD6Q8FaTP8GKmtnlO6if6oyvHj8lZvK9nnVkcpB
 hinsYNAzaTAjg8blcwPKi29cd+qV4h+O/tdrmN7KT9glMgLyM8Kx9HN5Km2EPOjqfvUM
 slKcVFSWOzdMbxzOhcd+6pQbAxww1rlCB6jJ2Z3pNsA22R/X1JCC6MO52HQdoqATkCew
 TbCGVrchpETrnXAnl/yDjSaPbdegjV/wUNp9ZFHbD6+MrVEuuxLtejhkMDjiXlg1ATAe
 ISk2hKLshKZ95VBzsdLP+pBse1mOSMRdHs75CD9GFhCATjy8RlhWGJy/Z4/+iW4qMF3F
 Snhw==
X-Gm-Message-State: AOJu0YyDv84WgYM8n/M36PiyvHmWYQYiw8a/oQCVGuawyh1CcwmuKBuu
 9jSWwR7aeRvNY1QwsKfZVhY=
X-Google-Smtp-Source: AGHT+IEt/bNpU0mRtK+AR7hsEVoqnuNX7FLGK81vCmsCoUDqeDEL7zNOB7lGTmHbnmb1jDXtdgZqDQ==
X-Received: by 2002:a05:6358:2611:b0:135:3f5c:9675 with SMTP id
 l17-20020a056358261100b001353f5c9675mr1730097rwc.19.1694568743861; 
 Tue, 12 Sep 2023 18:32:23 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 c14-20020aa781ce000000b00687dde8ae5dsm7997630pfn.154.2023.09.12.18.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 18:32:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 6773E89F3BBE; Wed, 13 Sep 2023 08:32:20 +0700 (WIB)
Date: Wed, 13 Sep 2023 08:32:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Angus Gardner <angusg778@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Removed unnecessary parenthesis around
 conditions to comply with the checkpatch coding style.
Message-ID: <ZQERJIGOOeYxgX3E@debian.me>
References: <ZQEKFR1OPoXGI2lO@midnight>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x1+FQVa4UDBiUUPt"
Content-Disposition: inline
In-Reply-To: <ZQEKFR1OPoXGI2lO@midnight>
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


--x1+FQVa4UDBiUUPt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:02:13AM +1000, Angus Gardner wrote:
> ---
>  drivers/staging/fbtft/fb_ra8875.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

No patch description and SoB, so Greg can't take this as-is.

> -	if ((par->info->var.xres =3D=3D 320) && (par->info->var.yres =3D=3D 240=
)) {
> +	if (par->info->var.xres =3D=3D 320 && par->info->var.yres =3D=3D 240) {

Greg prefers explicit parentheses on complex expressions (see [1] and [2]
for examples), hence NAK.

Thanks.

[1]: https://lore.kernel.org/linux-staging/ZCWGOZqdH1kWtOEq@kroah.com/
[2]: https://lore.kernel.org/linux-staging/Y%2FiaYtKk4VSokAFz@kroah.com/

--=20
An old man doll... just what I always wanted! - Clara

--x1+FQVa4UDBiUUPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQERHgAKCRD2uYlJVVFO
o73FAQCZr9WVvTPdXrwCR23Z8ew/F2TTSZkLjZY6t94QNZFc4gD8CN1oD399IWU0
p9IhzWXKtA85w37Q5pwbRZUfvAEcmwg=
=8y2y
-----END PGP SIGNATURE-----

--x1+FQVa4UDBiUUPt--
