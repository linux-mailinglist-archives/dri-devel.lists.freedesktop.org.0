Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60276B1CB57
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 19:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C4310E30C;
	Wed,  6 Aug 2025 17:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="HtZOn+GY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11AF10E30C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 17:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754502422; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KLMAIdvUqfa70pBe05YhQm0mRjjFqmsVztFulhEresiqWJ4rrMbEWWcqaTwPrkP9pFRPVSEEgtIAIT+Z5+WpamWuM8oj0/bAj9QWhBCZrGMQ88yFKdwRiOQbJ6I5eSp1ui+2yiuvT09ljasI9G9QjHYyUVotqfWTzGRaLH4UeoU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754502422;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0rZH6ywPZCM11FRS5p1tLtZwrwgINsb0Kn0e8UzL74c=; 
 b=UZ2SF0ZlbQcf/8BH+xwd0uaUd6+RwYuqe59KbxjLw+GXvygyWneDYcmv1J4vnaY/s+8eq3WhQMpg4G7doyGy0NBvXyhNkicRJ3txguMNnNyHLo/YVn7cAGsJAjiiLh4k0A8YIEAFaZdDagNglaWARtrAwrw9oAY/RVOiCZ53Lio=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754502422; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=0rZH6ywPZCM11FRS5p1tLtZwrwgINsb0Kn0e8UzL74c=;
 b=HtZOn+GYpHIbsd/zRkznGTO4gM6QocfzqpTCEiiJWalTQ2ulmuFQIwFXQyOhfRhq
 WRVN521S19F+BwJZOToSRNpGXYUaGgTjF/8NPoSmViPLhuMOeOqBW1UWXL8Fqz16ml6
 /3Qq513ln9aSszn9C/9MKK82OCWjvExaDGwZzEeo=
Received: by mx.zohomail.com with SMTPS id 1754502421337713.6481254788936;
 Wed, 6 Aug 2025 10:47:01 -0700 (PDT)
Date: Wed, 6 Aug 2025 18:46:56 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/panfrost: Print RSS for tiler heap BO's in debugfs
 GEMS file
Message-ID: <j7x47m2hpo3fgatuoryefkuqk7ijv32ztc63kxfjgud2ng3u3b@yipnrnby5cuz>
References: <20250731173534.3494324-1-adrian.larumbe@collabora.com>
 <CAPj87rPrGX2c3RQKJ6NxGYWbzbNp-9zCC=twCN4OLcD4aXcuHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rPrGX2c3RQKJ6NxGYWbzbNp-9zCC=twCN4OLcD4aXcuHg@mail.gmail.com>
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

On 06.08.2025 16:19, Daniel Stone wrote:
Hi Adrián,

On Thu, 31 Jul 2025 at 18:36, Adrián Larumbe
> <adrian.larumbe@collabora.com> wrote:
> > @@ -432,7 +432,8 @@ static void panfrost_gem_debugfs_bo_print(struct panfrost_gem_object *bo,
> >         if (!refcount)
> >                 return;
> >
> > -       resident_size = bo->base.pages ? bo->base.base.size : 0;
> > +       resident_size = bo->base.pages ?
> > +               (bo->is_heap ? bo->heap_rss_size : bo->base.base.size) : 0;
>
> Just use panfrost_gem_rss() here, though you'll need to make it non-static.

It's still within the same compilation unit (panfrost_gem.c) so it can remain static.

>
> With that:
> Reviewed-by: Daniel Stone <daniels@collabora.com>
>
> Cheers,
> Daniel

Adrian Larumbe
