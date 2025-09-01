Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F9B3DC3A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DF010E070;
	Mon,  1 Sep 2025 08:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cM0IxvwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896610E095
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756714906; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ADmgaCG/CvnJr2lXyKcqp/Y91Q9wfaH/RLcDo+NJaDLuaHxoJ7aYr87wOSQq9n0PtzDGK4wFkul4lcLe6GG23q41Vi0iqhBH58rws6iPPg3zu31XATLm/0zkTkqcGUGS8b2zZsAVxBO/A2Ri67SZup2hdbhykkYnLndoWtormUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756714906;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=V2VYL77T4YVqyTYlcxX7LR4V7tDFNs0R6vDzZ5e/xf8=; 
 b=QB7OjjxtoW61250zEgdiIV24QkPK3kNwg2xmvwY5Nl+rXRwqP61H8LFFuKB7T/jTX+V4twIyPlYehyuYPHkR9hOxEAjgagDLx9A1p9ZBYFHkX21aJEuZO73MQ/lik2E8UcvXUQ4dKie7xPDnehAP8EujW3QJ3kvXwWDGiGuyZwk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756714906; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=V2VYL77T4YVqyTYlcxX7LR4V7tDFNs0R6vDzZ5e/xf8=;
 b=cM0IxvwY2iOiDR65w0n5bes8nLmSOKKSohBVRAJz0NkYdvzEiteIt2oJhtUzylAi
 7Dub0GCHCgJHyXZLjSf8BatYEX7SuNGirE/5qp+PQVRlMcClp5b/VPp0IV+jGG7KE9Q
 62H29f2EVuKr20RmpxnJofAaDo3iP+metFblEXIA=
Received: by mx.zohomail.com with SMTPS id 1756714905112966.9933530005575;
 Mon, 1 Sep 2025 01:21:45 -0700 (PDT)
Date: Mon, 1 Sep 2025 09:21:42 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 4/7] drm/panthor: Bump the driver version to 1.6
Message-ID: <nq47s4smmtktgipymagklodknlcq6zbhq2u5kw6mivlgptmwvb@7cxqoem4cfmh>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
 <20250822142954.902402-5-faith.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822142954.902402-5-faith.ekstrand@collabora.com>
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

On 22.08.2025 10:29, Faith Ekstrand wrote:
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 1527966604e1..2da06057ce37 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1658,6 +1658,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>   * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>   * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> + * - 1.6 - adds DRM_PANTHOR_BO_WB_MMAP flag
> + *       - adds DRM_IOCTL_PANTHOR_BO_SYNC ioctl
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1671,7 +1673,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 5,
> +	.minor = 6,

I tink this might be something you need to do in the previous patch, the moment the new
ioctl is made available in the panthor_drm_driver_ioctls array.


>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> --
> 2.50.1


Adrian Larumbe
