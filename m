Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20DAC65BD
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CF010E5BE;
	Wed, 28 May 2025 09:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="j0p2ZKKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCFB10E5CA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:23:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so39808015e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748424196; x=1749028996; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OWbW6DSaS7EhhOnN6RRx03CpNOhwNByuhVw8RHuiKe4=;
 b=j0p2ZKKwssGTdb0zqKWq88HkufFnKAdlC+d3gWSMWY7QYqh/t1VPaq/tSKcPB0iR9a
 4Bfn4PwmKX/23NbaBIjLu3x/Fp5LwRKZIXDYBpS95TQrsJtFWFjjAZ94zhJ7kjm8cvim
 eL2aEzOH+O0s9GNDhZJIvXPH7RB8eUZkg0fY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748424196; x=1749028996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWbW6DSaS7EhhOnN6RRx03CpNOhwNByuhVw8RHuiKe4=;
 b=Amc2zreVHI9QwKEU9YBSTaea+maawThxUdhvr/pGo8aoJNx8dnlkxh3ESJV3xGY0H7
 Je7fuw+VH4oO0/6OGT9C+sDnDvEH+8K+F5Hs7K1P5LdFh3mRbV4AWgTdA+1oOaG+f7Zn
 y6rittux6vni38TjXGO+QAzKdBOsoMpFTidS6vYs42baJdzu2ZQy/vT631H7nGmONJvF
 JngXJEtUshRVYv+HqPo/tfjywM/CoPG1/ROUc2pRHvp8u+gtzLFu2y8q5pfpoXOsnmPy
 pNuXgK41VlheZJkUFyfiIDP/JxQERVavRWQFTgGVHnmB4vqJN4Zt/uPZ1YxgVsa+GBxT
 JR1g==
X-Gm-Message-State: AOJu0YzyL/uYoO8r/gMziELb7brPQrEuOSEeSjQdp+GYsFseXoaIO7tP
 X9Pkz+gt1JFwpQrU7JvvkFh0HEc7Z0xC3USmiSzZgaI/SoDI6CUByE05VhM0L94jXhpnjq40ieX
 r4eXb
X-Gm-Gg: ASbGnctBfwuUWeA4E4t+sSvbEpOGZ8hUSnM/06sTW8f/DW6OJdgIV1DGaskQdmhNWP+
 BoGHRL/H2tIFPs8p02+wSzYUyD9u+Ob9S3Oht+0IlM00EDIHLqyKQOTC68Jh29irnNr+oOqM/om
 pYwlhxfaxW6kGVUGepmc3T1PBeOyWK+q8Ta2KETDNvYZUfqKmxPLkcuS3+1590Y/oI4rj3Iz1Zg
 OfOzHsocKjkqVbcIG29heZVe/QPBBz+Ih5m6DPAXyJGmLmVh8t9uC9axqaaB1M71f3Mu+0ylwTN
 pNPLv/L6FEs1PxQOgs3Fxdlp8yKjlrBxqgnYxsPDjgods2D48B2jiOgon8U08BU=
X-Google-Smtp-Source: AGHT+IECvxtDkXo4c3njMnU8BGrUNWkT/CLwIW61OnEn14bzAhOWHTXaITQrwX36/3VuUA3VhNB3aQ==
X-Received: by 2002:a05:600c:4e45:b0:442:f4a3:8c5c with SMTP id
 5b1f17b1804b1-44c919e13ddmr190908365e9.10.1748424196628; 
 Wed, 28 May 2025 02:23:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4eac8aa79sm948086f8f.50.2025.05.28.02.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:23:16 -0700 (PDT)
Date: Wed, 28 May 2025 11:23:14 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Simona Vetter <simona.vetter@intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH 7/8] drm/vmwgfx: Add comments about drm_file.object_idr
 issues
Message-ID: <aDbWAsXjzt1lxSir@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-8-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528091307.1894940-8-simona.vetter@ffwll.ch>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 11:13:05AM +0200, Simona Vetter wrote:
> idr_for_each_entry() is fine, but will prematurely terminate on
> transient NULL entries. It should be switched over to idr_for_each,
> which allows you to handle this explicitly.
> 
> Note that transient NULL pointers in drm_file.object_idr have been a
> thing since f6cd7daecff5 ("drm: Release driver references to handle
> before making it available again"), this is a really old issue.
> 
> Since it's just a premature loop terminate the impact should be fairly
> benign, at least for any debugfs or fdinfo code.

Rereading idr_get_next I now think it's all fine, please disregard this
patch.
-Sima

> 
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index c55382167c1b..438e40b92281 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -323,6 +323,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
>  		rcu_read_unlock();
>  
>  		spin_lock(&file->table_lock);
> +		/* FIXME: Use idr_for_each to handle transient NULL pointers */
>  		idr_for_each_entry(&file->object_idr, gobj, id) {
>  			struct vmw_bo *bo = to_vmw_bo(gobj);
>  
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
