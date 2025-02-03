Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44BA2617A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CAF10E535;
	Mon,  3 Feb 2025 17:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aiwbF1es";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B4710E535
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:31:33 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so4875731e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738603891; x=1739208691; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6J5C2NglTFNy0YpzDKyoh02/sMog3Gz9jf3ZxrSeYfw=;
 b=aiwbF1eswOJSd0AxlEcJtdowUdM+IgOXMScFucpGPyOPyKaKJq5AZ/Q5oqvQ7OvvHM
 ZYycZS5+aFSDSJqqG2cPu3y/PZQ7/IoNBcjHgq33Zm2nDlYiGWMz/LzT+pzTLgpjuMsX
 6fw/5K1jSZFaqTtpDQ374b3dlXMBch8KWwSuDA+pXVkNCjSWU+ki3SxgqIFDqv9JhFvc
 yBU0Ij7VOxAQJQAQ46yZOEc6ULMCtjE4kCaekyNTEBvAAa7pnFUfmaJPGd5lGAhkHWco
 xPGELWMgo1jOoq58pF6PRW2NlGdlBrVsP/RG6tmOsGsB6MMtxmOJ+rxdhNe4f94NOGEc
 PASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603891; x=1739208691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6J5C2NglTFNy0YpzDKyoh02/sMog3Gz9jf3ZxrSeYfw=;
 b=m/aymPxw/vqjeIHcJ5CS3MOD0HFhOegjWmpzrcvArdGcJdmy0eWIuEkEchufymCFGO
 GFSNd09ObwO6dYJ9Up+r24o6IyMppfYyG9np+pEzQMkWJ3Z5OJseCjW/22Gn1Egyw5id
 N3QGsGahfEo8XHc3s31EVSnwIhOrx5Nd+Xl/RCTHcRTIC4rWQK606dZ9cP6a3yPpTpbi
 +q+MkOSChxGP0v5GOF9mYQUTPxlutnbv0A4Dh20aWdJPbd1zHUrAmjAMwMaaODVXsf/o
 KFxn9POVHTtdriBlL79KCqd8rCM3MrvnCvom8DIYyFWi6AmORJzhmlpJ81eQ5dj/dBnm
 qv2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ98FIaBZy+dQvNXl/K3Pdky4z6LoM58Z9Nw8GFj75K3ih+KyG6XgN3/6NnpkrS0jxCMpUG0+kryY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKfdq6a+wbEK1Al4MsmMQUBuDZX53XyZWz5+eso0/5rZknERlu
 ymwnQRNRzpynV5Yx53WntuVXa/aoGCmLt4RjJnO6hgjVjCpolzMM+IzcUIkBlmc=
X-Gm-Gg: ASbGnctRpXGhf74/yN1hLEX01DjYK0OS3EiW5b9wCbLpCQuJ95Nyw+0P0ISnjwwBdlW
 oUgarvjBgY/f2/LJZxmE8DfHJRERfbgSiYPyAcWPqZjJsavBmA67BSi2OTeqnvJU8c13rWCBGJj
 4IVaHIkxKJ7jO3lxa/F3gvK4sN0HPfCKqayxbdldtiXEF8fRnTs2Cb2gLDk2vcGCXOGUiNkUsoO
 Dj9NIwIOcDXjp1Whrf+eYS8n8PBL+7TxWoRuwO6ZVVCjSiuHrUvofCaa3rMnuGJ+Tz2KuE8q7ud
 r5j1dkz1qUuP9HgTJKUd18XHF6vueopRXowR/cL0iHR22jHAqc7rtbUbxaQjku3QjVOa2Go=
X-Google-Smtp-Source: AGHT+IFkNKZpMLqmFDZoDeQKhVlcO9/NhY+aFDQECzKLKClwYk71/Jrbal9oPP0TJgwbGI19n1UGFg==
X-Received: by 2002:a05:6512:3183:b0:542:8cb0:88a8 with SMTP id
 2adb3069b0e04-543e4c3fffamr7547584e87.52.1738603891401; 
 Mon, 03 Feb 2025 09:31:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb06bbsm1347935e87.146.2025.02.03.09.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:31:30 -0800 (PST)
Date: Mon, 3 Feb 2025 19:31:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Message-ID: <tk7ygprxgujdok4eo4iipmqs2bnsecxngltz2mk7kyqwl3ufpl@23rygh6g5iam>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
 <20250203161607.223731-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203161607.223731-3-herve.codina@bootlin.com>
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

On Mon, Feb 03, 2025 at 05:16:04PM +0100, Herve Codina wrote:
> drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.
> 
> This resets all active components available between the CRTC and
> connectors.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
>  include/drm/drm_atomic_helper.h     |  2 ++
>  2 files changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
