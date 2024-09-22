Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DDF97E23E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 17:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9570B10E215;
	Sun, 22 Sep 2024 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a+GhEoXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E944310E215
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 15:17:17 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f75f116d11so33487181fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727018236; x=1727623036; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TeCC5/9RmB0gTYUjRiZDCiusJhlFT0bcy4ZTn9uJ490=;
 b=a+GhEoXplC5xXr8ztpEsV4+i38BtkfSNl6OvexopKRk/athHjo+qOaYMLAtvEC+3uV
 qaKhM3Xav7LFGL+/rw/GxYfmTXmxaXdMGhrVGALf82TcdA7Wc7xWDeqy2hXFJKTEQxx0
 lSbmwYoRMwzVXl9/InJVlnxr7uMCWbRDQZYvijdgJAADdqkIrDLLwWr/TGF7nUwTn0O5
 LFALXpmH+UIugXvFuZYr5xYSWYuaeR1CKehUJFoP2rnLakcCEefEkruy+y/QVmpaOOrH
 CVvLv6HnqBh9rq2a2FdcA+QzVbHjdy2EQ/KPH4hSLiXxYDbIY0h7ELlOBuqC6Dlw9Zp/
 nEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727018236; x=1727623036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TeCC5/9RmB0gTYUjRiZDCiusJhlFT0bcy4ZTn9uJ490=;
 b=vA3gaCmXlk6lxp7vBeU9zCUFtIMC4p7ASRuCfRRxxwqx2t53kxwGBhu3xgIlQFiCUm
 KN/iviC8ewHd4DJzZOolAGH/k/A14lrLuJEbx1B8jyBnkOoPdHISc4zuZpMTfc66bLX0
 aCbJmTcW8WYC9x3+AMHj4EipTsRYIt08vEjQigCwXlUUD5KOzg6mlkyviTpNkVT+uA88
 nEiscNZBgG140Ok+AQU7cpCUQcKvVQEGE5PVckvKkoFS/AuIPq/XOhOk0KVyj0GG+0CQ
 kxQWrD1m43GUmaTyaQwHdtsKOgmOA1m+qsmkkWsw2erYuSXFeTv79VSS3/9w+y+rJTER
 rgzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ra2rkRJ+VrkqSqIcoulNgGEGqy3/WHK6LU9c2XBbDnk81b7SJQD09pclysVIXCf6DjOz1e23noI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiHwXgC8+dg07ThScS9Z/8HZUxjXBAXiM4TZxpoyTnIp4pvgUL
 YNz/+u75BLuKEHpeE5ZmabGT6+NSBPsMXRHNrW4mBR/PyzOt0A0jygd7GL+G/3U=
X-Google-Smtp-Source: AGHT+IHAuK4UgGskL4u5XMMZ8JsOOoAhqtHiAO1+Qtjx0XeH5NZu9bnznsfA1ZHqJuJqI4R7g6zY3w==
X-Received: by 2002:a2e:d02:0:b0:2f6:649e:bf70 with SMTP id
 38308e7fff4ca-2f7cb322e00mr35426531fa.26.1727018236049; 
 Sun, 22 Sep 2024 08:17:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d3012a5sm26536271fa.42.2024.09.22.08.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 08:17:14 -0700 (PDT)
Date: Sun, 22 Sep 2024 18:17:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm: drm/sysfs: Remove device type drm_minor
Message-ID: <vak3kj4r75tt37jlsofowxjwlyfraihfqajrb3hjxeyblfachi@l3kicsmya27l>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <9bf64023-cc27-435a-a1bf-f11816229d49@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bf64023-cc27-435a-a1bf-f11816229d49@gmail.com>
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

On Sun, Sep 08, 2024 at 02:14:43PM GMT, Heiner Kallweit wrote:
> This device type is set but not used, so remove it.

Please describe how it was used and why you consider it to be unused
now. Hint: d14d2a8453d6 ("drm: Remove dev_pm_ops from drm_class").

> Whilst we're at it, constify device type drm_connector.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Whilst we are at it => separate commits, please.

> ---
>  drivers/gpu/drm/drm_sysfs.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

-- 
With best wishes
Dmitry
