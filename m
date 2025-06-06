Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E3AD02B9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1453210EA71;
	Fri,  6 Jun 2025 13:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="V2vZIh3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CC010EA71
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 13:03:43 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-606fdbd20afso3971619a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749215022; x=1749819822; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uAz3IwxVIGZtcW19UqUFOR4Ccjk5MRSj4WGpPcEqtes=;
 b=V2vZIh3fQu1v5fOsdDVzHHPY+fJG0p/mfBNm9ZlJmbMythmPFaGsm+k4MeMXX471Sg
 oFKIf12voqY7Wb60x21dk+9bFXq7/G791KUbk2Z9mNIL9qqq/NqB4IdxHUtUE9f0xzcF
 HmZpKxpDN2oUbXk+1inPzHPbL+4rwpok0DNlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749215022; x=1749819822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAz3IwxVIGZtcW19UqUFOR4Ccjk5MRSj4WGpPcEqtes=;
 b=j32sFkWa8Wc6q35Jyg3av1rdl8XAz6j1qivTT/gQ7hY7GatBZwlK5te0CbuiTW4Yk7
 R4uXYudQtivZTEV/RFqOuvSOHfgMcVy42H4mKdawTlDyNQuQVBvtQYhcR91KOaaYKWwU
 f5RYK6STiYNwwiAdbnnZ3/Z+FOchA9eLKgw1xvh/bTXBnt/385zELdKQKVwvjwzdMWEy
 Ia8KfBH4dhnGFXqMKgSw1Bj7tSjCwlP/mYuv4Z4lccUpV72mdXlfjmbG1njtwlRqTIxe
 PcRI18hIG3mt4iPg8hQl51V0xKulOLYwBv2SXEFM3YIXGz9E+Lgn+MscVCPvK5W9DI0V
 F6CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwyE5nZs7oWXW7QIx8bzzOJ/u+xYquW+TS6tQGhKXZNJ1LejfGDBzFX5w5RZa3KZlX2uWJ4wYHDd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB1WlCj7o8vJNHA3goN8bFZ//NHz5BBmhLya4Cc1WCmT+1pBC+
 N1iyDUhnp5rRUsNeXqy4nzZU5LkLTUYanf22bryFA0u7IbYHR6Xi9+Oc+iISsXL74M0=
X-Gm-Gg: ASbGncsIUL9iz10541lldferrHvE6TsQjAeZdyqjl0oFpbDTqA2+CKWVSkWuUr/dLj5
 frtyeqM7DcSe/ev6jTEkphcMjDcrplA44XA0X9SMEFE8tn+oyJ9G4gwK6cALr8EwgXbK9hT8u3x
 7b3gU0gVbNKmp2pDlrZwgEAPbXHX+7waZyWQRTErB0qVnq+d/c41S7SrED2Kinw9MyXDjMk4n5r
 eigVnBbAkGqKILMIiwgYRMLKml3MLHbQY16d/9MvZhPL/9Hv9WnvUG5cPUzVl06+zaFlNlh7W5V
 6y09To7XyXxVBTDXWjH5Gd5Rl6m8TlR7mdYrz9MugzbMLxuC7Rp8UCx8pcCpMFxMxg7mPmg8AA=
 =
X-Google-Smtp-Source: AGHT+IHTc+eHW/5gHXGQgbG0M+E/iV0blTyu58bz6azK6vN1AzGBvRFefuTeMXZk2W50HJV0fqm4jA==
X-Received: by 2002:a05:6402:350e:b0:5e6:e842:f9d2 with SMTP id
 4fb4d7f45d1cf-60774894dbbmr2363653a12.29.1749215021824; 
 Fri, 06 Jun 2025 06:03:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783e682dsm985174a12.76.2025.06.06.06.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 06:03:41 -0700 (PDT)
Date: Fri, 6 Jun 2025 15:03:38 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <aELnKpkG4cPilRzE@phenom.ffwll.local>
References: <20250606072853.GA13099@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606072853.GA13099@linux.fritz.box>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Fri, Jun 06, 2025 at 09:28:53AM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> here's the PR from drm-misc-fixes for this week. It's a bit later
> due to merge-window confusion. The fixes for sysfb and video also
> affect fbdev.
> 
> Best regards
> Thomas
> 
> drm-misc-fixes-2025-06-06:
> Short summary of fixes pull:
> 
> ivpu:
> - gem: Use dma-resv lock
> - gem. Fix a warning
> - Trigger recovery on device engine reset/resume failure
> 
> panel:
> - panel-simple: Fix settings for Evervision VGG644804
> 
> sysfb:
> - Fix screen_info type check
> 
> video:
> - Update screen_info for relocated PCI framebuffers
> The following changes since commit 4557cc834712eca4eae7adbd9f0a06bdd8f79c99:
> 
>   accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction (2025-05-28 11:49:29 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-06-06

Pulled into drm-fixes, thanks.
-Sima

> 
> for you to fetch changes up to f670b50ef5e4a69bf4d2ec5ac6a9228d93b13a7a:
> 
>   sysfb: Fix screen_info type check for VGA (2025-06-05 17:54:31 +0200)
> 
> ----------------------------------------------------------------
> Short summary of fixes pull:
> 
> ivpu:
> - gem: Use dma-resv lock
> - gem. Fix a warning
> - Trigger recovery on device engine reset/resume failure
> 
> panel:
> - panel-simple: Fix settings for Evervision VGG644804
> 
> sysfb:
> - Fix screen_info type check
> 
> video:
> - Update screen_info for relocated PCI framebuffers
> 
> ----------------------------------------------------------------
> Jacek Lawrynowicz (2):
>       accel/ivpu: Use dma_resv_lock() instead of a custom mutex
>       accel/ivpu: Fix warning in ivpu_gem_bo_free()
> 
> Karol Wachowski (1):
>       accel/ivpu: Trigger device recovery on engine reset/resume failure
> 
> Michael Walle (1):
>       drm/panel-simple: fix the warnings for the Evervision VGG644804
> 
> Thomas Zimmermann (2):
>       video: screen_info: Relocate framebuffers behind PCI bridges
>       sysfb: Fix screen_info type check for VGA
> 
>  drivers/accel/ivpu/ivpu_gem.c        | 68 +++++++++++++++++---------------
>  drivers/accel/ivpu/ivpu_gem.h        |  1 -
>  drivers/accel/ivpu/ivpu_job.c        |  6 ++-
>  drivers/accel/ivpu/ivpu_jsm_msg.c    |  9 ++++-
>  drivers/firmware/sysfb.c             | 26 +++++++++----
>  drivers/gpu/drm/panel/panel-simple.c |  5 ++-
>  drivers/video/screen_info_pci.c      | 75 +++++++++++++++++++++++-------------
>  7 files changed, 117 insertions(+), 73 deletions(-)
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
