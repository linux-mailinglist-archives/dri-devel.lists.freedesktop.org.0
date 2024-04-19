Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CAB8AB135
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 17:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354810E108;
	Fri, 19 Apr 2024 15:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g1Hbt7Ny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B9210E108
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 15:02:27 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-518a56cdbcfso3461783e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713538945; x=1714143745; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q5l3DrKtVmRlu1zHtwVyAGR5CrXZw06HBbbhzszuOCs=;
 b=g1Hbt7Ny39fPCtYrum3EDInbmXLBP+YBtbBjApGCZLxMFcjjs99yQ9lCQPsC6zKfCC
 lVNCZzjBtnhY0qq+rEK5+wXXqlpy/J+2AaNprAG/wrp76T6xw6ixVtRpWhtxHehZE5kQ
 JaUU2c+mqfGIK2UbG1az6nt/KYb9gBAGx30rlR55DHyxX+PrfmE5LBfmTjdq5XK1fWxg
 b3Nfs9dhruiPv5HAnyddjG3k6/XrQqhPTr9QKNbTJLbDKlwAUWJ3wX0uR+YYWQ6mDaxc
 t/X4Twov0BVs4W6sF+OR/sl9cMcfeUZsJS9raDd3pPbGLKn43RE6yh5D24a12hb6LhZO
 EmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713538945; x=1714143745;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5l3DrKtVmRlu1zHtwVyAGR5CrXZw06HBbbhzszuOCs=;
 b=ttHi4wbjHAv5GHgP8UcSy+HzZ4rmSjFB4Fvqm6FUv5CeZ+8iRzEDmMw1Tw0BHAFMMo
 GiILb4N/qcl3v93PZ9+pn1jXwzlpNrMpG2LvV7eSN/0MCvUMtOO+TwFJ0ckzXNiMJ+AJ
 7Ipnr0/sbNo1vI7bAkpc8qEWfrmYO11xyVxHmwhOk3qwzNyzGg9m1GuanaExwnYr5qgC
 o8kC+3RmD2FwJlIZELPmY0y8UlqxKkK5mp9ywL83BJHj+dbr/VzeNP9QgznT05m1mIdQ
 0iEvoPiQikia50LBVi4+XOey1bzdLUKOj6yGH1s82sJmdYT7EeBjZsp7ueYgH2mTodr1
 qBow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoPimNEw1KQEirKrgbskIxREz4QKHrwNz0at7HVjqN2DEBYoGuocqvYjFqPr4XYWcF20FaRhyBLB/dX9rVNLg+2Im+sZF16SnOS4TPxudZ
X-Gm-Message-State: AOJu0Yx9Pd3gFE3+pjaGnoa9mIUJQ+lyWMu+zRKnd1BIVb0DQff/HPOu
 k69gAwKWqtq6zjj7/4wxYndxRMk/q9QTi0vNzaPtdJsyEwLJS+RFliKZNslXwLg=
X-Google-Smtp-Source: AGHT+IFZjrcp1mUuV6AiLWBqjl9YPyYjAFAcHbb4bUs3L2gqHQFdPg1/mX9b9o6ObWKJe26tsbZinQ==
X-Received: by 2002:a2e:3209:0:b0:2d8:2714:38e6 with SMTP id
 y9-20020a2e3209000000b002d8271438e6mr1865865ljy.25.1713538945291; 
 Fri, 19 Apr 2024 08:02:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a05651c021200b002d9f3bed88dsm636898ljn.77.2024.04.19.08.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 08:02:24 -0700 (PDT)
Date: Fri, 19 Apr 2024 18:02:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Robert Foss <rfoss@kernel.org>, Swapnil Jakhade <sjakhade@cadence.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Jani Nikula <jani.nikula@intel.com>, 
 Rob Herring <robh@kernel.org>, Zhu Wang <wangzhu9@huawei.com>, 
 Yuti Amonkar <yamonkar@cadence.com>, Jyri Sarha <jsarha@ti.com>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on
 error path
Message-ID: <4ytkvuigcxhs437rp46sawpzs6ewhgcldgvsy5c5ohpajt76vh@jg45sjwtwlgx>
References: <20240419113637.25745-1-amishin@t-argos.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419113637.25745-1-amishin@t-argos.ru>
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

On Fri, Apr 19, 2024 at 02:36:37PM +0300, Aleksandr Mishin wrote:
> In cdns_mhdp_atomic_enable(), there is an error return on failure of
> drm_mode_duplicate() which leads to the mutex remaining locked.
> Add a mutex unlock call.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
> This patch is against drm-misc-next branch of drm-misc repo.
> 
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
