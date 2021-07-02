Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F393BA43E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA11F6E104;
	Fri,  2 Jul 2021 19:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CC26E104
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:10:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o22so7297438wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 12:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Pmanh/l4RYPiMz9vtWN5vGxol6i2zbYeNRxTf6wlNo0=;
 b=h8lOkcy0Z6seVHPg996JrP6IqrpLp4pAriwUYYdNa41UYfO45lrwbhOoZ80NJRfQM6
 B2vXzas48bRn8XDOJMDNXxWs982fIRZvkU+9UArz0OnA/Qmp0ZhZsgRGgeYql9soQlaV
 BC8yeinu9wCkIMe04pvuj0eWLTY/yxagfdqUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Pmanh/l4RYPiMz9vtWN5vGxol6i2zbYeNRxTf6wlNo0=;
 b=C6JRm8ZGNcCieufFqCbxqtxas4Ea43Z+E4v57+a+vP1wofJraVJvNw5gxNG75RqJgv
 BoQYoZVeJ0Be/QwZgS9KTgc4sseEcpLLM0/VKqQNjMxMAHRAEPUf9wHooMAI8TB9wejQ
 D7QJQlyM9HBvOAWY9qQOb7lLCzhgs7aL87zOnL/Crk8ZJ3xG2iLlSr3nFUeEbeeppnJ/
 Kz0C0wfFxjkekwGenqmWEliID/8EvCOyrcF/0PmfxYy/3QgXdgfR6yA8Q3gbu5frNX0g
 m0B3sGNzBmS5pyVrY9VXnCsNHUhH2nPosC8TiPrTfl9GlFGKa0tnhp7uYDQOdmt5VRv/
 qobw==
X-Gm-Message-State: AOAM5336HaM0W0m9Qus9hGHKQpdgKrxxrtFDrabhuMP3bh+sI8547UHp
 KUa9GP1EwZ+764vPNWtdEXosbg==
X-Google-Smtp-Source: ABdhPJy5BNnqGN0Fwpl5zTTbBdeJYST9zgAK6VB4zEBH02UqccbbJZ0NAQLXspAuKwm4Ob8x7p3meQ==
X-Received: by 2002:a05:600c:4f09:: with SMTP id
 l9mr1368996wmq.114.1625253021638; 
 Fri, 02 Jul 2021 12:10:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d24sm9110479wmb.42.2021.07.02.12.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:10:20 -0700 (PDT)
Date: Fri, 2 Jul 2021 21:10:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH -next] drm: vmwgfx: add header file for ttm_range_manager
Message-ID: <YN9km1dVs5Z1YDXJ@phenom.ffwll.local>
Mail-Followup-To: Zack Rusin <zackr@vmware.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20210630203252.32471-1-rdunlap@infradead.org>
 <8CB463FC-BF27-48CD-8843-975AE600DE35@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8CB463FC-BF27-48CD-8843-975AE600DE35@vmware.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 08:36:29PM +0000, Zack Rusin wrote:
> 
> 
> > On Jun 30, 2021, at 16:32, Randy Dunlap <rdunlap@infradead.org> wrote:
> > 
> > Add a header file for ttm_range_manager function prototypes to
> > eliminate build errors:
> > 
> > ../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function ‘vmw_vram_manager_init’:
> > ../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:678:8: error: implicit declaration of function ‘ttm_range_man_init’; did you mean ‘ttm_tt_mgr_init’? [-Werror=implicit-function-declaration]
> >  ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
> > ../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function ‘vmw_vram_manager_fini’:
> > ../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:2: error: implicit declaration of function ‘ttm_range_man_fini’; did you mean ‘ttm_pool_mgr_fini’? [-Werror=implicit-function-declaration]
> >  ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
> > 
> > Fixes: 9c3006a4cc1b ("drm/ttm: remove available_caching")
> > Fixes: a343160235f5 ("drm/vmwgfx/ttm: fix the non-THP cleanup path.")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: "VMware Graphics" <linux-graphics-maintainer@vmware.com>
> > Cc: Roland Scheidegger <sroland@vmware.com>
> > Cc: Zack Rusin <zackr@vmware.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> 
> Thank you. That change has been part of drm-misc for a few weeks now:
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=352a81b71ea0a3ce8f929aa60afe369d738a0c6a
> I think it should be part of the next merge of drm-misc to linux-next. If not I’ll port it to drm-misc-fixes.

It should probably be in drm-misc-next-fixes. drm-misc-next is for 5.15.
drm-misc-fixes was for 5.14 and will only reopen after -rc1.

See  https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
