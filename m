Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07857A1CEE6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 22:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7487310E231;
	Sun, 26 Jan 2025 21:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="izh5HHGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E70410E231
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 21:53:48 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30219437e63so50221921fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737928426; x=1738533226; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2vuHWE3c3P5mXIBaPCFvNtHj7JvZR2Hig22Vs6+lycc=;
 b=izh5HHGK9MNI2mSuj+ys8cNW6qWF0vmt3JP+8H6U18fdrZvbWxk/mlHAjFmn7pff6a
 2ForgBBkHFYlhrqY/CkbZtThTXCOF1LourxJ2Lg33hvJhQzRmi4Us2Qp7STo+KrIULss
 Yh4piHUUaKrV1zNoxiHtgsk0pEEvO2GmthB5zMPOeYtUt+W5b8Meg3/pk7OvsEb/VCgP
 YzUl6lGZT6bOY4Av77n4iEx4h/p1pSiIDP2YPCXo+5feyqR9pLcd5CkdzTkwdqA7VlOq
 w4J7Y1vD5wBkeB3aDz/4m3Wi77ucqUGwfGysCmmsGPSGazSSeYdLwZs+HfR8we62wP4x
 HvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737928426; x=1738533226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2vuHWE3c3P5mXIBaPCFvNtHj7JvZR2Hig22Vs6+lycc=;
 b=Bi8oT4TgaaO5BlfFSP+GrFK6vYAjBodO/9d6rIpffPatxc5est0DpnCWpnYziEWk0B
 uirWMuOf6TKsJPT6l1iJ1gfWrPvTr9w4GvORY71wjOG7o3LMzDd0ha1FtRDPUwSm1mXs
 D5+f6zeIppiroW8gyrLr1YwFRVjag5ySzV86osAK5//sLQCLaXZlyuN/RiFlf0ppROK3
 5AOiWndfmhkxsTTTj6nvtZ3TXY5Cp3wb9LGMBaDXdR+wvRsbQKu0uKmtjV+snux1UNRK
 4uhrHpU/kz+pclOdIGnUsPYmdehjU4909VnJ+UE1KIdy54Ao+T/MaFdSmV+BtYPZVSFn
 37CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXothFX1t69Fgh4rmhl8XuZ1jBOUtB72gC9vb6ccPw7q3v4cjUDzuGgEi21vUN7yBTJP+eyYw4VaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjE2xEBlDJ8fv++c6BsbR67K9w4HmU+mYxQp5TNWDE6TFd/akA
 Bh2NtRRZRZQ37dhi2Wnsus6o9RbxlfyEG7EL4/Gy4PUzyGQkqJVfjyLtSTx3NYc=
X-Gm-Gg: ASbGncsrTSlvrv6967r3f8k5ou9Sil+fLPv54Fe8uhIHsaQZ6d1zSg7O/TBni4VcU6u
 FBSCHtmElBx/NjlHSebdKEksllrotI1qPVPDseSamtQeS+nsZQeYL1UCfWOuhwADsEyn73GkNeB
 zkWXl90qSE6P9aDwnB7JDCS/7jdrO+F5BYfvL/Suyv2uLxjwnq/uGm0Nj42fFXtNL7+0HTcZQbp
 QgbA62Rx/DskxFm9r5qE0QmDkLr+dmt3tUA4ufLnMCT11Bu3VgZQOyBeFHBOvEx2NTEVzHfo5oG
 0siwy9EibDiYA6jSezEKyGRikPMdzQMlMh+zTt+dA3AZ48S4Ye78CiuPa7O0
X-Google-Smtp-Source: AGHT+IE+mFvfBsZgyjpmycwdfQBiQ6idR454dVw1vzk2Jjf97WBUi7k1oPfw/eUW9F4iOumjTgjlmQ==
X-Received: by 2002:a05:651c:885:b0:302:49b6:dfaf with SMTP id
 38308e7fff4ca-30761c5f917mr54879331fa.20.1737928426234; 
 Sun, 26 Jan 2025 13:53:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076ba6bd49sm11420091fa.16.2025.01.26.13.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 13:53:45 -0800 (PST)
Date: Sun, 26 Jan 2025 23:53:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 10/13] drm/atomic-helper: Refactor crtc &
 encoder-bridge op loops into separate functions
Message-ID: <6tyastqack5ansocbug4yw6fkbvdl5rjaq46vunzviihgjrxqp@eo5vcykdmmng>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
 <20250126191551.741957-11-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126191551.741957-11-aradhya.bhatia@linux.dev>
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

On Mon, Jan 27, 2025 at 12:45:48AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The way any singular display pipeline, in need of a modeset, gets
> enabled is as follows -
> 
> 	crtc enable
> 	(all) bridge pre-enable
> 	encoder enable
> 	(all) bridge enable
> 
> - and the disable sequence is exactly the reverse of this.
> 
> The crtc operations occur by looping over the old and new crtc states,
> while the encoder and bridge operations occur together, by looping over
> the connector states of the display pipelines.
> 
> Refactor these operations - crtc enable/disable, and encoder & bridge
> (pre/post) enable/disable - into separate functions each, to make way
> for the re-ordering of the enable/disable sequences.
> 
> This patch doesn't alter the sequence of crtc/encoder/bridge operations
> in any way, but helps to cleanly pave the way for the next two patches,
> by maintaining logical bisectability.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 69 ++++++++++++++++++++---------
>  1 file changed, 49 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
