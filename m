Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118DA76B2E9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78DF10E089;
	Tue,  1 Aug 2023 11:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F8E10E089;
 Tue,  1 Aug 2023 11:16:56 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686fa3fc860so3521900b3a.1; 
 Tue, 01 Aug 2023 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690888615; x=1691493415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g/d9qVu/YgKMVuhjhU0hWbA0JqMw1Dt0pNaA2X8wmek=;
 b=cLEpu1fpZif6atTb1LkbVf4G1i4TPB+OFiE4RXQUZPg+A6ZhoAg10LUcbLPsvJYl3l
 7SBxpqYOzAt7LORxMkUuizMhJkXLNFsCm8w4nQemSEWYL9YeZkWOxVu/zuotfsSBWINF
 EuufoRgkUgF99WWvDddKTyIp8pAVcWkOnUWpb5yY48mHMc++5MIuw7yr23XxGuyMhFc+
 yhrRP8+PUv8GKmqwR51imhJ7Vgx9THntr+BrInKefmeXLMrrKUfqvaZMXnQjIICmonlS
 OO+bzooj95qi9tGLIRykfm8RMBvIplz+Kt4R8xVY3hBxz7/iu7pIYAg06Mt290ewUDmR
 wH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690888615; x=1691493415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/d9qVu/YgKMVuhjhU0hWbA0JqMw1Dt0pNaA2X8wmek=;
 b=f3JOhNlawmnsgIYHS2XqHd2NzY0GTJy003XkAUa9M1S+s5IHxKyVWtxMt7evQaL1JU
 WSNX8zwM2ntmrRJEWTXphmzZqzfhpOaf4u6xRnvG1ynusV1Al+jTkPM6S23pUk5NSPvs
 QwBGmHlO7bBCDk1g9Dfnk8e9Lt1ebUZ5KFjhKCVYvy0/FRw4mwx7f3NUPM+epdEN4PHT
 QM696/g+E3jIccBxTUqNxE9Rfig4p8xlj0Rcg2owZk2wGVFhdNirzj9xDYhbksU4awsx
 WA0Ac1WTz/GTlwacKAS9KdllwrATHQ1xxDs1I72bhDb6e/Klv3sGLZ5xKyxFulWQ/sCl
 W1ug==
X-Gm-Message-State: ABy/qLaE2OWYOaRkTd+A2sZKPTLoZmAn/JgNFRKxy2675iXy8SVGKyMS
 2hrqYKPSUqy3W2/g3E4hsXM=
X-Google-Smtp-Source: APBJJlEQT4wLJEIOI4URIWAZ3XaBcZXevHviTbAHc+v8I5MziVFXsXSF6IISkcsOmV4HCiEhGp9bEg==
X-Received: by 2002:a05:6a00:16c4:b0:668:99aa:3f17 with SMTP id
 l4-20020a056a0016c400b0066899aa3f17mr16050243pfc.16.1690888615498; 
 Tue, 01 Aug 2023 04:16:55 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 d9-20020aa78689000000b0064fa2fdfa9esm9084667pfo.81.2023.08.01.04.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 04:16:54 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id C9A89801D541; Tue,  1 Aug 2023 18:16:50 +0700 (WIB)
Date: Tue, 1 Aug 2023 18:16:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ran Sun <sunran001@208suo.com>, alexander.deucher@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu73_discrete.h
Message-ID: <ZMjposYeMFxU5nE9@debian.me>
References: <20230801100024.8215-1-sunran001@208suo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Oz9nExZewyCtXaET"
Content-Disposition: inline
In-Reply-To: <20230801100024.8215-1-sunran001@208suo.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Oz9nExZewyCtXaET
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 10:00:24AM +0000, Ran Sun wrote:
> Fix the following errors reported by checkpatch:
>=20
> ERROR: open brace '{' following struct go on the same line
> ERROR: trailing whitespace
> ERROR: space prohibited before open square bracket '['
>=20

Thanks for fixing up your tooling to use git-send-email(1). However, it'd
been great to send a patch series touching whole drm/amd subsystem, with ea=
ch
patch fixes one error (assuming the subsystem permits checkpatch fixup
like this) instead of spamming maintainers with >=3D 70 single patches like
this.

And it is unfortunate that you and @208suo.com people doesn't reply to
review comments (try searching lore.kernel.org), which makes me wonder:
what does prevent you from replying to the mailing lists like LKML? Your
mail infrastructure?

Thanks anyway.

--=20
An old man doll... just what I always wanted! - Clara

--Oz9nExZewyCtXaET
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZMjpnAAKCRD2uYlJVVFO
o8eVAQC8i8w0oMagTUhlWHqTriRwuWmnzpcrsbkdtwpX3Jlw9wEAtX2Mn1Ie6sWq
Fjq3EI7u1q5SRe7QS9q9ZY3WCOoWRAY=
=mCUh
-----END PGP SIGNATURE-----

--Oz9nExZewyCtXaET--
