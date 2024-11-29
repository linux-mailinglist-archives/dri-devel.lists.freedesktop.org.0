Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36B9D39E0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D61410E719;
	Wed, 20 Nov 2024 11:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A895210E719
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 11:49:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436281480
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:50:19 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E4673F66E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:49:48 -0800 (PST)
Date: Wed, 20 Nov 2024 11:49:40 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Fix compilation failure on panthor_fw.c
Message-ID: <Zz3M1Ji-n1XIi9UX@e110455-lin.cambridge.arm.com>
References: <20241119164455.572771-1-liviu.dudau@arm.com>
 <20241120124125.0bf1b9ac@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241120124125.0bf1b9ac@collabora.com>
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

On Wed, Nov 20, 2024 at 12:41:25PM +0100, Boris Brezillon wrote:
> On Tue, 19 Nov 2024 16:44:55 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > Commit 498893bd596e ("drm/panthor: Simplify FW fast reset path") forgot
> > to copy the definition of glb_iface when it move one line of code.
> > 
> > Fixes: Commit 498893bd596e ("drm/panthor: Simplify FW fast reset path")
> > Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Liviu, can you queue this patch to drm-misc if that's not already done?

Thanks, pushed to drm-misc-next, as that's where Karunika's patch landed.

Best regards,
Liviu

> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 4bc52b1b1a286..c807b6ce71bd4 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1133,6 +1133,7 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
> >  		 * This is not needed on a slow reset because FW sections are
> >  		 * re-initialized.
> >  		 */
> > +		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> >  		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> >  
> >  		ret = panthor_fw_start(ptdev);
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
