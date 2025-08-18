Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F3B29935
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 07:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B5E10E1B3;
	Mon, 18 Aug 2025 05:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hlr8iV7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883FD10E1A9;
 Mon, 18 Aug 2025 05:56:09 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b47174c3817so2718577a12.2; 
 Sun, 17 Aug 2025 22:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755496569; x=1756101369; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KDnEbrSfurZQ+Y1DvjkMBGJWcaizeGgNKLPFyaBX9ww=;
 b=Hlr8iV7F7Zo3+wri8aVZeap/Efohr5h+csZkzDt6yYSmiiQv/D8/h1WvCTMe0kmCDD
 lBrgywO8F3xBwss6GsYM6PSiaC7RCk7v3Z33rIxVsTcdzL1Q5ptrmuuWLWTrspIjhE9z
 fxgwELDAbMeIp4jFElPyDz1DWUgANjS5TnMPbStd2Jtki/yRu/mIPbLBPNDxqJvQ+0V0
 pGCeoVVFRR6qJYt3v2vbxb51aXorka8Zn96MAcRQZI8ra76jSBDAMtc/RwbfHsrFsvhc
 0tWBiJPsEOrCCjyoOEUMGG1OYVELB15yHkXHwCINZ+eIJ+aDTeBJ/YfBA4m1oNxVAzQ3
 67Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755496569; x=1756101369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDnEbrSfurZQ+Y1DvjkMBGJWcaizeGgNKLPFyaBX9ww=;
 b=jF2m6LYmOp2i/ydU0UVZeDZXQwJWEqHtKoAjbrjswgDOvsQnwNf4VThYpe8A5Mu8Ni
 bpwu/xgRKazOKIb5RmRpWXsMZ9SlxxZ0/R/Bx+FL2JwsfYAzcJzcfuz5htgHhCinwn6o
 pmlEsdgU0gCJCb+ARxy+QuKZtWjWrZEzCUo2aOkyaaD4JdPMkFojTHxEdtkuObyHDkhP
 XC6d9R1eqmfQ/U0cqPhNkS2Z5hMtxNoLvC2HWUX9/eTfrZvSeAtAzGMaXS+DWOUpG45E
 j/B7LdTH4J4uD+fAVvqx07KUn/rzWAyvmNqnYD2TuO28j4q8KU3/10nqnCrJO43Y2cbA
 kbcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQwDJMs0IPEsWCzppcLoaKP5eMkFChzQ+mhwrol9WcO9rJym80W3xAFEQYNB42gtLweig7WfmbkPE=@lists.freedesktop.org,
 AJvYcCXrpBNWOwTw59cUV9oo3m23UY90MkCtIA2Fo845Ha++m2vgiZsof0Y8T5BzCIcup/t6corYrbxZQpPP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyolwXok7ju1fyeWgaDG/S4LVFm5l7E5rhOUPSCvz+OICUnB8SX
 CaPfArztN1EBSnPEf2HQ742QtrC68sWiABTL4SGZAWgmcIS8rgUKKh+l
X-Gm-Gg: ASbGncuWSNWL8fs9gNDDTQsq3DvurZD4EmnxvCbMFW1v1lRYokz5B3HBYC5smIPiXIA
 pHDczKO6osp8fxg9J0jnt0TpL+AQHzc4p+pbcP8N0fMANxWyCN4R5ZMUCGv9TEcR+Yo9jNl7HIJ
 EL8YEHGkxIYJe1xxDs8dcSqxcjfUgAB/moyiNan0JOgSmVy73PP9Ly/IVUybH/KGDVbViNQH8MZ
 mlClxC9tog0vfslJF44vYCEXfgnwzUzr3W94/O7VgqUcwFiBNQfUunl9WSg52WDdP3pq64Rsa1M
 nC/wHfPzDOLh/MPdsmdQvUbXevgyWNqt6d/olspi2Vb6TZt5JCsmPNtg8mouR0R+az0iSAGTrFc
 N+WVQ31TYGTXEG8ZtUeqILg==
X-Google-Smtp-Source: AGHT+IGrZb2yXUpDByWXrf0RogRL3wdxGrw6LQsIafOIhXImWcKlQrD4Hqci3k0Rb6xnexOYz1c78g==
X-Received: by 2002:a17:903:3c6f:b0:23f:df56:c74c with SMTP id
 d9443c01a7336-2446d715b0bmr129857355ad.14.1755496568819; 
 Sun, 17 Aug 2025 22:56:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d57f12esm69189155ad.157.2025.08.17.22.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 22:56:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 14B60459631D; Mon, 18 Aug 2025 12:56:03 +0700 (WIB)
Date: Mon, 18 Aug 2025 12:56:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>, Javier Garcia <rampxxxx@gmail.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
Message-ID: <aKLAc27XGAadB8n5@archie.me>
References: <20250818123853.51aa3bc4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ys5Z0BDSBVttoXV4"
Content-Disposition: inline
In-Reply-To: <20250818123853.51aa3bc4@canb.auug.org.au>
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


--Ys5Z0BDSBVttoXV4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 12:38:53PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2446: ERROR: Un=
expected indentation. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2448: WARNING: =
Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2453: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2457: ERROR: Un=
expected indentation. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2460: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
>=20
> Introduced by commit
>=20
>   6cc44e9618f0 ("drm: Add directive to format code in comment")
>=20
> interacting with commit
>=20
>   bb324f85f722 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected us=
age in literal code block")

Duh! drm_gpuvm.c gets tangled...

Danilo, can you please drop my commit (and kept Javier's one)?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Ys5Z0BDSBVttoXV4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKLAbgAKCRD2uYlJVVFO
owDKAQCoKfhqaU9MYn5NO39SYn5JIOoZm6yD0EQIjQ8QNH3+YgD9GtPzY2zmWOwU
dNDspoFrAULfH+otQwwYcVaT6w0F8Q8=
=+vhx
-----END PGP SIGNATURE-----

--Ys5Z0BDSBVttoXV4--
