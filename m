Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5698CE35
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 09:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BCB10E5D5;
	Wed,  2 Oct 2024 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cKMOAfPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AD210E5D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 07:56:41 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c881aa669fso6867390a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727855800; x=1728460600;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:fnrom
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O08lDxgSZwC02/Y7RyccoCps9zhNy47cXCSDgPSj+Pg=;
 b=cKMOAfPU4B0dehhB2XUUeb5P33LtVnlgth492pzXu2/vjTqOxz/Yxrt38dcLoFvDHN
 8P7lx+/LZGljZ3iPyiKdvTV2SFMbjzjxXKUVPyxceMSRdC3s5Ux99el+bOP2g3bxb2f7
 cmt5ejYUB+ybnpo8JFfB+QdIDgF578ybjBVXvgp5BnRMo+GUHyYBMM56qj//5BUsotul
 YUukECzRI/Z9YQPn3v7nt7gVRBXg8i1yyfAz/v96cJu0+t6yJwBpRKe9sjeYBh7pbVsE
 dZSzoTQFK9CRZbd0N6GYM4WUZeX9vLm8sF5GCcDApzTnxAkVKMeYfJtgqiEEYBXJGlpf
 XbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727855800; x=1728460600;
 h=in-reply-to:content-disposition:mime-version:references:fnrom
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O08lDxgSZwC02/Y7RyccoCps9zhNy47cXCSDgPSj+Pg=;
 b=mBsmWlieoJWHX35n4SpDSKeqEzFfTDDdMyzG/Ly3JXjCXTUyVQ9hwo1pdoza6XxavB
 ga3Xe72hfdJFi3o3fUSsGtuozZhScg6Z200U/fH+PaTUZIaT4F6ut6p+u8SzVEnR7cmu
 fxcnEaxIy3WNkbaYETmWN70dtg6UlNGfBPHfh0z+sT18sYVqI2LDZ4imc3SqBOVim7GV
 ZCrGuIN/b+8E9XHteg3partAnocPY1ah5FAq8/WULPQq0ZlPFOYHUA4mhKqaxWhLeswX
 YuKYkYNde1CQf/lV9rNY1n6SHeoqKEkHH7ALgSPPV2i3eZIptDE+/1aBnD+/eSbpS7G/
 bQvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGK1ee2Bnn95zxzI90PHwHDXHAh5hwnDIqK5Ej0fBKNaz4KOe/ctSHmREfPVBe+WYLdfnJYdPQLUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIRQXmRat/uPbRl1mYfihDnxof7+982E3d2B5N1TK7UtO0YIZt
 vXFoz21qvpccdzGX5PwEWfhyQWhRN8eL84Mww5Gru+DT2YvLzC7q+h5BW0rMCIQ=
X-Google-Smtp-Source: AGHT+IE8u200qXGBAzQDFEPwMdjrSXJqDUZiLWhBJFDgwgHtqmfq6vo4KW4QvXEdgdad+14r6A7rSA==
X-Received: by 2002:a17:907:9281:b0:a8d:555f:eeda with SMTP id
 a640c23a62f3a-a98f81f652amr223080166b.8.1727855799769; 
 Wed, 02 Oct 2024 00:56:39 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm820676066b.89.2024.10.02.00.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 00:56:39 -0700 (PDT)
Date: Wed, 2 Oct 2024 09:56:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
Fnrom: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6erctmsjfjme4qbh"
Content-Disposition: inline
In-Reply-To: <20241002033807.682177-1-lanzano.alex@gmail.com>
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


--6erctmsjfjme4qbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.
>=20
> References:
> https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b9=
9.1701267411.git.mehdi.djait@bootlin.com/
> https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_fo=
r_Memory_LCD_programming_V1.3.pdf
>=20
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
> Changes in v8:
> - Addressed review comments from Uwe
>     - Replace pwm_get_state with pwm_init_state
>     - Use pwm_set_relative_duty_cycle instead of manually setting period =
and duty cycle

You didn't explicitly mention that it's fine if the PWM doesn't emit the
inactive state when you call pwm_disable(). You're code should continue
to work if you drop all calls to pwm_disable().

Ideally you mention that in a code comment to make others reading your
code understand that.

Best regards
Uwe

--6erctmsjfjme4qbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb8/LMACgkQj4D7WH0S
/k7EZwf+M/ShRYq1YgwqZPW4U30npE1K82FqykS7bQJxJQkQVyLkiSYOjmtVqVp2
Gax20mtgp0qxXz7EfAfKkNxJVTUbrK/O261lnSwfGMaXOf4HIriBDcER+MuSFzRZ
MJT6PmB0L+Ariyvbj/cKAUKwvGo8Mtfjbng0Mn3eHFNLIBPsfPT5PYFd7ru11pie
xQhZnUJJxusruq9VUnWFu/9Dqkh+EhSoZYH+sjtH6U62926QbxygpTSu9sjuU/NO
5nkEDUktwwDI01FdtksIo5RtwE1Dme5xYhA/KT3TX8HNjzYQSIEmkiZzu2vG60A+
hV/vo+Rw+hGNL4whuTeh0PDGqUedag==
=7JKD
-----END PGP SIGNATURE-----

--6erctmsjfjme4qbh--
