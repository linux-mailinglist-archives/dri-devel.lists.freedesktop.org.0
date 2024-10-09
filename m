Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6B99767E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 22:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C918C10E7F7;
	Wed,  9 Oct 2024 20:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V6XPQ8Pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BB410E0CE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 20:35:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso1391395e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728506133; x=1729110933; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjYS14YTYv2OCMWHkLucdNx0+SeUm3LsT48uh8uJaRw=;
 b=V6XPQ8Pq/kjhSfh23VPB8uHURHTbIgudB6b+e9H+YmvubRSZ51ytM23ifS2GXD62yW
 OQ/YGhjTLfLHwEetbodDTfsX1TXTiwJGaH0vfd3MCE1+vcYDZ5mr6gwAOtFw7JL89Gk1
 MNnl1hEynNhRUTZzvoRe8GHD17xTlNLhJkzG8H/fGFHUHi8tD2tBN3dhwHzLR5nCwygG
 d3vm6CaspfyymyzrRKA1hkySJP8Wc0FMZDW0wAupNZfMgwzcC/2DvIlp/hyVcXYZQL8F
 wLcnJwNJqeJGskCv3Q1NnwgwULP6mKOpuXUpONciv+fNYg8WOkdNEJKXw2/d+JW+sT9R
 dGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728506133; x=1729110933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjYS14YTYv2OCMWHkLucdNx0+SeUm3LsT48uh8uJaRw=;
 b=g69PmNDEvYv/C/8C/kaViwxWuPDsZOyLmsXCF5TmOd4+4EacfVmZl9sG2BWzd3jP1O
 VBmLDIvoD8X8iddSLhgFgxUxd8/8IAJEhxJ0BFbCizS9yEjRcy7MkVOlq3xdt1TYBV/E
 t7XPqM2oqnUM+GaSXkndVOah+MO7mMWBjNQ2ps37O3ZiO89aVsVfBWz722003qRU/NSN
 tDYyRLDs6MjFylN+rP37G1+ssMB3B9D8tVohvPumbhobMme0GJSZ5OHstAj1d4oqx6ep
 Ko9Z8krem4uBqVgmyrkwDPd8BP/TNbT3tnn97bk7+jyxw+frHs+8o768ncmglXba7jqS
 Mm6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuIaPa+0axBtfRvHH9ua5vagKRDZhh9qbrHsI2wFgK9ED4Y0Sa2vcBw/6lrLcDYcK3hrn98Pu1R1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwABouAP41s91vr50bEwH8GwPpSYbDSO73bBcShm+TIYJ9IFyfO
 VdcMAhZy3SF77VCYMeVBI9d/bG2lH3xfS8OzjBVpU+DHLh7UEBT4e1E9eYYJYkk=
X-Google-Smtp-Source: AGHT+IFbfMwsabJqo51FxMyaKfk6sJ6eDGqAwAcM1939Wwk+xOhuo14+AUTXfblGExsREK8B+2rfDQ==
X-Received: by 2002:a5d:6d48:0:b0:375:c4c7:c7ac with SMTP id
 ffacd0b85a97d-37d3aabfd1emr2434741f8f.49.1728506132947; 
 Wed, 09 Oct 2024 13:35:32 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d2e65d618sm4572798f8f.23.2024.10.09.13.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 13:35:31 -0700 (PDT)
Date: Wed, 9 Oct 2024 23:35:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/xe/guc: Fix dereference before Null check
Message-ID: <07d9eb6e-87d3-4428-aaa4-8721a6844404@stanley.mountain>
References: <20241009184951.4991-1-everestkc@everestkc.com.np>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009184951.4991-1-everestkc@everestkc.com.np>
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

On Wed, Oct 09, 2024 at 12:49:49PM -0600, Everest K.C. wrote:
> The pointer list->list was derefrenced before the Null check
> resulting in possibility of Null pointer derefrencing.
> This patch moves the Null check outside the for loop, so that
> the check is performed before the derefrencing.
> 
> This issue was reported by Coverity Scan.
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>

You need to add a Fixes tag.

> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 41262bda20ed..de63c622747d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1537,13 +1537,13 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>  	if (!regs)
>  		return;
>  
> +	if (!list->list)
> +		return;

Could you merge this with the other sanity checks at the start of the function.

-       if (!list || list->num_regs == 0)
+       if (!list || !list->list || list->num_regs == 0)

The list->list pointer can't actually be NULL.  It comes from
guc_capture_get_one_list(), so if the reglists[i].list pointer is NULL it
returns NULL.  However, obviously checking for NULL after a dereference is not
the correct so it's worth fixing and probably deserves a Fixes tag.  Although it
doesn't affect runtime, adding a Fixes tag helps backporters know they can
automatically ignore this one because the commit it's fixing is very recent.

regards,
dan carpenter

