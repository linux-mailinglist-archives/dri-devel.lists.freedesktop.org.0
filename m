Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D615525A5E8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 08:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407276E127;
	Wed,  2 Sep 2020 06:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692576E127
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 06:59:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so4004582wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 23:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0pqHRfpr6UrjNvbY/R9ZrWji8L8XsS+WJrZoowuq3CI=;
 b=hFGXoZ4FFNRD4jI5y5iYxtLPTKZCFlAIprIwSufOwhBSVaFP+52L3gVQxCsv45z5ge
 HUqCe6pvEJh+QdY8c9UjMrcNaoE/juyVOBo1Wbh3ZRaWY3hDXt75EL6LLcAD1npy/KYq
 gMMqC6JsvUTwCOvZSow76odIeTe/j5H0zZkAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0pqHRfpr6UrjNvbY/R9ZrWji8L8XsS+WJrZoowuq3CI=;
 b=IgjnkTZxncndSltnCXH7oajdjADvE8DGvpv88HZrMGa/DRA/RHIWKIkY+YepSxoKM1
 M4sJOncXe0HoUjE6OI1cLQLwOu9alSMgTQgV/XLK8z4nbP9yTimcqoBpiGnfBslytHc4
 KtViXVXkCQWVSd4jGW5qMmlW7EcPo0h942vGd1qFDGOCUEKZK3+NRNjRlBsjEgDOUvzG
 q5zFNXdIdtXPlgL/08GZ0k39RRwIktqAkqaup0t7H0cko1y5qa9rwmhEuc5c58a5GsIh
 tkuGcidss0rTx6bqKZI4+nHKXjGyv7U9BrmmBV7ytMTnzOL65VqdcfcP1RfxMKiNIo+v
 f2FQ==
X-Gm-Message-State: AOAM532+FUfIs6efztGIMS3Vm64LO56qHB3q6lDIakLnlUCxnCC0ksSB
 dCpP7WFMxb0YXp5IRWJUMNDQ9g==
X-Google-Smtp-Source: ABdhPJzagT929ndRY9I71kezYTJbV+uiZ4kTVb4zf4B55/0+JigztoYvjxClbZ1ZrimoU/X1X9ZpBA==
X-Received: by 2002:adf:c182:: with SMTP id x2mr5612366wre.400.1599029948165; 
 Tue, 01 Sep 2020 23:59:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm66345wmb.22.2020.09.01.23.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 23:59:07 -0700 (PDT)
Date: Wed, 2 Sep 2020 08:59:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Remove superfluous NULL check
Message-ID: <20200902065905.GG2352366@phenom.ffwll.local>
References: <20200902010645.26943-1-luben.tuikov@amd.com>
 <20200902010645.26943-4-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902010645.26943-4-luben.tuikov@amd.com>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 09:06:45PM -0400, Luben Tuikov wrote:
> The DRM device is a static member of
> the amdgpu device structure and as such
> always exists, so long as the PCI and
> thus the amdgpu device exist.
> 
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

On this patch, but not the other two earlier in this series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c4900471beb0..6dcc256b9ebc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3471,9 +3471,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>  	struct drm_connector_list_iter iter;
>  	int r;
>  
> -	if (!dev)
> -		return -ENODEV;
> -
>  	adev = drm_to_adev(dev);
>  
>  	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
> -- 
> 2.28.0.394.ge197136389
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
