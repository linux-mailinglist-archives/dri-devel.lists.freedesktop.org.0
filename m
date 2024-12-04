Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08159E487E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 00:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD0910E5A3;
	Wed,  4 Dec 2024 23:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uV7+aXB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D4910E59B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 23:14:49 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ffc7a2c5d5so2348881fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 15:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733354087; x=1733958887; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ByDBggfihaA7bzylhtE2nPcYIo+DwLJnDtkfjIDytqw=;
 b=uV7+aXB1OTFM17UJhS5k9FRXyR9YuNRgZKJDXE8UZi7V1fiy8FDPzQSoga/XB5CZbK
 SB/sosHL0DLY9dp9iWglazwgE95P2Xf3seEZvtdl7X2HbuAoUAr4UAwsOkhs53Xj2Dvu
 pSwkqXjIJeVzqGjvbOo8le68FjDZ/3gRFz1wz4/qypXSG1ZLD4/RkSeP39hN1Q7TeSjO
 4dr04xUQSQ/zf0U1YGVWyjPfAuFYqTfQ+K7ZqLwZ+lM0eq+aEdoe86OQDqqpw+hkO3lq
 ZF9Yf2Y5rYRgkwiL9XbVgkLIOcSCsGTuhWgxX9jHB0lUe107xc0paeOxifYmL/cB8zxI
 +Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733354087; x=1733958887;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByDBggfihaA7bzylhtE2nPcYIo+DwLJnDtkfjIDytqw=;
 b=hiuzfyG3rnxwxMKwwLTyLfMWqIPCDJexSDGVBPvQ4eb7rzH95a0DWZbCikKFBh6ZjI
 DGbKXPZDNFiUnFmpmBhdqtZRpZtyq0/42Cib4WDjFlVIXVma50GR8LVZKKENsJktkcTl
 FOnz+GLp5zWAVRNUgHOItSzmX+DKdW8I83MuDuU28GiOhhh3KW0EREGO0VMLCeGFfNfb
 xpBeO6/OUsrykRtZPpyLpFXmv+vVM51KNWJIesRWjkyuJnRNGN0U/gbPLeVeuQfanfde
 k4Tn7JtMpTM2Z48E81OjDHrloU63p04yV12IplNqkj2Bo9iCAVG09N9Xwp+7AqmHOwh5
 P+Rg==
X-Gm-Message-State: AOJu0YyBXVLLpf1OhGRdA2gMxfCAiDo/JeXafwQPufhJke57h4BQ5xIf
 +Lx6OEsOI5iS584ddkUSNJ2+veboLITDK01caJMl8UK/0yP5OPaKQopJYy5UBHs=
X-Gm-Gg: ASbGncsFmGj7kzfgKVIEWlY1aRCfHLbovFpoMHXwPYfREGmWwf37Pp3Nq9EQujxMmNc
 0jbJTn6/MTEtXziyrh0P7KvwUBsmj/iN2NYlYr8NWVz724FFs7NYo16tp9O8igZQFa13yl6rqfC
 PYgVACgiLvD+nr6Y0WUYDe81zXMklWBJGzuaxWceIHuR8Yw+h6NxSZOFOgWncfJpjRTSBVUn30d
 2pnQRtxttjNdXc1YJy8nXQtN2yb/fwHzwvdZxFfQvhoKTtIplYm8rFXMtW+f+l5367pZoJ8Qvrc
 0BYWqa8Fk7m+UsR+UQf/sFqp+cjh7Q==
X-Google-Smtp-Source: AGHT+IFuUS7Not1i5YzDB3gHy3ub9/hXvCvAwbQxzNqfeGQDqOoYZ6k6qPs0qszHy91ZjySfOh3ENQ==
X-Received: by 2002:a05:651c:210c:b0:2ff:7a4f:e770 with SMTP id
 38308e7fff4ca-30014eaa13cmr17797471fa.31.1733354087009; 
 Wed, 04 Dec 2024 15:14:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020e2085fsm158771fa.83.2024.12.04.15.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 15:14:45 -0800 (PST)
Date: Thu, 5 Dec 2024 01:14:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Simon Ser <contact@emersion.fr>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] drm: remove driver date from struct drm_driver
 and all drivers
Message-ID: <couqmlshll3v6vgziqnt6sq7caf4nart42ljo5fbim3rg7ec5o@3ym66tyaytd2>
References: <cover.1733322525.git.jani.nikula@intel.com>
 <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
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

On Wed, Dec 04, 2024 at 04:31:12PM +0200, Jani Nikula wrote:
> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
> 
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
> 
> v2: Also update drivers/accel (kernel test robot)
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

> 
> ---

-- 
With best wishes
Dmitry
