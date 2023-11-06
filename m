Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA17E1BBA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 09:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF4A10E292;
	Mon,  6 Nov 2023 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E42F10E273;
 Mon,  6 Nov 2023 08:14:46 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1cc3542e328so26660665ad.1; 
 Mon, 06 Nov 2023 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699258485; x=1699863285; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RnL15XWbR/PqBAe5vEEeomw1xohZpb97YhaYfG/+2hE=;
 b=YYgJWapjy69T8t2aG6jXlY8BS/QGT0tktYggGBR982h1f+xHqV2mOYYbqOlj4Mpbzs
 od0D1iFTczLuxoYhXzECVRQqmNQ0unPkRdDck9HWgjxAJ6IhUKy7FwbADRoNnazm1XOZ
 Y1omSZsIHFPX5ThrVUukRexqoCmnHPxWKrSyXRibYgtGga2QcS2RXk1Xq0/4XziEQUbH
 doA1Dho4qhFaL10SqdrdWrClFJLp2XJmQqLckQllDlpE3EwG5aX4qhyIQEnzJkCMWJXh
 ZWLQOEe14v6gncgnMqV/Kllo1+9EwtrRxXJ05IB67+F6qcjJsxHWr3ab4dmFfqYBEtew
 XZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699258485; x=1699863285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RnL15XWbR/PqBAe5vEEeomw1xohZpb97YhaYfG/+2hE=;
 b=ZAcGv+rX9z6U0snVcL07nDViUNZ1hdRjEfhBdC4yIxL9WIs/uZxcT5egD8/t38yR4O
 r0BIYSVNhHo3oPZBayAMaH3Z4WNykhUstdBvP7KTiZsxOEOxYC2BFE4/Km91Pd9P8NiE
 AQ36JVCwmTbpiWZu4S94agaOlGXQcgPEusrLizVeRKgHwRWk1seut2TpdoC2+ZLG6tik
 vYpUMWKzW0cCb/iXX7DpP08E3LxutsXHXaVI/Dt0lFSahzxChkq2g83bZoVmTYsh3dnk
 W1cvgJolLaA+lwLg/Fj6W3W/asa/ljhfUggJ6UKZJv4Wtb/r9w1h5cryVpqmkSYCKS0J
 PQbQ==
X-Gm-Message-State: AOJu0YwxzX327ComnhSAOzU41gD+TsrfjBv8AMIWJ6NBrYAyOLhKbfXJ
 ++6QbvFmV3LWeMhY/zo0wpQ=
X-Google-Smtp-Source: AGHT+IEH71t99GuGPuDpnkZTNN858Z5Z6G2lkYXBgMtLmpxZNn3A6l6Q8xwlyYMdOWlmUXyeV+Q6aA==
X-Received: by 2002:a17:902:ec81:b0:1cc:6e5e:a980 with SMTP id
 x1-20020a170902ec8100b001cc6e5ea980mr16100026plg.3.1699258485414; 
 Mon, 06 Nov 2023 00:14:45 -0800 (PST)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170903120c00b001c746b986e5sm5349705plh.45.2023.11.06.00.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 00:14:44 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id DCC899481F1F; Mon,  6 Nov 2023 15:14:40 +0700 (WIB)
Date: Mon, 6 Nov 2023 15:14:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Hunter Chasens <hunter.chasens18@ncf.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation warning
Message-ID: <ZUigbshGGc451V5L@debian.me>
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
 <ZUh2fuCjmgle3vd9@debian.me>
 <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pfvq47Pno2Wrjbn6"
Content-Disposition: inline
In-Reply-To: <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
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
 amd-gfx@lists.freedesktop.org,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pfvq47Pno2Wrjbn6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 05, 2023 at 09:26:26PM -0800, Randy Dunlap wrote:
>=20
>=20
> On 11/5/23 21:15, Bagas Sanjaya wrote:
> > On Sun, Nov 05, 2023 at 04:00:44PM -0500, Hunter Chasens wrote:
> >> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/=
pm/amdgpu_pm.c
> >> index 517b9fb4624c..703fe2542258 100644
> >> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> >> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> >> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct dev=
ice *dev,
> >>   * the power state and the clock information for those levels. If dee=
p sleep is
> >>   * applied to a clock, the level will be denoted by a special level '=
S:'
> >>   * E.g.,
> >> - *	S: 19Mhz *
> >> - *	0: 615Mhz
> >> - *	1: 800Mhz
> >> - *	2: 888Mhz
> >> - *	3: 1000Mhz
> >> + *
> >> + * ::
> >> + *
> >> + *  S: 19Mhz *
> >> + *  0: 615Mhz
> >> + *  1: 800Mhz
> >> + *  2: 888Mhz
> >> + *  3: 1000Mhz
> >>   *
> >>   *
> >>   * To manually adjust these states, first select manual using
> >=20
> > LGTM, thanks!
> >=20
> > Fixes: 615585d09b33 ("Documentation/amdgpu: Modify pp_dpm_*clk details")
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> >=20
>=20
> but can it be done without being so obvious about using Sphinx (or is it =
ReST?)
> in source files?

Yes, the comment is included in Documentation/gpu/amdgpu/thermal.rst, so re=
ST
syntax applies there.

--=20
An old man doll... just what I always wanted! - Clara

--pfvq47Pno2Wrjbn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUigaAAKCRD2uYlJVVFO
o2CLAQCUAbBtOtn22yQGu7Uv9lipjEUjPeZ57pIl4xfW8ZjorQEA7hZ6R3PSNen9
ebEfktqrfgqONoXsVVGm1/5wlmlsggc=
=yZdv
-----END PGP SIGNATURE-----

--pfvq47Pno2Wrjbn6--
