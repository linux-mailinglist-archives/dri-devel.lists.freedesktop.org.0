Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D201F8BE7C6
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0177910F040;
	Tue,  7 May 2024 15:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g7poxcwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2814010F040
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=kDW9
 bGSlVSMH3v/pWtlTslI3hjg1zW0spSb+1IvUlUA=; b=g7poxcwkBP6KEr69TxK5
 qNlZNwSmkmZejLAxtWdj6IeL2JFESUcDX5x4PhwXTxQAZwHnc3RI3nDjX5pBgwja
 3g4V2HbpGyINMH/Ah7a4Tka+AsJmDse9ablntvjGezuMTe/EEA/pjC6IoIX1q7S4
 b6V/ybufNzP3dzOxU6SEPARDngPbZNKzwXp3sIoSzp6TOfZyLyBalPjZ/wJbnRaX
 jFoX6+jGpYT66UnNIPtcjWUvvHJhXxc61WRlGhdYzdoHDGxjUX/mxxLUZ71QrxS6
 0M37DMqzDz8QlFCCN1U9IBzZbwE+wQufMb7koDJ2bl7Fo+ppawMy7GYIRXFmzdqY
 aQ==
Received: (qmail 295994 invoked from network); 7 May 2024 17:49:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 7 May 2024 17:49:47 +0200
X-UD-Smtp-Session: l3s3148p1@HpClIt8XMNoujnsp
Date: Tue, 7 May 2024 17:49:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/arm/comeda: don't use confusing 'timeout'
 variable name
Message-ID: <un2yjlemfj5fuuaejwbod755jv3fzkr6kigged7ug2bfvjjqcp@76vpmgsjzqc4>
References: <20240507090200.7936-2-wsa+renesas@sang-engineering.com>
 <Zjoq7oEuCu4H8eJa@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="732ye2buaxydf3ys"
Content-Disposition: inline
In-Reply-To: <Zjoq7oEuCu4H8eJa@e110455-lin.cambridge.arm.com>
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


--732ye2buaxydf3ys
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I will change the subject line to s/comeda/komeda/ when merging it.

Oh, thank you!


--732ye2buaxydf3ys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmY6TZUACgkQFA3kzBSg
KbZDThAAk0r5ROMPGCB/UZCuMwlk2DBE+BkQ236M1yERILOpBVRxqVLupJ4M28ov
9irDSanKywUmB66mFo8PJ0jzdaPK+DwdfOiOYmU4iLXkDmMKUeDY5NVoI285+kUF
r8B0X0j/NfvjiV6e+3pTSvFgHtq0bopegCpVRx8nYVKclYJnJ5xXWTbT/JP896HN
eAmyYgrZ5sePlAx2oYJQnYpUoC8bNzSxb8jJrp4sbs7nzIZ36sfSz/CNxg/1eeoS
JQWj3U3I9Tiux6I4wEKL9oF5bF355PHumhnIifgg0Vpn3yz5aI2mUS9Z3MOyYKLL
nRh2uHQFs+p0ygfO5+SE0UQYgRoVxGUW0TcS9OIEzRZvRI7S3h+KS5HIFZU8edcB
Z6swJ6bogABNDB8RDy56yNRu4+alZtWbGKDVvkMyh3qOgsg5dkCoxZuEKnMELSxu
rgtY2u9qKWjhsbzTE8PPB+EjDH8sSXGHAXLFIFiqxr6jSqHybQ5uY5G0JZKOTz8a
metJ+JRDzAhdg7Fh+//2fjXm+FlLRuayIq2Hw0miQm6g8JXyEkxH860op+5vq0OE
tQAv+EHlZFUKYVuB62Iac6dfbM/R164bKeLXYbYY3QgCePwCpYGMnhmXl9Y9xCX8
rThgA6gn3hVxHJFYJTRmNXz8VErumKYKE1WBbWJ2SZF2DTiUMRE=
=SK64
-----END PGP SIGNATURE-----

--732ye2buaxydf3ys--
