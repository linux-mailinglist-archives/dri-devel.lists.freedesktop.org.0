Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C02960BC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 16:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0C86F581;
	Thu, 22 Oct 2020 14:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC6A6F585
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 14:13:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c77so2283141wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=enF/NQ78UlHZi0kpjlRMqO+lesxBNMFNnWEi966YlwU=;
 b=lcgl8RehFALlBvKW+2WEqI6hL3DQCvnayUx386YFYdIACL6eZdDekWSge6wl0xau/P
 OurS80PGFdE+uCz2ywydsXe1KEcW2OKxZnMZUyxNDMbbrQ0IMr0SI/JTRmyVAXaE9J1O
 hmmezb9rcO1k/LRCAp+BJe5NUZwtKmz2hdtkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=enF/NQ78UlHZi0kpjlRMqO+lesxBNMFNnWEi966YlwU=;
 b=cVB2J4BCTUjP8HdAWrqXhjOfukiFocv+G6hnNsMWSkf5zV1obRKvkvlDq58U7m3yC0
 9tKqmK9c70rPWsbowvPeSYGmSJ8h4l9LkkVS65OrV3LQwXZyVbs+wEIRFTe8VD5n2npb
 iR1x9Zt8rl49YF3eCjZYjbhv5O+xLcKiBmYW8qBFTGoneX1rIQYBIVpJjolOqpR6oeYc
 aQSG48+bhDR881JXdwVsGOm53xcbFkR4TI36mcnAwPgL+4mP7sPuEru+/j7Gh14KUP1d
 JoL5uum4P+a266Y2eUkO8sAgnlz3atdOiQZ81kQDphJP8nasjBaF8xp6XS4JePWtQEiN
 tmcA==
X-Gm-Message-State: AOAM5313fK7/gZiW/pQMLU4LSCoy6CKDo1x3IocTm3LqCmsLfeTIn4Jn
 cW3GcwtALQdGRnwaJyNRtBckfw==
X-Google-Smtp-Source: ABdhPJwHYDGIRoRMV1tiPrqE+G8DvABiHKwtdx9svGn7vK4QZAvd1J5pyjsiQ/shrV+Vnd5qklpZ6Q==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr2863073wma.95.1603376030491;
 Thu, 22 Oct 2020 07:13:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3726390wmj.2.2020.10.22.07.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 07:13:49 -0700 (PDT)
Date: Thu, 22 Oct 2020 16:13:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 0/5] drm/amdgpu: Replace snprintf()
 with sysfs_emit
Message-ID: <20201022141347.GZ401619@phenom.ffwll.local>
Mail-Followup-To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, melissa.srw@gmail.com,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1603371258.git.sylphrenadin@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 outreachy-kernel@googlegroups.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 22, 2020 at 07:07:50PM +0530, Sumera Priyadarsini wrote:
> Using snprintf() for show() methods holds the risk of buffer overrun
> as snprintf() does not know the PAGE_SIZE maximum of the temporary
> buffer used to output sysfs content.
> 
> This patchset is a series of Coccinelle cleanups across the staging
> directory to convert snprintf with scnprintf in the relevant files.

I think you need to edit your template here since this is now drivers/gpu,
not staging :-)
-Daniel

> 
> Sumera Priyadarsini (5):
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 8 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c      | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
