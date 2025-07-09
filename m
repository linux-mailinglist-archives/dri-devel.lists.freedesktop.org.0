Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40100AFE2ED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 10:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67210E352;
	Wed,  9 Jul 2025 08:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6zhQIDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8877510E352
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 08:40:42 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b391d6780d2so1971589a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752050442; x=1752655242; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lVmwqwXwoXoRLrgQnhk5kpKYOZmo/Np4dRqsnZuNico=;
 b=b6zhQIDaGCkjqqWH8sz/9ANAHUnBHkazNgQtEZl6HA8uwXkuBxg5MKgycaxHWG2k48
 S/Myi1ZUnqDQosUNFJLMg1//GaoEyhKUV8eSKxp17egDFLMQzShbtxk57KyBBLgTyWdv
 qC3UzPJlPD04qk6wuSA5q9KJkTsuFDmm9IAmu048TRn0aDAMjg/nnR5EzjmD84C9Xr5V
 ytKt9IZV6n6VfDWvqEIO8MkPmJtFRbRDKo+XsPQ1UohKzu47Sr/rrrw0AtQ8vF8EZgdr
 Hvv/yXqsmHJaMJhXbH5zGND1OyRG1b4cjnfWKG9YbvJw4jwjGc43H8B6Foay1aEyewta
 tMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752050442; x=1752655242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVmwqwXwoXoRLrgQnhk5kpKYOZmo/Np4dRqsnZuNico=;
 b=lQCzFnMhWr9aghQo0bauDmxDP9wO13ZfQvS3AYvFkaxjt2EKnP5krvdLH6WRy4Ddvm
 gGGhDvG1tqo5VGbNfvHAEVI3kvucKMwVzIHFVUs86/xJDzAmTm2e1kgi4Od/D3lsvsh4
 K44/G0t14tqjKc12xbahXIW3eucPjezIYEm7GSEFVrymkd0xKSjfrlxbEg027XX445wD
 TKbeHSbYqf4ZgkqsNpwjM3pqD22Fs0ZGxAQRztOIZjf2Jt2qKxGuTTN3MEt65eaClDWB
 s8AwJbqfksh4S8owZbhmGeXwtwvxf0xW29g/MFOugYJG+RzUF8NoH5rJ+7/yy2oY4yrm
 grNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD/ieiL3puL31KV496JbaaaCvptZOV7MPWKD4mnc4F9xkO5RpG36YBEYphPXxQ1CIiPlHvFjTxGAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiPkEHoLDvCb+jMcUa6MJ4ZQf1pM6w+UObpj314pP0JzYStrqu
 s0W3qakfL41PO3cq8J7F61fAGqucNjijk3FjkVARYNu1CKlmctJfqFZw
X-Gm-Gg: ASbGncveuiOZRokK8kWYLzgHe+tqzkpPXFGeWVUsWiH4+X4JAEcSs4dZ3yC+D/6Tpqe
 OyTHDYKCFCLl6jEQJmKKkZsEjgjw5UVaiUYJHuL416w5IsIfKEDZsD+PnbVM2Lu29u830MA1YNf
 HjC802rR+v0CeaQq7eERgiiGYu6PY8jUtJHOSC323MoBe3+3EF77xfboDtZ0F/fkQFEGoeVjqwk
 xhUyctYX3quXku+UZpvL3UQGpZ6CdBrvQkIebQGRoqTZj+6nx0k/yjIQs5+fNMNqizGLbxcYu2X
 fgCnPGssNWGwRfJUWHtsfT2yr6He61QlCtYu5OwFQqek+QgMUnlYETWlexII4g==
X-Google-Smtp-Source: AGHT+IGF2o8G1bwQLiGet81gBmlMfqUC632G56A4Q5MAObcKdNhxT/tUUhEvHqLItldI9q1ue2k3/Q==
X-Received: by 2002:a17:90a:da90:b0:311:c596:5c6f with SMTP id
 98e67ed59e1d1-31c2fda079amr3351553a91.17.1752050441904; 
 Wed, 09 Jul 2025 01:40:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c301a95ffsm1414433a91.40.2025.07.09.01.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 01:40:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id CBAAA4101950; Wed, 09 Jul 2025 15:40:36 +0700 (WIB)
Date: Wed, 9 Jul 2025 15:40:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
 usage in literal code block
Message-ID: <aG4rBBJE_KEhkAfu@archie.me>
References: <20250709024501.9105-1-bagasdotme@gmail.com>
 <aade485e-0880-4c68-9b37-d8a27dc122e3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wFUsWKicYRt4Gvv7"
Content-Disposition: inline
In-Reply-To: <aade485e-0880-4c68-9b37-d8a27dc122e3@kernel.org>
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


--wFUsWKicYRt4Gvv7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 09:37:36AM +0200, Danilo Krummrich wrote:
> I assume this has to go through the MSM tree?

Of course!

--=20
An old man doll... just what I always wanted! - Clara

--wFUsWKicYRt4Gvv7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaG4rBAAKCRD2uYlJVVFO
o5vdAP4zYQraYcWZ5417LKimSuB/iobFIALeKUn0bIkGLhZxFAD8DstYb43X3+Wr
oHbq2TC0/1xxUZP7Zx51Yb13YIsDlgA=
=oNYA
-----END PGP SIGNATURE-----

--wFUsWKicYRt4Gvv7--
