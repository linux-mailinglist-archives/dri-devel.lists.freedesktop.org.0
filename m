Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCACA33554
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E72410E24D;
	Thu, 13 Feb 2025 02:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r7sk46wC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928B710E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 02:12:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5451d1d56a7so396645e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 18:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739412742; x=1740017542; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rw/9a5A6LvNevv/YEo/GWDHEhu1/e1Me0h9UeanBldo=;
 b=r7sk46wCbU2gdh6wa/IvQVJkhCA45FfaebVSsMB4Jt83AU8Li3X4VT5nRqc5XLNBWm
 ZKr8NIVPbgThBH3yYQNcY660XkwNsZaYPmYe55JFvJ3yp29P2Zg72ZEBi9eU0wOg3bbK
 ostNvq/fNRBAIe3CygFm/DsEpBfuoL4LcOwx5zngMhs6aHC3s4IovIkwydJh+8DK7mzM
 qu+WUPs4hbcwnRYqUcfs0TFHeqHCCMoDfhg/4eQ28FwDzFNygo+pAoJIkt6H3o24TuD0
 05k22holfqPYhx2mqLzJBLjr9uUkz0SWzpRoMpsuQMg3sTW/3wB6vyXiIyYEGI8kkUlJ
 ZFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739412742; x=1740017542;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rw/9a5A6LvNevv/YEo/GWDHEhu1/e1Me0h9UeanBldo=;
 b=rqtS7ud3KncFN1ll1EbWDxQGI+ANLG/DLtS0l9p9veCahS3QKAOH75PgrNkkUjfUNQ
 V5+CAD99jFb3YJ64MbRAv2eNhjDG2HyXsOh4l6vok3TtT34IQpWD2Qt3eCZKIRZYhDc0
 yd0nhXMi/pyHfuPKK6Ey4N6da4y+P7qEhx6nR9ztlt3/2NxoOKaMJgoKuE3WIRhZH6bl
 myC8O+cZPqhBFsqmLZGIEhBbEHtOnXko2Gz6jY4xWMgFBQgoynH6TBl7IBwtVpZLtFc3
 z5pgxS17+XGlafHSeVsSw3s3YVBMrombjkFhF2WqkigjnPytDsg8wkyqeXnih7YhNEak
 h2Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMoR6mgBFktk0RvqlMRVTcRhAPcdZ1LCMACYVLsS/NgiPxn4xsf8cu90XS7IgbNzTZP4mXGNodJK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmrVFm4lSdAVhKl2qoUoUpoxpmDt+XaxxCFIgwJ8fbx3xnYdLf
 vecd6Le0ozQzty+xF7yAYphmL7q056US1109i6XhN503xSmf0jV2MdhjnLp0N6Y=
X-Gm-Gg: ASbGnctpdQUZib2lD/CJPN93JU7S/fZcf7O2czA7J8PeaY5jcJFiCLL2ggo/PJq8m/q
 7gfU+gi04fgSlngjVwpWYTwU+efpXoDQrqpGqTqOHrJKs2SPVjTkGm0EjrMzB48OiLWojRYRGme
 tl4SQAGEVZNSqHEAt8NW+35JPA7BBY6CxSy2VEct5rXrVR92PA8d8CrAY41sVw2o3XWicHIMJCW
 olOwu01y9dMdO1eG8qjpqvvIhVNgfV/bkwRF/ddFd9leSZdgR+mHc9fbondFC6+E3f9LaJdndtq
 mA+A2pLf/80kyETmuOhFbXIVZISUG1ef7UDsbru6XtZJXOarC/QduOX+ph4rFYJ7z09UGoE=
X-Google-Smtp-Source: AGHT+IGQtYrcLDc/I8anHaIYxUqEHWkHLWFBsjN/VO65ZVcW4zr73ZK5nrBsOA74X0CKYm6L1Ss1LA==
X-Received: by 2002:a05:6512:2101:b0:545:c08:e18b with SMTP id
 2adb3069b0e04-5451e4f0832mr295754e87.9.1739412741686; 
 Wed, 12 Feb 2025 18:12:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09b3c1sm32980e87.76.2025.02.12.18.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 18:12:20 -0800 (PST)
Date: Thu, 13 Feb 2025 04:12:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm: drop i2c subdir from Makefile
Message-ID: <twu3yewyuj7e27jiboqrcjsmxwccyzrhmvvp7qmy3dunewrzfs@nsjiuiih23g2>
References: <20250213-fix-tda-v1-1-d3d34b2dc907@linaro.org>
 <Z61IS+WVVi049Dp5@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z61IS+WVVi049Dp5@lstrano-desk.jf.intel.com>
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

On Wed, Feb 12, 2025 at 05:18:03PM -0800, Matthew Brost wrote:
> On Thu, Feb 13, 2025 at 02:49:41AM +0200, Dmitry Baryshkov wrote:
> > The commit 325ba852d148 ("drm/i2c: move TDA998x driver under
> > drivers/gpu/drm/bridge") deleted the drivers/gpu/drm/i2c/ subdir, but
> > didn't update upper level Makefile. Drop corresponding line to fix build
> > issues.
> > 
> > Fixes: 325ba852d148 ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/dri-devel/20250213113841.7645b74c@canb.auug.org.au
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Our CI caught this too. Thanks for the quick fix.

Thanks for the quick review!

> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

-- 
With best wishes
Dmitry
