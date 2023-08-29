Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D59778CB97
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B2C10E428;
	Tue, 29 Aug 2023 17:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B959410E428
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:57:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401d61e9fecso2411905e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1693331858; x=1693936658; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFho8P+UvUmfEV9wWiOTvex+Rj2mIp3Rwu/rvM1E0q8=;
 b=jV3Zkq7BUdlKf2wCo0ETi/qprUST1oofpibEtA8I3WcYF/FbW4Z72+N75YI3jnbWRo
 ERPsGp+DH1kXS6W84H64KQk0IaQkVr0q0DE9AK8ibORN0oDebXlRCYumLUvlNOOG9mck
 3i7tUDC7O01lpVzJYiurYQ5q/oNIg8Oa79Z4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693331858; x=1693936658;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RFho8P+UvUmfEV9wWiOTvex+Rj2mIp3Rwu/rvM1E0q8=;
 b=O6wiyoJ099ZZuJ6JV6lP/2BcwawAWnxeK37UbSyVujYYygKG3CHDSg77jBA/0wyGTI
 hrHeY/Yruqz0hc+1v6f3bJiUsWPH1xOiyNS0NyDfcxLlkIeTW8iU/JOhJFnOWrHUukL6
 6WgI6B9LE6I2J5DN8KJILuTQYaQH7vIYMisVquNhSzieDj4eVXL3AdRJ2w3Rtytn/qAm
 Jlg7OrCdTg6b0iPMD1t+/yeTq/+OwJLnuxqnEUrAbhbcwN/Bv4UUIySoMYNLvztMyKtG
 v4BWh8/Ep8HSTJ7MGQoHccCqpgsE7uNPX7zO8YYNsWmkwoGEVgy8MStkgRsR1MWvqZOm
 k/vw==
X-Gm-Message-State: AOJu0YwGW3PHETJAYaSUQGnUpsYSTZVatXRWQ0WRz4BHjuY3LBwI+YD5
 k31FSKCfVdPdJOwTqpqj0GdgxA==
X-Google-Smtp-Source: AGHT+IGAWDP/5Nw90I1fUZV8pHLMfzJOCfEFTIbxuzS3QBgmzrnEyZ9Z/DHllgOa/qo90N9EEEqu8g==
X-Received: by 2002:a05:600c:4284:b0:401:b9fb:5acd with SMTP id
 v4-20020a05600c428400b00401b9fb5acdmr40873wmc.3.1693331857981; 
 Tue, 29 Aug 2023 10:57:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a1c4c10000000b003fa96fe2bd9sm17728411wmf.22.2023.08.29.10.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:57:37 -0700 (PDT)
Date: Tue, 29 Aug 2023 19:57:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2] drm: ci: docs: fix build warning - add missing escape
Message-ID: <ZO4xj/sHodsc8+X3@phenom.ffwll.local>
Mail-Followup-To: Helen Koike <helen.koike@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, airlied@gmail.com
References: <20230824164230.48470-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824164230.48470-1-helen.koike@collabora.com>
X-Operating-System: Linux phenom 6.4.0-2-amd64 
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
Cc: daniel.vetter@ffwll.ch, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 01:42:30PM -0300, Helen Koike wrote:
> Fix the following warning:
> 
> Documentation/gpu/automated_testing.rst:55: WARNING: Inline emphasis start-string without end-string.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Applied this, sorry for the delay. I also rebased the tree onto latest
drm-next, in case there's any fixes for the current set of ci support that
need applying.

The other series I've seen looks like it's adding more support, I guess
that can be skipped for the initial stuff?
-Sima

> 
> ---
> 
> Patch for topic/drm-ci
> 
> V2:
> - Fix typo s/scape/escape
> 
> ---
>  Documentation/gpu/automated_testing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 1b87b802ac7f..469b6fb65c30 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -52,7 +52,7 @@ IGT_VERSION
>  drivers/gpu/drm/ci/testlist.txt
>  -------------------------------
>  
> -IGT tests to be run on all drivers (unless mentioned in a driver's *-skips.txt
> +IGT tests to be run on all drivers (unless mentioned in a driver's \*-skips.txt
>  file, see below).
>  
>  drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-fails.txt
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
