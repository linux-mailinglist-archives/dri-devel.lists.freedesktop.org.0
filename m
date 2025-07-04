Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F74AF8E06
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57710E00E;
	Fri,  4 Jul 2025 09:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SZocJEE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2609B10E00E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:16:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so6826545e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751620598; x=1752225398; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FrASRedBj3qOuU4Lr3oIf/QtQ7Obhd71IuXJYVppfjo=;
 b=SZocJEE7+lCvwT9SpGu17C7Ivk5WUxF6+nEjgoiocHa9SRn0fe1BYiQCNtHdylIY+S
 Daa4wxJPWtXmnxMHtgBdXNLFFSG5TJKR8oafF2iogOJyTMVOozgw/3bre3DKEkorOwaL
 S5wrBpzhFkFTUTmD/x/CN/INOkft4XOPEivHbTToO6AVBWpBCxKeFNQbTw1bIFaGZpUe
 dGTU1F4s3Rro8Q7xTTAOJd9Qc+rKSEnzDdhi7UABKPLonsfh4fxgvUcl3qsl/ekG2G4d
 BknCjaDwa1lVi3iua5juKf2ZySCY5S73gTgT89wKCxX5xVNXltevcp7CZE5mCAzdE6cN
 RNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751620598; x=1752225398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrASRedBj3qOuU4Lr3oIf/QtQ7Obhd71IuXJYVppfjo=;
 b=h2sqDvaLrVy1WqoED3WMiow2EY8pdf6zkoGlkb5zJWGv7qOHfo6fIq1ZFRVm2bCt2y
 sNSXQRxd2MlEwo0bfuqCFoayG3jHudmUUmj52Bkj2GducCbYYZyir0eNHkPoLVQGAEbI
 NJ8iFg9Tt7Yar0VZbfOt7c6tqP8mjXozsPN7BsRIPtB0/nIlY9Z6SdA7EPk6xJkevfar
 Hb4kuM5hDSIvs5cleuBPz9FZMY2EfKlqQo5L8i/tb8frO0vdqCkekZ4fLYo5/A/guT8y
 rgt8lCvyz96/Bx5AwwJ4Odt0Q0WWbrJkGAJI4cmVFx2zvh4W67L/ZoNX+SDPrSqQyH37
 Km7g==
X-Gm-Message-State: AOJu0YwnzytLTJqJpL8lO58DwChXYuD8runDXhVdGTFYqhETOsNsAB6p
 b1msCsoekvG57YDCJr8YVKM0Q3USJggxiJEJxLGFUNZOKxtnTRGZXgFIw2EYGA==
X-Gm-Gg: ASbGncslaUavDQuZvoQIMwPnI1YamBXEeV4f3Bk7JQiPJgwiiOc8F0JJJqhzwOmecZf
 /dGlOS2+g0T+G0J9yUFXSUJzEbQ6P1rp6NSJb4Ho50IakdDgWsy2iPaUX96pWH2/h3UI48Qlf+Z
 TlPXy+bbtnpBcTE9nZ0ctB+zIL9+T59dm9N0aDpMI232F28sYwyz/m6zzI5dtkjt0nVDwL6kWpc
 JkWXxO8Esa9cAWPfSSUdK+OHh0docfJeaHdISLUXF8jpN8StNE/O37oUFcwXztxxkKfJcIqMl5i
 nENjqfRm4DgGYqgulATr7DYKVPM3qau71pydeaU/EtVfc9rxzS51l6jOJyoukVhDwufiFykxgmo
 CoXiHXZ3Uzs73TYLCcc/l0svtkfVK+UPx9CcSWKYbgfXjD5O3
X-Google-Smtp-Source: AGHT+IExoSHUzRhz86JAP7f5Iv8dXYAnNcjUlnz4mnvSpomXoY2GDkuUNMtNR/YNZ30kfGG/xqsY0Q==
X-Received: by 2002:a05:6000:2dc7:b0:3a5:75a6:73b9 with SMTP id
 ffacd0b85a97d-3b4964f4d95mr1407226f8f.11.1751620598375; 
 Fri, 04 Jul 2025 02:16:38 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030bd42sm1945202f8f.5.2025.07.04.02.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 02:16:37 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:16:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH] drm/tegra: nvdec: Fix dma_alloc_coherent error check
Message-ID: <xjtnrvbh3dowjhmgrtduo4dqiah35oekbgqc35bdzexug5lmue@kqh6ikyesurj>
References: <20250702-nvdec-dma-error-check-v1-1-c388b402c53a@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5jbhrvx5g2niyo7s"
Content-Disposition: inline
In-Reply-To: <20250702-nvdec-dma-error-check-v1-1-c388b402c53a@nvidia.com>
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


--5jbhrvx5g2niyo7s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: nvdec: Fix dma_alloc_coherent error check
MIME-Version: 1.0

On Wed, Jul 02, 2025 at 11:08:07AM +0900, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Check for NULL return value with dma_alloc_coherent, in line with
> Robin's fix for vic.c in 'drm/tegra: vic: Fix DMA API misuse'.
>=20
> Fixes: 46f226c93d35 ("drm/tegra: Add NVDEC driver")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/nvdec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied to drm-misc-fixes.

Thanks,
Thierry

--5jbhrvx5g2niyo7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnm/MACgkQ3SOs138+
s6ETEBAAmR4QvTrOlFKPrmVwr3KPiG9rXswxyZZWFh57ku8z0WkowahCyrAe4sTn
7Q6yHWTW2uCmnbrXx+BFXIl9Uas2RjUtAGxRSzLtKyyIuNFi74wWcTV9NwWFib2Y
2ibHxnqBqM6ZxZWqM/0s2Poz3J8Wac8BF+BTCx9xx1pOF3piaweNmxG2HShVajnu
jSr08e7j22E8/zbTtcPHklkEzG8/nDBiPm32vEqrZz8guJ11MW2FNV+wOYxUN611
2/VN6iz8R2L/EYY4g1bn38PpuOtBKWLdI/F2ryjXaWCK4gLMo/1DRf8adFxAY1z9
/rc11VutI8m06p5q75Lwl/0TsJ09Sm1zS/Gj52l9SAcd/QtFSyfL5sbP/HahrjpB
VntCOz7l0wpTxS1koodPxtgvg5ifaQzmjnaVhJgETaYhY4grWG2jBXqiRlZUh2hC
ylhC4aoPs3ypiQB+lPlx+ZFM5To0B3B19WRArnQw8QBYJhSnJafg7EK6ziK5NcBd
RS4sksEEBoIExoZF6WjpwQzDWn7fxcwYsl8EyGWRDarKi3WXslL6u+DvJO/mHYso
t+0Utjz5lf+LmwWD5iECFPqBFMyg02GyGpM+qZ4FWz1NhtsSZOVquD0waNNzOGmB
dCILQdmvlzwm0liPxZ+/47TdjOc/Q+xQCcW6qo/RseIxvfqg0U0=
=a2V8
-----END PGP SIGNATURE-----

--5jbhrvx5g2niyo7s--
