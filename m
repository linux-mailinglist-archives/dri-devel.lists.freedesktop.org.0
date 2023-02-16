Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B369932F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFD610ED3D;
	Thu, 16 Feb 2023 11:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02F610ED3D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:34:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z13so1345410wmp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yp1RqaqEx4nLDef7bB12pxM4tlwpF0/KEPXfIZhswEE=;
 b=L3qzinmfbur+mnzLKb9ovTEORSMfC0u3lgDgDzGjfT67fPz7YAN2Sqid1VXijy4C7l
 AHi3T6v/GKXw+G7vXf1+LttqAnBgs/SVPeK2ttn7Ymz+i6Jor4GcmEoqX6/ri6lpa0e7
 adOda+hN/y2bNUDBSM+evIH7ynzFvjPfJ/QsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yp1RqaqEx4nLDef7bB12pxM4tlwpF0/KEPXfIZhswEE=;
 b=iSjAvHH8U9wNqKTGU6fEGqnG2mRdMQ5mCcJUQWIbWxiURVCBbkQ4RBsMwe30UpiVbT
 L+XY/PPPfdB5lfuweWo0dpm65GJpzAFW0rYUrzaoQ97T3tf8HPp7IVJHygBZ2BNIMeFu
 AGAmBAf27IosDrOGAQ4izD7oNZ1oa0FksoDL+6c7tuQKuxi7MOy9LemuUkBryhNLDzYB
 UleHqXv1VEhM34wsYrr3TTKRHdBj3ZIsWK2x15k8P6UuXNc0AqVm2lG7NMTIrAo0Om6z
 BUH5A/oktyXdZoE8vLoBNMOa7HpP+eqeHmuelLJXzZOxqqV++VoNmH8rim/XOazwSSN4
 JgnQ==
X-Gm-Message-State: AO0yUKXghKCY+WWDkdUnGVwHBF/M4QS6OxYgjTHYRbufJtz3t9GaJL1V
 FPYcqeog7uYOmRZupS8Jq/WuRQ==
X-Google-Smtp-Source: AK7set/2YvvrhC0oeIe7rnecGv7Y7H+Vn31+N0FWhSTxPOKyRIHc/Ac8nk9sBmHTtrRh0HF7VyJ+hA==
X-Received: by 2002:a1c:f418:0:b0:3e0:b1:c12d with SMTP id
 z24-20020a1cf418000000b003e000b1c12dmr5643698wma.1.1676547287283; 
 Thu, 16 Feb 2023 03:34:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a7bc401000000b003dc47d458cdsm1435949wmi.15.2023.02.16.03.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:34:46 -0800 (PST)
Date: Thu, 16 Feb 2023 12:34:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <Y+4Uz4KM3S9QCDqA@phenom.ffwll.local>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: daniel.vetter@ffwll.ch, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 maxime@cerno.tech, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 03:06:10PM +0100, Christian König wrote:
> Am 09.02.23 um 14:06 schrieb Maíra Canal:
> > On 2/9/23 09:13, Christian König wrote:
> > > Am 09.02.23 um 12:23 schrieb Maíra Canal:
> > > > On 2/9/23 05:18, Christian König wrote:
> > > > > Hello everyone,
> > > > > 
> > > > > the drm_debugfs has a couple of well known design problems.
> > > > > 
> > > > > Especially it wasn't possible to add files between
> > > > > initializing and registering
> > > > > of DRM devices since the underlying debugfs directory wasn't
> > > > > created yet.
> > > > > 
> > > > > The resulting necessity of the driver->debugfs_init()
> > > > > callback function is a
> > > > > mid-layering which is really frowned on since it creates a horrible
> > > > > driver->DRM->driver design layering.
> > > > > 
> > > > > The recent patch "drm/debugfs: create device-centered
> > > > > debugfs functions" tried
> > > > > to address those problem, but doesn't seem to work
> > > > > correctly. This looks like
> > > > > a misunderstanding of the call flow around
> > > > > drm_debugfs_init(), which is called
> > > > > multiple times, once for the primary and once for the render node.
> > > > > 
> > > > > So what happens now is the following:
> > > > > 
> > > > > 1. drm_dev_init() initially allocates the drm_minor objects.
> > > > > 2. ... back to the driver ...
> > > > > 3. drm_dev_register() is called.
> > > > > 
> > > > > 4. drm_debugfs_init() is called for the primary node.
> > > > > 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > > > >     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
> > > > > to add the files
> > > > >     for the primary node.
> > > > > 6. The driver->debugfs_init() callback is called to add
> > > > > debugfs files for the
> > > > >     primary node.
> > > > > 7. The added files are consumed and added to the primary
> > > > > node debugfs directory.
> > > > > 
> > > > > 8. drm_debugfs_init() is called for the render node.
> > > > > 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > > > >     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
> > > > > to add the files
> > > > >     again for the render node.
> > > > > 10. The driver->debugfs_init() callback is called to add
> > > > > debugfs files for the
> > > > >      render node.
> > > > > 11. The added files are consumed and added to the render
> > > > > node debugfs directory.
> > > > > 
> > > > > 12. Some more files are added through drm_debugfs_add_file().
> > > > > 13. drm_debugfs_late_register() add the files once more to
> > > > > the primary node
> > > > >      debugfs directory.
> > > > > 14. From this point on files added through
> > > > > drm_debugfs_add_file() are simply ignored.
> > > > > 15. ... back to the driver ...
> > > > > 
> > > > > Because of this the dev->debugfs_mutex lock is also
> > > > > completely pointless since
> > > > > any concurrent use of the interface would just randomly
> > > > > either add the files to
> > > > > the primary or render node or just not at all.
> > > > > 
> > > > > Even worse is that this implementation nails the coffin for
> > > > > removing the
> > > > > driver->debugfs_init() mid-layering because otherwise
> > > > > drivers can't control
> > > > > where their debugfs (primary/render node) are actually added.
> > > > > 
> > > > > This patch set here now tries to clean this up a bit, but
> > > > > most likely isn't
> > > > > fully complete either since I didn't audit every driver/call path.
> > > > 
> > > > I tested the patchset on the v3d, vc4 and vkms and all the files
> > > > are generated
> > > > as expected, but I'm getting the following errors on dmesg:
> > > > 
> > > > [    3.872026] debugfs: File 'v3d_ident' in directory '0'
> > > > already present!
> > > > [    3.872064] debugfs: File 'v3d_ident' in directory '128'
> > > > already present!
> > > > [    3.872078] debugfs: File 'v3d_regs' in directory '0' already
> > > > present!
> > > > [    3.872087] debugfs: File 'v3d_regs' in directory '128'
> > > > already present!
> > > > [    3.872097] debugfs: File 'measure_clock' in directory '0'
> > > > already present!
> > > > [    3.872105] debugfs: File 'measure_clock' in directory '128'
> > > > already present!
> > > > [    3.872116] debugfs: File 'bo_stats' in directory '0' already
> > > > present!
> > > > [    3.872124] debugfs: File 'bo_stats' in directory '128'
> > > > already present!
> > > > 
> > > > It looks like the render node is being added twice, since this
> > > > doesn't happen
> > > > for vc4 and vkms.
> > > 
> > > Thanks for the feedback and yes that's exactly what I meant with
> > > that I haven't looked into all code paths.
> > > 
> > > Could it be that v3d registers it's debugfs files from the
> > > debugfs_init callback?
> > 
> > Although this is true, I'm not sure if this is the reason why the files
> > are
> > being registered twice, as this doesn't happen to vc4, and it also uses
> > the
> > debugfs_init callback. I believe it is somewhat related to the fact that
> > v3d is the primary node and the render node.
> 
> I see. Thanks for the hint.
> 
> > 
> > Best Regards,
> > - Maíra Canal
> > 
> > > 
> > > One alternative would be to just completely nuke support for
> > > separate render node debugfs files and only add a symlink to the
> > > primary node. Opinions?
> 
> What do you think of this approach? I can't come up with any reason why we
> should have separate debugfs files for render nodes and I think it is pretty
> much the same reason you came up with the patch for per device debugfs files
> instead of per minor.

Yeah I think best is to symlink around a bit for compat. I thought we
where doing that already, and you can't actually create debugfs files on
render nodes? Or did I only dream about this?
-Daniel

> 
> Regards,
> Christian.
> 
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > 
> > > > Otherwise, the patchset looks good to me, but maybe Daniel has
> > > > some other
> > > > thoughts about it.
> > > > 
> > > > Best Regards,
> > > > - Maíra Canal
> > > > 
> > > > > 
> > > > > Please comment/discuss.
> > > > > 
> > > > > Cheers,
> > > > > Christian.
> > > > > 
> > > > > 
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
