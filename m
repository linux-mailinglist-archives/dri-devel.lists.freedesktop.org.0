Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4BB875A1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 01:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1668E10E209;
	Thu, 18 Sep 2025 23:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AE6y0p3G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD8D10E209
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 23:23:12 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24458272c00so16524975ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758237792; x=1758842592; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cywbwc8EdUxJw4qdKc7+s9IRWS7iBCfFJYQJGElQO3Y=;
 b=AE6y0p3GQW14b0G/9qozBmf0BICSo4zVEBMINLwTZfeNIJrLirdAWUFx2VCeZvTOi7
 uvqotdVe9JKySBffS6LQ9yaDNbTbhOF5vZVR0q9D4R6HyqWVoyJ4J1htvbahabcr1cD7
 jVRhW6NIyl/yVa4Ck0Pl8jV40JFkRHAYNM2ipsQz6rv5rkA3/KI+HV//Pw4PHPkFX2lF
 peN0QJ6USxISRCSs4EiKEm4foQLdVssgh8nIh+q/0Ch7vEW1pvRUyoIshTA6usA6ZxLi
 pPt1wLPiK5Ngj5rLolPDjXPKoxPZEyy6YDMPQbYwO3dqUgnkyvRrsrXs5aI5ROVNfgTR
 aiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758237792; x=1758842592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cywbwc8EdUxJw4qdKc7+s9IRWS7iBCfFJYQJGElQO3Y=;
 b=q5Sr3uRQXPzKfE+HJr5SpDT3Jb40US22mdkD4OFJhpdOXO60Bxwu8/Lt0VC/cHSMJW
 HVD5iK3he1SqYE6+JumxTzB2XGsV58edmAZdtqm2GbUyavvrAJkzYNAj0Mna0GLPamYn
 T9sNjO3yxvRG8Z0b9FCThbLMWKamdTb38ouupvAMfoaBz3mlJ5KdNWTr2+QYf2Npd9eb
 NxgQH+Z5ZFzjoSi4pxfm7J/jRIVOIDrLoo3vUFUYpIL2htU/2DHw0QGO531Z0k0HOiww
 8EvhpsqGSHAIQ8Scja/SwqEtJzp/y5qB5IQR+WmvFLvlXSreeY91z6jV3MgQLg0ceZl/
 Hviw==
X-Gm-Message-State: AOJu0YztCYG/4rhOXzcU1aePpzxQwh/bjG1VktCk+SLFW47oNcsZIR02
 s04fiIbuV+jU2a3Qb2ucmeAwi2ilKgJWKJhS6nKiu94C6TN5W9pukrMC
X-Gm-Gg: ASbGncuIKslgDdCCt+VqbxarAfkWl5Z7Hb3LZDheUufJd8thiKUCyZ6kyvrqUwlFHqr
 xu+ZYbG9T9RprUVtIBrNyGf8ADh5a+T0GPXPuiTrO9XuKmeprVXD6vG9frcnK414F5b1hPeGiY/
 PomJoLGYd44rT/xM1rK1uQlkZogh8lrbDkWw7GrF0+I1tapYyJHblKDXNGu7FoK8Gxz7J0uc27o
 im5mea1cICRLHF9rWNixi5VwvjUjjyNnI3LtY8UGmgiaNnJA3QYasRzU3shKrcO+NpgDl5ZERz1
 ob+QeR4c5PNagMppBcEjjfHYqkybJZToz86Gj+o7H5OrGPjbe8d7ir7B5V4ACdqBQ3d1ZxZs63O
 Qcp93SWlzgjT/0BCnhugzEpLy8eh+I4HQQP74cQn6
X-Google-Smtp-Source: AGHT+IGpNOwUTJg5vEerN1zVzVrhhiTJaIsAfQYpkwPbjiwSkLY7kk7Blhp0t2/ryk7iJPRhMy3cEQ==
X-Received: by 2002:a17:902:d511:b0:24c:ce43:e60b with SMTP id
 d9443c01a7336-269ba45c0a8mr19654615ad.18.1758237792166; 
 Thu, 18 Sep 2025 16:23:12 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e20bf07c4sm992769b3a.70.2025.09.18.16.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 16:23:11 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 0313E420B4E0; Fri, 19 Sep 2025 06:23:08 +0700 (WIB)
Date: Fri, 19 Sep 2025 06:23:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Philipp Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/sched: Extend and update documentation
Message-ID: <aMyUXCF-Jlu3wAjt@archie.me>
References: <20250902111209.64082-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Qhp/VLK82Ka+Yy/u"
Content-Disposition: inline
In-Reply-To: <20250902111209.64082-2-phasta@kernel.org>
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


--Qhp/VLK82Ka+Yy/u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 01:12:10PM +0200, Philipp Stanner wrote:
> + * The GPU scheduler is shared infrastructure intended to help drivers m=
anaging
                          a shared infrastructure

> + * command submission to their hardware.
> <snipped>...
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job.
> + *      Drivers don't have to be mindful of this function's consequences=
 and
> + *      its effects can be reverted through drm_sched_job_cleanup().

           ".. this function's side effects and these can be .."

> + *   2. drm_sched_job_arm() which irrevokably arms a job for execution. =
This

                                     irrevocably

> + *      initializes the job's fences and the job has to be submitted with
> + *      drm_sched_entity_push_job(). Once drm_sched_job_arm() has been c=
alled,
> + *      the job structure has to be valid until the scheduler invoked
> + *      drm_sched_backend_ops.free_job().
> + *

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Qhp/VLK82Ka+Yy/u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMyUWAAKCRD2uYlJVVFO
ozP1AQC87UKQORC06R0t9sItFjRkRGzZuHrMM2C41aAjbI9oCwD9GhjvSUEkZs++
clAP/8722HiSPJona2f7L3BBaH4cGQ0=
=kNNY
-----END PGP SIGNATURE-----

--Qhp/VLK82Ka+Yy/u--
