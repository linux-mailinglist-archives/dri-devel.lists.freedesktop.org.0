Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FDDC26890
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 19:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BB410EC0D;
	Fri, 31 Oct 2025 18:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="H94SrdI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B8410EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 18:13:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso553436466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761934397; x=1762539197; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LvDcl7aUeFUyKsgejSQVUGEaPvCe4KSsG/NO0WKzeoc=;
 b=H94SrdI/Ud/fnWy8zuyYwEWNBNgozG5E3zI5NNmNuvbJjtXzqbyz8+R7bAGqYZdXOI
 MUFl9LiwGWjclLtUzZJ/9eqacNb04A9JG69wIq4e1tiPHNjc0HjSb3VZwudG6ZFbBaGE
 7z2XUqJMthQZ/elq57NQfagKZeUs5e+5iZ1E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934397; x=1762539197;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LvDcl7aUeFUyKsgejSQVUGEaPvCe4KSsG/NO0WKzeoc=;
 b=lU84L4Il4ksEwGLGc99dj88FGTM6WlTCMWkzf0+7kBlW4WsOKMOMs0ih5xAcGDWyGX
 xsdGbcwoWkoUxALP1ISrKVewvq2NjQE3qNM5/rsRdiUO0mtS8EgMXgl2lqhPPl2B1cCm
 D1c4Rl3Cxez1P1ixDCUw2V9SPxunFX+nNvsDz7Xol4/UknNlLLSTVNGZQyJi0irGhFA6
 6ZTI6E6Khx5nZhUwaroELzyYnIdvUpRQwLMgqUbYqLvZgO2hIVllVhumfrjNPXyRZnKo
 yT5r6YApN1s9Ezv/XXKCIAyRhqC2R7FZblfLdDoKteln7bskjSP+p3ZsUH1XmJxC85w3
 sjSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZipm6rYfPMTqlSkxsY8INd0L2Rn6/Pb8ZuDrWKQAGN9NQQNZrWdJezbmmxXIChu8KJ9BJRnGwh30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWS49+/dTbZlcmyYjTtfe2cLNbE13hQo6LvlHzZfqQqZBsyN9d
 FDmpj+wqy2E+oEZP6F2XCEM1cVHXdePHLAMNiSzHcfdh3l9+7+rwEVasq9vWXQ9ZJ08=
X-Gm-Gg: ASbGncuJxc6Ck10AmYOiRS+GQfw2m3WsA7Codx5D5ABh9VzZ3+/18px8D3apPGV/Dap
 AP/is/WGi7g2Y3XP6kOKHpIp+b/Oz1HQAVt9PoWgsH2to3GlqSYr/dzkI6kGKg8U6SiNSmudt9k
 PveEWYOUVz5dCCyhUX7FesTXYHkYRHqhbV4ibNQGecwZJeW7POGLPzOwCUYZuDdRWA6+2eauQla
 7AL0x5yQYewiC2P0YIlqlHe6/aBymb8oqywlYTsfXYIyVhQOI7Loy/GR3jkVJ51Omk/YeVtuVj8
 dKr9bCUj7yfAZ49T2LF/GMd/Py3S3ATZhNlVloNY/7oTy5XsumUrjOceW6Gmu7PsC1f/CCtuNw+
 9mShp1IT//MvAvuPxGKnNTVVHvmWFaRuJZ9rPLOzvhzxrDOw60bwTZyDWzHzCEL+icJK7/T3+fp
 bMq4aA12Ch2Tr+DfJJLc+NCw==
X-Google-Smtp-Source: AGHT+IHVQtSYIMKoaB09gS4Ym2WtHZOQB6rH2Sr43gGLn8sfmn5TDYxYclk0MPWzHZLKlEq2ORS/lA==
X-Received: by 2002:a17:907:868b:b0:b50:9863:dbe0 with SMTP id
 a640c23a62f3a-b70704b26c3mr433135066b.37.1761934397541; 
 Fri, 31 Oct 2025 11:13:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70779dc143sm237175166b.30.2025.10.31.11.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:13:16 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:13:15 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-xe-fixes
Message-ID: <aQT8Oz-iKABeZkCj@phenom.ffwll.local>
References: <o2b3lucyitafbbcd5bewpfqnslavtnnpc6ck4qatnou2wwukix@rz6seyfw75uy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <o2b3lucyitafbbcd5bewpfqnslavtnnpc6ck4qatnou2wwukix@rz6seyfw75uy>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Thu, Oct 30, 2025 at 03:44:32PM -0500, Lucas De Marchi wrote:
> Hi Dave and Sima,
> 
> Here are the fixes towards 6.18-rc4.
> 
> drm-xe-fixes-2025-10-30:
> Driver Changes:
>  - Fix xe_validation_guard() not guarding (Thomas Hellström)
>  - Do not wake device during a GT reset (Matthew Brost)
> 
> thanks,
> Lucas De Marchi
> 
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-10-30
> 
> for you to fetch changes up to b3fbda1a630a9439c885b2a5dc5230cc49a87e9e:
> 
>   drm/xe: Do not wake device during a GT reset (2025-10-29 11:43:30 -0700)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> Driver Changes:
>  - Fix xe_validation_guard() not guarding (Thomas Hellström)
>  - Do not wake device during a GT reset (Matthew Brost)
> 
> ----------------------------------------------------------------
> Matthew Brost (1):
>       drm/xe: Do not wake device during a GT reset
> 
> Thomas Hellström (1):
>       drm/xe: Fix uninitialized return value from xe_validation_guard()
> 
>  drivers/gpu/drm/xe/xe_gt.c         | 19 ++++++++++++-------
>  drivers/gpu/drm/xe/xe_validation.h |  8 ++++----
>  2 files changed, 16 insertions(+), 11 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
