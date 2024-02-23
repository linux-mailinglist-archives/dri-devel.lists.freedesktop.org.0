Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5BE861C3C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 20:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1896210EC74;
	Fri, 23 Feb 2024 19:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kDnk4MTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0810EC74
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 19:04:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6DA7CCE2E61;
 Fri, 23 Feb 2024 19:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F8EC433C7;
 Fri, 23 Feb 2024 19:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708715072;
 bh=kvRBTnpXxJuiMh6rU54+PqzZxLJBaTJYWSM4jkXCnq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kDnk4MTRhS2VGtZczg90fw1dl1rw2wbHYY25dtBT/S6bDviEGFP6FaChJVlw8+5dM
 U3W0v2XGj4uZ4NnDFbmvJjVsbT6wtStCGQSyBz4+wfkMbJj8DZejfHdad68oGb0Zjf
 irqro+Mzzl5AevhZTzKnZhoQGJN06azAAc7E1zTpmt/hUEuuPwDrfO2T2D3xOXhDji
 c8zwUXY8oirTcv2HtNvJz7WyIBpA4gnSh3hw+8Q5W46wkx4v0sopm/ZytISe1Y1tHq
 JqcnKc1qHE1g67mlNL+qYRwWyyO/sBXbfWpSULAmeSD5qIMYlMDas4a3S7L6Ksk5Gr
 tEDR6j1zqI6OA==
Date: Fri, 23 Feb 2024 19:04:26 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org
Subject: Re: [PATCH v2 0/9] Add Chameleon v3 video support
Message-ID: <20240223-bottle-grumpily-900dabb22491@spud>
References: <20240221160215.484151-1-panikiel@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OQjjAQm+Wl0cgy2+"
Content-Disposition: inline
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
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


--OQjjAQm+Wl0cgy2+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Feb 21, 2024 at 04:02:06PM +0000, Pawe=C5=82 Anikiel wrote:
>   media: dt-bindings: Add Chameleon v3 framebuffer
>   media: dt-bindings: Add Intel Displayport RX IP

I'm happy with both of these patches, but I would like others to look,
so I'll hold off leaving R-b tags until someone else has at least
looked.

Cheers,
Conor.

--OQjjAQm+Wl0cgy2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdjsOgAKCRB4tDGHoIJi
0kdOAP9exKFk426JGBzS6e5PuRv/hRCsdMzhpIG2OVVZR71KBwEAzXMieV4HnLoJ
WwUH+i5PkLVRTB7IHnBCJVtcCpoTygs=
=COSl
-----END PGP SIGNATURE-----

--OQjjAQm+Wl0cgy2+--
