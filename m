Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B264FF354
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7C010EFE0;
	Wed, 13 Apr 2022 09:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A20F10EFE0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:22:37 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id i27so2641876ejd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Hwrnz4T6SIEW1/zS9YfM+3knT4gWDYTZzGmYI3xfVFQ=;
 b=IDxbTva4ixhCCbqUHxei433irosVoSKgPiin59t9Pa5b7b2yNsGPzLhTcQdHWLIGBW
 20+GxjKeI9b+6iPnX0CHtBXk2+RykVNQ/NhzamSbVcxKGItcm79nU6t4fd7vKNaU+6gE
 mT4eTYafPUFQDye+V6dbe7iEd+BCtbXrZZbo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Hwrnz4T6SIEW1/zS9YfM+3knT4gWDYTZzGmYI3xfVFQ=;
 b=D4th8inRVF5naqLzaq5PShuuQC9mSMZwej3rJoh3OEx49vaVEGP507cbQX2durJ/jx
 cTCf7sRuXF9VaHlEKtTxguXWOuxYN0/Ln2j1lJJWtUoTExaX5qk2RvAfd1cHXBG4WFFC
 Dli+yUQkSWrECW3aiw/LothGj2UvEzGi8EJetStkGeyzF0mPxw5Ipt67INaHpLkKTACJ
 SpGxz/kXxIZ8+UYtIScfi/n0190AiRy99dAaN0OiI6TyBoy/P2iRkZOOIOtVz+pfAHrP
 BEshlNvQ3mCDUffVtDF7qX+LJYzlcl8gDMG2cIH8lWQzQHHlxqxhOsNfEwUsAq8VrA/x
 7f1w==
X-Gm-Message-State: AOAM530su1UMENLEK/OP5tKRKE1WduX8QWbonAIpErozSRh2Mdyx2c+m
 fD8F0kgfFhpGDX3ICsd9kBlQEQ==
X-Google-Smtp-Source: ABdhPJwfQT85NV4Ve/KgbgrifH7ejOBtxlF7l5Wv3lrE+AlOaPYZq2SYvGhQSqxJQMm684brxTIq/w==
X-Received: by 2002:a17:907:3e0c:b0:6e8:be59:9901 with SMTP id
 hp12-20020a1709073e0c00b006e8be599901mr4117122ejc.358.1649841756203; 
 Wed, 13 Apr 2022 02:22:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a0564021e8700b0041d03a94f27sm943819edf.66.2022.04.13.02.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 02:22:35 -0700 (PDT)
Date: Wed, 13 Apr 2022 11:22:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: fix kerneldoc for ttm_lru_bulk_move
Message-ID: <YlaWWiNRCcc0FVY3@phenom.ffwll.local>
References: <20220413091242.638413-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220413091242.638413-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 11:12:42AM +0200, Christian König wrote:
> Update the kerneldoc for the members as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: b0e2c9ea5afc ("drm/ttm: allow bulk moves for all domains")

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/ttm/ttm_resource.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 314f73de4280..f82fee18c07f 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -215,8 +215,7 @@ struct ttm_lru_bulk_move_pos {
>  /**
>   * struct ttm_lru_bulk_move
>   *
> - * @tt: first/last lru entry for resources in the TT domain
> - * @vram: first/last lru entry for resources in the VRAM domain
> + * @pos: first/last lru entry for resources in the each domain/priority
>   *
>   * Container for the current bulk move state. Should be used with
>   * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
