Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8823EA89F0A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92D010E785;
	Tue, 15 Apr 2025 13:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="IcALcOjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9797010E785
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:10:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso46092815e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 06:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744722656; x=1745327456; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BeBKJsxdsFRDlkMvWf+IkTqfIZxOxoG2HFQhP0mrG6A=;
 b=IcALcOjhLdhD2PoEm7BUND1bratnT+8HRk4CBoJ9V7tVhZWH9EFnDB3ioan3mstIMC
 Rl5/NvPvEVwM2u1drrofh0TvQWGAOWqLBS02lHaZeAbRGcsnpOrt3zwsTTvDn9V3ukN0
 MAfR8EaeJzazqM9adoIjvB2m4JKz49x27tV7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744722656; x=1745327456;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BeBKJsxdsFRDlkMvWf+IkTqfIZxOxoG2HFQhP0mrG6A=;
 b=Mw0nhWA68MslkocPQ8EJcs/Ef3/225lJtdLrWrGvJowRMtR5n8h9JIX8SrNj6fqm9f
 KibWCJpBulz9obsLGPLbOGpY37a2BJMdjIRaykm1KJtw9aZOgOcq0r/L3wfMQk7MWNKR
 3m1nrnrbXiX28C6mrqHS5k+1OgJypXe/lnBsOvVuFU3U18bAVEzPziVZRzKRT500+el9
 ALEB8+oZ9td6Hd6wZ2y5rre/Rzki/uANpJTdTBdlSXt4SkxZlhf3o/TnybXU5RyhIlQk
 BDz8SCnCWpsyY+b5WNZKPElFhteHzJA56qXJH48LhaM+LQHt0EwLDhmKm0/jMWxquWIm
 3lIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWhrY7OhfB5QnuveeCWhB2ICjuickafxvW+yGkpoNYxvK4k1bd9eKYI/GE9jFIC+0z4n6kGL28/NM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMOUoL004KBegjm9tDwgb54GFN+23g8YrFiPsQ0tMCnP73Nj74
 S08zcLBPswolZaE+p1qzVQ1L8rqxxAyZ8FHu5T74cXgwNyNM6UnjyYbhvd9n8YE=
X-Gm-Gg: ASbGncs76C8tLSe7rJo9ZhETN+hdoUtGQUFZH4Ds+eQx4qy0t22D4CF7sYCNJaRxPpO
 AIM1YA8HztNgCiI2eyZcWPhgKWLOX1cThpdLZMJZBYP7pmbCQsXjEiNvc8sAdJ+vmswOrVFh9rO
 QuKjnLkN8J79WkShN4OJCRrBpN9yDKY8RR20tGHw+VldsO9NjWM0sUCDzJaljbLDIuJWaclg0d2
 MKOJG2dKj/0oeYnD0125Vu+HrbMe7Wd+nVcGoaosgnrNdQXoUKr7nK0io7WzJ3aNLAc1A7KaOcX
 CPeLqTS2VIEpcKscQLuvseP6OEHdc2sj1dl8Z1PxxalWVa8VDuxi
X-Google-Smtp-Source: AGHT+IH8bfspMLulM47LnkzN+N5h/di9riH+6UFGuNsynasbDT1EWe+urvrobwPqUm2lk0qjV1vE+g==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8288 with SMTP id
 ffacd0b85a97d-39ea5211c47mr12246486f8f.33.1744722655688; 
 Tue, 15 Apr 2025 06:10:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96403dsm13920688f8f.4.2025.04.15.06.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 06:10:55 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:10:53 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <Z_5a3ckZiY-fINNW@phenom.ffwll.local>
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
 <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Tue, Apr 15, 2025 at 02:52:54PM +0200, Christian König wrote:
> Am 15.04.25 um 14:40 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 15.04.25 um 14:19 schrieb Christian König:
> >> Am 15.04.25 um 12:45 schrieb Thomas Zimmermann:
> >>> Hi
> >>>
> >>> Am 15.04.25 um 11:39 schrieb Christian König:
> >>>> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
> >>>>> Test struct drm_gem_object.import_attach to detect imported objects
> >>>>> during cleanup. At that point, the imported DMA buffer might have
> >>>>> already been released and the dma_buf field is NULL. The object's
> >>>>> free callback then does a cleanup as for native objects.
> >>>> I don't think that this is a good idea.
> >>>>
> >>>> The DMA-buf is separately reference counted through the import attachment.
> >>> I understand that it's not ideal, but testing for import_attach to be set is what we currently do throughout drivers. Putting this behind an interface is already a step forward.
> >>>
> >>>>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
> >>>>> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().
> >>>> That is for exported DMA-buf and should *NEVER* be used for imported ones.
> >>> Did you look at the discussion at the Closes tag? Where else could dma-buf be cleared?
> >> Yeah, I've seen that. The solution is just completely wrong.
> >>
> >> See for the export case obj->dma_buf points to the exported DMA-buf and causes a circle dependency when not set to NULL when the last handle is released.
> >>
> >> But for the import case obj->dma_buf is actually not that relevant. Instead obj->import_attach->dma_buf should be used.
> >
> > So if I understand correctly, the tests in that helper should be done by looking at import_attach->dma_buf.
> 
> At least in theory yes. IIRC we also set obj->dma_buf to the same value
> as import_attach->dma_buf for convenient so that code doesn't need to
> check both.

Uh, given that we already have a confusion between in the importer and
exporter cases I think it'd be better to more strictly separate them than
to mix them up even more for convenience. We need more clarity here
instead.

> But it can be that obj->dma_buf is already NULL while the import
> attachment is still in the process of being cleaned up. So there are a
> couple of cases where we have to look at obj->import_attach->dma_buf.

Yeah this sounds better imo.

> > The long-term goal is to make import_attach optional because its setup requires a DMA-capable device.
> 
> HUI WHAT?
> 
> Dmitry and I put quite some effort into being able to create an import_attach without the requirement to have a DMA-capable device.
> 
> The last puzzle piece of that landed a month ago in the form of this patch here:
> 
> commit b72f66f22c0e39ae6684c43fead774c13db24e73
> Author: Christian König <christian.koenig@amd.com>
> Date:   Tue Feb 11 17:20:53 2025 +0100
> 
>     dma-buf: drop caching of sg_tables
>     
>     That was purely for the transition from static to dynamic dma-buf
>     handling and can be removed again now.
>     
>     Signed-off-by: Christian König <christian.koenig@amd.com>
>     Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>     Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20250211163109.12200-5-christian.koenig@amd.com
> 
> When you don't create an import attachment the exporter wouldn't know that his buffer is actually used which is usually a quite bad idea.

This is im entirely unrelated because ...

> This is for devices who only want to do a vmap of the buffer, isn't it?

... it's for the vmap only case, where you might not even have a struct
device. Or definitely not a reasonable one, like maybe a faux_bus device
or some device on a bus that really doesn't do dma (e.g. spi or i2c), and
where hence dma_buf_map_attachment is just something you never ever want
to do.

I think we might want to transform obj->import_attach into a union or
tagged pointer or something like that, which can cover both cases. And
maybe a drm_gem_bo_imported_dma_buf() helper that gives you the dma_buf no
matter what if it's imported, or NULL if it's allocated on that
drm_device?

Cheers, Sima

> 
> Regards,
> Christian.
> 
> >
> > Best regards
> > Thomas
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>> Best regards
> >>> Thomas
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> >>>>> Reported-by: Andy Yan <andyshrk@163.com>
> >>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
> >>>>> Tested-by: Andy Yan <andyshrk@163.com>
> >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
> >>>>> Cc: Christian König <christian.koenig@amd.com>
> >>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>> Cc: Simona Vetter <simona@ffwll.ch>
> >>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>> Cc: "Christian König" <christian.koenig@amd.com>
> >>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>> Cc: linux-media@vger.kernel.org
> >>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>> ---
> >>>>>    include/drm/drm_gem.h | 8 +++++++-
> >>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> >>>>> index 9b71f7a9f3f8..f09b8afcf86d 100644
> >>>>> --- a/include/drm/drm_gem.h
> >>>>> +++ b/include/drm/drm_gem.h
> >>>>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
> >>>>>    static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
> >>>>>    {
> >>>>>        /* The dma-buf's priv field points to the original GEM object. */
> >>>>> -    return obj->dma_buf && (obj->dma_buf->priv != obj);
> >>>>> +    return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
> >>>>> +           /*
> >>>>> +        * TODO: During object release, the dma-buf might already
> >>>>> +        *       be gone. For now keep testing import_attach, but
> >>>>> +        *       this should be removed at some point.
> >>>>> +        */
> >>>>> +           obj->import_attach;
> >>>>>    }
> >>>>>      #ifdef CONFIG_LOCKDEP
> >
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
