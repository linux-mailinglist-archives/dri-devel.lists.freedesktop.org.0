Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8DFA2DB72
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 08:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938C810E48B;
	Sun,  9 Feb 2025 07:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GTdlivFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2029010E48B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 07:07:23 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so3876066e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739084841; x=1739689641; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gHZAQrpjHEZtEYNS00KjVl0M/seQdBn5MlJtjVGzMmU=;
 b=GTdlivFWlpb0FiE/E4VgdkIkPICqiZKmACL51z5PcfZ8HXMUCKYsmxF5GaQHePoutG
 PWV266d8EqWcue+YLKtfyRotEFPUhnNk7LDVScpDCUaIlITWahLH1KQ4dVTYAdZfTCpa
 seVXAdbg697Luc2fefX0Lay68dxvGuqGQeDYNRkxiatUQRoNiu/MhHZXboXzqn1pt3SO
 oe9hy4tEVZHW6EKwN4eadPw+v7/j8miUwxpCMI/v9UH//Ln2vroDuipsUrR2AcMs45Kz
 mmfEXNcqVN6/Waf88pmIsgKgCDqzo1lysFqJlUT52QQiU226zZTUzbogNNjRt/JcjVNS
 bi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739084841; x=1739689641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gHZAQrpjHEZtEYNS00KjVl0M/seQdBn5MlJtjVGzMmU=;
 b=LO0zsIXsM5i3Ed8gkZlzfKsq6oV+lPug6tKVpyB38ENtgvNEEDqbqn6uaIUij6QA1O
 nO3ea/25wLvv1Lb/fzMns25aSIpytLA2i0co3C08OFlcXa4u/iobCcomvuAZumTeIMy5
 57gGFsb9QRPsIZHxn/KRc6I+dSxfIgP7rt0I1Pl2C/rnXxzdwKi0do3FCdL5BAwvkj1U
 sE9uyWhHF/dogKs0ChEOqbBk1MIBFo+5kfj3t3h0q4Xauqi/YRU9E1Vnz/Hvq6ywIofo
 4wnnLM2JoCozrNk113S7MWHFG6fOuTEJWoX3HW4b75F8RXMg/PB5qfC1TyYUICMf1Vdr
 xBzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/+AKdXFVWc64+oy1fmjl6FC1+IIoCznQLF7UJFoUhg0Av0kMfrrjsCCklNYPEaUd7MxFVQFxhTis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAZ8sCf/E1sOAuK+5PYyrAtwFyRTsI2nEo2eqSvsFgGBduqETi
 a5UM90aMCzr2nEziEJ3qsKUzVcCG2YpmBEAZII7QU3r7YruIyHkIjKqGxbL3FP4=
X-Gm-Gg: ASbGnctCG766yZV9FC08NFNq/omY942nXa9QF8Pd0zLHuDjOUKNCX4udI3Iw4wzMuRJ
 ea6O5fhdszL8FCWsBMDJPO0XaFA5Jae2uMjT4OeZKk/neOUUfbnoej6pDhXu7XmGmk0LsS8Q835
 ZMwntVodv5N/uqLWyOSPhfFsFEvtIMIrjyYwV3qXPJX5mRP0D8ZyM2AuEPXAyhk0K0x8U2qcpVL
 2dVZ/jn7OwsOayQLUa0uP+cz1aO5fHh7JkN6x0EfBwROtBC5ReCdqupPRrAb3TH4b7ygCP0DwFY
 2142ogD0HN8baq4p/ECSv+SmbOcd1yCBE3oDKMHB7I/+KcSfKivGKl6WvkqfD/NvwCXiDu8=
X-Google-Smtp-Source: AGHT+IHURvdmo8Y832vNqtsKFMargNUdHATmLMGUU27oaMH1tsiKLFGe4aKRkUydJa5Pv3ZEX5tUsg==
X-Received: by 2002:a05:6512:1c7:b0:545:23a:d9ae with SMTP id
 2adb3069b0e04-545023add6emr1464047e87.41.1739084841141; 
 Sat, 08 Feb 2025 23:07:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450487ac88sm381133e87.247.2025.02.08.23.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 23:07:19 -0800 (PST)
Date: Sun, 9 Feb 2025 09:07:17 +0200
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
Subject: Re: [PATCH v2 33/35] drm/bridge: tc358775: Switch to atomic commit
Message-ID: <nckkn6neo52g4kc66x6ikwkj7poj2pivyypdfucg6jshmey7nk@xem7bdybplze>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-33-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-33-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:58:01PM +0100, Maxime Ripard wrote:
> The tc358775 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.

Same comments as for the previous patch.

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
> 

-- 
With best wishes
Dmitry
