Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30A7771CC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28AD10E4DF;
	Thu, 10 Aug 2023 07:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9A410E4DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 07:45:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9912460B65;
 Thu, 10 Aug 2023 07:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06F2C433C7;
 Thu, 10 Aug 2023 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691653530;
 bh=zerCc/5DK+ilXY+6GqoWY1C74akVIuU8wehC3Y/Xvnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n0FP8bv12958A5edSJpDYvHHP0PtTIiDihx8qlqAoCjnAkaxcLIgBV0fpHcpVDiqS
 s9VRtTxQQp8H0ihi2XPQofU3eJ6smqujCvo1bSYsOXuY0/EZnEY4a4gqUEPnOUm/Cb
 PjhjfSaganyty13ALdzAY2a51EDk1ogofCcZyv/U7ptCK4WrxN7y9b/J3M7H6JoBv4
 1nwaGwF8t+REaRMuPWFjEXGJmGQd0M5DDlRLJOnUB2M32Mclh8zRof3uES1oR/jsiX
 RZzIDbLf59j7AVaG1/fptYJxuvlsufjpVKqWC922fVef7OAIVJNn39pa4BFQn59iep
 mQPpFkWXSTwJg==
Date: Thu, 10 Aug 2023 09:45:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
Message-ID: <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5pxbbnm7vsid32re"
Content-Disposition: inline
In-Reply-To: <20230807140317.26146-2-jfalempe@redhat.com>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5pxbbnm7vsid32re
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote:
> After discussions on IRC, the consensus is that the DRM drivers should
> not do software color conversion, and only advertise the supported format=
s.
> Update the doc accordingly so that the rule and exceptions are clear for
> everyone.
>=20
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f743e..00a29152da9f 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -38,6 +38,13 @@ extern "C" {
>   * fourcc code, a Format Modifier may optionally be provided, in order to
>   * further describe the buffer's format - for example tiling or compress=
ion.
>   *
> + * DRM drivers should not do software color conversion, and only adverti=
se the
> + * format they support in hardware. But there are two exceptions:

I would do a bullet list here:
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#lis=
ts-and-quote-like-blocks

> + * The first is to support XRGB8888 if the hardware doesn't support it, =
because
> + * it's the de facto standard for userspace applications.

We can also provide a bit more context here, something like:

All drivers must support XRGB8888, even if the hardware cannot support
it. This has become the de-facto standard and a lot of user-space assume
it will be present.

> + * The second is to drop the unused bits when sending the data to the ha=
rdware,
> + * to improve the bandwidth, like dropping the "X" in XRGB8888.

I think it can be made a bit more generic, with something like:

Any driver is free to modify its internal representation of the format,
as long as it doesn't alter the visible content in any way. An example
would be to drop the padding component from a format to save some memory
bandwidth.

Otherwise, on principle, I'm fine with that change :)

Maxime

--5pxbbnm7vsid32re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZNSVlwAKCRDj7w1vZxhR
xX+MAQCNMRjXjPIrJUmhF/gHST7bLvoWEeLzuv1QbRnA9wJfAgEA3KgkFEi39OGJ
H7nT0Te8g7gJY+LPz5Ynl/kkDDlVKgI=
=sGvp
-----END PGP SIGNATURE-----

--5pxbbnm7vsid32re--
