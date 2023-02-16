Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C148D699D3E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 20:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CB310E11A;
	Thu, 16 Feb 2023 19:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AE010E11A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 19:58:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 hg24-20020a05600c539800b003e1f5f2a29cso5068154wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LN/189C9U5isFxh0jcgZGEFOXpDBqXkGMA4H8O5QOv4=;
 b=ZSQVYi13gf/QzFDltQrz6FxAxqeu0sdZAb3sfbOcQJYrEpVOoWxqdlSemgAzJra8Az
 5bqtv0XrUwvbZrh5APeJ3K5KkOkVa4da0GEMOfvMmCUzhdBHo6QPYVeoF3dl1NlAZ22i
 aSM9Sg+qRDcJy330D1hSrjm76nisJ7JLC4lL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LN/189C9U5isFxh0jcgZGEFOXpDBqXkGMA4H8O5QOv4=;
 b=ISW68yVOMVF4MS01ELfRZIJ2jz7Ce4YLbNBm2kVwTMAg6F+C7oTi/79mLmpFKXC6uh
 D8qLmgOTSBXc7AoWiFrNrsR+CUwxk6166MqYYqsQuw0MEGlXmya3rQudw3e/S2qXp2vF
 qBRWE72vPHnj9c4GJKEyyre8U1+qXQFQJJguuZkP4oq9mp+iD+/E/PWKSFc6KApshWKJ
 a+1jMN25xZeLSTIVTKV2vOYCm1pjNhKBrXkCIH7pPbAORwvoQBdRF5nUJfOkuTRQVOYq
 Imu8R8hl+W11Gw4o4V2C6M8+njC1veHHcer0J6MFoT7sYDUxvj8aXziMj6I+4jUTKg/O
 r5cA==
X-Gm-Message-State: AO0yUKUpf6O8ymJj/otyEYdKpUJtFYxbYgx0rI7GM5D6CJIwUcDVcD2F
 cyLsxFdya629KruEHL9SuK9tEYuEFveJEROv
X-Google-Smtp-Source: AK7set+y6bR1yZpNqCx0pWjlHdyb7QgOdA1MX3v80r0baacDCG/pm3LYR2V6rKpnz3V+lfKxkVAqVQ==
X-Received: by 2002:a1c:f418:0:b0:3e0:b1:c12d with SMTP id
 z24-20020a1cf418000000b003e000b1c12dmr7025722wma.1.1676577483197; 
 Thu, 16 Feb 2023 11:58:03 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 he8-20020a05600c540800b003e208cec49bsm4633275wmb.3.2023.02.16.11.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 11:58:02 -0800 (PST)
Date: Thu, 16 Feb 2023 20:57:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <Y+6Kwzpc5byUgr2H@phenom.ffwll.local>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
 <Y+4Uz4KM3S9QCDqA@phenom.ffwll.local>
 <d53e294b-2447-8692-f4e3-dbc46439b3cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d53e294b-2447-8692-f4e3-dbc46439b3cf@gmail.com>
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

On Thu, Feb 16, 2023 at 05:31:50PM +0100, Christian König wrote:
> 
> 
> Am 16.02.23 um 12:34 schrieb Daniel Vetter:
> > On Thu, Feb 09, 2023 at 03:06:10PM +0100, Christian König wrote:
> > > Am 09.02.23 um 14:06 schrieb Maíra Canal:
> > > > On 2/9/23 09:13, Christian König wrote:
> > > > > Am 09.02.23 um 12:23 schrieb Maíra Canal:
> > > > > > On 2/9/23 05:18, Christian König wrote:
> > > > > > > Hello everyone,
> > > > > > > 
> > > > > > > the drm_debugfs has a couple of well known design problems.
> > > > > > > 
> > > > > > > Especially it wasn't possible to add files between
> > > > > > > initializing and registering
> > > > > > > of DRM devices since the underlying debugfs directory wasn't
> > > > > > > created yet.
> > > > > > > 
> > > > > > > The resulting necessity of the driver->debugfs_init()
> > > > > > > callback function is a
> > > > > > > mid-layering which is really frowned on since it creates a horrible
> > > > > > > driver->DRM->driver design layering.
> > > > > > > 
> > > > > > > The recent patch "drm/debugfs: create device-centered
> > > > > > > debugfs functions" tried
> > > > > > > to address those problem, but doesn't seem to work
> > > > > > > correctly. This looks like
> > > > > > > a misunderstanding of the call flow around
> > > > > > > drm_debugfs_init(), which is called
> > > > > > > multiple times, once for the primary and once for the render node.
> > > > > > > 
> > > > > > > So what happens now is the following:
> > > > > > > 
> > > > > > > 1. drm_dev_init() initially allocates the drm_minor objects.
> > > > > > > 2. ... back to the driver ...
> > > > > > > 3. drm_dev_register() is called.
> > > > > > > 
> > > > > > > 4. drm_debugfs_init() is called for the primary node.
> > > > > > > 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > > > > > >      drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
> > > > > > > to add the files
> > > > > > >      for the primary node.
> > > > > > > 6. The driver->debugfs_init() callback is called to add
> > > > > > > debugfs files for the
> > > > > > >      primary node.
> > > > > > > 7. The added files are consumed and added to the primary
> > > > > > > node debugfs directory.
> > > > > > > 
> > > > > > > 8. drm_debugfs_init() is called for the render node.
> > > > > > > 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > > > > > >      drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
> > > > > > > to add the files
> > > > > > >      again for the render node.
> > > > > > > 10. The driver->debugfs_init() callback is called to add
> > > > > > > debugfs files for the
> > > > > > >       render node.
> > > > > > > 11. The added files are consumed and added to the render
> > > > > > > node debugfs directory.
> > > > > > > 
> > > > > > > 12. Some more files are added through drm_debugfs_add_file().
> > > > > > > 13. drm_debugfs_late_register() add the files once more to
> > > > > > > the primary node
> > > > > > >       debugfs directory.
> > > > > > > 14. From this point on files added through
> > > > > > > drm_debugfs_add_file() are simply ignored.
> > > > > > > 15. ... back to the driver ...
> > > > > > > 
> > > > > > > Because of this the dev->debugfs_mutex lock is also
> > > > > > > completely pointless since
> > > > > > > any concurrent use of the interface would just randomly
> > > > > > > either add the files to
> > > > > > > the primary or render node or just not at all.
> > > > > > > 
> > > > > > > Even worse is that this implementation nails the coffin for
> > > > > > > removing the
> > > > > > > driver->debugfs_init() mid-layering because otherwise
> > > > > > > drivers can't control
> > > > > > > where their debugfs (primary/render node) are actually added.
> > > > > > > 
> > > > > > > This patch set here now tries to clean this up a bit, but
> > > > > > > most likely isn't
> > > > > > > fully complete either since I didn't audit every driver/call path.
> > > > > > I tested the patchset on the v3d, vc4 and vkms and all the files
> > > > > > are generated
> > > > > > as expected, but I'm getting the following errors on dmesg:
> > > > > > 
> > > > > > [    3.872026] debugfs: File 'v3d_ident' in directory '0'
> > > > > > already present!
> > > > > > [    3.872064] debugfs: File 'v3d_ident' in directory '128'
> > > > > > already present!
> > > > > > [    3.872078] debugfs: File 'v3d_regs' in directory '0' already
> > > > > > present!
> > > > > > [    3.872087] debugfs: File 'v3d_regs' in directory '128'
> > > > > > already present!
> > > > > > [    3.872097] debugfs: File 'measure_clock' in directory '0'
> > > > > > already present!
> > > > > > [    3.872105] debugfs: File 'measure_clock' in directory '128'
> > > > > > already present!
> > > > > > [    3.872116] debugfs: File 'bo_stats' in directory '0' already
> > > > > > present!
> > > > > > [    3.872124] debugfs: File 'bo_stats' in directory '128'
> > > > > > already present!
> > > > > > 
> > > > > > It looks like the render node is being added twice, since this
> > > > > > doesn't happen
> > > > > > for vc4 and vkms.
> > > > > Thanks for the feedback and yes that's exactly what I meant with
> > > > > that I haven't looked into all code paths.
> > > > > 
> > > > > Could it be that v3d registers it's debugfs files from the
> > > > > debugfs_init callback?
> > > > Although this is true, I'm not sure if this is the reason why the files
> > > > are
> > > > being registered twice, as this doesn't happen to vc4, and it also uses
> > > > the
> > > > debugfs_init callback. I believe it is somewhat related to the fact that
> > > > v3d is the primary node and the render node.
> > > I see. Thanks for the hint.
> > > 
> > > > Best Regards,
> > > > - Maíra Canal
> > > > 
> > > > > One alternative would be to just completely nuke support for
> > > > > separate render node debugfs files and only add a symlink to the
> > > > > primary node. Opinions?
> > > What do you think of this approach? I can't come up with any reason why we
> > > should have separate debugfs files for render nodes and I think it is pretty
> > > much the same reason you came up with the patch for per device debugfs files
> > > instead of per minor.
> > Yeah I think best is to symlink around a bit for compat. I thought we
> > where doing that already, and you can't actually create debugfs files on
> > render nodes? Or did I only dream about this?
> 
> No, we still have that distinction around unfortunately.
> 
> That's why this went boom for me in the first place.

I guess time to land that? Or should we do this as part of the conversion
and just change the new add_file helpers to only instantiate on the
primary node until all the old users are gone?
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > Otherwise, the patchset looks good to me, but maybe Daniel has
> > > > > > some other
> > > > > > thoughts about it.
> > > > > > 
> > > > > > Best Regards,
> > > > > > - Maíra Canal
> > > > > > 
> > > > > > > Please comment/discuss.
> > > > > > > 
> > > > > > > Cheers,
> > > > > > > Christian.
> > > > > > > 
> > > > > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
