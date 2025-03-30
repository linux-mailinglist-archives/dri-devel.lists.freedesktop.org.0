Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B8A75A64
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 16:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511A110E06E;
	Sun, 30 Mar 2025 14:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2157E10E246;
 Sun, 30 Mar 2025 14:13:14 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2240b4de12bso40813785ad.2; 
 Sun, 30 Mar 2025 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743343993; x=1743948793; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Nx8vPnxajDWa/k8RJzbsW2uXLdAUtSH4tESU6OSGGY=;
 b=kXVjuHyJ6PfRKp21kvoWGLfa6Lvr5/YVe7vs8Igb4evQ5c+2n3U9a66NfXKHdHrfwa
 SIxm8EirvSZtJ81LCcMM5LSixP+UpwphA3g3UMw2CeGleY+isnqoD+s8AnZHRBrmmU55
 JI3n3oaCFrhNh32USi2it/c1QgTqrbVulaT0BYT8oLj/sxTvNVFEF5ARZ/1be8Tr/1pS
 guL7XCdcTxTlQDMDpeOtjfhGOlaTNanDPffxEEjUQx0gM39em8nz5WlKCdv83OXZT59i
 yu6V2ZNjiz8yC41WZbvYwn/WA/8yJQC4l1xdF4MGUk4oMHQeQFoFgo2o30JkdBmIKIWr
 dq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743343993; x=1743948793;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Nx8vPnxajDWa/k8RJzbsW2uXLdAUtSH4tESU6OSGGY=;
 b=aks8GjiN4uwaZiRO9Y0h4iXpabM2J2hk6/+GSdoqYNZASoibn4pwPNx01/LePnAZm5
 zIke8VCRQJcPsobKEehBmWzJOJjgdxs3M0pBgYumpXaMzXBSOfL/dMs74Cjl45BxtHGm
 Kfw4hJtKiF0b+4Y+b66cPb63PAdfHnqLLN8B9AMcaUHP8fnmczZR4yyj+Fe/VcWaoxek
 DhMUELms2zDahtjpyecDzzfnP7zphtIl+IPiPCNtgeUU9VeOcWJOvStmpqX8O4iMy9ns
 j6gSNuCx+vpjnMLV913M9HGkNEt9FlowXcx83zK1XsgRCYy+JPYkllf/tKLtgZgh0MLt
 +WOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWfNWqYp/kBCb0ykRU4HTDPd1lf6STq2KH94CWazaEECG7jRrhLjgX1RU8PmhtFajz2/8B1EhEY+Y=@lists.freedesktop.org,
 AJvYcCVTZmWqF/f9yqgVHPc25HrX09sbkhXx+4X5Zd5/bjpvD8DRv9TfGRMcrldIuqDfWGoU5j3syDYMrTs8NeRsQw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXD3f3IZUMobPEeh4D+hCPGzSDVfpvRxEJAVoJwo27+/nxa0mu
 pFL6lNsvFk2tCRb/ASy0SA/xmRQ87YV/JssN/HSsCzWuqJJpTDmLVBBF6Q==
X-Gm-Gg: ASbGncvPCCYtEIzZiDg5xNGT1PSv9fxGuhVAcnDB/uGk+7BHMztWMrqtsv3BmxUArpc
 6jiARlUzLej5LaOuupy9wfJ9+ib8IdqqRmvqnypj+wGVpTdNiVXINNfbK+kq+wtUvUhPDrVG1iC
 ePemd47vVDSxeByNUMqWO4ooLEnEmoYfN83qYMZ8VTYI7oj/tBHx69AKRTpjO7GJiOz2x6z6wir
 zO/t1Q2OX/VkzapYeY9lc6ZqtOv7k2jpnvULcM5x/DLEawkjedr+1sxS2wqSLl6U7eto7IauGNQ
 I0lC309/pgsGCKhgkP152Ec9IsrCO6kWoNJr7Fo0HAF5H12S/3cJVGEB/5puVLcYe/ZdUr5P2cz
 pQzWdz5U=
X-Google-Smtp-Source: AGHT+IHWwlOnQkYLWScexb/klDOaANwyyCGzTceTKgTXJ7oydhM5+BJ97edgW53oBzkCOVIEIR7fAQ==
X-Received: by 2002:a05:6a21:3a8a:b0:1ee:ef0b:7bf7 with SMTP id
 adf61e73a8af0-2009f640527mr8487129637.19.1743343993395; 
 Sun, 30 Mar 2025 07:13:13 -0700 (PDT)
Received: from localhost (om126233180002.36.openmobile.ne.jp. [126.233.180.2])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-af93ba10863sm4816856a12.74.2025.03.30.07.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 07:13:13 -0700 (PDT)
Date: Sun, 30 Mar 2025 23:13:07 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: update MAINTAINERS
Message-ID: <Z-lRc1uD6sVvawHZ@dell-wzy>
References: <20250227093805.2217658-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227093805.2217658-1-jani.nikula@intel.com>
X-Mailman-Approved-At: Sun, 30 Mar 2025 14:52:46 +0000
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

On Thu, Feb 27, 2025 at 11:38:05AM +0200, Jani Nikula wrote:
> Update GVT-g MAINTAINERS entry to reflect the current status of
> maintenance and repositories.
> 
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Sorry for late reply. I was quite busy on personal things during last month
that almost no chance to put hands on keyboard. ;)

As I think both Zhi and I agreed before, this is totally fine with me.

Acked-by: Zhenyu Wang <zhenyuw.linux@gmail.com>

Thanks!

>  MAINTAINERS | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b69b93f63c6..98374661f5a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11649,13 +11649,10 @@ F:	drivers/gpio/gpio-tangier.c
>  F:	drivers/gpio/gpio-tangier.h
>  
>  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
> -M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
> -M:	Zhi Wang <zhi.wang.linux@gmail.com>
> -L:	intel-gvt-dev@lists.freedesktop.org
> -L:	intel-gfx@lists.freedesktop.org
> -S:	Supported
> +R:	Zhenyu Wang <zhenyuw.linux@gmail.com>
> +R:	Zhi Wang <zhi.wang.linux@gmail.com>
> +S:	Odd Fixes
>  W:	https://github.com/intel/gvt-linux/wiki
> -T:	git https://github.com/intel/gvt-linux.git
>  F:	drivers/gpu/drm/i915/gvt/
>  
>  INTEL HID EVENT DRIVER
> -- 
> 2.39.5
> 
