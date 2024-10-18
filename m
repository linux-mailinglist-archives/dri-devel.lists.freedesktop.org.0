Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9AE9A42FD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3910E0BA;
	Fri, 18 Oct 2024 15:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XGC4K444";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30DE10E0BA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:54:07 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539f58c68c5so3717822e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729266846; x=1729871646; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jpwCbM4LBCW7939H36OgTv3MYW3D2YNl0kDGBqimkqU=;
 b=XGC4K4440eMl9xCHkpiXAqYJVmiETY1l09EsGvjb7GEzJ6bnbXEbVCYjwAYxCCeMgJ
 obdKYZN9c5DwJMwybtZHc50eT6+v0e+QYYnLNNkje5eRKpkDxzBPO5GTJQpjYJEPVato
 8tt0GmPya56laucjFNyI0lMSA+GVn8A9Uz6LYhUFHRqSY4thEzkGw6pBwwNF+5RhvUwG
 cOJQ+BuWk4b0SFljx+lOOVQn7NNus/REMnmP4xRtiQx92hsBIG0uIz72YaOO/VgoGVE5
 7PuCzKjcT5aapt2OdOH6oMYFKrDrUVwgAAZ/8O/++/4QtMJ202ybH/uT2+yXvbFLfpYK
 QTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729266846; x=1729871646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpwCbM4LBCW7939H36OgTv3MYW3D2YNl0kDGBqimkqU=;
 b=dFaW0C+Q7fY5rV3oDqh8IzVwGqREMZ/oPyteK7Pmqo63cD4I4GRBdRFEFDvPlAw9Pz
 ntkAmqPwTKGWfMNHDaph20DV8C/Ou4JHtiKzPkx21Rm4LHLlgXgnTEVcPnm74N/4FKNV
 iO7p1G+DdHHpfYZrib8G/ZuTsMtCQ8EZSNRVFyIEpKZL6YP9mMu9LySeZnb24vI6eGGE
 voLt77uGAKdvB/ot55tXoWIvriNv5K2SjTmXmQvc8geJN3AXtC36WwkU1/iT8TdPbvbr
 aa/EXvoWDaArAPNtcyGwZM/Gl2nZq/+Qd7VqejCc18UUuegClFDl8XwQBcDjRLnDCmxl
 AVAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7hdgsSr4U8j8zNTaPyRiAOMf3Tz1kz71DpxaXwo0kVHvDEwCBKBIOAFGZj8g+8liI4To1M5xffpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz690Hf+SgTQiGTBszm6kQ0siv7ZrB9T1dr7uW8LeIKsOZguzOj
 lyMrdXIKAzkqUZDNZYitJpBeYDtiHnDt9rhXJbr0JfajOA50fpNM5AopgReCEhY=
X-Google-Smtp-Source: AGHT+IGhho3L1K3a1JYBXIXN9ildFXC/piLjygCrOlVDIveDLOAwyGQX/DIfb23VIc6IiDg6s0rRXw==
X-Received: by 2002:a05:6512:3d8f:b0:52c:deb9:904b with SMTP id
 2adb3069b0e04-53a154ca09dmr2914041e87.38.1729266846118; 
 Fri, 18 Oct 2024 08:54:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a152041edsm247311e87.184.2024.10.18.08.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 08:54:04 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:54:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Algea Cao <algea.cao@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
Message-ID: <ff5eq2x5vhv3jxv6fjjd3bdohndyhurxqa3o4a5jbnis3543wb@jyfd3iikkzc2>
References: <20241018151016.3496613-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018151016.3496613-1-arnd@kernel.org>
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

On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Dividing a 64-bit integer prevents building this for 32-bit targets:
> 
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
> 
> As this function is not performance criticial, just Use the div_u64() helper.
> 
> Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
