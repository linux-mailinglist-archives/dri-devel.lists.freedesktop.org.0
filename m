Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF359B2287C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 15:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7443710E169;
	Tue, 12 Aug 2025 13:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="fO1COuL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Tue, 12 Aug 2025 13:30:47 UTC
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7171E10E5EB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:30:47 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1755005066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HT2hqwAZZG0UAbHiYEwWNljrR3mJBNDjqO64v62M4Fo=;
 b=fO1COuL7ORNxs3B9H3eGGgHU9jirAwVsKZdXfDYQgh+bWhrPOwnFtvbFpwFtmMrK8h7QSx
 G1R1zOR/S018416supYWIA/skr45GD15EDyxzwf5e02YMHZ3gWFQuWrV2108YVFoKmMHyc
 hbuoLiHAtfyt6ZgiYCo20JrHBiT6byXF+QYtTvctbCorhcpSW/GeEyUGP3zR/E0lWMdhHe
 BjWQezA7xH3eHnGuTxNraXzhvJ0fQLGcXrAI64bheWpRKS/FiWloe/KEsydGnJK9vU4bHC
 SXnUYbPFfsivpYnu++s2au44lOTAWHdj3xDLn+7hr1tUQUVkX9R1EGDKhsOHuw==
Content-Type: multipart/signed;
 boundary=72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 15:23:55 +0200
Message-Id: <DC0HD39JC201.N1K8MVD1P7OI@cknow.org>
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Piotr Zalewski"
 <pZ010001011111@proton.me>
Cc: <hjc@rock-chips.com>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250706083629.140332-2-pZ010001011111@proton.me>
 <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
 <DB4WNMVBIWYS.273Z54K6O7DTM@cknow.org> <4207630.fIoEIV5pvu@diego>
In-Reply-To: <4207630.fIoEIV5pvu@diego>
X-Migadu-Flow: FLOW_OUT
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

--72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Heiko,

On Sun Jul 6, 2025 at 12:46 PM CEST, Heiko St=C3=BCbner wrote:
> Am Sonntag, 6. Juli 2025, 12:37:40 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Diederik de Haas:
>> On Sun Jul 6, 2025 at 12:20 PM CEST, Piotr Zalewski wrote:
>> >> With a new version of a patch, you're supposed to add the tags you
>> >> received for previous versions, like my Tested-by tag [1].
>> >>=20
>> >> (unless the new version has changed so much you feel they should not =
be
>> >> carried over; you then need to explicitly describe that and why you
>> >> dropped them)
>> > =20
>> > Forgot... Should i send it as PATCH v2 RESEND?
>>=20
>> I don't think that's needed; the maintainer will let you know if that's
>> desirable or that they will add it (back) when committing.
>
> The problem is then remembering to manually collect the tags from a
> previous series.
>
> For my reference, it was
> Tested-by: Diederik de Haas <didi.debian@cknow.org>
>
> So hopefully I'll remember now :-) and there is no need for a resend
> at this time.

Is more needed to get this patch accepted? If so, can I help with that?

Cheers,
  Diederik

--72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJtAgAAKCRDXblvOeH7b
blk/AP9qVD2EKzBtPo/59n2gdL4G9t/u9M80pLQJzj/tM0PwowEA/d9FYzxx/rFZ
lfZGkb8gpfOqw60ZYCxDwIfQQoqU7wQ=
=3G71
-----END PGP SIGNATURE-----

--72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f--
