Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8DA7E3236
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21710E495;
	Tue,  7 Nov 2023 00:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389AF10E495;
 Tue,  7 Nov 2023 00:25:14 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cc30bf9e22so40492065ad.1; 
 Mon, 06 Nov 2023 16:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699316714; x=1699921514; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KvNevDILmrFumM2oQIUBMvMXYtsYvLzdrTujg9hVkHI=;
 b=miBkMjSDa+KJpdbHLW5RXIoBdprMRRqM+HJZaU3zMqfqvyoKGVcLfUtdl1LX0Wnwwy
 /kpYdpv1wrsmwGrd5x8x/2fsupgJTYRlMajpZBW8MuAPHU61em0XZMYi+KpvtlOORheK
 jb6R33X745Ldj+a5r3bkdZjW5qbxUZMrm4x5BXKw7DFeF/S0qllAXOByvnslOcQ6lR+s
 r4yYMVRqxUYdTu8Z475fmsabFmupStl/HHg54wiRexFEONDNNi7OH2aof3ysdJy8CQKB
 agOl+93JID7LS+Xxgy+F85FlMX0MolYRmOWY9bl8BdURlwX8Upa06A4ophPPaV6B/2nx
 TWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699316714; x=1699921514;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvNevDILmrFumM2oQIUBMvMXYtsYvLzdrTujg9hVkHI=;
 b=WqFcEeYnMLdvCgiDnpjx1ee8V55a4hwHnNjMveP6c2oyeiOpQ+5rPvmCafghrT6kc0
 KWG2SwCXwlBNNZx/sNFPEar5r3IqTR+4aUY0VawvvE13Oy5XZ953OcOs6sjqYhqTM4IH
 V/68P7SChq0MZqVKMR28O82paYVRgGLVPOMhdRISVhkbLgpLjtSkznb0FW1gTYWyxqHT
 4pZZCePMFpR6chELAC44YUDbC3QFz7Q85+VXS3aIlzAnw8iUjE+9WnziNEOrec+b8Lso
 Uo7YWME4qErCs0EAy6GWyg9rP7LEc/e/HD99XM/ojQy2dNPr/RsVlICHD8ciD8lAFM1f
 kB6g==
X-Gm-Message-State: AOJu0YwvyEeLXSUvTBudeUsKVnfQjhnMI+SOSwUVmcWIHirZgwm8EG8C
 TpFntI3QTOdYNUt2mLnt3cw=
X-Google-Smtp-Source: AGHT+IFpEJjW+6bQ6vlcdu8jbIyxxRW7ZMOKGK03NP4M1Mz4NcROaycZ11XDShYh+2rBgXl2g25WXw==
X-Received: by 2002:a17:902:e551:b0:1cc:51ee:5faf with SMTP id
 n17-20020a170902e55100b001cc51ee5fafmr1650822plf.7.1699316713622; 
 Mon, 06 Nov 2023 16:25:13 -0800 (PST)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170902654700b001bb1f0605b2sm6573600pln.214.2023.11.06.16.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:25:13 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 63C18817FA85; Tue,  7 Nov 2023 07:25:00 +0700 (WIB)
Date: Tue, 7 Nov 2023 07:24:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hunter Chasens <hunter.chasens18@ncf.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm: amd: Resolve Sphinx unexpected indentation warning
Message-ID: <ZUmD2u7qZS9XWRRz@debian.me>
References: <20231106201739.29507-1-hunter.chasens18@ncf.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/im2KQQsxOjeQDIO"
Content-Disposition: inline
In-Reply-To: <20231106201739.29507-1-hunter.chasens18@ncf.edu>
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
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 Linux Documentation <linux-doc@vger.kernel.org>, Xinhui.Pan@amd.com,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/im2KQQsxOjeQDIO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 03:17:39PM -0500, Hunter Chasens wrote:
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 517b9fb4624c..81b8ceb26890 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct device=
 *dev,
>   * Reading back the files will show you the available power levels within
>   * the power state and the clock information for those levels. If deep s=
leep is
>   * applied to a clock, the level will be denoted by a special level 'S:'
> - * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + * E.g.::
> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>   *
>   *
>   * To manually adjust these states, first select manual using

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--/im2KQQsxOjeQDIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUmDrQAKCRD2uYlJVVFO
o3+ZAQDfjlESW3+XuDhrOEojS9fqik7nCHXgYFOPvulyC48CzwEAmlHOs12KiwgZ
BP9nE37zIUNmEkWjNU+PCfws51OmbgE=
=JkyO
-----END PGP SIGNATURE-----

--/im2KQQsxOjeQDIO--
