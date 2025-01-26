Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE76A1CD49
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 18:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC0F10E456;
	Sun, 26 Jan 2025 17:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EAm2R4pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8223B10E456
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 17:06:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9F9E0A40DED;
 Sun, 26 Jan 2025 17:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0F3C4CED3;
 Sun, 26 Jan 2025 17:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737911207;
 bh=URhgw1DKZdJOfSvgQeHDWWQZh/kF6uZLUJisynp1iOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EAm2R4pgMehqQG6sGCdao50NHjXeNzsc85p9i27EO0jpcvRtRUaefM+glv0Y5hgiw
 ifSL64CjKrVW2RPjA4btbNHQzlqgnnyZ+AjWeJVcgm8tXxIi3QsYyUl32ota/vy+zz
 ynFVARy5aWSa6TMWsyxV+WBwa46su+26ifqADi+w2ZFtN2q38/zgi0lCdKAdk8vA/i
 iGsBxY0hOB/wUQiFjXb7zM25iygFIPVR+0+LUIX+iejQeVVu/3Nggaw9+n/ki/Raxs
 4uzEvRwOp+SEweVRxTbBnL3A2IWfMQCayynFsPFHzI5ZmXwOe/7/M/9xRaKuqm2DaZ
 HDVe1uLr47SDA==
Date: Sun, 26 Jan 2025 18:06:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, seanpaul@google.com, 
 marcheu@google.com, nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dlzbemnndt5pqfg2"
Content-Disposition: inline
In-Reply-To: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
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


--dlzbemnndt5pqfg2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 *
> +	 * Test cases for conversion between YUV BT601 full range and RGB
> +	 * using the ITU-R BT.601 weights.
> +	 */

What are the input and output formats?

Ditto for all the other tests.

Maxime

--dlzbemnndt5pqfg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5ZrkgAKCRAnX84Zoj2+
dgf7AX4/3ojQzpaWS6I2+Z5m2w0ZAieeeoXMx23/OhsYnBApklD5lg95VlTNmmC6
IBWzj5oBf09HNYhyPnjoqVlWyN12/uStwZhRkND/zlbXihVKNu84XSqZ5TDdPx6/
fkSgZ2yf1Q==
=Rofi
-----END PGP SIGNATURE-----

--dlzbemnndt5pqfg2--
