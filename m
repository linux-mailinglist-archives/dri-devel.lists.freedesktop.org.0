Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FBBA2DE30
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D49C10E49A;
	Sun,  9 Feb 2025 13:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.b="iaVOtCIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B1D10E2AE
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 09:16:06 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-21f48ebaadfso41678975ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 01:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1739006166; x=1739610966;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nvJCWy4EMuDIOueWrbTN3LkRGm5dA+GTUOq10vklDNE=;
 b=iaVOtCItfbBNyVo2+0ovZf1ZikIu0BP9qyj5srcVENXkUj5KvoXVI6Biu0THox1mfU
 Hhsk8aB9H/psHlECmGR/+OfYjC1DsqoYW5dYS+vNRocr1GZS8H9kzgrWsX/nHXBdeD6f
 DNL6bewAX8Y7H/cNTW1di8I094bhlPqD9OIgcqq9JVw0kojXJyuhFBdN3e9HmBWxy/cB
 3AwAxIJhPRxI5pQQj1JcJ096+BwVRngriArQr7GjalGYJIzD85jSvG5XzgWNVyAYuLNM
 P/7sgK5lupX7oGz/5SkUG2BofZnv7aSTkGM+6p0djR2rr4DoQ6EJYzufZP5PcbxZQ4Vq
 AwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739006166; x=1739610966;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nvJCWy4EMuDIOueWrbTN3LkRGm5dA+GTUOq10vklDNE=;
 b=eYZMgz/sxlgu7eAryRY6L4vD4LXxLxyht10UBgAEk41/1Pp+kcXS0PZQfcF87dPiV5
 moXYuV5rVRGJzerwpnUukRsUPhcWwXRx2vZBG/BlZ7C0YetiQQNIM6JrSGhmKitjD0gX
 NvliIOeta7C9H080jd2jLBVCSYv/vekQEAmvX3sUvcHnVE6c9/VzzDi/+p6nFdvkkrLB
 wS0wHcBzlTILrbvlm3WSoMqYMAx1E7hmr/8iZQybaVpvMOsPW+VlmcCXyQM3wmJFdGen
 +sF8jE1As9hP+/Qwjnsf7KziI14Q9LB3H3LdjT3uExqqfLQhrF6lkBovIkn3D5OFlY2l
 feFw==
X-Gm-Message-State: AOJu0YwG5g+CVRjzbbRYr8qY+pwOqjEs6KWqmy9gxMA6urfSOsML06t/
 fLY+atJXzsbmJdPInNQ9lfIchulYMa72mI2ENWvdqZq5anGEbIJ9RC+u4Yv51Ho=
X-Gm-Gg: ASbGncsy1mFm1ov0FNj8o/0kzweklH5JyetjPWvkdh0YNTyku4a5ViSWKNXi9JMUa87
 BPBTY3O96ftaW9T88EJqtES3sVZS1bh4/S1v8jHE56gdeMDgx3cxO6sxdOQhNOzZ0AzxLDHs3/5
 9ZiSwnB5/c0GIajrnDAecsGv5SXvR6/446BaEUvw/2IlMrj5Wk8oI1pgTZWMkJuueVSyPNhIuzH
 ifAXGpARxhawHRbrBu6n0V1gJgdhLLlrvu729Z21uyaFFrjX3AHF7yeP/MIbbIUkp0UsBy3N/Z5
 1uO0cS3nSfLyeDkrQfJWxiKYxRY=
X-Google-Smtp-Source: AGHT+IH9LMRe9AjHdNUfp2Yrb0ZiOIbt3KV7vcDcJeBZyl80We0ELLIq9YFH/aC5JlHj5VwpG1tojQ==
X-Received: by 2002:a05:6a20:d706:b0:1e0:ca1c:8581 with SMTP id
 adf61e73a8af0-1ee03a8dbb8mr12087904637.21.1739006165903; 
 Sat, 08 Feb 2025 01:16:05 -0800 (PST)
Received: from bytedance ([61.213.176.12]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7307bfc03efsm311772b3a.160.2025.02.08.01.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 01:16:05 -0800 (PST)
Date: Sat, 8 Feb 2025 17:15:59 +0800
From: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 ray.huang@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ttm: use ttm_resource_unevictable() to replace
 pin_count and swapped
Message-ID: <20250208091559.GA118571@bytedance>
References: <20250126093256.GA688734@bytedance>
 <bea1a3a0-c6d4-4941-9dd9-73f0756ef17b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bea1a3a0-c6d4-4941-9dd9-73f0756ef17b@amd.com>
X-Mailman-Approved-At: Sun, 09 Feb 2025 13:55:44 +0000
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

On Tue, Feb 04, 2025 at 08:59:08AM +0100, Christian König wrote:
> Am 26.01.25 um 10:32 schrieb Zhaoyu Liu:
> > TTM always uses pin_count and ttm_resource_is_swapped() together to
> > determine whether a BO is unevictable.
> > Now use ttm_resource_unevictable() to replace them.
> > 
> > Signed-off-by: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> I will pick this up for drm-misc-next.
> 

Thanks,
but I don't see it in drm-misc-next(https://cgit.freedesktop.org/drm/drm-misc/log),
is it not merged yet?

---
All The Best

> > ---
> >   drivers/gpu/drm/ttm/ttm_resource.c | 15 ++++++++++-----
> >   1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> > index cc29bbf3eabb..a8f9f7ed6c6e 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -252,11 +252,16 @@ static bool ttm_resource_is_swapped(struct ttm_resource *res, struct ttm_buffer_
> >   	return ttm_tt_is_swapped(bo->ttm);
> >   }
> > +static bool ttm_resource_unevictable(struct ttm_resource *res, struct ttm_buffer_object *bo)
> > +{
> > +	return bo->pin_count || ttm_resource_is_swapped(res, bo);
> > +}
> > +
> >   /* Add the resource to a bulk move if the BO is configured for it */
> >   void ttm_resource_add_bulk_move(struct ttm_resource *res,
> >   				struct ttm_buffer_object *bo)
> >   {
> > -	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
> > +	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
> >   		ttm_lru_bulk_move_add(bo->bulk_move, res);
> >   }
> > @@ -264,7 +269,7 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res,
> >   void ttm_resource_del_bulk_move(struct ttm_resource *res,
> >   				struct ttm_buffer_object *bo)
> >   {
> > -	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
> > +	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
> >   		ttm_lru_bulk_move_del(bo->bulk_move, res);
> >   }
> > @@ -276,10 +281,10 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
> >   	lockdep_assert_held(&bo->bdev->lru_lock);
> > -	if (bo->pin_count || ttm_resource_is_swapped(res, bo)) {
> > +	if (ttm_resource_unevictable(res, bo)) {
> >   		list_move_tail(&res->lru.link, &bdev->unevictable);
> > -	} else	if (bo->bulk_move) {
> > +	} else if (bo->bulk_move) {
> >   		struct ttm_lru_bulk_move_pos *pos =
> >   			ttm_lru_bulk_move_pos(bo->bulk_move, res);
> > @@ -318,7 +323,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
> >   	man = ttm_manager_type(bo->bdev, place->mem_type);
> >   	spin_lock(&bo->bdev->lru_lock);
> > -	if (bo->pin_count || ttm_resource_is_swapped(res, bo))
> > +	if (ttm_resource_unevictable(res, bo))
> >   		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
> >   	else
> >   		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
> 
