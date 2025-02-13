Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC10A34A11
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1205510EB20;
	Thu, 13 Feb 2025 16:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Oj35mCSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534B310EB20
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:37:15 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54506b54268so1042361e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464633; x=1740069433; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K5yI9mtbA6TbP9BSYi0Lu15w4ixyZW4/1lyfqxBYhqc=;
 b=Oj35mCSSYBs8vqnjdbIPbJWnc050Gfw41j425eIGW4JdR0Z2oWyPh8WUUjfXFAVh5X
 6yTQ8EaoIA2XU6gNMojKusVePy7B4LT0zBFWOdLELf7ID24T/Cd5+msY3AVS6kAd0dF4
 M60/TkJkh6KZLo7lUfZFL1xYJzl4HwtLc57kkDT6nFFvhzB1hEVSQWgJYZVwayAXi6gL
 RZ12xm/+EIQGVPE7GSKVwKkjhQ6k1ou1owF9mwtPsFh/KCwZfCpZuBUBvPftymK4EaYq
 I0ZN4gFDXWFksIuyOabJ5SP76mpSOgxpVPc14SxmokPwPi5Z1hBku6V0bAWVB9KUX1eZ
 Fyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464633; x=1740069433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5yI9mtbA6TbP9BSYi0Lu15w4ixyZW4/1lyfqxBYhqc=;
 b=OUIgnXFUmksWpVjV9PmdhuEV9Ht7EvmQ5NEcf/PpD77oJYsUFknacXXOcNACSPYeDn
 C4rx41YiNLm0rTDXuAJHK5V/QU786CdTnWdFzXH2h0v9EIUZhgug7AiZUqliqJhnpxBt
 lUxiQKCgVCMfyo3rYgBPfiTHmVn1QCkH4ntG20JfXRkcLK4mxC8JVed4HXINIgSqXvH7
 f4SXxN0F/+UrkX6u8P8pWroxH0XYV+F/u2h4aACSnuYO4GUIAyOF+oDn5NTu6UxpxbJG
 gdlkHgU+xfvcI4qEkri+r9Nk8aNZqh/WXehxmmmz3e63morkiitpEhHwfjPMOy93Eeax
 eU4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiQPOtf7Kmoqj4KboWhoHuTTL8vBHc820v8b4m1o+14uZ+UM+/ECuf5m6SEvWjLUIjWNOVjbNahVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVwE546wuYEWbpMrwKQrjkF4fDI1MqrqgZCbvv18lCI3AjOfQY
 d92W/eryafBXJKMdtOLk/DG7iaSChOeIqPNDZfe/cvU0NDFUI0Pg+ums+2dMfsU=
X-Gm-Gg: ASbGncvkBbvprUwEPfuqJvUVAjH1/RBpXwE0YpnV029vqQNqY/lHYYGIkSvrzIG7HUH
 yzhCsF+X4F31OBKM4GoDYXpx7AL2SU0gGKIerDdDuvaRS0/TBDyRsQ7S6BUg/iu8ReRDEzeYZ0V
 9+qc5s4HJQbfcMteR7dDwjf5SMvMytkVcyjPsgs6Pg2TjINuxI2gupBg6URtQnTIec6DomxrWTP
 toxRrsNstaipK0KKdRfs86v0J0AipLK+VUC8mbqJR7lGH/0uJiSchB58c8loFIHU233mb7jzkBz
 xJXEZ6O2bDCQR9lF3T8FIFNwXgAS4pWx7Kvx8yzGtgCzKC64gYAULgZzRv0KwPDCqMHDpqM=
X-Google-Smtp-Source: AGHT+IH+q3SO0AlGiFI6AM0BmNsLF/QARW+Zixtb4EjiMyrDyQLHtQ7O4U+e0SrdUEIxNCY9ztY0GQ==
X-Received: by 2002:a05:6512:6c5:b0:545:6a2:e56 with SMTP id
 2adb3069b0e04-5451ddd65f0mr1158897e87.37.1739464633491; 
 Thu, 13 Feb 2025 08:37:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105ea1sm213021e87.124.2025.02.13.08.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:37:12 -0800 (PST)
Date: Thu, 13 Feb 2025 18:37:11 +0200
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
Subject: Re: [PATCH v3 35/37] drm/bridge: tc358768: Stop disabling when
 failing to enable
Message-ID: <dsccxyorddnhjiff37zxmwh6mwerwtlabxxp6csugomalsgfwv@mfnsky7pacha>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-35-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-35-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:54PM +0100, Maxime Ripard wrote:
> The tc358768 bridge driver, if enabling it fails, tries to disable it.
> This is pretty uncommon in bridge drivers, and also stands in the way
> for further reworks.
> 
> Worse, since pre_enable and enable aren't expected to fail, disable and
> post_disable might be called twice: once to handle the failure, and once
> to actually disable the bridge.
> 
> Since post_disable uses regulators and clocks, this would lead to enable
> count imbalances.
> 
> In order to prevent that imbalance, and to allow further reworks, let's
> drop the calls to disable and post_disable, but keep the warning to let
> users know about what's going on.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
