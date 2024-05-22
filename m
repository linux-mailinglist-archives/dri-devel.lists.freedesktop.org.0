Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69498CC907
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333AD10E036;
	Wed, 22 May 2024 22:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eIH9vUEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE29C10E036
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 22:25:24 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso8817869e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716416723; x=1717021523; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0B2JbRhNTxBGKVMHTsItxZYaFytK7xf2SG3yQV20MJg=;
 b=eIH9vUEyGoED8kioL9wGhEBDB4OtdEcJw73hxKEGpT0MqR8yzEVGb5x8AVW3RuLu60
 0YEv+H7KG2tUEh1jC84+0+81DMbzK9CNEw8BG97+UXI8v6JlznxQq6Ysmgr4/k7HUuKg
 6xFJfrgF1app/9BXOCOwKnXJ/BDLk1pZYlhlZZj2KFB2Hcv/VieochbowWDBzMKrth6C
 Au+nHzzNxcEQewBrqE6VD/iAXd+jF2fBFcA/BvetwW+hG0TWgGqp3y8xIhx+U437RUhq
 q/1bCD1kA6gI+wGPFK5xuhnACPCXlakou2/d5Wb50nfWPVI6VbI6A4BTRYWO7skvhJoe
 FBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716416723; x=1717021523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0B2JbRhNTxBGKVMHTsItxZYaFytK7xf2SG3yQV20MJg=;
 b=TURiFvJpf1aVgl/h9kzOHWOFsNd1QQtXcLj0e5JivVGwJTIyoI7rfMG3/Xn1ymFZxV
 CC6Xop7wioPuXsqNnaSLEOGLYj0cWcMfOUAnW2vhKhvOSj8NOKpxnYr98n4yEuQ964X5
 RDAhQD8/L0ot/49QOHMkde+IGto+GUUdTRSzsKCDcDGviimtwDKByIemfMoZtpMjaPQT
 o/G/s/yHul6ICIQS0M0qHrt2iAfa1MMLXFNJgXEIweiR9nVsyy/1sshJDcrA0bFZHi9l
 /nzI/r4f4qgTxw+WOLUSJO2x2ZGwHhTh3h80cMOPaNfrlAjJ6rhYv9V7x5lOeURmTju7
 Gxtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUyKmKTh5xRB4lqyWOaUzGGiyDMZYQAKECMIbXPnM/YNX0RSlFZSesIk8DOHuDLyoxQA2lPSX7sxqnvqc+H0IozIlgU7bFGD58XEa73tAP
X-Gm-Message-State: AOJu0YzsbIHCLp6NVfphtYJp2JrxxFUpLSIaNEiwsPy/NsbKLIbPAmCl
 OggFWo/gr+RN/miwZLOMtxe7C7tSvw7fhNI1SyGD7sxMsjlePXaFK2Fg+9iJa8Y=
X-Google-Smtp-Source: AGHT+IEdRcdYbBoQQzpqYVDzxkuMPcPMqGC5L1AwkkRW2Odahvetj8UXht61AaeWnM+5cMkq4/v0ww==
X-Received: by 2002:ac2:5ded:0:b0:519:6a93:ed3a with SMTP id
 2adb3069b0e04-526bd6935bfmr2114964e87.23.1716416722617; 
 Wed, 22 May 2024 15:25:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad499sm5106336e87.20.2024.05.22.15.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 15:25:22 -0700 (PDT)
Date: Thu, 23 May 2024 01:25:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 05/28] drm/connector: hdmi: Add output BPC to the
 connector state
Message-ID: <ikljb6koxeg6urdzjyg4nbqtl6pzxs2vakavjkxjudsjhsklyp@3ib3inb2oq4s>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-5-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-5-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:38PM +0200, Maxime Ripard wrote:
> We'll add automatic selection of the output BPC in a following patch,
> but let's add it to the HDMI connector state already.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  5 +++++
>  drivers/gpu/drm/drm_connector.c                 | 20 +++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_connector_test.c      | 12 ++++++++----
>  include/drm/drm_connector.h                     | 12 +++++++++++-
>  5 files changed, 63 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
