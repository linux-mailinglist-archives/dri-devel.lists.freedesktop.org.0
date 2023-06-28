Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5154D741C97
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 01:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173910E094;
	Wed, 28 Jun 2023 23:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972C10E094
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 23:43:59 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QrypQ0WhXz9tVt;
 Wed, 28 Jun 2023 23:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687995838; bh=aCxfwbOwARg6JvNCx2z9WmaAEjP518LgGINjDoyXsNc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OZmVGh233CMjlNWAMNrv1svnkY9DHcnBgMLjANs+mCqhPaq9PfHViRc3GdUhhI9p9
 pBgtJJAGJ/AwKOpGkmRbFLT3MzeNZWCEP+HIeLV2YJtlYe398uLOIZV7UHXn5wa1yu
 ECEB/vBiTt0ZZAcy7x0xxo8fJD69byGz8JWLihC4=
X-Riseup-User-ID: A6C5903BC79183FCF58D6D4B9B289FA20D692F86A61B987E5253D1526F2CA897
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Qryp764gfzJmyg;
 Wed, 28 Jun 2023 23:43:43 +0000 (UTC)
Message-ID: <31218ec3-e7cf-7274-f807-7c1d9e24e2c6@riseup.net>
Date: Wed, 28 Jun 2023 20:43:40 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/tests: Fix swapped drm_framebuffer tests parameter
 names
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230624212905.21338-1-gcarlos@disroot.org>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230624212905.21338-1-gcarlos@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: andrealmeid@igalia.com, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/23 18:29, Carlos Eduardo Gallo Filho wrote:
> Swap tests parameters names so they actually reflect what is being tested.
> 
> v1: https://lore.kernel.org/all/20230623152518.8603-1-gcarlos@disroot.org/
> v2: Simplified commit message.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> Reviewed-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Applied to drm-misc/drm-misc-next. Thanks!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index df235b7fdaa5..f759d9f3b76e 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -178,13 +178,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
>   		 .handles = { 1, 1, 1 }, .pitches = { 600, 600, 600 },
>   	}
>   },
> -{ .buffer_created = 1, .name = "YVU420 Normal sizes",
> +{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
>   	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
>   		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
>   		 .pitches = { 600, 300, 300 },
>   	}
>   },
> -{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
> +{ .buffer_created = 1, .name = "YVU420 Normal sizes",
>   	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
>   		 .handles = { 1, 1, 1 }, .pitches = { 600, 300, 300 },
>   	}
