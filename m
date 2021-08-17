Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3F3EEDF0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 16:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF556E1B4;
	Tue, 17 Aug 2021 14:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0560D6E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:00:00 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r19so28392534eds.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3WA6vode3InsNEu2roODBzsDGsc3Kj5u/8BIVh5P3/g=;
 b=HQ0Pud/b1h6xg4xXRAZ3HdY8kKA56s46auuUQK8pR2L5bE021VT4buEmdbxevVUoxN
 4ftmMM8tAlvc1nOL8Lvnn7iVBBUzGTA5QvEr6hHGB8JLsRAu53GcwsSX+iYRBP2Y6FO1
 /fe0ZGhAi4TmGUiV+LaoJbTCk35Yn33Yz8GJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3WA6vode3InsNEu2roODBzsDGsc3Kj5u/8BIVh5P3/g=;
 b=JroHP5SKCszgardwDMEFeQuYQSxtqFcyzADS2arviECjz8HXOc5t7LSLJMeHyFJT+U
 0ZwRpLB9rHN1xYtMvRHV8zbW02QJbIc33cC05cEiWBBS4MDip3PdfTekIPaY4Bs3UUxu
 RImX2NcoSq6iB9Dh5wRkzbFRfFDd0oVPtDxcfoYvuXq825C3n2mBU/igJ8sENc+SmXfA
 JzQReizWK513SizpyM2tgC4aE6m6FAggXxmxDvUEHl0Xn2ww6O4Z1KgjwSXL2+BZ1ENr
 pzKNWmLilG2B6WFeWKbiMpU1EFy66ZaLjUnzZMU8QyuBviwTYrOQntpbJA2LmbB2oGv5
 EybA==
X-Gm-Message-State: AOAM533Yg5XGZr//8rTah5JqZqVv5BXk2dEc/4K3pm0QUcd1YmeDqdnu
 G1A65TtRUM2bcE2hJPq6o4ADjg==
X-Google-Smtp-Source: ABdhPJxtBTnEetBxThxwVoFGlJkQwNYuxprIO2mj6ZyvM4tVXzkz4ybaMR8neDwl2p28Qfb86o7ktg==
X-Received: by 2002:aa7:df98:: with SMTP id b24mr4329352edy.103.1629208798565; 
 Tue, 17 Aug 2021 06:59:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i10sm1123823edf.12.2021.08.17.06.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 06:59:58 -0700 (PDT)
Date: Tue, 17 Aug 2021 15:59:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, peter@stuge.se, linus.walleij@linaro.org
Subject: Re: [PATCH 1/7] drm/fourcc: Add R8 to drm_format_info
Message-ID: <YRvA3N7tb6mz1FrA@phenom.ffwll.local>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210817122917.49929-2-noralf@tronnes.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 02:29:11PM +0200, Noralf Trønnes wrote:
> Add an entry in drm_format_info for the existing format DRM_FORMAT_R8.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index eda832f9200d..783844bfecc1 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -133,6 +133,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  {
>  	static const struct drm_format_info formats[] = {
>  		{ .format = DRM_FORMAT_C8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },

Uh the depth = 0 on these is all a big lie, same for the 332 formats
below. The only format which is officially depth = 8 is the C8 one. I'm
not sure it's a great idea to announce others as depth = 8 ...

Might be good to throw a patch on top to drop these. Same for the ARGB1555
ones and it's permutations.

Anyway it's consistent with what's there.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  		{ .format = DRM_FORMAT_RGB332,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_BGR233,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_XRGB4444,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
