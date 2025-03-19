Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA45EA683DD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195710E281;
	Wed, 19 Mar 2025 03:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nKWnzbs8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791AC10E281
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:44:14 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-301493f461eso4611911a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742355854; x=1742960654; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LmrhgRaZQ2esJD5Ee8Q5WTZMqeQvEp9WPDtHlhFhYRo=;
 b=nKWnzbs8fQvbt/GXr+McDmch93Z7NQDuNwiZ1+VL5uqiGlaCX0td+0WmD36NsDudNy
 AO/oXEjVdfHxdCQZOjYjZ0exrw66+SAnD/46zg+hvay+zp+qYvHyET1PdKx5tQVthJwd
 R28m2BcLNjZItb7/IJ2xq33Vtbhe6X7/SCvbS9ZXl1Yp1LkAs/y3E0j6rEIdYZndM23V
 sGWdMvoR+NU2Wewr6bJ7WUnRVKGctHWBQIGy4gyO6U3VRHPZW8zYaa5FLtMRj00TugTB
 ILT2Vc4ht+XPpdcMKlYemOXitnCWxIzKLV+Gw4FRfQTuWjfebnDG1s6849k284SIna15
 02HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742355854; x=1742960654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmrhgRaZQ2esJD5Ee8Q5WTZMqeQvEp9WPDtHlhFhYRo=;
 b=U6hCnpNYXa0zdk2NhzIsLVcWhI4m/rXFPwApZ76VM6tftcYFstIU0EJZ8DPAHLWyJV
 +3/1wB01/pl+ERw8y2B/Z1arCkTJQFZtGRTfRff9SbNS9xhmCeEB1n+ZdhnTmXE5BUQU
 +l0/c4mC2Q1Bh1sJMQ8EUP3zw2ncrm6M9xAEeUEU4Wgmb9D21JKuTHEw6Z7UOza4pG4S
 ySC6nJ9DFrTbSpKFUe9EhPCASqlHENr+Va7x81dy1/SGS8BF9jW4K8nWYcLHSzZcyqsR
 VGMAnc3G3AqMcoU/qsN2fkVwA4w8ZoMN9m4vGO28QEOM5yiCBYexOw95UYUgFNX30Ttm
 xDmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPwjhJuvZw4qDo8X5BBw64aaZL7Oz+7w92lBf9dWmoORekhosFApcGjcduy3KB5cLl2Z2r+2i4JOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFmrCKksZ+Lj3ceyii5d9yEpuCumpcsl++VYI8t1+x6WNr28F0
 AgMpp0RqY1MzJRQDwIzntg/5cs+sqRTISUewPtD1aJTS6Y4hWCIw
X-Gm-Gg: ASbGncuqm+vegGor1XfVIQBNxmeGZkRWZtf0iG5B62ECvppi0++aFMkgBEZdZ495sFb
 lmRE+K80j7pZXs7RkBpYMl99XusdKG6PMNb92KVWZFY0eeSzqsT62+enXFihew5S/ghHLdfwHMH
 x5CYS+q23lxaFCd5PqiX00WQFKIsoPF5sKKBWxnQ9InUNxKMPRvPgvae4LBZCys9RfRY68XMOiV
 KGxbVPszQBE0CQzber+nbP24fy9sYpDwc9+hK2OkdPPRJhrDkk2b3n13YzUjzYXUpugybc8+5Ui
 5zH4ibHP1YI9vCUBTWj7hJu3v0mESYymXYibSYvKQ/MidsSR2Yu3CJA=
X-Google-Smtp-Source: AGHT+IH/iT3MtS2ax7POPPW1zeTwh0K1LGntWioMM24k31dXIZG9jeCFE1wxGR3hbW1JG1oYXmT3uw==
X-Received: by 2002:a17:90b:1a89:b0:2fe:b937:2a51 with SMTP id
 98e67ed59e1d1-301be205ce4mr1756074a91.33.1742355853746; 
 Tue, 18 Mar 2025 20:44:13 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf59cd49sm365744a91.22.2025.03.18.20.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 20:44:12 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 167FD424184A; Wed, 19 Mar 2025 10:44:11 +0700 (WIB)
Date: Wed, 19 Mar 2025 10:44:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: Re: [PATCH] Documentation: vgaarbiter: Fix grammar
Message-ID: <Z9o9iri2uUCoIxdK@archie.me>
References: <20250318041249.20786-2-bagasdotme@gmail.com>
 <87a59icsbw.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JSr2fAOfACuQ+50l"
Content-Disposition: inline
In-Reply-To: <87a59icsbw.fsf@trenco.lwn.net>
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


--JSr2fAOfACuQ+50l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 08:43:31AM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>=20
> > From: Pranav Tyagi <pranav.tyagi03@gmail.com>
> >
> > Correct grammar issues:
> >
> > - Fix "co-exist" subject-verb agreement
> > - Correct plural form of "server" in context of more than one legacy
> >   devices
> > - Use passive mood for intro sentence of libpciaccess section
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Link: https://lore.kernel.org/r/20250220164946.18007-1-pranav.tyagi03@g=
mail.com
> > [Bagas: massage commit message]
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
> >
> > I have to carry the original patch [1] because DRM maintainers doesn't =
seem
> > to apply that AFAIK. Jon, would you like to apply this patch before the
> > merge window in case DRM people don't apply this either?
>=20
> The DRM folks manage their own docs.  I'm certainly not going to
> circumvent them during -rc7 for a patch like this.

OK, thanks! I should've post this after 6.15 merge window closes then...

--=20
An old man doll... just what I always wanted! - Clara

--JSr2fAOfACuQ+50l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ9o9hgAKCRD2uYlJVVFO
ozPKAQD81lszkWgPnWn6sjb1ZHh6b793Xx5tEtNM5I22Gh3qFQEAghGlHKJouvS4
vC7T2IcOxUIPNRvEi+MLHCsLIOMaRgA=
=woq5
-----END PGP SIGNATURE-----

--JSr2fAOfACuQ+50l--
