Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8313D7253
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4A36E9EE;
	Tue, 27 Jul 2021 09:49:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58676E9EE
 for <DRI-Devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:49:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f18-20020a05600c4e92b0290253c32620e7so1174917wmq.5
 for <DRI-Devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i6Kdgs8ZLPcYgReHZlS9wlKCGi1I3QsQIYpSpbxcCb4=;
 b=R+D6Yie9RsBWGAAW9NP32Dlj6zJUH76pbLrPNJWaq5tGEkr2R/ZqObSTBrj/LcvxYC
 XZIqBLZzntcJRhZTIuuvXA9zktZkK3iYLyZ360Cuyr5mcAixAdHpJU05uppbgRlnfdB3
 fTkYSQUNxcD8Qj5ldOzryzJhe/1pyYtehy0k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i6Kdgs8ZLPcYgReHZlS9wlKCGi1I3QsQIYpSpbxcCb4=;
 b=fvGAPYs6/nyCQ4/g/I70QMn8X1DzXziZoF4aQlIO7eQAB1fxWNkeqDkDw7sZmcd16p
 pCbGQZbb1GNuHn6N7i5xZpCpPHOEj52D8t2rayX8z5iw8v/93ZDkSlzTJEMGqsFQbfg4
 d620EIs39SE6Vl0Ls8lnSZtOjlFkezYHYQMX0eFgMcUAXdFc+aOkVQZq3Uq5lJbDAw3I
 N/Zu30CQUBtIPgYihEdwE7XsBpl76GekGjRQlz6a00lttrsa46WSSKe6aG1UoXjt1gol
 D0qzItM8F6lFVR63yikhBFHpffUMwhnnwtU3jHJ2OrsAaCfO1bZD6kJjv2e8E49UL0JX
 4ycQ==
X-Gm-Message-State: AOAM53394CxScQqPYFwgV0BIzODzDp4nyZHzaLoddOpGPniSrzDBuqOd
 J4z4lq3oBLxZXzImklAH+OlBOw==
X-Google-Smtp-Source: ABdhPJzL5YkOFUsZOyiMqHUWEQx5vsEE6yQJ5uOcLSl02rb6ZjynN3o8zaTfQ83MyXhuQ6A0yPkpJw==
X-Received: by 2002:a05:600c:4b86:: with SMTP id
 e6mr3220981wmp.110.1627379387272; 
 Tue, 27 Jul 2021 02:49:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d8sm2900164wrv.20.2021.07.27.02.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:49:46 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:49:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH 0/2] Add support for querying hw info that UMDs need
Message-ID: <YP/WudLoHxIx/h1B@phenom.ffwll.local>
References: <20210727022145.157343-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727022145.157343-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 07:21:43PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Various UMDs require hardware configuration information about the
> current platform. A bunch of static information is available in a
> fixed table that can be retrieved from the GuC.
> 
> Test-with: 20210727002812.43469-2-John.C.Harrison@Intel.com
> UMD: https://github.com/intel/compute-runtime/pull/432/files
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Can you pls submit this with all the usual suspect from the umd side (so
also media-driver and mesa) cced?

Also do the mesa/media-driver patches exist somewhere? Afaiui this isn't
very useful without those bits in place too.
-Daniel

> 
> 
> John Harrison (1):
>   drm/i915/guc: Add fetch of hwconfig table
> 
> Rodrigo Vivi (1):
>   drm/i915/uapi: Add query for hwconfig table
> 
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   3 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 156 ++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
>  drivers/gpu/drm/i915/i915_query.c             |  23 +++
>  include/uapi/drm/i915_drm.h                   |   1 +
>  10 files changed, 215 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
