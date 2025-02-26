Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2BA455ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9889A10E859;
	Wed, 26 Feb 2025 06:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EXpPTSbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3795E10E859
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:46:16 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30a36eecb9dso66918281fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552374; x=1741157174; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AWm0q5kkg5ASyqrsLf1hxDCAdhd0X/a8g8veLb66Zls=;
 b=EXpPTSbtE2wL4YGNRmYAmv4YtwZgHjxuqrjMWogFGl8Tv74dkKZRCRN9TO4NWicG/V
 eXYXyhLmJUAjqKJItMVIxGQCVReBY1lknHEicAFQUZptwkkItCg3g7Q7viblyAeJ6XxY
 AZw9SHLcghUJE3hcq7dImZeAVvwKbwLAc4s6bxyhOk0kUncmi37BA39Yjowg9w1PjB3+
 JsptpDfbP2jMiIgzu2xg4LVhRC0EFM267zecCaGTDY9cXETcHaUC+OMZYpBGRGwP8ECB
 ydQkOpoGUdKleeeGmMJyVMFIWXTW9JhC4vwR6fm+Mj75OSY9sWGhJ+WbECbz0BtlSauX
 y/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552374; x=1741157174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWm0q5kkg5ASyqrsLf1hxDCAdhd0X/a8g8veLb66Zls=;
 b=Xz60mHvivaM/CX6FAH8fvlS3cfZuCDH+37mIVHS2eeZ1Mv4ia8rWql8dAkepA2af+P
 fzlhJDP92KeFTH1D4lErPiS9lMI7ozTAN+h+9kTC0VrAh/0G2ZiD6TuGQIu3ecQbsYxW
 aSsRgJ85sVYWqO8O0o4kNAHfju5GFJ2kBLPOHrFuqbuiqi9poT7QPcR/yXjNazQU/z8F
 1UGopPtoQFP7XL/Zz+KZO50yIhlGoRU7VfTtbgx5G2hv0NvyiQDS7h35pAiGIxCfe/c3
 dZb1/zs5+oadMduVHKHtQUm8FGPtHyHq3aEEKyjQP3hxt3TSRm25NFFKDFUJZPDQFEjV
 dpHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0g2xiVvWi9JKOAjfGX/6fu8DbF8ohwpLNQsdHY4vG0vv2vwk1ladJOs6hmFi3sVp/hbkEzLpgRXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzROAOthNV2zPxzkzdlaiR6grPhKHw2gbyUGweZCCEC/6ZwHMrL
 qxnNqiGaiHL9JrDxjCWcDvXpvNpq/EXQSiG2+lFznuC0ia7QZGdo9VctJhnEeFU=
X-Gm-Gg: ASbGnctZIql2oEt1fbbbnrF3sXB8EuyOCnAvlJtnvOxz2fNoTkwOCsbAtWy44o27fXl
 pfrvSmWziJY6ZLDy89/If1vcKBnDjs/M4v0ScrjMXywM613+pdYuh37mEbm139YeF6CyozyA9YP
 AQOIP2h8T8gb2FXg1PYL5uVIsowbI4ZHX74yu+UjQRwo3xnfQUzuCXHDpawwSLqpRglG6XE6QQi
 ET0i+HCxrjebIFSDhprPAQE1hckuMKxR25lgcCDo1U94W7fZNFhjGRtP5ooarycAiRG11npxf0B
 7cEiN7Rbv4c4SF5zubxKCP+aaf1+FjbVCyhSqVM9LkNFBrB42hEf/8IxV35qQ+wUYCnMvbKF9M3
 5xKnGkA==
X-Google-Smtp-Source: AGHT+IESQSBp1tzujDCzQLATI4kgIcFpaXxaN5497nW7ec58c47/b6CNi+Ll6FkX3dtBSCR5Fo4K2A==
X-Received: by 2002:a05:6512:b9d:b0:545:e2e:842b with SMTP id
 2adb3069b0e04-54838eddd50mr8543750e87.9.1740552374224; 
 Tue, 25 Feb 2025 22:46:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f9e3fsm363186e87.217.2025.02.25.22.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:46:12 -0800 (PST)
Date: Wed, 26 Feb 2025 08:46:10 +0200
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
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/15] drm/tests: bridge: Provide tests for
 drm_bridge_reset_crtc
Message-ID: <w5nycbnj67yjpmxpqn7n44vjxq4tc66h3qnnzq7tplnms2cw7r@sppgyer3n4o6>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-8-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-8-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:56PM +0100, Maxime Ripard wrote:
> Let's provide a bunch of kunit tests to make sure
> drm_bridge_reset_crtc() works as expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 168 +++++++++++++++++++++++++++++++-
>  1 file changed, 167 insertions(+), 1 deletion(-)
> 

BTW: it would be nice to verify reset of the disabled bridge for the
disabled connector.

-- 
With best wishes
Dmitry
