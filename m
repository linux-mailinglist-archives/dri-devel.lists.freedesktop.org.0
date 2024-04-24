Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E641C8B059F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 11:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A5810F00F;
	Wed, 24 Apr 2024 09:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wpZVK8j5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB6510F00F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 09:13:41 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2da0f8f7b24so8288181fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713950019; x=1714554819; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dyu/qfLUKMUVy9ySNB9uAE6ofOvsG4ON8Bs9Mq4sTeg=;
 b=wpZVK8j5hfOxeb9zOxdlD3eY9mRALc6lFsfz6In4/Km2jfdf3SnQ7HPbx412rpymAL
 aM5qqHGBUUk+EFGofyBhH+Tf9zJa7CjSsCmk71m2xauwbE5+WpJTwGI1CqnKczAlWMPM
 7EfqwyXApneTcl7O2GP1nIUOuC6DJ11iK83nmC2KKId8u1AvK5QUFVJmBCo3sjtlhgWC
 wUfmcqH4NDJWF2ZWZe+sCZyHs3CHf+p7C8DXifK3iv9+hzdbcE56Z0fsTdQ/Jnz5V7V9
 RAQWrYUAgFKQty1LzXEsV/8DeocBrVK3n1lR980hXj6EnHmM4nuuHKPH5VOtE0XmaVGz
 WzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713950019; x=1714554819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyu/qfLUKMUVy9ySNB9uAE6ofOvsG4ON8Bs9Mq4sTeg=;
 b=C/a6KKc6VaO+8zcXWbDgCmj5kt4i6SGj/xsag8E0u5nL02i4VXjf26PfytHJnfAFbE
 JHh5xayQkb058aE2yCQJHwq3DvczY8iZ2a7lwm54OaEBb6spPR7Tf+e4kNGPI0Xtrhno
 LlVZp3iMwIs2Ec1uB9ScrqKpiis2z0k/rXnqqJnqJV43tvXgEgzYu2WRWebl/xkEj9r/
 XHy5HZFIzCuY/8z8PzKXyKJqnxto8NkCtnBf2CzT+1n0pwLzfMkudTNw2tupweY7hKwA
 MQYu6qquhll6bb1+MYvUMlf4pBfie93Lsxd/z1ClL5cePeeQ/pKXHOvO285Ue02cAKuQ
 eFwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzHEETOZz9tHUk4BYoyF8QacIQ2xYrRh8/ijWVxI6eme5c1p4SHtRy5UgGsLR/G0GrcoFTmv+MXsDUIw5zpcxnUr6OXJZKBU/oATcqQvQD
X-Gm-Message-State: AOJu0YwR83lEb1nZ0M5iZ1S7TzAS+4xY+JG9+ZNVC9KqbnMXuOSRSicE
 R1jbPWUsXwsmtXtyxhBN1Bq0Ld3S6wXqxbjb1oa0McOOWtaBlATramppSe7yRUs=
X-Google-Smtp-Source: AGHT+IF7tGhQQ19VTK/0hLGwx3/fVCmQHC9hfOw/q63KO27oX2rwhIc6Wd2UFQ1XMV0Hpj7/jLMDRQ==
X-Received: by 2002:a2e:a715:0:b0:2dd:f725:765d with SMTP id
 s21-20020a2ea715000000b002ddf725765dmr1673160lje.4.1713950019113; 
 Wed, 24 Apr 2024 02:13:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a2e86ce000000b002d2191e20e1sm1948403ljj.92.2024.04.24.02.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 02:13:38 -0700 (PDT)
Date: Wed, 24 Apr 2024 12:13:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: tc358764: drop driver owner assignment
Message-ID: <qmvi2dpwbkpbyyyqlugyqa6ljrpzodp64uwnfzi42oqw73q5zl@eoqmzkufxhvf>
References: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
 <20240330202741.83867-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330202741.83867-2-krzysztof.kozlowski@linaro.org>
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

On Sat, Mar 30, 2024 at 09:27:41PM +0100, Krzysztof Kozlowski wrote:
> Core in mipi_dsi_driver_register() already sets the .owner, so driver
> does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/bridge/tc358764.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
