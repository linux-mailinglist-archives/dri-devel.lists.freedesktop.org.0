Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40ABAF66C2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 02:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB12010E7BC;
	Thu,  3 Jul 2025 00:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MglBywUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA2A10E7BB;
 Thu,  3 Jul 2025 00:25:29 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-af51596da56so4841149a12.0; 
 Wed, 02 Jul 2025 17:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751502329; x=1752107129; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NSLzIqO90YkPCol3RRrpeMNsBThgzqJUNZzQMcg/9E0=;
 b=MglBywUaJajVaypzwrAYHWUDgbPJfi/8upAve8lAXhtzuB++y+Ulr3HZNmwHnlXawc
 FrAUcPzXt88Q3HpFDZj20n8HwaPWv2MJozAMP1+J6z+TN+fmFW/+661tZeDys/wj+l9Y
 CcdPM6WNPTaYuJ+Hy4BCnEt2EnLAJWi/Sr2UMOg3X3DU1T5LQ96aODoxDREe+xnrXNzH
 h6NeOYw4Ee+/VW2KDIFXzqGKjP2xKr+noIr5q3bQmjZKs3PuIKZDvS2u+d7vCByABM+a
 r9xP/yVUMDukW2ApTEb8ZrlS4daGDZX4p/2CMeI+wwmOk8ze8Z4dfLRgzUIFmFpLJUOM
 Vk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751502329; x=1752107129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSLzIqO90YkPCol3RRrpeMNsBThgzqJUNZzQMcg/9E0=;
 b=JsscB99Zr/3EWwaQ0exVzg8o7msDV6zG9mKTwJLr8ePBM1w7xiHbv5aCcX0o5lYQlE
 tR87Me5+f6CUPyFZCEP0U0aQt357bhpHmtxHdItP2EPb6sNIj2TpGLGM5Qb3VDIPBsdE
 p1cpqH08lgrF6JUr/TxhuQw/ZQj5GY1tXd1tilXeAEFcmCtXJtMA+fLiY34xLCtaAazc
 5xlOzzV7ZbxAYlDg7l9jBjX3Xbcm+F1ngMpQSYqRMy4PQhpF80FJ1VdkAGtNXKDtMHd2
 HmhLlZYbAwH2zWC0W4e6XRfvExRB6f5CVOI/HKV5Nza968kIj1Soiow6RZ7y7YGSLdq/
 uXMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc0NI+zM/k+4Z5ined3A1GNpGUjRLOXE7Wq/FlJWYaFEpuyKaaKsTku/7Lo0PSSfyN0ftp/9rQjjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJGBkLlt8KDJxUqUm9rIA+Oo6PnekGzYBElWX3DywHvgmJiFQO
 keee6g9+jVe5Mhbg3qEbdRy7Jt2umEANyX2WzSlE6biI7iOIfJ3jh1nxcJN52Q==
X-Gm-Gg: ASbGncsStgNWAyH1iRPIfEMob0x/IGuLh8/M2Cahny68TclYiSO/FjfNOxQDctBkz53
 01wKfASiIehrP/zm2c/hXGVNEZfW5GMjfb+akSqLE4vdA/fTtxudiBc/M1huDMpVsipK66EmXt/
 4S+tQ74FiUAxAYdS5iFPgROmEVTDcDmBtEKmtVU9bmtyTWBP8BM8v6H7NBtAfp6LZI5xcnVGiZ8
 5HPw89tj4RwvKbzVFb+9vCTzD93PwPi4wqp17iYHF30YwN8I48BwUVXFYFL7na7rLKFLDXfCQoR
 W1MtQo783CNxcZdl+p2MdBwIKp05KCM/vepJShABlVHbo1lRwnO0V3jdX3NFJw==
X-Google-Smtp-Source: AGHT+IFjsUoYBmLh0X886pHpGqMQ8Rzj9r2662mubW8hFdwnbM8UjOnwwpMzrtrSu1OAJYGsoZ2aHA==
X-Received: by 2002:a05:6a21:104:b0:220:1ca5:957c with SMTP id
 adf61e73a8af0-222d7ef985bmr9329384637.31.1751502328716; 
 Wed, 02 Jul 2025 17:25:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57f1ef1sm15687041b3a.164.2025.07.02.17.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 17:25:27 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id A16E14206887; Thu, 03 Jul 2025 07:25:24 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:25:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v3 6/7] Documentation: gpu: nova-core: Document fwsec
 operation and layout
Message-ID: <aGXN9C_ouM6ylzyf@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-6-f362260813e2@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3EAk4poTFdusGnth"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-6-f362260813e2@nvidia.com>
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


--3EAk4poTFdusGnth
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:43PM +0900, Alexandre Courbot wrote:
> +FWSEC Memory Layout
> +-------------------
> +The memory layout of the FWSEC image is as follows (this is using an GA-=
102
> +Ampere GPU as an example and could vary for future GPUs and is subject t=
o change
> +completely, it is just provided as an example):
> +
> +Here is a block diagram of the FWSEC memory layout::

Above sentence is redundant (as it is implied by preceding paragraph).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--3EAk4poTFdusGnth
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXN9AAKCRD2uYlJVVFO
o7TTAP9xUUoDhtQRYj0Qu6Zz2laGb+FXpuJd8JcCBV+0OSY2HAEAk+mrOqjJ0RCF
ch68VLOtkWzBsPK7zw9sxNMGVFYBYQU=
=gaWJ
-----END PGP SIGNATURE-----

--3EAk4poTFdusGnth--
