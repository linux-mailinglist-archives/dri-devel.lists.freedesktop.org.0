Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B38769BC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E1C113934;
	Fri,  8 Mar 2024 17:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YXTWuCLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9357113933;
 Fri,  8 Mar 2024 17:22:12 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6e56d594b31so1621471b3a.1; 
 Fri, 08 Mar 2024 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709918532; x=1710523332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiNILTvzhUOUFgGdpWm2TaA0CSBfCxD3SAypXD+oVXg=;
 b=YXTWuCLGOXePpQDwJl4z5liqgxvJYSqDf3VrFLZp3yDFuD2YbjxlRZf+MAt6Si1iC6
 N2b9SyHtd33n2GUqzcuep1VEZCivsse9xJw4dKp1prgE/jCrxRE9Lpd6ZrqvUCVR8hM5
 CMA8E6gp0y4FZY2BMHDQN8hL3wcQUcg+FPqa0SorPT2DbNpImd/DXBP5xR8veIkjbHBz
 cEui8fhYntHov8xI6pvBho1lhq7zf8qZMAZmAf6AcITWdXKNXu+tLLZvdXvetmesE/AS
 Fbnz3CBKSivYDoeSH0XVAn0rmDX37ZgA0iU5QUKa7YoF78tOtmw9+tkpkGdTWteLgU6T
 c1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709918532; x=1710523332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiNILTvzhUOUFgGdpWm2TaA0CSBfCxD3SAypXD+oVXg=;
 b=MG83AZo7CqaqvegNAguWIn6r6Ki7VzguzYDnWZfTafbD8h+/zDfkFBwfYGVT2VWNEf
 i2dNF5fa8elabdwDEsh9OXxm93ow1n52rd1JsxI50XFkCPISa7Q8uhbHQ7WHi7BphQG2
 xbUAKAEUTPMHiuPSKEcbzFY6gWYD3l6yKCliP0TKU6uzOC43BYE+6IgCY9Bzw+d8fVhU
 VkWYJIcjWb5BINsV46ujB78clvwkOqiI1uNqzmXzydP1Y8sCTa3wKmYGPj7Ptv7DGF5l
 RHihir8GLS0Ws4JmKT+VFICCjUWWvtq1g3Dlti0NmYnvzt12Qf4fGnQqJVY6nOeMjdZl
 QVAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQOJXBG+QACyJeedoCbpsaBVUHIN0/ZWrB4xfYVknNpytQBTvA0vLK44Cqxztskb/7u1Jbgx0mflMGkw+PnPxbIGlvd0fIKKBXJbebtkDnl8wEL2LPPvVVkTeYvYSheQ8kUR2xa1O6wlB/SA4M3hQ=
X-Gm-Message-State: AOJu0YwU7SDA2jje0Q7GPiNlW41o/uZTrjjDwp3GMwCpf+AKXMVPSmKf
 D0O6WD7zY4+k9FWHvgZgo9eseeobSVxwx2tC/gsmbpHSswkwCEGsBrA9BSaEZTe+EOsP1KpfuZ1
 82RECbif06eIPrCBvyZn7n4bOtdY=
X-Google-Smtp-Source: AGHT+IHuMhRPgV29xQbN8Nqi5e9WNDL8t1w8xDIiqYxalfW44ajwawCxHIQeotYi5K5ChLMGHeyfx8Px9DoBqS8os2E=
X-Received: by 2002:a05:6a20:3ba8:b0:19e:b6bd:f6a5 with SMTP id
 b40-20020a056a203ba800b0019eb6bdf6a5mr9111550pzh.45.1709918532337; Fri, 08
 Mar 2024 09:22:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709898638.git.jani.nikula@intel.com>
 <fb87ab4b4490c53e9ece66d53c4f178ead244cb5.1709898638.git.jani.nikula@intel.com>
In-Reply-To: <fb87ab4b4490c53e9ece66d53c4f178ead244cb5.1709898638.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Mar 2024 12:22:00 -0500
Message-ID: <CADnq5_Nmk+xGuyd6xFq=xGvG8VO3E58BuZBayc+Gwhpe-HqPAw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] drm/ttm: make ttm_caching.h self-contained
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 8, 2024 at 7:23=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Include <linux/pgtable.h> for pgprot_t.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/drm/ttm/ttm_caching.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.=
h
> index 235a743d90e1..a18f43e93aba 100644
> --- a/include/drm/ttm/ttm_caching.h
> +++ b/include/drm/ttm/ttm_caching.h
> @@ -25,6 +25,8 @@
>  #ifndef _TTM_CACHING_H_
>  #define _TTM_CACHING_H_
>
> +#include <linux/pgtable.h>
> +
>  #define TTM_NUM_CACHING_TYPES  3
>
>  /**
> --
> 2.39.2
>
