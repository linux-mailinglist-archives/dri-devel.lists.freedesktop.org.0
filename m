Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A2DB01805
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3E810E9F2;
	Fri, 11 Jul 2025 09:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="f2mEa21S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E5C10E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:35:33 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so1224029f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752226532; x=1752831332; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6PLErhzIHgqUceJ8uGn53LmGP1iH03CQT0Hs7uBS3qA=;
 b=f2mEa21SSGPHWKBzmXSdvPi3C30XyllcBQXCJz58La3XwsWQ+AzgmIHmORuN/9C77q
 zkJ0R8zNi3djfLOH9Da2eFY1oU8QsijpoEFvezHkP6rsoKRkKiKCuqVtpWQEoE1ji+C/
 vQhdpd2O/bjpMg+2aCZIiC2xn4+4zYEXznBlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752226532; x=1752831332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6PLErhzIHgqUceJ8uGn53LmGP1iH03CQT0Hs7uBS3qA=;
 b=uVQ84oETribiJp14pk2hF6eLZUKTX+d4bJD0JnLrcTunLRg+J4OCFNDZetGHCxmNF9
 n1SDj00XVLAMuxIKmfrxLoTmbvLTYeP+Ubm32f8hwQRk39P3yseA/pNWxOJYRwKrkLfT
 mCGDlDWw9JUU2Gog33aEHREVEGAmfnhVcpajmNbL6LmrcwzeVJ4r1mdGnfPCZOBGYMs8
 mInmqWj5gLLvPXMQ0tbCzQze2tBJ9OCy47J45CPxd4qVYdvA1vG18vU6d04kwxpTJqDe
 7rk4beQ9lNBJ7M0jtFia+rJ+7rGwioe62AawNrgQj0rHdSP24de7gkpt8N5STXS2rSGv
 u2KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMkrNlAyFWbnCnMTfKRFml2kyFrCh0QuIvlUEDa4MEmt75+2EqcV6tOOVeVkZkwHJJMGCTCu1yiXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcKN5leBCzle1zZ+WR3BlSl5IQHlJObGXw5wO64LsUWERzK70K
 2iHNJ0OTaqgO9Q+BnGz7mmsvFB0CEh9h6LlW2ZDtK/dDzAPrTe8HOS47t0TxVwca72A=
X-Gm-Gg: ASbGnct1LeusIoOg+pRvHM83zG515+MCafnAp9i7z8Fco9xny8sdceaGGWWgKENJ19g
 9pfRX8Tkg+zGldhTDq8rCHs/Y8OXDPF9fdoYUP/8khD01LzApgFnFeD/sfftF8jhOdsMRAldkgf
 kkIdwBs/KqqcLeXVrOTtSfBoO1rcVT0ehtdWhbx6KQ2oXjY6btiVRgqEpJEsxwBEVGzNbVOt/EK
 xbTix2CoU2IAcn5kx1e/spdffmIgniGClCb90WiXYU8nTGf8dP6+zuUa6GadVtttk2BobQtn1e5
 0Lk2gzLTAp/zu68YflepSfZQtRduT/KfNxRVM1wRDK0zB/2XZfWuNwWlDxpWoNsNXHbCqCryh8s
 P+RS+D9K6L/GXCt2oQeP1xzi6BFE5kvt2OQ==
X-Google-Smtp-Source: AGHT+IEEFFDoIZs2u4Er2i46k4rasQ+FDPQ5hGoZxxNHWviqtk0UW2VaXCZ2Y1m3dLN3tIkdk1NcpQ==
X-Received: by 2002:a05:6000:d46:b0:3a4:f90c:31e3 with SMTP id
 ffacd0b85a97d-3b5f18ceb8emr1948425f8f.31.1752226532338; 
 Fri, 11 Jul 2025 02:35:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d511bd6dsm82049245e9.38.2025.07.11.02.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:35:31 -0700 (PDT)
Date: Fri, 11 Jul 2025 11:35:29 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <aHDa4ctAtd9pPvP2@phenom.ffwll.local>
References: <aHA_eR0G7X2P6_ib@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHA_eR0G7X2P6_ib@intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 06:32:25PM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes the drm-intel-fixes of this week as I'm covering for Joonas here.
> 
> Also, only the single DSI fix from Hans.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-fixes-2025-07-10:
> Short summary of fixes:
> - DSI panel's version 2 mipi-sequences fix (Hans)
> The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:
> 
>   Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-07-10

Pulled into drm-fixes, thanks!
-Sima

> 
> for you to fetch changes up to e778689390c71462a099b5d6e56d71c316486184:
> 
>   drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too (2025-07-10 11:35:20 -0400)
> 
> ----------------------------------------------------------------
> Short summary of fixes:
> - DSI panel's version 2 mipi-sequences fix (Hans)
> 
> ----------------------------------------------------------------
> Hans de Goede (1):
>       drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too
> 
>  drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
