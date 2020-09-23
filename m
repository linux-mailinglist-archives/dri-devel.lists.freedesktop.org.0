Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5C275C43
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE06E9D7;
	Wed, 23 Sep 2020 15:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F6C6E9D7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:44:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v12so546169wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NHZipRNpE67uYuwr90L3HulXKe388LbDswNjIlrRDLU=;
 b=IwO5V2YyX7l31aHn3j/t17FBjlvv54uY20qRLkGC/yFT/uQWcvhRRoc4AFdoojyR+4
 nyg3zgk6IGohD/HVH9Ei+M+Z61RUDSwP2nnQzcQ/kYddieeHzd/HCP1Z8sg940YmCB9T
 e9Dn+eEtbeypovGqhlcvHKqTgKnPJl0lgTwDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NHZipRNpE67uYuwr90L3HulXKe388LbDswNjIlrRDLU=;
 b=ABZecDZZiJdwjgmue7Lcs2AmRQNmN8oeklwzfOqJzth4MFXaXXr8YBwMmKGuXxu824
 IUeZxcShAR66aHtjcNB+F8XR2iUTBv3Ro8/sG2XsgBYzmu073WH+Auc/I9v/LM16sY6a
 /owNuVnrQV6nLPWVsEJnI9W6/Qowo4lanc7oGNN/fI0Opz9hdjPHJuq+d6OlM0hxhT0N
 HLZM06wKIgx2glh3BDJz6YyF3UbV2y9LpfifO/8VVEWMw2i9MjbMsIS8jRsLfKJfJuLs
 yR+4emPvx11DVxMF06D1yMH+ZKhfiPtLh3gIqybP4Qb+gY21dgYSTvZXqJTdUQK4nc4X
 ZgxQ==
X-Gm-Message-State: AOAM530wBcVYyGOgd7pMvK5WdBnM99OarE2hV66h/CZ7harm7PbEjPus
 Czj7pZvbDf/szunvM2GCQsaOQQ==
X-Google-Smtp-Source: ABdhPJwy7BSWB+M+IfXgYXJVVjWchvYAwf/tSn6o/egp4NFGJceG/Y7ZoOcSoqwQZb587+wvvtz/Hw==
X-Received: by 2002:a1c:7514:: with SMTP id o20mr212465wmc.76.1600875891953;
 Wed, 23 Sep 2020 08:44:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 97sm255682wrm.15.2020.09.23.08.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:44:51 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:44:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm/vram-helper: Various improvements
Message-ID: <20200923154449.GW438822@phenom.ffwll.local>
References: <20200922145700.25413-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922145700.25413-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 04:56:57PM +0200, Thomas Zimmermann wrote:
> This is a collection of improvements for GEM VRAM helpers. The patches
> were part of other patchsets that didn't make it into upstream, but the
> changes are nevertheless useful.

On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Thomas Zimmermann (3):
>   drm/vram-helper: Integrate drm_gem_vram_init() into
>     drm_gem_vram_create()
>   drm/vram-helper: Set object function iff they are not provided by
>     driver
>   drm/vram-helper: Don't put new BOs into VRAM
> 
>  drivers/gpu/drm/drm_gem_vram_helper.c | 88 ++++++++++++---------------
>  1 file changed, 38 insertions(+), 50 deletions(-)
> 
> --
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
