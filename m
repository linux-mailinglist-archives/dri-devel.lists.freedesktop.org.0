Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFE9AC875
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 13:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B59110E353;
	Wed, 23 Oct 2024 11:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ab8f5i78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8436A10E353
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=bHGP7JRBaCSysfpKlshFcLgSRwMDYg7xmq1kLK1A24s=; b=ab8f5i78WdZUXwGp
 wbqtbsfxiYAumw4Utmi29eFbkaMVABYBaZz68D5czH649u5ecSTBAoQU/BhSm42j1G7F031d8EgNn
 V3Gq7frcwiEie57ldcEwp0vbI6ZmsoxCaX1e4XgqA4gfw/VjArQ6al9KJPDqzsNp83fMYH6X7OrWd
 50uocxktXGnkyCdHPkw3jYfjC1sINTEH6Wa5U+w2xWTRxrX01HMX+u9nEYH5W7mUAASe8u5s3BV1r
 LalTExpRCnLN/GSBAYmkn5Fmjw5MrzPuNEeojqe8r61odsbnrQaIKYHtwmceUlvmiH5AQ6oI1g+8B
 me/PBtU7Uyjnmnv3hg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1t3Z9J-00CzTf-1G;
 Wed, 23 Oct 2024 11:03:33 +0000
Date: Wed, 23 Oct 2024 11:03:33 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/client: Remove unused drm_client_framebuffer_flush
Message-ID: <ZxjYBbusIbQU6WDv@gallifrey>
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-5-linux@treblig.org>
 <a56b486c-9341-41aa-a3ab-090f7ffd56d6@suse.de>
 <44141638-4d8f-4e11-9ede-51cdb51d3a28@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44141638-4d8f-4e11-9ede-51cdb51d3a28@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:01:50 up 167 days, 22:15,  1 user,  load average: 0.06, 0.03, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Jocelyn Falempe (jfalempe@redhat.com) wrote:
> On 23/10/2024 08:46, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 23.10.24 um 01:29 schrieb linux@treblig.org:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > drm_client_framebuffer_flush() was explicitly added in 2020
> > > by
> > > commit c9c03e3cf072 ("drm/client: Add drm_client_framebuffer_flush()")
> > > but has never been used.
> > > 
> > > Remove it.
> > 
> > I had a patchset to use this helper for fbdev emulation. It just needs
> > preparation in a number of drivers.
> 
> It is used by drm_log, which is under review.
> Please don't remove it.

OK, no problem.

Reviews on the rest of the series would be great.

Dave

> https://patchwork.freedesktop.org/series/136789/
> 
> -- 
> 
> Jocelyn
> 
> 
> > 
> > Best regards
> > Thomas
> > 
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >   drivers/gpu/drm/drm_client.c | 33 ---------------------------------
> > >   include/drm/drm_client.h     |  1 -
> > >   2 files changed, 34 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> > > index bfedcbf516db..5d10ad3c2ca5 100644
> > > --- a/drivers/gpu/drm/drm_client.c
> > > +++ b/drivers/gpu/drm/drm_client.c
> > > @@ -552,39 +552,6 @@ void drm_client_framebuffer_delete(struct
> > > drm_client_buffer *buffer)
> > >   }
> > >   EXPORT_SYMBOL(drm_client_framebuffer_delete);
> > > -/**
> > > - * drm_client_framebuffer_flush - Manually flush client framebuffer
> > > - * @buffer: DRM client buffer (can be NULL)
> > > - * @rect: Damage rectangle (if NULL flushes all)
> > > - *
> > > - * This calls &drm_framebuffer_funcs->dirty (if present) to flush
> > > buffer changes
> > > - * for drivers that need it.
> > > - *
> > > - * Returns:
> > > - * Zero on success or negative error code on failure.
> > > - */
> > > -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer,
> > > struct drm_rect *rect)
> > > -{
> > > -    if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
> > > -        return 0;
> > > -
> > > -    if (rect) {
> > > -        struct drm_clip_rect clip = {
> > > -            .x1 = rect->x1,
> > > -            .y1 = rect->y1,
> > > -            .x2 = rect->x2,
> > > -            .y2 = rect->y2,
> > > -        };
> > > -
> > > -        return buffer->fb->funcs->dirty(buffer->fb, buffer->client-
> > > >file,
> > > -                        0, 0, &clip, 1);
> > > -    }
> > > -
> > > -    return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
> > > -                    0, 0, NULL, 0);
> > > -}
> > > -EXPORT_SYMBOL(drm_client_framebuffer_flush);
> > > -
> > >   #ifdef CONFIG_DEBUG_FS
> > >   static int drm_client_debugfs_internal_clients(struct seq_file *m,
> > > void *data)
> > >   {
> > > diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> > > index bc0e66f9c425..560aae47e06d 100644
> > > --- a/include/drm/drm_client.h
> > > +++ b/include/drm/drm_client.h
> > > @@ -165,7 +165,6 @@ struct drm_client_buffer {
> > >   struct drm_client_buffer *
> > >   drm_client_framebuffer_create(struct drm_client_dev *client, u32
> > > width, u32 height, u32 format);
> > >   void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> > > -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer,
> > > struct drm_rect *rect);
> > >   int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
> > >                    struct iosys_map *map_copy);
> > >   void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);
> > 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
