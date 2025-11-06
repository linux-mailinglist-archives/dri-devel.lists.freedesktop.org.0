Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C455C3A46B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B81210E06B;
	Thu,  6 Nov 2025 10:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hTtKCeyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A8810E06B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:33:20 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso481220f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 02:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762425198; x=1763029998; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IQipCRpVFfui25dKlyIy/WSGyJHEdXiJ7zhFimN9ZT4=;
 b=hTtKCeypYltiaCN21eZZ2pJqhPrA575aQxu4ISVJssW8+o9WVBb9R6ueGKwf4wazZR
 TqMCZAz+znqD/uxzXbCfC8+9ULonOtU2LdjuAF2G+DOeE1bfNNvJRy053buX0D28pZio
 ip37HvRplg2mJesqtIh40sPTDidKucfmkktQrJoD6UXDhnBMf3SZ92a+fDck0+MQwedr
 bKoCqHgo5Gi55Z6zPmbyZvXyi6irYTtbgRS1uB6hMt5kglb2oBSpn++84m0YDYrOMQkG
 e/nANOaRwT+WPq+WcFGFFze1BCMLMVyyRMoCd0nAArILUJuQc84XJ8vQLAss6m3GtMFo
 wu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762425198; x=1763029998;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQipCRpVFfui25dKlyIy/WSGyJHEdXiJ7zhFimN9ZT4=;
 b=wblxtq6hsKMsLe++1BihVUKs/Qr2I9A2Ins6pKMCkHNY7REvLyFKKJ76P5s9EgMH9G
 y1yyBXl8ebCUp4VnyXuIy+MH6Z1CzRO+g5lT95P074bS1yPMK028tpOfdJ+I37dKkHtm
 /QRiXabkYr2KGTtgyemSqqmzzvGefc1koFVHdg3GiA/MQcsczf/E5cyi6HSSUtARjT5S
 sI6iacmE12RpUwWZUJZUXIfwOFGH/1BLc6YNpyW79Wx7p1rFW0FPO9lom2WfTsJUFoUT
 8WO3QJpe285inQLO7pjC3YWl4m1qZJtDJXzvj0bCyPyU1vI6qzkp1gDsDNab+4ay1ggT
 b6Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4DMooz8Aa/ztUUKqPFyVJC6ynpy7CjOiWChmuEv91edspH9wlLJShJg9sGrd4JhnPXQByuyo4Ys4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwPf5JpRfmaafO0+Xyw6irGsG9xoF1BbPlNUvxPvzMyyArlTCH
 zSLmzjB5AZiJit9t8sA5mUvCoavmOAZoRrysOK+SptYoQldQJPDcS/BF
X-Gm-Gg: ASbGncv93jXZxaf8QXSo6UePFkjP5+5uf05CF7PMn1IyWakFm4cX5sP6/emAWq1ZOiU
 P0/oVRjQzDw3slGSvKzMuizmRb7g7lJPN9UsSduTp8DttxVPOKigxSIojeRUCcvYZLpQTEgJPyU
 72g6qhamo7h6oqAVypf0jniSi7jGxZij4B+rKWRvAhupszBLWC9YtiHXECVwNIm4JETqGCTsUKy
 yGm8QCnBFpAByKoqbZeR48pjKfphgR5IROxBLYxYMdKc6oa/isb72koJjsUQPgNBJYbre1IFRtn
 0oRwKeOjRnr95Ar/EYCqQKElK85/2JupTiPAeeA2aMkNtcnWkHhuhZNYZdRQukM+1RyrDsQo/JK
 0Y7MaZi67HmVLRLAriHzmdw+okTbBTu13a9Ujlohz4ZXoXsVVcScwXy2DD6LjtE/ZlL/yrRyOi+
 WtuNLMZiPq4Qp0+aykoPEYMA==
X-Google-Smtp-Source: AGHT+IFtY317gqE6KkPCPF8CEMqlY4XSqSHpCQgEggJ0wgh6u+xUqljo6I5F0N5V/IXa3Sh4CqPFig==
X-Received: by 2002:a05:6000:615:b0:429:c9ab:2cb5 with SMTP id
 ffacd0b85a97d-429e32c817emr5341842f8f.2.1762425197999; 
 Thu, 06 Nov 2025 02:33:17 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb403854sm4173231f8f.5.2025.11.06.02.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 02:33:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 046AC420A685; Thu, 06 Nov 2025 17:33:12 +0700 (WIB)
Date: Thu, 6 Nov 2025 17:33:12 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/ttm: Fix @alloc_flags description
Message-ID: <aQx5aAR3DjengjVt@archie.me>
References: <20251106005217.14026-1-bagasdotme@gmail.com>
 <f935574c-67d1-4a7c-bd8e-e9dff7aa97ea@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rmZmydHKAYCDjdz2"
Content-Disposition: inline
In-Reply-To: <f935574c-67d1-4a7c-bd8e-e9dff7aa97ea@igalia.com>
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


--rmZmydHKAYCDjdz2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 08:28:15AM +0000, Tvrtko Ursulin wrote:
> I assume no one merged it yet to any branch so I can push it to
> drm-misc-next?

Of course!

--=20
An old man doll... just what I always wanted! - Clara

--rmZmydHKAYCDjdz2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQx5ZAAKCRD2uYlJVVFO
o6KUAQCdWlX+bS8tZGT/WzXuutPy13eM3ApLgSLVthbWq2XiFAD/dr6KLftQULXk
HX5cf0yZ85lJ3S9nW+31ZKHhTSUppwM=
=gYHU
-----END PGP SIGNATURE-----

--rmZmydHKAYCDjdz2--
