Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 459703EEE50
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 16:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621F36E1B3;
	Tue, 17 Aug 2021 14:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F276E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:17:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id q3so27692170edt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 07:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=k+aABhMthaQoDrk02uh408W/KEPEIDm/ot+tejRw8pM=;
 b=XO6bZar+T47NLzOUk22utfYqhT3AzY4/Whapc0H78dBvVb8vd9SJ1y3R/Q38KNk5Qb
 zEQdcaZl8+SSZzrPs7D6Q4tnpOtEXvRpKuluue0TbE8xi3kYokiGfjQtRrtYpoj0AuRp
 XZoxQT/58CLSE7E+wbc3E7fzQl40+gixx4UoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k+aABhMthaQoDrk02uh408W/KEPEIDm/ot+tejRw8pM=;
 b=CSkJ4yq8+SAr4PgSH/SetiAY/8U5q4UCTYFO4Dtmlospk1H6GyNHz19+WucWNAe40S
 81ZfJVhy/kYbPZEGCLBJW5EZhnJ2qg3RCGqYYoLzl/XXqSSJhquPJXzbpiep1Ox+oUlP
 3HFtYEU/RCiujUqe1zS39SuVoXtAlisBxacM+0G92MAeTMVtCp9g0qdyX95p5Z/x3/ci
 EhrsDgN+LU3zsDVNnj2i5y6YIjhP5OGJIhewLSyP4FbMaHPF1tRFGQpVYyLAigchW8P2
 AwATISgsGTAIjFqSOLJDu2J3gORYelfOGDhbt3xRYFQeQWRi9dinpYtegNxnvKaBtw4c
 AXzA==
X-Gm-Message-State: AOAM530LuN8JzAXCHpvjW438+vdnLc5zAR6iEQ64ejqEtEUWPuEBfRX/
 womtzmiTU+fRcipEnUT+hIIS+A==
X-Google-Smtp-Source: ABdhPJxFL9xqgCdZcDQo2NxQciN1o5c7CPEdi2Gse46fa9AGXTk0M4dmYAO+6ZJ5QCpSgtVHaiBaaQ==
X-Received: by 2002:aa7:d2cd:: with SMTP id k13mr4376675edr.0.1629209824349;
 Tue, 17 Aug 2021 07:17:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bf15sm1121670edb.83.2021.08.17.07.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 07:17:03 -0700 (PDT)
Date: Tue, 17 Aug 2021 16:17:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, peter@stuge.se, linus.walleij@linaro.org
Subject: Re: [PATCH 1/7] drm/fourcc: Add R8 to drm_format_info
Message-ID: <YRvE3duZY6lINDV0@phenom.ffwll.local>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-2-noralf@tronnes.org>
 <YRvA3N7tb6mz1FrA@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YRvA3N7tb6mz1FrA@phenom.ffwll.local>
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

On Tue, Aug 17, 2021 at 03:59:56PM +0200, Daniel Vetter wrote:
> On Tue, Aug 17, 2021 at 02:29:11PM +0200, Noralf Trønnes wrote:
> > Add an entry in drm_format_info for the existing format DRM_FORMAT_R8.
> > 
> > Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> > ---
> >  drivers/gpu/drm/drm_fourcc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index eda832f9200d..783844bfecc1 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -133,6 +133,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >  {
> >  	static const struct drm_format_info formats[] = {
> >  		{ .format = DRM_FORMAT_C8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
> 
> Uh the depth = 0 on these is all a big lie, same for the 332 formats
> below. The only format which is officially depth = 8 is the C8 one. I'm
> not sure it's a great idea to announce others as depth = 8 ...

btw if you really want to go fancy, full dithering for these might not be
a complete waste of effort to type it. Temporal dithering probably too
tricky, and also too many folks don't like that.
-Daniel

> 
> Might be good to throw a patch on top to drop these. Same for the ARGB1555
> ones and it's permutations.
> 
> Anyway it's consistent with what's there.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >  		{ .format = DRM_FORMAT_RGB332,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
> >  		{ .format = DRM_FORMAT_BGR233,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
> >  		{ .format = DRM_FORMAT_XRGB4444,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > -- 
> > 2.32.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
