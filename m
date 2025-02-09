Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE2CA2DA95
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 04:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E2510E20F;
	Sun,  9 Feb 2025 03:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="he6iGKvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3402F10E20F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 03:31:44 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30738a717ffso29896571fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 19:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071902; x=1739676702; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=28IEsxjLPW/17EuEuU+kwykv943l5wZ3TOeqG+jMPnM=;
 b=he6iGKvcqrC5hJmKP5Nx5X70uC0q1TkLKTYCSgtZqtOL/m4drnfur8QgbVVgOVIn/E
 0/K15TbA2c3UVe/zbGPgkt3IC84oL2eTIM4N2Z/TLquGeGo6TTJPDGGvmXc0kJfemsEX
 uDrNgLY0OPYMwWckMm9nxIWniuwTrh742xgA4+edac05nr1antZy048LYDTar1OICUq2
 7i357LXYpSmNvYOTuSdFySXWqEsFqRbDNh5jjbB58HfM2DaJvqQC1ocFpggXP7B9c/bs
 alwVh3SbPxwIUys67sdqvLYo+zP+cGOd2lCyAbnfbzAhzIZ9Dr5nBhkANImnpLF0STiI
 6Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071902; x=1739676702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28IEsxjLPW/17EuEuU+kwykv943l5wZ3TOeqG+jMPnM=;
 b=p/G5Tagi9O69yFzoJO/WZs09QaoR4+zjvsgtDF2RUrI02Zf7Ut+2yjn1Cv2L993lSw
 BoYRStFoPdkPDlSVzxVWscjGUlUnwvNX2khivilIwzPIY3A6srNtToxoeibVutZynO12
 pklk0tYiM71jFRWqM/86mHs669E0a8xAK+emZ8r681CXdjKZ2hPbxB6yjjWy944iv1SR
 cqfhSqXlElqeWbDwZ+l01H5nzhJ+IX2f41aCRTwMDnNzPKU6GH3uaRkKo8Pu9m4VVvI4
 nzmIuO8LgFRcCg5mZEfJu71MPi7scagcW2A/rgkY7VWS8Ms3YLQxcd36oIxHJA2unZes
 fWmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyBix3wPUa64bFR4xORXWemnl1KkbGG4Mgq3YjxupdzaF4c4Q1pl+lffc0uYfC4ODIASs1y995hRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTadR8TGyFExivlX5tx35qL+iFEVn7/BvaSkbIF7JR6/OvoVg0
 oM1WPLDPO/zIb20Ot5m3tDwAoYqdtiORsiolmTnD8lG6hZfhuDVMg4YZrr6dJsc=
X-Gm-Gg: ASbGncsMOr4fbU33HrBOOPbhyjwFue4ZiVOyTUvsR/5cR03sd0f7MVhEvodWHpiPUtW
 XANd4vNMAqvgmCA+L2ciZ2gUJrvZki0TYUz2MKxYhA66frgS6fw4d5/HS3NyO1391LSyPazL192
 ylWnRwaXANl9EOS9NIn8I3DMyHz8MQto+F8WswZntGnM+3jNETOHHJLjnvzU8uSH+i8LOqR0DjY
 NgfHT34dSU9g4kP5E6zzF+gKUHDwFVDfTrj1qw+yeXKJOz87A/kI9Tvu6YjPfELxX2ooDOjHSRs
 kNfb90Ky6bTIiv7H8gRt0CDniEiHYmEZ2S/QMeQJkG0ucoPBCY3LDoSBYyymKr+d5BxHxsE=
X-Google-Smtp-Source: AGHT+IFiG9OlyfSDN9Gbzge8HDkG084NNv3XQuhDjBxeTaCVWE6puHcqHZdRNWTexmpMoVSUwZacRg==
X-Received: by 2002:a2e:9147:0:b0:308:860e:d4d3 with SMTP id
 38308e7fff4ca-308860edd40mr21033071fa.22.1739071902274; 
 Sat, 08 Feb 2025 19:31:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308ec25911csm21241fa.57.2025.02.08.19.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:31:41 -0800 (PST)
Date: Sun, 9 Feb 2025 05:31:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/3] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Message-ID: <qd7stwkjqqwrozddbllgz7brme5udfnncaltpacmxgemvj34vd@fdqtyokt7ktv>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
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

On Mon, Jan 13, 2025 at 11:53:43AM +0200, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
> on-die on the TDA9989 and TDA19989 chips.
> 
> Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
> drivers/gpu/drm/bridge/.
> 
> Note: In a comment for v2 Hans has acked merging these patches through
> drm-misc(-next) with no additional immutable branch.
> 
> Note to RMK: I didn't change that, but I'd like to propose to use
> drm-misc tree for this bridge.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Dropped irrelevant sentence from the tda9998 commit message (Hans)
> - Link to v2: https://lore.kernel.org/r/20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org
> 
> Changes in v2:
> - Moved TDA9950 driver to drivers/media/cec/i2c (Hans, Laurent)
> - Moved TDA998x driver to drivers/gpu/drm/bridges istead of tda/ subdir
>   (Laurent)
> - Link to v1: https://lore.kernel.org/r/20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org
> 
> ---
> Dmitry Baryshkov (3):
>       drm/i2c: tda998x: drop support for platform_data
>       media: cec: move driver for TDA9950 from drm/i2c
>       drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge

Dear drm-misc maintainers, is it okay to apply the patchset?

Hans previously (in response to v2 cover letter) acked mergine of the
CEC patch without additional immutable branch.

-- 
With best wishes
Dmitry
