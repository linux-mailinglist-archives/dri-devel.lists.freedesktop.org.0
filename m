Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7590EAE3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 14:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BDC10EC84;
	Wed, 19 Jun 2024 12:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M+wsowsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24C510EC82
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 12:22:26 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-705b9a89e08so5671305b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718799746; x=1719404546; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V41/rcWKltI+WknTyeXP06R8W+cGdmxAwRdLK3VXRV4=;
 b=M+wsowsIw07yY0ZtjleJO+gP9gFW/4ja9q3DtiGsrCa6Kf/9dfYx+XP6b7GO9YsB0u
 3QmTBTopOIASjP2kF5NnXEEFApNTS+BpU9akuMHNk8YaZsBDvdCvHSN45LL/Na5nsPQY
 S8Ip0605u7PDQ6fZtfIECxNnS2n7f4mleYDQ9I22WhhCTDLJPZFxd0/q6f4X7EARwEsX
 J7nTgPhCLT6bS0jl71A9jMo8s5GVtE0GlzRbzTh0G4b1MD3Z+BH+tEYS5zDjLPFPoKDc
 JPMHEHCzr1SxKiVbsrGfV7c73Lkzbdq6oxc+aeIBFg7L94H42z/6thDRaAZjsMuQRX/1
 CkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718799746; x=1719404546;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V41/rcWKltI+WknTyeXP06R8W+cGdmxAwRdLK3VXRV4=;
 b=M3tWmcmzcySZ/xiyr2mX4ssW88iPyXW/mJxUHbTg6oVJaUKehzBw1L2Jh5umJqHzhy
 6mYRKiKvv3LPCCnAXiX+7cIyWjIZ8WQquTc1XyDGpUtbsaf5Fm/wxicIwUuLvMm8jZG9
 g9b972LQ4m9y+yCcJL6BiMllbvrgUkUKpPyrYwX5T/q9RLUZ1SFa3Q8dKKsz65cmEcX8
 V8upnSwVBfqNxY0XaK9GLwHn53D0VF4XXSbKJY/A0cy26tPd5OsdsdN+AbQnWwiRlQBW
 ybPxjDl1OWi2D0T9Dj9f6575HbWtrIR4qBLQWBe8becbdFY/Wk2dsa7QkSUU9dibjaLI
 MNgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ68wwIOzhDg1bWMBsMGHZqKz368OEkjO0X7DkKSpjZdKq7OxW4bbdI6FHkKcseaRkQ1BTSvQr1nipxjaDWeK/5YBdR+NWjXsY/T+w781D
X-Gm-Message-State: AOJu0Yz2Qtl7wvoSDFP+5Fc2HPrsFYf6VTAyS4m3Yvd0muboKqOVoCpi
 RhNif39Ya6EF+YTeYARh1+59GX93QIWa7tiReT0gVKEAZp1Yrnzv
X-Google-Smtp-Source: AGHT+IFNxwWmh0mB5nhspfwKH+64F9TJyMuzEuB30lqUIBugcJh/Gng9OTFsOUwuNaX9+aJTaOMbww==
X-Received: by 2002:a62:bd10:0:b0:705:cade:1f40 with SMTP id
 d2e1a72fcca58-70629c3683emr2114067b3a.11.1718799746080; 
 Wed, 19 Jun 2024 05:22:26 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc929321sm10560319b3a.26.2024.06.19.05.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 05:22:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 015D5182522A8; Wed, 19 Jun 2024 19:22:22 +0700 (WIB)
Date: Wed, 19 Jun 2024 19:22:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v11 6/7] Documentation: iio: Document high-speed DMABUF
 based API
Message-ID: <ZnLNfq3QvdwlVD1t@archie.me>
References: <20240618100302.72886-1-paul@crapouillou.net>
 <20240618100302.72886-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wDBpEk9k3fDiQDP8"
Content-Disposition: inline
In-Reply-To: <20240618100302.72886-7-paul@crapouillou.net>
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


--wDBpEk9k3fDiQDP8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 12:03:01PM +0200, Paul Cercueil wrote:
> +As part of this interface, three new IOCTLs have been added. These three
> +IOCTLs have to be performed on the IIO buffer's file descriptor,
> +obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
"... which can be obtained using ..."

--=20
An old man doll... just what I always wanted! - Clara

--wDBpEk9k3fDiQDP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZnLNfgAKCRD2uYlJVVFO
o4y6AQDgOsdarQ8+Hpt/RroNmGj88fc5ztC2ucDL+SFkBMD3egEA/jAq/vCNnHLV
PeVNFq70Fcg7IPBxIcAc0QN08ILDOws=
=7nF7
-----END PGP SIGNATURE-----

--wDBpEk9k3fDiQDP8--
