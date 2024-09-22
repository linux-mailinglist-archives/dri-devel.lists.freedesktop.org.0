Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB997E24D
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 17:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53D010E223;
	Sun, 22 Sep 2024 15:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UcEj0nfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9F310E223
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 15:31:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f78b28ddb6so31777451fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727019117; x=1727623917; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rBu+yMt4ecuORUuNgnAITQWuifw2CvZPRhFerzqyEAs=;
 b=UcEj0nfCZsDSduagYdAP6FtnGZIqvssZXJSS5xw658b9fNzkHJeoDOR+CLrniQbgTS
 HbYsVWuySB7mJtdUuREFDVGfLbypXkaefEQ7Qbwvzs8sHJ+bSLSsVVXr/efW3JobvZKo
 BLQvtFapRgUGtN4IYnqyJ9yr/XR9W0NIDCMF7c94RgzRePPl22YxmmPotQuvrISbR5gk
 7NfkOWQZ7rb+Ri6oT0ObI9UcV2eQTjEJZ41kQuFzFARZalEKOqTTkvDbcZ1orOvp0XEV
 WxOq0ga3wNXD5gXV3xKB3RYs/U9KqURPdGjVU+i+IGpwr0IePm+4CZ7DhCMw538vn9aC
 76Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727019117; x=1727623917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBu+yMt4ecuORUuNgnAITQWuifw2CvZPRhFerzqyEAs=;
 b=fIvqBUSiceC+8GFvvoHIz1/Edv6aP9kCaYu4vYrIsE5NMfET9iF1Y8JeWzYwjkzlst
 pC2GRMb13rHpM5qjUt+BeXjmSivQgWhB8Awxo9Q9GX4UgF8e+0f178mFF1R9UuRnWvKb
 jKvVwgph2uv/12+/ffmYMMH1SKdRLMlwA/PvLGPe0xG3W8JRcXegJQU9Qph7w29g9F+z
 UXV7srs0rIF+QdE+njiBSsqCfejL4Vr3b3VAQi0rjrMSuHVsP5aG75bt7PIXZFko5jAe
 iTR/gep4vdVKhagSXYNhK3P6AyReL8BeYNq1czFt5h5cVGbfLyFH19yFiJO0pxIOwsI4
 oBLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRzc09YdGfFeG5LX6AzZ2OD4xfcX4j4BoGVy49xpI9FcVH0YvUUB5mwPhVnJvxWb95CwREy5JUfBQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4ZUvVAUIBIwt+AO7kvg4GrXQbORzieW30/iHd7sanbnlSU7mT
 WKv2nItXA81CjJUKRZwGRkYPcZNE6x0u3Y81C9vlx6xbFuNaR5Eueuuwb53RQw/Pu6uvdfhz8ni
 gKB4=
X-Google-Smtp-Source: AGHT+IG5Bx8ECod33hSVelLeBxGFnMm3FDCUTkzDlOHsUsX6e1LsUv6REs514b3oaLgDEYh3kPkqgw==
X-Received: by 2002:a05:651c:2205:b0:2f7:583e:e967 with SMTP id
 38308e7fff4ca-2f7cc5c4681mr46521891fa.40.1727019116597; 
 Sun, 22 Sep 2024 08:31:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d3012bcsm26424971fa.45.2024.09.22.08.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 08:31:55 -0700 (PDT)
Date: Sun, 22 Sep 2024 18:31:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 jani.nikula@linux.intel.com, 
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: writeback: Introduce drm managed helpers
Message-ID: <rz3xk3kwwsfstjrqffp4vfkm7mvn5sdviwjzb5dodmsnb5v2fz@vuamquxmvt4r>
References: <20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com>
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

On Fri, Sep 06, 2024 at 07:28:17PM GMT, Louis Chauvet wrote:
> Currently drm_writeback_connector are created by
> drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
> Both of the function uses drm_connector_init and drm_encoder_init, but
> there is no way to properly clean those structure from outside. By using
> drm managed variants, we can ensure that the writeback connector is
> properly cleaned.
> 
> This patch introduce drmm_writeback_connector_init, an helper to initialize
> a writeback connector using drm managed helpers. This function allows the
> caller to use its own encoder.

Also it introduces drm_writeback_connector_cleanup(). Ideally that
should be a separate commit with a proper description. You should also
document that existing users should call that function (and maybe add a
WARN_ON that can check if the function wasn't called).

Last, but not least, please don't add API without a user. Please switch
at least one driver into using this API.

> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Hi Maxime, Jani,
> 
> I tried with this commit to implement the drm-managed version of writeback 
> connector initialization. I tested with the current vkms driver, and it 
> seems to works (at least no crash/warns).
> 
> As suggested by Jani, I only created one function, which takes a 
> NULL-able pointer for encoder/encoder functions/possible_crtc. What do you 
> think about it?
> 
> Regarding the documentation, I think I repeated too much, can I simply add 
> comments like "see documentation of @... for the details / requirements"?
> 
> Good weekend,
> Louis Chauvet
> ---
>  drivers/gpu/drm/drm_writeback.c | 224 ++++++++++++++++++++++++++++++++++------
>  include/drm/drm_writeback.h     |   7 ++
>  2 files changed, 201 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry
