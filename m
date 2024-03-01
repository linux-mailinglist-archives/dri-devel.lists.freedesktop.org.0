Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF0C86DE08
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8406910EC3B;
	Fri,  1 Mar 2024 09:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bqGGa5EU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3181810EC3A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:19:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 871B46164E;
 Fri,  1 Mar 2024 09:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16522C433F1;
 Fri,  1 Mar 2024 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709284785;
 bh=JqsVIGDlCP1wu/pwYjBj+DhvFfWoXCVCb65NYnp1sO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bqGGa5EUE0/3CibnOgppDLmpuYqEQPjTBEImGJd7cTJvuHSrR5AHjykaMbDMUnf13
 tsHdbyXJs8qt3WWB29PhJY3qpddr/0HewC1/GIGUutQG0PLZw8JVi4JdddjRh/6HEt
 IECxRiDvK9A02dYiYs4GvLZxE8Adi9D6jgUby9BXd/QwGB2fl6GncOt0BDertQ5YEY
 AhCeKKj4lIfYY6bhhtoGYRhq/d8ZtBj3gWAEjJg9WmoRog5HwVfkSfjT/noECTJjSF
 LyFDVSxDhTjypqeHIcTGnYsUYw7BF7yuz279ydc3h8LxcixJRFPR8M6B4kVTL6IuoT
 9uLNTuV1jt+pg==
Date: Fri, 1 Mar 2024 09:19:38 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: sam@ravnborg.org, bbrezillon@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hari.PrasathGE@microchip.com, Balamanikandan.Gunasundar@microchip.com,
 Durai.ManickamKR@microchip.com, Nayabbasha.Sayed@microchip.com,
 Dharma.B@microchip.com, Varshini.Rajendran@microchip.com,
 Balakrishnan.S@microchip.com, Charan.Pedumuru@microchip.com
Subject: Re: [PATCH v9 2/8] drm: atmel-hlcdc: Define XLCDC specific registers
Message-ID: <20240301091938.GB1688857@google.com>
References: <20240301052534.38651-1-manikandan.m@microchip.com>
 <20240301052534.38651-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301052534.38651-3-manikandan.m@microchip.com>
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

On Fri, 01 Mar 2024, Manikandan Muralidharan wrote:

> From: Durai Manickam KR <durai.manickamkr@microchip.com>
> 
> The register address of the XLCDC IP used in SAM9X7 SoC family
> are different from the previous HLCDC. Defining those address
> space with valid macros.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> [manikandan.m@microchip.com: Remove unused macro definitions]
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 42 ++++++++++++++++++++

>  include/linux/mfd/atmel-hlcdc.h              | 10 +++++

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 52 insertions(+)

-- 
Lee Jones [李琼斯]
