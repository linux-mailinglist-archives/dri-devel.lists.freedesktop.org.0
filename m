Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35C829796
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1424F10E5B1;
	Wed, 10 Jan 2024 10:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19FA10E5B1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:28:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55760f84177so686655a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 02:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704882534; x=1705487334; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kzMRVLCK4MkU8q0YmaEVcjGiGn4HILsH8nsfUlY3Z6k=;
 b=lRrWlQJ1/0dzu+qByHoykaVUdTwE1DXGUHAdPT8EAudr7YgIfV0Oc+XUvd0KT9IH/E
 2a7S2qhKxQdwQ1L+F8iJjueHLi9+ltcbxTxc5weKFgZCv6Xbgcw4hfWzQWZMCMGTFR/d
 XbozxiXTlSJPET3jgMlw6JHGH05xo9H3YliSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704882534; x=1705487334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzMRVLCK4MkU8q0YmaEVcjGiGn4HILsH8nsfUlY3Z6k=;
 b=jrMXHsh8z/HtKhq6pMstm/LfawRbRVdis4evlVLIm3pkEcUKtJWXS0iYrWMahwgagP
 rY8rgXgyZjXZDhtazQXCuLi1md1gsw/ZN6GTW7JyIkdHs+uFY8LpyyZXem5z6QCVtTVo
 2WeY0FZYR8PnTfOm2CADcv/eSElK1zJTdrK66QfkF4ycdoR25wSiBL/qB37XRha5JXlr
 znf7zKpoipqaC+J/5F0J8tvR4osanMhr0ZCxAPtdyO9XenUYWpZI+exELRtMy8p8tKcm
 C7m3Fj4Mfe/Sn6bjxjLmnIe81KKcWSllyNWbW0cQWk+1UnS/6rpobpHm1/Y3ke9G6poa
 pB3w==
X-Gm-Message-State: AOJu0YxfAz1zaVdj6RPt2f/MR+/Hp/FD05SR752kErIpb1bBz5Gzgyiu
 BJb9UvFrZniWX6HG4l0v0LNbCTU+JqkRr7ijlrjBaMoxqqc=
X-Google-Smtp-Source: AGHT+IECuz12gyJXRsY7xbNrSNHE8rjHQSetupddyehP9n471pjH5f5uHEPWvAX6ek/Nbdw7Pqi3Zw==
X-Received: by 2002:a50:874e:0:b0:557:4e8a:f2e7 with SMTP id
 14-20020a50874e000000b005574e8af2e7mr1041516edv.0.1704882534264; 
 Wed, 10 Jan 2024 02:28:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r13-20020aa7da0d000000b00557c51910e4sm1854707eds.85.2024.01.10.02.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 02:28:53 -0800 (PST)
Date: Wed, 10 Jan 2024 11:28:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: Re: [PATCH] drm/shmem-helper: Fix comment describing dma-buf mappings
Message-ID: <ZZ5xY8gD0pQWwFXQ@phenom.ffwll.local>
References: <20240109104305.604549-1-jacek.lawrynowicz@linux.intel.com>
 <ZZ1Gnvitssne-e5r@phenom.ffwll.local>
 <547ccabe-f88d-4246-a6e1-cce327a2f058@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <547ccabe-f88d-4246-a6e1-cce327a2f058@linux.intel.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: mripard@kernel.org, dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 10:54:42AM +0100, Jacek Lawrynowicz wrote:
> On 09.01.2024 14:14, Daniel Vetter wrote:
> > On Tue, Jan 09, 2024 at 11:43:05AM +0100, Jacek Lawrynowicz wrote:
> >> `shmem->map_wc was` set to `false` but the comment suggested WC was
> >> enabled for imported buffers.
> >>
> >> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> index e435f986cd13..1532f1766170 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -75,7 +75,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
> >>  
> >>  	if (private) {
> >>  		drm_gem_private_object_init(dev, obj, size);
> >> -		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
> >> +		shmem->map_wc = false; /* dma-buf mappings are never write-combined */
> > 
> > I think neither is correct, because for a dma_buf import it is up to the
> > importer to set up everything, including whether mappings should be
> > write-combined or not. And setting this to false ensures that helpers
> > don't muck around with the caching setting.
> > 
> > Also there's private buffer objects for other reasons, but the overlap
> > between drivers that have those and which use shmem helpers is zero.
> > 
> > So I think overall a better comment would be:
> > 
> > 		/* This disables all shmem helper caching code and leaves
> > 		 * all decision entirely to the buffer provider */
> > 
> > Maybe in a very old version where shmem helpers didn't correctly use the
> > dma_buf functions there was some justification for the original comment,
> > but that's been long ago fixed in a series of patches to make sure
> > dma_buf_vmap/mmap are used consistently and directly.
> > 
> > Care to respin with a wording of your choice for the comment? If you're
> > bored you could also try to dig through history a bit and collect some of
> > the commits that made this comment largely obsolete, since I don't think
> > any of the map_wc == true paths are even reachable anymore for private
> > objects ...
> 
> I think that it would be better to add drm_WARN() here - similar to WARNs for import_attach.
> Only v3d sets map_wc in gem_create_object() and it is easy to fix.
> Would these warnings make sense?

I think v4c has the same pattern from a quick check ...

But yes if you're willing to do the full audit, then this sounds like the
cleanest approach. To document the results of your audit please explain
for each driver why it's already save in the patch that adds the belwo
warning (or that you've fixed it in a preceeding patch), that makes
checking things in review easier.

> __drm_gem_shmem_create():
> drm_WARN(dev, shmem->map_wc, "Object caching is controlled by the underlying dma-buf\n");
> 
> __drm_gem_dma_create():
> drm_WARN(dev, dma_obj->map_noncoherent, "Object caching is controlled by the underlying dma-buf\n");

Yeah this sounds good.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
