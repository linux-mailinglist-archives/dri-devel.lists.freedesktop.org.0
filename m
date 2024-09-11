Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C574975C18
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 22:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1792010EA91;
	Wed, 11 Sep 2024 20:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="adIcz7/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F6E10E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 19:58:25 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5e1ba05bf73so120155eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726084705; x=1726689505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6MQd6zL07IoutVU1fDbtyULwQg6ZCsqi+BW9kHA0xKw=;
 b=adIcz7/Lxgd2x0H/zA13VGGuhwM06doLpMIHs2VWlF4rixh7RV90tUazHbGhxvjPAQ
 7zyj72a/E1q8OcQgj0mIxtpptrfjUMcIYY7fvJHy1fEtLDesVBExVJK1ApPE13sy+ZUy
 4Qaxu5XthSFekJAKyPSksmEFnHMyHlZkpONfWK+c4weo3WS01As6x0SJDM2po92kudgu
 zW8UNWMDEqgJc8x+1ytVDaSeii3DAvlZNzo0xoqD5epGcv4XofObbH5ygwInlyJ1a8dJ
 vOZmks3IyZirmqqFjGU2PQzBd0jwQ8mTrznR8fPNbdn9EyGApjpX5vuje+4SRU/vixx2
 QGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726084705; x=1726689505;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6MQd6zL07IoutVU1fDbtyULwQg6ZCsqi+BW9kHA0xKw=;
 b=WbFf8k+mhKZMQ2yQxtB/epVnWB8DGEIq70trNhjy9+LMsYnJnRtOewZEqaY3P3CcSz
 Cjg/dToh3teLB2v5M9QmlQBsmI80XtsiWURroQMOcnf1GzoR4dRdNgRAc6AUb3+7y9wW
 eV9AJhR6hBwJwTh9nx/gCP6G2svCk3iYg3tOs8dusYVdmNG9qyIRHPk0JMftciTYMyDt
 xlc9aGxJCzkNnowd8jzYuVAcNs20DYIAxD7KHVGYl4vorP7Fxe4LaOIurT0mNH9BmX79
 AX/u95cI5cp0ybdRKDaJRBoI1k4/6nILDGQIbeb2xrrGTcoHFTy0PwFzJT8WbeE9iBRq
 UrKA==
X-Gm-Message-State: AOJu0YydxrJWmD/5m4xByKrImMmT17tgdvsGW2i+o0vVrgx2ZDdJBBFY
 JnG0asqfk6KZ699Y77u98mMZ5FCVCf7xo/ej/oYjcIfZmtNZTPMJ
X-Google-Smtp-Source: AGHT+IEwmGHz/Hn32YQLgFp/649kiwG88rntRYf3UqVhKCBm6JPP9CC+ky4B0i/pFb+QRSn1ulsjgQ==
X-Received: by 2002:a05:6820:2294:b0:5d5:b49c:b6f7 with SMTP id
 006d021491bc7-5e201452599mr308595eaf.7.1726084705088; 
 Wed, 11 Sep 2024 12:58:25 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e?
 ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5e1bf2f587asm2210819eaf.35.2024.09.11.12.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 12:58:24 -0700 (PDT)
Message-ID: <676af629-af53-4cfe-9362-f844a6e3457d@gmail.com>
Date: Wed, 11 Sep 2024 14:58:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display: fix kerneldocs references
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20240911-drm-fix-dbc-docs-v1-1-ae5cb82fce1e@linaro.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20240911-drm-fix-dbc-docs-v1-1-ae5cb82fce1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 11 Sep 2024 20:58:09 +0000
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

On 9/11/24 05:16, Dmitry Baryshkov wrote:

> The commit 9da7ec9b19d8 ("drm/bridge-connector: move to
> DRM_DISPLAY_HELPER module") renamed the drm_bridge_connector.c file, but
> didn't update the kerneldocs. Fix that.


It did not rename the file, it change its location, so commit should be
changed slightly. Besides that,
Reviewed-By: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>


>
> Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/dri-devel/20240904163018.214efaa7@canb.auug.org.au/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/gpu/drm-kms-helpers.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 8435e8621cc0..c3e58856f75b 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -181,7 +181,7 @@ Bridge Operations
>  Bridge Connector Helper
>  -----------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_bridge_connector.c
> +.. kernel-doc:: drivers/gpu/drm/display/drm_bridge_connector.c
>     :doc: overview
>  
>  
> @@ -204,7 +204,7 @@ MIPI-DSI bridge operation
>  Bridge Connector Helper Reference
>  ---------------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_bridge_connector.c
> +.. kernel-doc:: drivers/gpu/drm/display/drm_bridge_connector.c
>     :export:
>  
>  Panel-Bridge Helper Reference
>
> ---
> base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> change-id: 20240911-drm-fix-dbc-docs-8ac42d0c2e4f
>
> Best regards,


Thanks, Carlos

