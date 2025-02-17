Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A39A38D10
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 21:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCD610E26A;
	Mon, 17 Feb 2025 20:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s1r7pIgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1183D10E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 20:15:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5453153782aso2226946e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739823327; x=1740428127; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eRkHg5Ucp6RGHWusT3IEAggViQD31EKhbXy2GP0vglI=;
 b=s1r7pIghujuINRN0tDdw4kGa16wrHPDG4wMA/0DTsxSu7nWOTRlzSaIan7hqRI6Z/N
 Z0zguXMVX6wNPvA969YV7uQqTr06EWPQdgvGsj0AsdvRK4wjWhO2UBVsT4Zy7CGjcHcb
 Z4tbYx6a1yr17y+umjZEwHw9RmM5RgE3Sl7RuQiOpbnJ83Rr+xff74XhDDJPLSvfjncP
 qtgic3BCmxr+IQzzO6CGMkuFRC9R7OA4wY66lrdhEFPK18Ge9lqqjJTaBy+7WGEtKlWA
 nTiSkbcxKHiwLKPzEK/9DeYBwQweUozv/ipeqIhQwfKlN3rEfbgnb9ikS2I1awwRKiHA
 /JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739823327; x=1740428127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRkHg5Ucp6RGHWusT3IEAggViQD31EKhbXy2GP0vglI=;
 b=PY1mNZUXnhZrlBgawEI6etXDWijK3BNt6nbQZWpi0GZRNfR+9bX58kJf82H6xkLv7g
 ECCEOrzlDXEODK/sRBW2IVdJart9akO6nxdhJO0CsYKSva67Br89rah2fxnN46mGYEZ9
 1wixPnzHfb/qILkZQvh1VGWf4HR+Q6nrDejZVueNuKl9Sah+DjFQfUmnK2f02STCzLfE
 baISGR1I08TC+dg+VvBZUyCGknML6ZHBmyYKrhVbPmAAv36h/rPYGGHqBiUHooSlekd9
 dwMO/JqmlOR3VTzqTvnabHOGOgEWG5PNCaq3+27W7Ao5IQRF3K1b/ZcXj5NcxdfJY5bZ
 biyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj4pPUHcSJdskWVyMtkt8XKSkQFUVVcTXqBnfVus8EAZ9gRrcjW5VF9ShdVU/efRIdjdsJDAEJfxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTFFr2AC5djf8hR+X3WZZMULBZ+ecrjoczCWiUgtGfdcERKLSM
 561j+JwQ4k+rRiOe/28M87OeMz2IR2T2AP6XjcBTGQcZ1VorEfYxlY340E2FM1g=
X-Gm-Gg: ASbGncvc+m1AXbAvEsu+3ncbJe48sxzMIvNAYuCAlV7Vr/3yjJRtFCFtdSthpmFrXIA
 I9uJ1rHD9ER9J0mTEb+JkQNrTdaeE8xGDSns3DdKhuOgmGuAnomtoOC2UZ5kTwj4GFyNQdPy8By
 0I0j7SneM6Mfd/bEvVEnN1sZoTdPryvo9Iu1xe1FkKLXUklzpOGyvVUSua0TZSuyn+GHihUHesK
 vZNhhKTv21gtmS/ithbcEvu3cOm+qZeVaDUg4vdXyCXN/MAVpU6Nv9ikkLX9ooMgLH4O0jC2Ajh
 4IbWlMzhPrSlur8vbTPxgBzbeOppRckzj/ZM5p01lOjsrT8wUqs9yiJldFy7tWTnjDDjwWY=
X-Google-Smtp-Source: AGHT+IHN4TQQDcSOwXKpfuPORhrxQ9cJeq7yFtgX9iUm7RPvnEU4xWfa1ad7OdRTHhcIA1rKUqRDiA==
X-Received: by 2002:a05:6512:3ba9:b0:545:1233:d4f9 with SMTP id
 2adb3069b0e04-5452fe66b4fmr2845657e87.30.1739823327250; 
 Mon, 17 Feb 2025 12:15:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54620544eacsm565555e87.136.2025.02.17.12.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 12:15:25 -0800 (PST)
Date: Mon, 17 Feb 2025 22:15:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
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

On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> container.

Is there a more common name for this format? Otherwise googling for it
reveals only your series.

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 1 +
>  include/uapi/drm/drm_fourcc.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index cc7e1ef4ef21..07b03b0fe9ad 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -280,6 +280,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
>  		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f936cac2aebc..7e8aa3bd52b9 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -246,6 +246,7 @@ extern "C" {
>  #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
>  #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
>  #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
> +#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
>  
>  /*
>   * packed Y2xx indicate for each component, xx valid data occupy msb
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
