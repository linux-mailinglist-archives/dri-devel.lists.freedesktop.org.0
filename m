Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E250A34A31
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C4B10EB34;
	Thu, 13 Feb 2025 16:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i8jYsZkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7510EB30
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:40:10 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5450f2959f7so1097278e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464809; x=1740069609; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jEIQ3K/3iDZAyHTodK3+6OTlBYGjys5mtHQuCkfEBss=;
 b=i8jYsZkb+jAzWHLQWd0IJsazJBVg+WAQn+maIi8VEuLvqBGJlaj7mWZtk7Zcdl4K3n
 r4IAo97tSpqOb2ytUvdpe/YUdcaoVXGuAoUgPwPUE/eiLMRD0ZeecAheM7lqVEyv/I5+
 fRracQYfpLt44azRRx8Ocf05lDos9DNE6/Lj5CXbcFyv3uHWidKSv2kzysTMX75Yz5Fa
 en8p1V79XdgD2yNhy4mpdoIxWKlwGevqoBvkOpr/CNJvMWOjPsHiN+1D0phD5p437Lkv
 GleE5jwsKhPdkw00Yf4BLOn8Ok2t5GWQ10ZpgqIeSWN8j81UcYObt0IcEOsCSlbpzDIU
 YEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464809; x=1740069609;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEIQ3K/3iDZAyHTodK3+6OTlBYGjys5mtHQuCkfEBss=;
 b=r2VbFU89FK/zRSDIphd7HQnzKk8F58MGkCLzxqs2L4joe1nlJnL0oXD4Wi/ZpPxCit
 kioE5DRAv3DGYD2Ukw+r0NCQz2cWzmCjs8IFYENZx4xxCW8a8fLP2iJs8aOvpMRZyLzp
 zAr/wO9Rzr9QzBP1953azyQBtGAk1rfcBjvrspsFrh1CTIyUqI3cWUcQAN8x3jP6Raag
 pCcS8mCb/2ePAcIg0WCoLZlo2nCTp+BiuKLo6PVsZS8D41vh7jh6w1HPHKbPR2Y4hYeE
 EkwtvOU+6bjwg+9fzNLVjouD6kYqqh/1cJUOV2U/yPg0a6h+r3gIVf6I1lbsHX4qneDI
 SMAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOnC2S9ijRFMITtjKnnuVr8zDORFrcflq0RoWFANGn9ZbdlYIZHMKx0YD4e0iFSHOW9XvHGCjBpQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQGEiau7s3fNCztZUvOqK8/kkiN1mVFrrIn84Q8g7YFSEepWSN
 TmInshTt7Aoamh2ZYNyOOMrws2xxxIFC42QBcpksSumD8/K43MZ6/abcumVrOXI=
X-Gm-Gg: ASbGncvLpvxDzcFCWN1AiEv4E9i+f7nu0XN6VvohzDl4ebP9YrPmUHURhWFYyY38PzF
 ud/yFhn9zxnTNYOfenut1wQJcSmGSmZ7qlJyF/QQCiL+kAyi0HCALX8zXrC++1K5eL9gOo4zTWv
 OJFEzBiLHu/gA6OeONd0ne2LBvB00aM5W8oKBgMtKhwZu0AA1bovCgDQR10a5cfgxV5w+OBJx+q
 h1gXLZ18IG6OmBjJ6sMDq38XjN885/gq/es5QFqosfiYn/ZgDYdaoWILCoMB/SFkrI40p/abfzO
 IdsZcpy21uz8uWEOJicY7h8AS78qvKuVzRLcvLKF4Wpip7NsDMwGjxNqznPDPYfj/lwplTk=
X-Google-Smtp-Source: AGHT+IHF6JYg8o9iPAbhowG9brKPw9OQ7bxonNwRfn7MOY4iIar8pyOkUt+TuUgL4bBtZ7bJl/qq3Q==
X-Received: by 2002:a05:6512:ea6:b0:545:58d:9dda with SMTP id
 2adb3069b0e04-5451ddeb4d6mr1608127e87.48.1739464808737; 
 Thu, 13 Feb 2025 08:40:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09d0d4sm217697e87.100.2025.02.13.08.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:40:08 -0800 (PST)
Date: Thu, 13 Feb 2025 18:40:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 21/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_fake_vblank()
Message-ID: <j74s4po655dtjcvsweijgdcfktalceenn2mh5ebkx6wuostaus@st2m5gf2o3cl>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-21-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-21-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:40PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_fake_vblank() fake a vblank event if needed when a new
> commit is being applied. It takes the drm_atomic_state being committed
> as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
