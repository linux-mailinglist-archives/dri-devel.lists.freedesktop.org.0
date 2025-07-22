Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909EB0D49B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 10:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE80F10E62A;
	Tue, 22 Jul 2025 08:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="ONH9fMJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AE210E62A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 08:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753172971; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z26ZDr2WLRHM13aYU8MWWF7ViIeVdELRGUeCtqUXv/KLj0zY48Q+tIOdo9dd43pmWmyyVmcvP/EhodgZMp/9RaglQRrw8jzY7k/Zaaae7AdQAmkS1cIJqPYeXG57/8yWQJYlByTYzRSKLmN5n904DcNfDsFgy1VFHn3bxWdff6A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753172971;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=kYLsrkqZUuwVDb1Zq02YDwQ1D3jxtY8K+gjAuZAnlfQ=; 
 b=DH3gecS/oiFPuJfENf/iceDqjXYWUVBsnoVWBZi+1bgPTQwsCYCWpX/FlSEAOm2pgsJDzwxgKQ8aCCJCxhiwwJ4BP54nLLoBp9VQm+2DG37isDAFFzGZ25UhgC8UrAlDIfiMeMAr/tFREY3FcEy9Mh0QCzJZ/C+2+oMcUmm+4DM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753172971; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=kYLsrkqZUuwVDb1Zq02YDwQ1D3jxtY8K+gjAuZAnlfQ=;
 b=ONH9fMJ0NUgRgf4llJvYo0IgVw1sCDZrA1nVU3dWI8JK64DeqPMN8eBlRagQ3wzi
 e2tDGdODUoptcWLeJ2lGxAXbyGMe0vaKYYOHQCzWKzsww85U4MqjWN8hP7hJof5SUPk
 1Vex0bKmVPYk43WQCc46Fn6gXCq8R8D4BBRIlGGM=
Received: by mx.zohomail.com with SMTPS id 175317296642515.56143309745596;
 Tue, 22 Jul 2025 01:29:26 -0700 (PDT)
Message-ID: <abc0eae5319ed14409c88baab3160b7aed2061b2.camel@collabora.com>
Subject: Re: [PATCH v5 3/6] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>, Steven
 Price	 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org
Date: Tue, 22 Jul 2025 10:29:21 +0200
In-Reply-To: <20250721111344.1610250-4-karunika.choo@arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
 <20250721111344.1610250-4-karunika.choo@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (by Flathub.org) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Mon, 2025-07-21 at 12:13 +0100, Karunika Choo wrote:
> This patch adds GPU model name and FW binary support for Mali-G710,
> Mali-G510, and Mali-G310.
>=20
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> =C2=A0drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
> =C2=A0drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
> =C2=A02 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c
> b/drivers/gpu/drm/panthor/panthor_fw.c
> index 36f1034839c2..b7b454d16f12 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device
> *ptdev)
> =C2=A0}
> =C2=A0
> =C2=A0MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");

This isn't a problem with this series per-se, but these (as well as the
ones you're adding in later commits here) are all missing from here:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/tree/arm/mali

Any plans on upstreaming these so people without DDK access can
actually try these patches?

> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c
> b/drivers/gpu/drm/panthor/panthor_hw.c
> index f39010c0ca86..7f138974d43b 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -15,8 +15,14 @@ static char *get_gpu_model_name(struct
> panthor_device *ptdev)
> =C2=A0						GPU_PROD_MAJOR(gpu_i
> d));
> =C2=A0
> =C2=A0	switch (product_id) {
> +	case GPU_PROD_ID_MAKE(10, 2):
> +		return "Mali-G710";
> =C2=A0	case GPU_PROD_ID_MAKE(10, 7):
> =C2=A0		return "Mali-G610";
> +	case GPU_PROD_ID_MAKE(10, 3):
> +		return "Mali-G510";
> +	case GPU_PROD_ID_MAKE(10, 4):
> +		return "Mali-G310";
> =C2=A0	}
> =C2=A0
> =C2=A0	return "(Unknown Mali GPU)";
