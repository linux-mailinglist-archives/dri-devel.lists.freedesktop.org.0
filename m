Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A208CA6977E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 19:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1310E357;
	Wed, 19 Mar 2025 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f5mZffpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E679B10E357
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 18:10:47 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so34647035e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 11:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742407846; x=1743012646; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NRDBPEHgXUupa2eHopjm+NVMZxrKrUuYtULMiQNFxdw=;
 b=f5mZffpbi7MZ9X/k6FT5MLII0KvSb1rwQn0T2yln9gDdRYBj1Pt9FCM9ojKAQecbRi
 rtKsP1L5sXf4w1RrIPAwSLM7VyxAATI7GMWQjrvtEZ9IcO/6c3YYfPxBO9NWFQR6Cv1l
 HjR3Rkz1V7R8ioN+wqpLwoQYPLtcYOyu7mrJfbfFXCd11ZaWEUZO1lbe1xoNeYSAIGrU
 dRZyOv0aByc7qiZugJnFK37ywfgsRQV921/Nks3aPGI2Zj6v8N3yoPsvyDJAO96MGEb4
 kXVwd6Og1h+x1sguXQHpAi+T99am5vxRKgCe98JukKU66f7q2mer8cUPxxAtcEkc459Z
 NBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742407846; x=1743012646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRDBPEHgXUupa2eHopjm+NVMZxrKrUuYtULMiQNFxdw=;
 b=qJe8sXWv2I8YJU/n6y6WalzC3YoYPX7oMn2FRWEaAorGfnP9Lku0opJ7oZgQRiDv3R
 Dbikr8m7s0VmJUBpnIQSnmX0hR8qY82zsDCFR9cWkALl7m8kMLdotX1kQYI5QK12dSAA
 gLqZwaQZWNzKOgLXNQp8yEVTelyVD8mBzgLGyJ9MZdRsmqxXvzmffOW7g7U4wjNABhxt
 3l5/cAFZJOetEzKwO5j90Zh0NhH15fyFm6uJGyqYzl37+QCrLycixC5j543mx0tmPYKi
 WqpZPzKKn87iU815Ta81P0fwnl1CjCjd4pPT5XPL724e3wLcdzte6GE2oTL0hqiISeKs
 uYEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkTzdnPtjwgnyxkRYXnRPar1l7qDfTCTkPTKTLKWK8gLXGeC7XF1vK0HApVsWIRCTEPn939y78jAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGVfp/w69ZY8a+0xesITJWpq8+E1aevDl0MpjZQ70AVScaDKeh
 ApApqqwBvXnnXNROosH0YWYlYHHIY8aiCqsP2T8Dqx+NTbTZuEPE
X-Gm-Gg: ASbGncvsY/041XiII5gpStYxepXnRSgqTbo+3yOR6EsGKYd1SLMH7FZXnw2/SNoQJ0N
 ntSX5qtzeeA+WSUgzYDLKGF4oOdTc16so8Xd9gVt5o8cYE7+sQ/48/NHwG1VnlH7xb6YJQ0Zevy
 U+D1C4t42IWdDkcEDSMsgxC6tU+3ggYGKo1dFVHA+iLMVzgobNR7KFFi3TViXSTGkuyRzW2Qjct
 Lz149lkKcIgfgJHtFjKM0cKU+gUiPs++GnvNbRXNOcjO5U+/RtMIHkbeejc2sXMSHDaAwNhZ6Yt
 rh/E9/BuoebFD44NVKyfk4hxbFkGubApXspTGxmj3U2ohe3o84Q4UlMl283J9/vDjrJbyX1cFcs
 CapG06LIsbjHCX5Mmk28GzZtc0b1kMnI=
X-Google-Smtp-Source: AGHT+IHYFWZdONoLhtaU63p45Xf9+bWz8YoVzEW+0yAcNTLY2gKQG7/aemrHzQVaMzVWmdFrLB4q/A==
X-Received: by 2002:a05:600c:348e:b0:43c:f16a:641e with SMTP id
 5b1f17b1804b1-43d43781690mr33983605e9.6.1742407846139; 
 Wed, 19 Mar 2025 11:10:46 -0700 (PDT)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8881187sm21267993f8f.41.2025.03.19.11.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 11:10:45 -0700 (PDT)
Date: Wed, 19 Mar 2025 19:10:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 Mikko Perttunen <mperttunen@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>, 
 Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev,
 regressions@lists.linux.dev
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
Message-ID: <vn6lqxfqvi6tbxomrvn6ct3ezvegx3y2q4sdwpjkvbehzzs3gl@ctek3pks5y3e>
References: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
 <19478509-5007-4a20-9512-b965126b7026@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3vs3sblqwnplgzuh"
Content-Disposition: inline
In-Reply-To: <19478509-5007-4a20-9512-b965126b7026@tecnico.ulisboa.pt>
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


--3vs3sblqwnplgzuh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 12:34:35PM +0000, Diogo Ivo wrote:
>=20
> Hello again,
>=20
> On 2/4/25 7:18 PM, Jason Gunthorpe wrote:
> > Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default dom=
ain
> > could have been left as NULL. The NULL domain is specially recognized by
> > host1x_iommu_attach() as meaning it is not the DMA domain and
> > should be replaced with the special shared domain.
> >=20
> > This happened prior to the below commit because tegra-smmu was using the
> > NULL domain to mean IDENTITY.
> >=20
> > Now that the domain is properly labled the test in DRM doesn't see NULL.
> > Check for IDENTITY as well to enable the special domains.
> >=20
> > This is the same issue and basic fix as seen in
> > commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means=
 no
> > DMA IOMMU").
> >=20
> > Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
> > Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927d=
c@tecnico.ulisboa.pt/
> > Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>=20
> Any news on this patch or any other solutions for this regression? It's
> not great if this falls through the cracks, especially when there is a
> solution for the problem.

Looks like I had marked this as applied by mistake. Thanks for the
reminder, it's applied now.

Thierry

--3vs3sblqwnplgzuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfbCKMACgkQ3SOs138+
s6Gc0A//TrzbaprQO4xc8Hgq6tcEIg3KdqfdbBdYgELgL6bY+60NkY0cm5wcsUaG
he5y3ZfuZLUBjV2rlhJAuyOdpScrjekO0lB12wmnTKypOsp/ugFDTgDnrdgIgQU9
Brs4DDAVu9AB/pjN8jHnQ0wOYpR5yXW69ZKGZuu+FAlscC8hVQ2SoyAUP9WDBcw5
cy2E5pZuVs7ti6MhF4MaL1hkFz4QjPnlupAxwBEMslsf/6vzJeTwVwAB9wq6aoj7
43NFJ2U7VLPMBQA0DfdPMI50gJGeAkKfBWuQMIXwRsH2XUT93uzXrJr0qKDWROUA
/s8z6kuKi1jnUZ+gbUUZauQyHFF9OT8sJAND9Tx2bnDUncfmj7ZSrP4MU0F6uYJV
PU13U30Dm76w6IV0X+zNfDUyRUoapVBAbpFRtlKX8yn+mGrZy5vMJdGiu+AUZJBS
hbuEAg5qW+DDcwwJsrjMpOTfIPAEWJ6Kxm2t5Qr/Jtd1WpiCmQD6pDrxud24yEBt
DQ897YMsOP7DT5UJG8B7IXFL95OTyDYTXcSFK8D802Il1tBfjh1jZnoteva8VhHd
wI0bHAyWDdND+KrX8WbtLeDzCc97vw9yJ4RfI7ZI9G2waRmQBdpWXTv1K8lt5gDy
03jmd6jX8CfULyXueikrm5+Br92M9afX66J+ubSq1o2QPn9R+UU=
=aAbR
-----END PGP SIGNATURE-----

--3vs3sblqwnplgzuh--
