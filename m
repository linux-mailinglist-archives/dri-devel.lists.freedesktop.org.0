Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4819E0023
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC5210E6E0;
	Mon,  2 Dec 2024 11:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E5okRQAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274C410E1E5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733138482;
 bh=4YRBu0iEfYpeNdGAKABSBxrKy76YlMDsHW9tAWoOGpA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E5okRQAIuz39qaPWXdxM7gGyomfsmUr6f06ewruH1iFPWulJPgC25tyWxycK41+us
 txuYN3oBJ0GuYWb63RXcauXSMs19xGxHURpRtoPf7IL6D8CiQy2qYOt1X+G2t44qNV
 cFLRAehcKMtax+EJjW2hFVBe7JPiMejLyddHxyJ5CXfRmHXkxam+vTRkX0iZOKE1ZI
 BwtBWdArf2qqXvkHiTl+M4cK4e6uGDQZtZdoyjDep5WAxQjJjd8Lf+XkUz2n1yTShP
 +Mv4Rd0AjR4WoAfoptifAbwWXPdRX6j6jMphXMgpsZJ6Oa1Nn7PCBqKII9Z3xlFM81
 AFtsOmCdLe6Zg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 517E117E3624;
 Mon,  2 Dec 2024 12:21:22 +0100 (CET)
Date: Mon, 2 Dec 2024 12:21:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] drm/panfrost: Add forward declaration and types
 header
Message-ID: <20241202122114.61a4c2a9@collabora.com>
In-Reply-To: <20241128211223.1805830-8-adrian.larumbe@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
 <20241128211223.1805830-8-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 28 Nov 2024 21:06:22 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This is to make LLVM syntactic analysers happy.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.h
> index e6e6966a0cca..27c3c65ed074 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> @@ -4,6 +4,7 @@
>  #ifndef __PANFROST_MMU_H__
>  #define __PANFROST_MMU_H__
> =20
> +struct panfrost_device;
>  struct panfrost_gem_mapping;
>  struct panfrost_file_priv;
>  struct panfrost_mmu;

