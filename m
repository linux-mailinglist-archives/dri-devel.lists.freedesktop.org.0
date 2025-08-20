Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B3B2DDFA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8665510E261;
	Wed, 20 Aug 2025 13:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OBPe7+Qn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B0910E013
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 05:18:08 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3234f8df749so519917a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 22:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755667088; x=1756271888; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2NuIlexl8sKdTpa8K3Ng1YH290AAfgSN9p/5/nsGJ6c=;
 b=OBPe7+Qnyp3CNS+IpXy1hzhuiCjOOp4k+skFFg6k9EiXDoOa5AwStSA1ySEAM9RKlj
 HBe+lhl8pSagPPLdeANzfbhtXXwRsmoAHCO3QxerN/b+S1yLsBkFmlBCKgpql9yBcHJC
 yj5VnGCWE5uUZQddEBbyMuZfjEqQHoRQaOdIxk41unDjM7w8+6PmLuPyhVvkgf6wvwVc
 XZ2K8q24K3PMIprnaPjZImIYKgkEv0JXFpN1mpwfbRtHt5IpcMwyIlrYknL2Lobjvts9
 AbIgmyhWn0x0tZjD51GTQWuMaTmsct2VdIP6Bmo1oiFTtjIxBHdicODZsapoxb5mgzWv
 TSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755667088; x=1756271888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NuIlexl8sKdTpa8K3Ng1YH290AAfgSN9p/5/nsGJ6c=;
 b=ljkUt+eXofa5oFYQEh+EOtpOXZrbZpdZ/kQyx3X73jp7nZJPVwCcgsGRXuUYSDfLME
 U7Se145QXjaD2OrX1tKeKXfJ5AZdPWpy2OhAtKqcoUA8ecYX9+vV2CHoOD49NV0f8d3e
 H1RE3uuVV5tvaT8CXt/TRUU3O4gT0qKp7ULtkB461NzaggBDqxJLQZYp8jMzWrT0G9pd
 y83dxPScJfFphdvGGEgWopba6gf2W46Vr39Z0n7HV8Uwf8OPEU+PWwhma/JON6nhBLjL
 wPq48u9Ayze2fD1+f7DmSSKMXPgnj/9r0yLjtH6Wrsqkc9R1zQDwSxoDpAqB52J43gKb
 1hMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7SKMYv8gI5jzP+HzRybThe/ClEP3RmgWl9S39N/niGGsDMyvhHZRtf39q9QXQ+IycvlgWEYrFZxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3fpEvxYBdczaU4nP/qcSL4HuN8WUViVCN8hmzLUXrRmbEi2Ac
 5esPzpeOQROqpIfEz1VwxQ1QEM+7k6sE/iWA3qK8GjdDmZfGH+8tpssx
X-Gm-Gg: ASbGncsSJnI3tZhcGXWwhvxzVNISSLc4kCg+UQYnnAilr0dW61T75Wnh1Mc+x8g8ddn
 QXwS/OtNrxVNCBqQSzENO2ZdfYdTyYZrQRydMwTB3Mnr/+8Mg5iVeIIQzGS+yxaomI8334HCWSc
 x3k2wdT0VMk95qQ4tRZgxDvWXH+A8DILCxdv5Px2rCPu6Sj9ioO0tyCbKSLcw/cDMC1KDzQEbWd
 5kbexDjMPQLy2Ouq335x7gg+6dcUFKlPrDPlyUjQvUeZpiWiGVyWCDtaPtW/s/BIaMdWEPUXIZt
 v2E/yPMMMKmX6lcTW8slUfc3mpqiHpE7KPa34JM/Z9PLXx7VZbk9nkEvCI+v7im6G5WuK+8jxPz
 aXwhUScfKUb3LCflbslnSdKHVE2J51rg=
X-Google-Smtp-Source: AGHT+IHMD1LcX/pupFGgRrDlklcZoViMXprsqGd+UJfEK6hegF2tXkrCHXzy/74dHLRMWkAbHXwraQ==
X-Received: by 2002:a17:90b:1b04:b0:31e:f30f:6d21 with SMTP id
 98e67ed59e1d1-324e1178c04mr1315233a91.0.1755667087796; 
 Tue, 19 Aug 2025 22:18:07 -0700 (PDT)
Received: from hobbes ([2600:70ff:f833:0:8e07:c9e8:902c:6ffa])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e250eba9sm1003418a91.2.2025.08.19.22.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 22:18:06 -0700 (PDT)
Date: Tue, 19 Aug 2025 19:18:01 -1000
From: Joey Pabalinas <joeypabalinas@gmail.com>
To: Nai-Chen Cheng <bleach1827@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/display: remove dead code in
 drm_edp_backlight_probe_state
Message-ID: <aKVaiRpULAGceEMD@hobbes>
References: <20250820-drm-dp-helper-logically-dead-code-2-v1-1-34421f4a7442@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fxN+yevHhckMWmys"
Content-Disposition: inline
In-Reply-To: <20250820-drm-dp-helper-logically-dead-code-2-v1-1-34421f4a7442@gmail.com>
X-Mailman-Approved-At: Wed, 20 Aug 2025 13:38:50 +0000
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


--fxN+yevHhckMWmys
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 10:30:31AM +0800, Nai-Chen Cheng wrote:
> In the error path where ret < 0, the ternary operator "ret < 0 ? ret :
> -EIO" will always evaluate to ret since ret is guaranteed to be
> negative. Simplify by directly returning ret.
>=20
> Found by Coverity(CID 1649044).

Acked-by: Joey Pabalinas <joeypabalinas@gmail.com>

--=20
Cheers,
Joey Pabalinas

--fxN+yevHhckMWmys
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEx6b1SGGPTKxTmPDYqoHu9CTxowIFAmilWokACgkQqoHu9CTx
owLvWA/+OO8g6BVZk+PAWFYiWYD3imnpadaeoeKx42wPLV0y7LZrR9uZ1G+dCZyU
BCmDPq8FI+RPvV4mocggajuHvaU/ZtISUJ2C7gbIK6mJtl8SpyNe+DWPnOdo6euI
D2Y++3ds9im824TWlMTZUo9OkycrQCXYG3s1d3xftQjcqqmw/oZ96K4SAAyRQP7w
VnUQAhh562U6gN1rlCrwZSuyHykCoFyqSkZ83VcLt7RpDL+3oP4gagPN/vhiFcBt
+7qPYRsPBJZmketrhMOb/iS1a4IEESGzeezF3yZ5FpCcpVpLS3Ajw0+n/aLreGc5
/eJIolvhHGVenIjA0Xi3WgoyP9h9Zyj8fOJshhbtQ19nRBMe3ZSxn64PPNGHxbUN
L6jCmuDFMsCJS/Jqx6x1IfHbs/Ont3orkTwR1SJTRzt120NVN65RbfQMeU4MhZQY
4C+3DVi7BULnAduseq66qz5U/qA7r9s//8YpLDn8PW7UC5cjQHd2JcWmeSeDLJUe
LqCOB8jAFy+AO9rCpBrrhtE26dUeAA/Dl2XbOuns/87Oo5GKBamuDY2MCwhJbaw0
Z308BOM0TdtmOzsO7C4tYqQoG0/fpa7vXUXSrChCcq7NLoK+a9JrUmlXG2wwhjzI
f57T2lvKSVXMdPmBSgg64rfNAmpkT+AUN9BQxSCQSkWUAKnbARY=
=K/q7
-----END PGP SIGNATURE-----

--fxN+yevHhckMWmys--
