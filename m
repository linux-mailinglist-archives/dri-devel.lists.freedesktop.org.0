Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468690DA80
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 19:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1754A10E21F;
	Tue, 18 Jun 2024 17:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cCMgah5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351BC10E21F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 17:24:34 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ebf961e504so62496641fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718731472; x=1719336272; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UWc5R2fCgPmQ5dTsZo1oVFpgeegHmUpDv90F0Wr70Ck=;
 b=cCMgah5mggESRy6q+X1oHjuuWSYL2ZgFWMiRuGLBoA+cz7Jh372DamjC4gELHYdE47
 uoH72/+T2n2NvAREgcZ/5VXE2x//RKH577WiqmTMZ9YdVxsm3HrSvMviktQ44TN61/v+
 ORVYypPNGIlJD6XlhypiTuTm/3OqSFj57aw4J39vbegLGCNX7uQtk1+sA4t1jNBvZNt0
 rqvcmrM6MpgGieEXuE+Z1nRSqiq1dxOKFRaeiKLARlxB4ZkjnWwxbIaILSYRpOHcRTXN
 5bWbjp/HFvWN9TGRnMYNMXrObYFP60lzturKttWuifTjhu1Vovt9oHP4WK3gFoVRBpqe
 jLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718731472; x=1719336272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWc5R2fCgPmQ5dTsZo1oVFpgeegHmUpDv90F0Wr70Ck=;
 b=WVLr4vfTD0NC0uDaXugFAUJVgBSNKaqIfbqz0g88Oh+vBOY2YDmXOdJey0vUhEuBYf
 kQy754IypMTRj1mEVSR58m0eJFXQftQnOdb5NgQUXHClWP0/K7F4S0Zx/T2bfjDAoonu
 4xRjk1Yg13930uFVkcr0zN0wiuonfWG+XV1g33ew2XR+MmBR0FQES/oBiMlosUktf9+z
 svnPzL/NZeceZ4PJnlOamb5khF4ZQh+NXyaB1DRxg+S9o30CDCGVurEqbmRSgvYEA+sU
 PEOGGGQqVkXtmL5USSA07GO/4w5L75ec0BbquUfqT41TbxEYqqTWL6pONhBNk6NjuT5a
 +s/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVywGywxli7t02IIfVrtNkAgsraCgPEqMnUQGtJosPPgHes/JsGuRgt0oQdVIYOMtIWy980cpfGY8mEYDzmMuUafEvCcdzF54zmkMNgTYyx
X-Gm-Message-State: AOJu0YykolgFBjK+5CUSPj3gBn9Hyt49/HPnkrD/hBf0/+eIOHYZfiJH
 iJMXBWT+01AXGNWwZfWSY5e+IEBQByV7uylSVj6WsgPTmsORb273TejjIJI8aW8=
X-Google-Smtp-Source: AGHT+IEWzwDTU5fwaxyyYzF7wNA1htX/B1S82IuB1yuDZxJnrnpE6wymMddDXW6j0o+2+wU0E3upeA==
X-Received: by 2002:a2e:7c0d:0:b0:2eb:fa26:8ca2 with SMTP id
 38308e7fff4ca-2ec3ce9ae80mr3786401fa.4.1718731470752; 
 Tue, 18 Jun 2024 10:24:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec0aa84665sm16512281fa.17.2024.06.18.10.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 10:24:30 -0700 (PDT)
Date: Tue, 18 Jun 2024 20:24:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 3/4] drm: bridge: simple-bridge: use only devm* in probe
Message-ID: <cmi4lqopew6afptocuoif6h6up3xcigpxjbbd57soul37ujw7b@z2bcfiw7lfdi>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-3-df98ef7dec6d@freebox.fr>
 <deirqqoap7ta3iwmmvg6uxzalfe22yirjp6et2a74ffh5ybi64@vekr6l7sl22c>
 <82c982ad-20ae-4f36-8797-440828317d32@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82c982ad-20ae-4f36-8797-440828317d32@freebox.fr>
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

On Tue, Jun 18, 2024 at 01:37:15PM GMT, Marc Gonzalez wrote:
> On 18/06/2024 00:28, Dmitry Baryshkov wrote:
> 
> > On Mon, Jun 17, 2024 at 06:03:01PM GMT, Marc Gonzalez wrote:
> >
> >> Once probe uses only devm functions, remove() becomes unnecessary.
> > 
> > Breves vibrantesque sententiae
> > 
> > With the hope of getting an expanded commit message:
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I'm not quite sure what else to say.
> 
> Using only devm* functions in probe, the remove() callback is
> no longer needed, since devm unwind will free all resources.
> 
> Is that better?

Yes. Or something like:

The only call in remove() is drm_bridge_remove(). Use devm_bridge_add(),
removing the need to call drm_bridge_remove() manually and drop the
driver's remove callback completely.

> 
> NB: this patch is not *required* but I thought "might as well
> change it while I'm in the code".
> 
> Regards
> 

-- 
With best wishes
Dmitry
