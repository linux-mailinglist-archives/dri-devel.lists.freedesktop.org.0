Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87485BE2DAD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CA610E9AC;
	Thu, 16 Oct 2025 10:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mVCco9co";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81A210E9AC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:41:05 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-339d53f4960so591537a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760611265; x=1761216065; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LVSu3v5hQ+mkImsLsDrLueW7tnWFr04YL/mKk3BRmmc=;
 b=mVCco9cotbNplo3Inf9gurDgkpZxODkAI2oc/13jy7QEL6STwYSWqd4gCAcGKV3SQ+
 /c4HXkjZSPnTChtrwhG4PtvNjTbreiZWlrHthqEiVZB5kmiIZG05YDmclRanOycE65cO
 4Fhspz3KiQ/LNRmxWl3GjEVocEa8nVkoZLxF0QBhcWtBLPj0bRBLpOWDeVQT16liJ350
 ehjsuCl3tbvmOWLHIU7nZhNe+LkzxI/vyO4H8JWFY/PIs4PqhB3wzi53qmyFGIHRJCEU
 +t8DSdmCaEPN1r9KDAFDyTziZ8Y/kS1074Le0DJyg1JeyDRrV+m6PbTnrWTg7brRHPLS
 ioFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760611265; x=1761216065;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVSu3v5hQ+mkImsLsDrLueW7tnWFr04YL/mKk3BRmmc=;
 b=DQpjm6r4Bq04IWY7Zeyn5WQpnRvbaTo+XOLCbUDnz1vI8JVbKMUClEksCykOV1eXJk
 MUxBvrjH+NdxtPWB8AOe9FumlfDDWtC2Kd6qetuU2sgm3N7rNeb8MqmrfTIev4H4NmWU
 x9V+NCXwxOyqj0xNvqPfmnxMFp2qlYpwZC7tEj0HWUgrASaf4rXHkPaMGFw8pPYgQXLq
 8W7i+03Ls8dtGP3/97vVi1pLhT6orazHV+P35qM4zuomaBwz5+WEo6/VLGiumyle/LBV
 F4CF11wFI3vUqbDfr/5bRz5znl7dly22PNl7GEuQLY4McKIj5BwCJGHGpAnVSEJQ7RSB
 XU9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOAqjNC+T7KmWffFMWEDpzInnhnLgiCcu5skg+f23ayEbeFFkTVTpS+audSuICC20LTJnXLCV/+ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGuB/J4XHCw4Oe+bxcTaTsFzxZUCtydjjtfOHvX0SfPBovOdNG
 eTCprmJu4ThD/i2YstteliLAVuwdmjjuGuYwZlzSED1wq+j/rBgr8ghm
X-Gm-Gg: ASbGncv8Joy3rBmaaja99uI3obEcKZDtV/0ofdnYoK9XJ8SF7VcP6kHb3RE/3cpmB1d
 poq3nrtf5fRgJhbeu5R6NbQYuJJEKzjAqcLCLoMt4yUha3CKfEEG1wbAe3vJtq746pzaRiu75aP
 MKMRWJHj61AOWcR3e3DulmtORPEBh2St75R7pFkKJ30gKlSMBrxv4kqNkTXJeknHLnjI3xNX314
 DjExAe4e+qgNFIBDZSAvDbTijg+yXSfGq0K3wjcxohdxj7D41oSp9vTkc8wsQo3PpXeIB1EFhTT
 S/i61520nYvHKbfXz43FDLSvVk5dLyAcNpc2xG03Pwyi1fwBGGx6LQFF9h30a1y8PV9qUD/rxVk
 lQ2X3VtxIZvo8RUbeCgxiduaphfKKkMrJNVltcF/BGIx5V4W/yaiNO/lEtj00R5zFvcJNdR0KAH
 3HeK2HABWu69Sb9A==
X-Google-Smtp-Source: AGHT+IE1H0Qo6arbd/0sw3nK8Wog5439Kuk67M2dNIEm8atK9BLJ3NAIUD/arp5nW0PclXPHJb8yBA==
X-Received: by 2002:a17:902:ecce:b0:271:b6b3:71ef with SMTP id
 d9443c01a7336-290273737a0mr409664895ad.43.1760611265161; 
 Thu, 16 Oct 2025 03:41:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099385d9esm25928775ad.45.2025.10.16.03.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 03:41:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 02548400365D; Thu, 16 Oct 2025 17:41:01 +0700 (WIB)
Date: Thu, 16 Oct 2025 17:41:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
Message-ID: <aPDLvQaZX7M5D1tv@archie.me>
References: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ldeZ5wTTs5GzBIeN"
Content-Disposition: inline
In-Reply-To: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>
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


--ldeZ5wTTs5GzBIeN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 02:09:12AM +0000, Kriish Sharma wrote:
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index a0979440d2a4..c0035dc257e0 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -26,6 +26,7 @@ following heaps:
>     ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
>     created following legacy naming conventions; the legacy name might be
>     ``reserved``, ``linux,cma``, or ``default-pool``.
> +
>  Naming Convention
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--ldeZ5wTTs5GzBIeN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPDLvQAKCRD2uYlJVVFO
o9hmAQDFQdWAy7dyIyVP0SLEEl2pGTkPA49V3t68gWb/RcemuAD9EEE+wGcnfP5g
y0D3QS10Sw9x4aNHuLSknmnEamh0YAg=
=ADLh
-----END PGP SIGNATURE-----

--ldeZ5wTTs5GzBIeN--
