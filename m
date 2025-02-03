Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77434A25F4C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17E910E4ED;
	Mon,  3 Feb 2025 15:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uUn3cZn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3310E4ED
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:56:37 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54024aa9febso4589592e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 07:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738598195; x=1739202995; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+ufx9LndyQ+Q8Y+4pq9rBmtvxrTRSiMJivVKQTd2MhM=;
 b=uUn3cZn2sgxIbtK248A5seLG5I64mnVXP9d/CFBAsGZ/U45WpglRGQQnQ+vRU0QPvO
 3uNSgzlCYyFOMSBqxoRgGVXlm0oOI4P07vGgrZk6CUJd7gICXl6/3lu50K4d5e7Vuza9
 03Fe9ib44Eh+oaC+nAUd/Hsxm4TSK8qxGmGILRl9f3BEizvJunB1NHfbLdI8CjX5HVjy
 +egX6tqDyAnlpVw3EjutuwYyKWLSuh/77Fp4roA1Mj3TJGPWEtR1klZ0Zrp49mbrQ76P
 sFGHzpUvAes0SXEA8p1ZXHq7aHYUpnrcQhJqYGdNZRIk2ISyot3czOaeB1U0f81RRSMW
 czyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738598195; x=1739202995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ufx9LndyQ+Q8Y+4pq9rBmtvxrTRSiMJivVKQTd2MhM=;
 b=ZB5B85s3Du727yYD899G7WA4sqwhwV0Q6pD164s0DhcEPgL2tu07Pjud2sNw+Dqm2i
 1YmIOUYGAtInivr2NO57AeInUJpD/NgScNxYKjgBZeez/abgk8PASx4hwB3FFUf8KzqZ
 hAitrrCuMz//QHza/MzFTivKU/A72IaPk7YSS5EsZzqWX3t6IQ6wIVolhDudkBE0r5Di
 lL4LOkxMnVGuPBKErhgFJSYSPS7Www2PRMr7wAz0oh/IMjFgjeUrvLb3ve2AISeiQk81
 JTKSCZKyJ5WyL8qH0uD/i4SI95qTqvHa9u1w9ViuVKFGbMy9up0aePZ2RcF/G6w22pUR
 sM+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA0Lsa9NejfAI3PnHAvrzG+ZW0963VS1fnsM9GF2d2I85RKihXVUKySmGirxhSLIhRir+EMsMfTyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEXGrIzZR7P26ORmgK8ryOxTcGAq8QIXb6SKOarTfjkEViv5LG
 CtIhQOt9F7lTqpi8h2KMlbRtaYugkJ5ElexPbtZ3M4PJnQCqfY1/NhIL85fqzZY=
X-Gm-Gg: ASbGncuTbI8JGLgC8wwLv0wz22h9l1sXXI6sfHOTApvK/rLCrzdmaYSey4Gb74oHNby
 z+gihMnfNJNWHNErACT0tAvjW1f53O1f1usmeidEOHJoDgx9KL4uK9uuEPF0w/2Lmm/WIkq/X+d
 omaesdaEjsPRNsO8zoR62z8nzRu+tIcrOU2pAhFy6okDaj5/dq70sQ4vGve+dmDvHb0ZLcJjoKA
 0LLG5VRso6DE3TPfEFaaFZ3g1v8BVO+VuK+oVBsQHmOozTZCtCIbKKW79H1qHbvT3gDIRmIn5nW
 98P/Cup2I4mnhcjvdKGICeSFYABwrE49FGyfwoZyBGcrNiapjFDSK+4xlTEvFiMuDv6AOeU=
X-Google-Smtp-Source: AGHT+IFT9JYuit2k0e9HSaZLgvpA0Li63Lnd/rY7xCOAkHWEzZCyLSO/loAyRrahXsnWpzZ++/uVIQ==
X-Received: by 2002:a05:6512:33c9:b0:542:29b6:9c27 with SMTP id
 2adb3069b0e04-543e4c3fd62mr7381291e87.51.1738598195122; 
 Mon, 03 Feb 2025 07:56:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb071csm1327031e87.134.2025.02.03.07.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 07:56:34 -0800 (PST)
Date: Mon, 3 Feb 2025 17:56:33 +0200
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
Subject: Re: [PATCH v4 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Message-ID: <76stqnzkm5itcoavv4vl7hbjiiujtenov3qaigdikxqjsuyif4@jhanrdhw5jly>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
 <20250203145824.155869-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203145824.155869-3-herve.codina@bootlin.com>
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

On Mon, Feb 03, 2025 at 03:58:21PM +0100, Herve Codina wrote:
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
